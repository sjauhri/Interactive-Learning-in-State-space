from utils import *
from tips import TIPS
from feedback import *
from fdm_cartpole import *
import gym

class TIPS_contcartpole(TIPS):
  def __init__(self, state_shape, action_shape, lr=0.001, maxEpochs=20, epochTrainIts=4000, M=50, batch_size=8):  
    TIPS.__init__(self, state_shape, action_shape, lr=lr, maxEpochs=maxEpochs, epochTrainIts=epochTrainIts, M=M, batch_size=batch_size)

    # set which game to play
    self.env = gym.make('Continuous-CartPole-COACH-v1')
    self.env.reset()
    self.env.render()  # Make the environment visible
    #pdb.set_trace()
    #print(self.env.observation_space.high)

    # Initialise Human feedback (call render before this)
    self.human_feedback = Feedback(self.env)
    # Set error constant multiplier for this environment
    # 0.01, 0.05, 0.1, 0.5
    self.errorConst = 0.2
    # Render time delay for this environment (in s)
    self.render_delay = 0.05
    # Feedback training rate in the episode
    self.feedback_training_rate  = 10

    # Choose which feedback is valid with fb dictionary
    self.feedback_dict = {
      H_NULL: 0,
      H_UP: 0,
      H_DOWN: 0,
      H_LEFT: 1,
      H_RIGHT: 1,
      DO_NOTHING: 0
    }

    self.ifdm_queries = 40 # One continous action.
  
  def build_policy_model(self):
    """buliding the policy model as two fully connected layers with leaky relu"""
    with tf.variable_scope("policy_model") as scope:
      with tf.variable_scope("input") as scope:
        policy_input = self.state
      with tf.variable_scope("model") as scope:
        policy_h1 = tf.layers.dense(policy_input, 8, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        policy_h1 = tf.nn.leaky_relu(policy_h1, 0.2, name="LeakyRelu_1")
        policy_h2 = tf.layers.dense(policy_h1, 8, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
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
        fdm_h1 = tf.layers.dense(fdm_input, 8, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        fdm_h1 = tf.nn.leaky_relu(fdm_h1, 0.2, name="LeakyRelu_1")
        fdm_h2 = tf.layers.dense(fdm_h1, 8, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
        fdm_h2 = tf.nn.leaky_relu(fdm_h2, 0.2, name="LeakyRelu_2")

      with tf.variable_scope("output") as scope:                
        self.fdm_pred_state = tf.layers.dense(fdm_h2, self.state_dim, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense")        

      with tf.variable_scope("loss") as scope:
        self.fdm_loss = tf.reduce_mean(tf.squared_difference(self.fdm_pred_state, self.nstate))
      with tf.variable_scope("train_step") as scope:
        self.fdm_train_step = tf.train.AdamOptimizer(self.lr).minimize(self.fdm_loss)

  def pre_demonstration(self):
    """uniform sample action to generate (s_t, s_t+1) and action pairs"""
    terminal = True
    States = []
    Nstates = []
    Actions = []

    for i in range(int(round(self.M / self.alpha))):
      if terminal:
        state = self.env.reset()

      prev_s = state
      state = np.reshape(state, [-1, self.state_dim])

      # Continuos action space
      # Actions between -1 and 1
      A = np.random.uniform(-1, 1, self.action_dim)

      state, _, terminal, _ = self.env.step(A)

      States.append(prev_s)
      Nstates.append(state)
      Actions.append(A)

      if i and (i+1) % 1000 == 0:
        print("Collecting dynamics training data ", i+1)
        self.log_writer.write("Collecting dynamics training data " + str(i+1) + "\n")

    return States, Nstates, Actions

  def get_state_corrected(self, h_fb, state):
    """get corrected state label for this environment using feedback"""
    state_corrected = np.copy(state)

    # IF CHANGING TYPE OF STATE FEEDBACK, ALSO CHANGE get_corrected_action()
    # Correcting Velocity
    if (h_fb == H_LEFT):
      state_corrected = state_corrected[1] - self.errorConst
    elif (h_fb == H_RIGHT):
      state_corrected = state_corrected[1] + self.errorConst
    return state_corrected

  def get_corrected_action(self, h_fb, state, state_corrected):
    """get action to achieve next state close to state_corrected"""
    # Continous Actions
    min_action = np.random.uniform(-1, 1, self.action_dim)
    min_cost = np.Inf
    
    if (args.learntFDM):
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
      cost = abs(state_corrected - Nstates[:,1]) # Velocity

      # Check for min_cost
      min_cost_index = cost.argmin(axis=0)
      min_action = Actions[min_cost_index]

    else:
      for _ in range(1, self.ifdm_queries+1):
        # True FDM:

        # Choose random action
        # Continous Actions
        curr_action = np.random.uniform(-1, 1, self.action_dim)

        # Query ifdm to get next state
        nstate = fdm_cont(state, curr_action)

        # Check cost
        cost = abs(state_corrected - nstate[1])
        
        # Check for min_cost
        if(cost < min_cost):
          min_cost = cost
          min_action = curr_action

    return min_action

  def get_action(self, state, nstate_required):
    """get action to achieve next state close to nstate_required"""
    # Continous Actions
    min_action = np.random.uniform(-1, 1, self.action_dim)
    min_cost = np.Inf
    
    if (args.learntFDM):
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
      cost = np.sum(abs(nstate_required - Nstates[:]) , axis=1)

      # Check for min_cost
      min_cost_index = cost.argmin(axis=0)
      min_action = Actions[min_cost_index]

    else:
      # True FDM:
      for _ in range(1, self.ifdm_queries+1):
        # Choose random action
        # Continous Actions
        curr_action = np.random.uniform(-1, 1, self.action_dim)

        # Query ifdm to get next state        
        nstate = fdm_cont(state, curr_action)

        # Check cost
        cost = sum(abs(nstate_required - nstate))
        
        # Check for min_cost
        if(cost < min_cost):
          min_cost = cost
          min_action = curr_action

    return min_action    

  def coach(self):
    """COACH algorithm incorporating human feedback"""
    terminal = False
    total_reward = 0
    state = self.env.reset()
    state = np.reshape(state, [-1, self.state_dim])
    t_counter = 1
    h_counter = 0

    # Iterate over the episode
    while((not terminal) and (not self.human_feedback.ask_for_done()) ):        
      self.env.render()  # Make the environment visible
      time.sleep(self.render_delay)    # Add delay to rendering if necessary
      
      # Store previous_state
      prev_s = state

      # Get feedback signal
      h_fb = self.human_feedback.get_h()

      # Update policy
      if (self.feedback_dict.get(h_fb) != 0):  # if feedback is not zero i.e. is valid
        print("Feedback", h_fb)
        h_counter += 1 # Feedback counter

        # Get new state transition label using feedback
        state_corrected = self.get_state_corrected(h_fb, state[0])        

        # Get action from ifdm
        a = self.get_corrected_action(h_fb, state[0], state_corrected)
        print("Computed_IFDM action: ", a)
        # Debug incorrect action
        # if not args.cont_actions:
        #   if ((self.feedback_dict.get(h_fb) == -1 and a[0][1] == 1) or (self.feedback_dict.get(h_fb) == 1 and a[0][0] == 1)):
        #     print("MISLABEL!")
        # else:
        #   if ((self.feedback_dict.get(h_fb) == -1 and a[0][1] > 0.5) or (self.feedback_dict.get(h_fb) == 1 and a[0][1] < -0.5)):
        #     print("MISLABEL!")

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
        # Continuous actions
        A = np.copy(a)
        state, reward, terminal, _ = self.env.step(A)
        total_reward += reward
        state = np.reshape(state, [-1, self.state_dim])

        # Add to ExpBuff
        self.ExpBuff.append((prev_s[0], state[0], a))
        if (len(self.ExpBuff) > self.maxExpBuffSize):
          self.ExpBuff.pop(0)
      else:
        # Use current policy
        # Map action from state
        a = np.reshape(self.eval_policy(state), [-1])
        # Continuous actions
        A = np.copy(a)

        # Act
        state, reward, terminal, _ = self.env.step(A)
        total_reward += reward
        state = np.reshape(state, [-1, self.state_dim])
        # Add to ExpBuff
        self.ExpBuff.append((prev_s[0], state[0], a))
        if (len(self.ExpBuff) > self.maxExpBuffSize):
          self.ExpBuff.pop(0)

        # Train every k time steps
      if t_counter % self.coach_training_rate == 0:
        self.update_policy_feedback()

      t_counter += 1 # Time counter

    print('episode_reward: %5.1f' % (total_reward))
    self.log_writer.write("\n" + "episode_reward: " + format(total_reward, '5.1f'))
    
    # Capture and return feedback rate
    feedback_rate = h_counter/t_counter
    return feedback_rate

  def post_demonstration(self, M):
    """using policy to generate (s_t, s_t+1) and action pairs"""
    terminal = True
    States = []
    Nstates = []
    Actions = []

    for i in range(M):
      if terminal:
        state = self.env.reset()

      prev_s = state
      state = np.reshape(state, [-1,self.state_dim])

      # Continuos action space
      A = np.reshape(self.eval_policy(state), [-1])
      state, _, terminal, _ = self.env.step(A)

      States.append(prev_s)
      Nstates.append(state)
      Actions.append(A)

    return States, Nstates, Actions

  def eval_rwd_policy(self):
    """getting the reward by current policy model"""
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
        time.sleep(self.render_delay)

    return total_reward
    
if __name__ == "__main__":
  tips = TIPS_contcartpole(4, 1, lr=args.lr, maxEpochs=args.maxEpochs)
  tips.run()
