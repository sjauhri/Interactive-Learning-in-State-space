from utils import *
from tips import TIPS
from feedback_lunar import *
from fdm_lunarl import *
import gym

class TIPS_lunarlandercont(TIPS):
  def __init__(self, state_shape, action_shape, lr=0.0005, maxEpisodes=50, epochTrainIts=4000,  dynamicsSamples=20000, batch_size=32):
    TIPS.__init__(self, state_shape, action_shape, lr=lr, maxEpisodes=maxEpisodes, epochTrainIts=epochTrainIts, dynamicsSamples=dynamicsSamples, batch_size=batch_size)

    # set which game to play
    self.env = gym.make('LunarLanderContinuous-v2')
    self.env.reset()
    self.env.render()  # Make the environment visible

    # Initialise Human feedback (call render before this)
    self.human_feedback = Feedback_lunar(self.env)
    # Set error constant multiplier for this environment
    # 0.01, 0.05, 0.1, 0.5, 1
    self.errorConst = 0.15
    # Render time delay for this environment (in s)
    self.render_delay = 0.06#0.005
    # Feedback training rate in the episode
    self.feedback_training_rate  = 10

    # Choose which feedback is valid with fb dictionary
    self.feedback_dict = {
      H_NULL: 0,
      H_UP: 1,
      H_DOWN: 1,
      H_LEFT: 1,
      H_RIGHT: 1,
      H_HOLD: 0,
      DO_NOTHING: 0,
      H_UPLEFT: 1,
      H_UPRIGHT: 1,
      H_DOWNLEFT: 1,
      H_DOWNRIGHT: 1
    }

    self.ifdm_queries = 500 # Two continous actions.

  def build_policy_model(self):
    """buliding the policy model as two fully connected layers with leaky relu"""
    with tf.variable_scope("policy_model") as scope:
      with tf.variable_scope("input") as scope:
        policy_input = self.state
      with tf.variable_scope("model") as scope:
        policy_h1 = tf.layers.dense(policy_input, 32, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        policy_h1 = tf.nn.leaky_relu(policy_h1, 0.2, name="LeakyRelu_1")
        policy_h2 = tf.layers.dense(policy_h1, 32, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
        policy_h2 = tf.nn.leaky_relu(policy_h2, 0.2, name="LeakyRelu_2")

      with tf.variable_scope("output") as scope:
        self.tmp_policy_pred_action = tf.layers.dense(policy_h2, self.action_dim, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense")
        self.policy_pred_action = tf.clip_by_value(self.tmp_policy_pred_action, clip_value_min=-1, clip_value_max=1)

      with tf.variable_scope("loss") as scope:
        self.policy_loss = tf.reduce_mean(tf.squared_difference(self.policy_pred_action, self.action))
      with tf.variable_scope("train_step") as scope:
        self.policy_train_step = tf.train.AdamOptimizer(self.lr).minimize(self.policy_loss)

  def build_fdm_model(self):
    """building the forward dynamics model as two fully connnected layers with leaky relu"""
    with tf.variable_scope("forward_dynamic_model") as scope:
      with tf.variable_scope("input") as scope:
        fdm_input = tf.concat([self.state, self.action], 1)
      with tf.variable_scope("model") as scope:
        fdm_h1 = tf.layers.dense(fdm_input, 64, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        fdm_h1 = tf.nn.leaky_relu(fdm_h1, 0.2, name="LeakyRelu_1")
        fdm_h2 = tf.layers.dense(fdm_h1, 64, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
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
    A = np.random.uniform(-1, 1, self.action_dim)

    for i in range(self.dynamicsSamples):
      if terminal:
        state = self.env.reset()

      prev_s = state

      # Continuos action space
      # Actions between -1 and 1
      if (i%5 == 0):
        A = np.random.uniform(-1, 1, self.action_dim)

      state, _, terminal, _ = self.env.step(A)
      # self.env.render()

      States.append(prev_s)
      Nstates.append(state)
      Actions.append(A)

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

    for i in range(int(round(self.dynamicsSamples/10))): # Using 10% of the initial dynamics samples
      if terminal:
        state = self.env.reset()

      prev_s = state
      state = np.reshape(state, [-1,self.state_dim])

      # Using an epsilon-greedy policy for exploration of new actions
      if (np.random.uniform(0,1) < 0.1):
        # Continuos action space
        # Actions between -1 and 1
        A = np.random.uniform(-1, 1, self.action_dim)
      else:
        # Continuos action space
        A = np.reshape(self.eval_policy(state), [-1])

      state, _, terminal, _ = self.env.step(A)
      self.env.render()

      States.append(prev_s)
      Nstates.append(state)
      Actions.append(A)

      if i and (i+1) % 1000 == 0:
        print("Collecting dynamics training data from exploration policy ", i+1)
        self.log_writer.write("Collecting dynamics training data from exploration policy " + str(i+1) + "\n")

    return States, Nstates, Actions

  def get_state_corrected(self, h_fb, state):
    """get corrected state label for this environment using feedback"""
    state_corrected = np.copy(state)

    # IF CHANGING TYPE OF STATE FEEDBACK, ALSO CHANGE get_corrected_action()
    if (h_fb == H_LEFT):
      state_corrected[3] = 0                  # Zero vertical velocity
      state_corrected[5] += self.errorConst   # Angular velocity      
      # state_corrected[4] += self.errorConst   # Angular pos
      # state_corrected[0] -= self.errorConst   # Horizontal pos
    elif (h_fb == H_RIGHT):
      state_corrected[3] = 0                  # Zero vertical velocity
      state_corrected[5] -= self.errorConst   # Angular velocity
      # state_corrected[4] -= self.errorConst   # Angular pos
      # state_corrected[0] += self.errorConst   # Horizontal pos
    elif (h_fb == H_UP):
      state_corrected[3] += self.errorConst   # Vertical velocity      
      # state_corrected[1] += self.errorConst   # Vertical pos
      state_corrected[5] = 0                  # Zero angular velocity
    elif (h_fb == H_UPLEFT):
      state_corrected[3] += self.errorConst   # Vertical velocity
      state_corrected[5] += self.errorConst   # Angular velocity
      # state_corrected[0] -= self.errorConst   # Horizontal pos
      # state_corrected[4] += self.errorConst   # Angular pos
      # state_corrected[1] += self.errorConst   # Vertical pos
    elif (h_fb == H_UPRIGHT):
      state_corrected[3] += self.errorConst   # Vertical velocity
      state_corrected[5] -= self.errorConst   # Angular velocity
      # state_corrected[4] -= self.errorConst   # Angular pos
      # state_corrected[0] += self.errorConst   # Horizontal pos
      # state_corrected[1] += self.errorConst   # Vertical pos
    elif (h_fb == H_DOWN):
      state_corrected[3] -= self.errorConst   # Vertical velocity
      # state_corrected[1] -= self.errorConst   # Vertical pos
      state_corrected[5] = 0                  # Zero angular velocity
    elif (h_fb == H_DOWNLEFT):
      state_corrected[3] -= self.errorConst   # Vertical velocity
      state_corrected[5] += self.errorConst   # Angular velocity
      # state_corrected[0] -= self.errorConst   # Horizontal pos
      # state_corrected[4] += self.errorConst   # Angular pos
      # state_corrected[1] -= self.errorConst   # Vertical pos
    elif (h_fb == H_DOWNRIGHT):
      state_corrected[3] -= self.errorConst   # Vertical velocity
      state_corrected[5] -= self.errorConst   # Angular velocity
      # state_corrected[0] += self.errorConst   # Horizontal pos
      # state_corrected[4] -= self.errorConst   # Angular pos
      # state_corrected[1] -= self.errorConst   # Vertical pos

    return state_corrected

  def get_corrected_action(self, h_fb, state, state_corrected):
    """get action to achieve next state close to state_corrected"""

    if (h_fb == H_DOWN):
      min_action = np.array((-1,0)) # Dont fire any engine
      if (args.learnFDM):
        # Debug: equal timing
        time.sleep(0.005)
        # pass
      else:
        # Debug: equal timing
        time.sleep(0.04)
    elif (args.learnFDM):
      # prev_time = time.time()
      # Learnt FDM:
      
      # Make a vector of same states
      States = np.tile(state, (self.ifdm_queries,1))
      # Choose random actions
      # Continuous Actions
      Actions = np.random.uniform(-1, 1, (self.ifdm_queries,self.action_dim) )
      # Query ifdm to get next state
      Nstates = self.eval_fdm(States, Actions)

      # Calculate cost
      # if (h_fb == H_LEFT or h_fb == H_RIGHT):
      #   # cost = abs(state_corrected[5] - Nstates[:,5])
      #   cost = abs(state_corrected[0] - Nstates[:,0])
      # elif (h_fb == H_UP or h_fb == H_DOWN):
      #   # cost = abs(state_corrected[3] - Nstates[:,3])
      #   cost = abs(state_corrected[1] - Nstates[:,1])
      # else:# (h_fb == H_UPLEFT or UPRIGHT or...):
      cost = abs(state_corrected[3] - Nstates[:,3]) + abs(state_corrected[5] - Nstates[:,5])
      # cost = abs(state_corrected[1] - Nstates[:,1]) + abs(state_corrected[4] - Nstates[:,4])

      # Check for min_cost
      min_cost_index = cost.argmin(axis=0)
      min_action = Actions[min_cost_index]

      # Debug: equal timing
      # print(time.time() - prev_time)
    else:
      # True FDM:
      # Continous Actions
      min_action = np.random.uniform(-1, 1, self.action_dim)
      min_cost = np.Inf

      for _ in range(1, self.ifdm_queries+1):
        # Choose random action
        # Continous Actions
        curr_action = np.random.uniform(-1, 1, self.action_dim)
        # Discretization
        # val_set = [0.2*x for x in range(-5,6)]
        # curr_action = np.random.choice(val_set, self.action_dim)

        # Query ifdm to get next state
        nstate = fdm_cont(state, curr_action)

        # Check cost        
        # if (h_fb == H_LEFT or h_fb == H_RIGHT):
        #   # cost = abs(state_corrected[5] - nstate[5])
        #   cost = abs(state_corrected[0] - nstate[0])
        # elif (h_fb == H_UP or h_fb == H_DOWN):
        #   # cost = abs(state_corrected[3] - nstate[3])
        #   cost = abs(state_corrected[1] - nstate[1])
        # else:
        cost = abs(state_corrected[3] - nstate[3]) + abs(state_corrected[5] - nstate[5])
        # cost = abs(state_corrected[1] - nstate[1]) + abs(state_corrected[4] - nstate[4])

        # Check for min_cost
        if(cost < min_cost):
          min_cost = cost
          min_action = curr_action

    return min_action

  def get_action(self, state, nstate_required):
    """get action to achieve next state close to nstate_required"""

    if (args.learnFDM):
      # Learnt FDM:
      
      # Make a vector of same states
      States = np.tile(state, (self.ifdm_queries,1))
      # Choose random actions
      # Continuous Actions
      Actions = np.random.uniform(-1, 1, (self.ifdm_queries,self.action_dim) )
      # Query ifdm to get next state
      Nstates = self.eval_fdm(States, Actions)

      # Calculate cost
      # Automatic broadcasting
      cost = np.sum(abs(nstate_required - Nstates[:]), axis=1)

      # Check for min_cost
      min_cost_index = cost.argmin(axis=0)
      min_action = Actions[min_cost_index]

    else:
      # True FDM:

      # Continous Actions
      min_action = np.random.uniform(-1, 1, self.action_dim)
      min_cost = np.Inf

      for _ in range(1, self.ifdm_queries+1):
        # Choose random action
        # Continous Actions
        curr_action = np.random.uniform(-1, 1, self.action_dim)
        # Discretization
        # val_set = [0.2*x for x in range(-5,6)]
        # curr_action = np.random.choice(val_set, self.action_dim)

        # Query ifdm to get next state
        nstate = fdm_cont(state, curr_action)

        # Check cost
        cost = sum(abs(nstate_required - nstate))
        
        # Check for min_cost
        if(cost < min_cost):
          min_cost = cost
          min_action = curr_action

    return min_action    

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
      if (not args.fast):
        self.env.render()  # Make the environment visible
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
        self.update_policy_feedback_immediate(state, a)
        self.update_policy_feedback_immediate(state, a)
        self.update_policy_feedback_immediate(state, a)
        self.update_policy_feedback_immediate(state, a)

        # Add state transition pair to demo buffer
        self.DemoBuff.append((state[0], a[0]))
        # If Demo buffer full, remove oldest entry
        if (len(self.DemoBuff) > self.maxDemoBuffSize):
            self.DemoBuff.pop(0)

        # Train with batch from Demo buffer (if enough entries exist)
        self.update_policy_feedback()
        self.update_policy_feedback()
        self.update_policy_feedback()
        self.update_policy_feedback()
        self.update_policy_feedback()

        # Act using action based on h_feedback
        a = np.reshape(a, [-1])
        # Continuous actions
        A = np.copy(a)
      else:
        if (args.learnFDM):
          # Debug: equal timing
          time.sleep(0.005)
          # pass
        else:
          # Debug: equal timing
          time.sleep(0.04)

        # Use current policy
        # Map action from state
        a = np.reshape(self.eval_policy(state), [-1])
        # Continuous actions
        A = np.copy(a)

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
        self.update_policy_feedback()
        self.update_policy_feedback()
        self.update_policy_feedback()
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
      # Continuos action space
      A = np.reshape(self.eval_policy(state), [-1])
      state, reward, terminal, _ = self.env.step(A)
      total_reward += reward
      if args.render:
        self.env.render()
        time.sleep(0.002)

    return total_reward
    
if __name__ == "__main__":
  tips = TIPS_lunarlandercont(8, 2, lr=args.lr, maxEpisodes=args.maxEpisodes)
  tips.run()
