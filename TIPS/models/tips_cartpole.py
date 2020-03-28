from utils import *
from tips import TIPS
from feedback import *
from fdm_cartpole import *
import gym

class TIPS_cartpole(TIPS):
  def __init__(self, state_shape, action_shape, lr=0.0005, maxEpisodes=30, epochTrainIts=4000, dynamicsSamples=500, batch_size=16):
    TIPS.__init__(self, state_shape, action_shape, lr=lr, maxEpisodes=maxEpisodes, epochTrainIts=epochTrainIts, dynamicsSamples=dynamicsSamples, batch_size=batch_size)

    # set which game to play
    self.env = gym.make('CartPole-v0')
    self.env.reset()
    self.env.render()  # Make the environment visible

    # Initialise Human feedback (call render before this)
    self.human_feedback = Feedback(self.env)
    # Set error constant multiplier for this environment
    # 0.01, 0.05, 0.1, 0.5
    self.errorConst = 0.1
    # Render time delay for this environment (in s)
    self.render_delay = 0.075#0.08
    # Feedback training rate in the episode
    self.feedback_training_rate  = 10

    # Choose which feedback is valid with fb dictionary
    self.feedback_dict = {
      H_NULL: 0,
      H_UP: 0,
      H_DOWN: 0,
      H_LEFT: 1,
      H_RIGHT: 1,
      H_HOLD: 0,
      DO_NOTHING: 0
    }

    self.ifdm_queries = 10 # Two discrete actions. (Easy)

  def build_policy_model(self):
    """buliding the policy model as two fully connected layers with leaky relu"""
    with tf.variable_scope("policy_model") as scope:
      with tf.variable_scope("input") as scope:
        policy_input = self.state
      with tf.variable_scope("model") as scope:
        policy_h1 = tf.layers.dense(policy_input, 16, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        policy_h1 = tf.nn.leaky_relu(policy_h1, 0.2, name="LeakyRelu_1")
        policy_h2 = tf.layers.dense(policy_h1, 16, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
        policy_h2 = tf.nn.leaky_relu(policy_h2, 0.2, name="LeakyRelu_2")

      with tf.variable_scope("output") as scope:
        policy_pred_action = tf.layers.dense(policy_h2, self.action_dim, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense")
        self.tmp_policy_pred_action = policy_pred_action
        self.policy_pred_action = tf.one_hot(tf.argmax(policy_pred_action, axis=1), self.action_dim, name="one_hot")

      with tf.variable_scope("loss") as scope:
        self.policy_loss = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(labels=self.action, logits=policy_pred_action))
      with tf.variable_scope("train_step") as scope:
        self.policy_train_step = tf.train.AdamOptimizer(self.lr).minimize(self.policy_loss)

  def build_fdm_model(self):
    """building the forward dynamics model as two fully connnected layers with leaky relu"""
    with tf.variable_scope("forward_dynamic_model") as scope:
      with tf.variable_scope("input") as scope:
        fdm_input = tf.concat([self.state, self.action], 1)
      with tf.variable_scope("model") as scope:
        fdm_h1 = tf.layers.dense(fdm_input, 16, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        fdm_h1 = tf.nn.leaky_relu(fdm_h1, 0.2, name="LeakyRelu_1")
        fdm_h2 = tf.layers.dense(fdm_h1, 16, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
        fdm_h2 = tf.nn.leaky_relu(fdm_h2, 0.2, name="LeakyRelu_2")

      with tf.variable_scope("output") as scope:                
        self.fdm_pred_state = tf.layers.dense(fdm_h2, self.state_dim, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense")        

      with tf.variable_scope("loss") as scope:
        self.fdm_loss = tf.reduce_mean(tf.squared_difference(self.fdm_pred_state, self.nstate))
      with tf.variable_scope("train_step") as scope:
        self.fdm_train_step = tf.train.AdamOptimizer(self.lr).minimize(self.fdm_loss)

  def dynamics_sampling(self):
    """uniform sample action to generate (s_t, s_t+1, a_t) triplets"""
    terminal = True
    States = []
    Nstates = []
    Actions = []

    for i in range(self.dynamicsSamples):
      if terminal:
        state = self.env.reset()

      prev_s = state

      A = np.random.randint(self.action_dim)
      a = np.zeros([self.action_dim])
      a[A] = 1

      state, _, terminal, _ = self.env.step(A)
      # self.env.render()

      States.append(prev_s)
      Nstates.append(state)
      Actions.append(a)

      if i and (i+1) % 1000 == 0:
        print("Collecting dynamics training data ", i+1)
        self.log_writer.write("Collecting dynamics training data " + str(i+1) + "\n")

    return States, Nstates, Actions

  def exploration_dynamics_sampling(self):
    """using epsilon-greedy version of current policy to generate (s_t, s_t+1, a_t) triplets"""
    terminal = True
    States = []
    Nstates = []
    Actions = []

    for i in range(int(round(self.dynamicsSamples/2))): # Using half the initial dynamics samples
      if terminal:
        state = self.env.reset()

      prev_s = state
      state = np.reshape(state, [-1,self.state_dim])

      # Using an epsilon-greedy policy for exploration of new actions
      if (np.random.uniform(0,1) < 0.15):
        # Discrete action space
        A = np.random.randint(self.action_dim)
        a = np.zeros([self.action_dim])
        a[A] = 1
      else:
        # Discrete action space
        a = np.reshape(self.eval_policy(state), [-1])
        A = np.argmax(a)

      state, _, terminal, _ = self.env.step(A)
      self.env.render()

      States.append(prev_s)
      Nstates.append(state)
      Actions.append(a)

      if i and (i+1) % 1000 == 0:
        print("Collecting dynamics training data from exploration policy ", i+1)
        self.log_writer.write("Collecting dynamics training data from exploration policy " + str(i+1) + "\n")

    return States, Nstates, Actions

  def get_state_corrected(self, h_fb, state):
    """get corrected state label for this environment using feedback"""
    # state_corrected = np.copy(state)
    state_corrected = np.zeros(2)

    # Get auxiliary state: pole tip position
    angle = (state[3]*np.pi)/180    
    state_corrected[0] = np.sin(angle) # x
    state_corrected[1] = np.cos(angle) # y

    # IF CHANGING TYPE OF STATE FEEDBACK, ALSO CHANGE get_corrected_action()    
    if (h_fb == H_LEFT):
      # state_corrected[2] -= self.errorConst # Correcting Velocity
      state_corrected[0] -= self.errorConst # Correcting Pole tip position
    elif (h_fb == H_RIGHT):
      # state_corrected[2] += self.errorConst # Correcting Velocity
      state_corrected[0] += self.errorConst # Correcting Pole tip position
    # else: # (h_fb == H_HOLD)
    #   state_corrected[3] = 0  # HOLD pole angular velocity zero
    
    return state_corrected

  def get_corrected_action(self, h_fb, state, state_corrected):
    """get action to achieve next state close to state_corrected"""

    if (args.learnFDM):
      # Learnt FDM:

      # Make a vector of same states
      States = np.tile(state, (self.ifdm_queries,1))
      # Choose random actions
      # Discrete Actions
      a = np.eye(self.action_dim)
      Actions = a[np.random.choice(a.shape[0], size=self.ifdm_queries)]
      # Query ifdm to get next state
      Nstates = self.eval_fdm(States, Actions)

      # Get auxiliary state: pole tip position
      Nstates_ang = (Nstates[:,3]*np.pi)/180
      Nstates_xpos = np.sin(Nstates_ang)
      Nstates_ypos = np.cos(Nstates_ang)

      # Calculate cost
      # if (h_fb == H_HOLD):
      #   cost = abs(state_corrected[3] - Nstates[:,3]) # Corrected Pole Angular Velocity (Zero)
      # else: # LEFT or RIGHT
      # cost = abs(state_corrected[2] - Nstates[:,2]) # Corrected Velocity
      cost = abs(state_corrected[0] - Nstates_xpos) + abs(state_corrected[1] - Nstates_ypos) # Corrected pole tip position

      # Check for min_cost
      min_cost_index = cost.argmin(axis=0)
      min_a = Actions[min_cost_index]
    else:
      # True FDM:

      # Discrete Actions
      min_action = np.random.randint(self.action_dim)
      min_cost = np.Inf

      for _ in range(1, self.ifdm_queries+1):
        # Choose random action
        # Discrete actions
        curr_action = np.random.randint(self.action_dim)

        # Query ifdm to get next state
        nstate = fdm(state, curr_action)

        # Get auxiliary state: pole tip position
        nstate_ang = (nstate[3]*np.pi)/180
        nstate_xpos = np.sin(nstate_ang)
        nstate_ypos = np.cos(nstate_ang)

        # Check cost
        # if (h_fb == H_HOLD):
        #   cost = abs(state_corrected[3] - nstate[3]) # Corrected Pole Angular Velocity (Zero)
        # else: # LEFT or RIGHT
        # cost = abs(state_corrected[2] - nstate[2]) # Corrected Velocity
        cost = abs(state_corrected[0] - nstate_xpos) + abs(state_corrected[1] - nstate_ypos) # Corrected pole tip position
        
        # Check for min_cost
        if(cost < min_cost):
          min_cost = cost
          min_action = curr_action

      # Discrete actions: return a = A in one hot
      min_a = np.zeros(self.action_dim)
      min_a[min_action] = 1

    return min_a

  def get_action(self, state, nstate_required):
    """get action to achieve next state close to nstate_required"""

    if (args.learnFDM):
      # Learnt FDM:
      
      # Make a vector of same states
      States = np.tile(state, (self.ifdm_queries,1))
      # Choose random actions
      # Discrete Actions
      a = np.eye(self.action_dim)
      Actions = a[np.random.choice(a.shape[0], size=self.ifdm_queries)]
      # Query ifdm to get next state
      Nstates = self.eval_fdm(States, Actions)

      # Calculate cost
      cost = np.sum(abs(nstate_required - Nstates[:]), axis=1) # Automatic broadcasting

      # Check for min_cost
      min_cost_index = cost.argmin(axis=0)
      min_a = Actions[min_cost_index]

    else:
      # True FDM:

      # Discrete Actions
      min_action = np.random.randint(self.action_dim)
      min_cost = np.Inf

      for _ in range(1, self.ifdm_queries+1):
        # Choose random action
        # Discrete Actions
        curr_action = np.random.randint(self.action_dim)

        # Query ifdm to get next state
        nstate = fdm(state, curr_action)

        # Check cost
        cost = sum(abs(nstate_required - nstate))
        
        # Check for min_cost
        if(cost < min_cost):
          min_cost = cost
          min_action = curr_action

      # Discrete actions: return a = A in one hot
      min_a = np.zeros(self.action_dim)
      min_a[min_action] = 1

    return min_a

  def feedback_run(self):
    """run and train agent using D-COACH framework incorporating human feedback"""
    terminal = False
    total_reward = 0
    state = self.env.reset()
    state = np.reshape(state, [-1, self.state_dim])
    prev_s = state    
    a = np.random.uniform(-1,1,self.action_dim)
    t_counter = 1
    h_counter = 0

    # Iterate over the episode
    while((not terminal) and (not self.human_feedback.ask_for_done()) ):
      self.env.render()  # Make the environment visible
      if (not args.fast):
        time.sleep(self.render_delay)    # Add delay to rendering if necessary

      # Get feedback signal
      h_fb = self.human_feedback.get_h()

      if (self.feedback_dict.get(h_fb) != 0):  # if feedback is not zero i.e. is valid
        # Update policy
        # print("Feedback", h_fb)
        h_counter += 1 # Feedback counter

        # Get new state transition label using feedback
        state_corrected = self.get_state_corrected(h_fb, state[0])        

        # Get action from ifdm
        a = self.get_corrected_action(h_fb, state[0], state_corrected)
        # print("Computed Action: ", a)

        # Update policy (immediate)
        a = np.reshape(a, [-1, self.action_dim])
        self.update_policy_feedback_immediate(state, a)

        # Add state transition pair to demo buffer
        self.DemoBuff.append((state[0], a[0]))
        # If Demo buffer full, remove oldest entry
        if (len(self.DemoBuff) > self.maxDemoBuffSize):
            self.DemoBuff.pop(0)

        # Train with batch from Demo buffer (if enough entries exist)
        self.update_policy_feedback()

        # Act using action based on h_feedback
        a = np.reshape(a, [-1])
        # Discrete actions
        A = np.argmax(a)
      else:
        # Use current policy

        # Map action from state
        a = np.reshape(self.eval_policy(state), [-1])
        # Discrete actions
        A = np.argmax(a)

      # Store previous state
      prev_s = np.copy(state)

      # Act
      state, reward, terminal, _ = self.env.step(A)
      total_reward += reward
      state = np.reshape(state, [-1, self.state_dim])

      # Add to ExpBuff
      self.ExpBuff.append((prev_s[0], state[0], a))
      if (len(self.ExpBuff) > self.maxExpBuffSize):
        self.ExpBuff.pop(0)

      # Train every k time steps
      if t_counter % self.feedback_training_rate == 0:
        self.update_policy_feedback()

      t_counter += 1 # Time counter

    print('episode_reward: %5.1f' % (total_reward))
    self.log_writer.write("\n" + "episode_reward: " + format(total_reward, '5.1f'))
    
    # Capture and return feedback rate
    feedback_rate = h_counter/t_counter
    return feedback_rate

  def eval_rwd_policy(self):
    """getting the reward by current policy"""
    terminal = False
    total_reward = 0
    state = self.env.reset()

    while not terminal:
      state = np.reshape(state, [-1,self.state_dim])
      a = np.reshape(self.eval_policy(state), [-1])
      A = np.argmax(a)
      state, reward, terminal, _ = self.env.step(A)
      total_reward += reward
      if args.render:
        self.env.render()
        time.sleep(self.render_delay)

    return total_reward
    
if __name__ == "__main__":
  tips = TIPS_cartpole(4, 2, lr=args.lr, maxEpisodes=args.maxEpisodes)
  tips.run()
