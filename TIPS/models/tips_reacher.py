from utils import *
from tips import TIPS
from feedback_ext import *
from fdm_reacher import *
import gym

class TIPS_reacher(TIPS):
  def __init__(self, state_shape, action_shape, lr=0.0005, maxEpisodes=20, epochTrainIts=4000,  dynamicsSamples=10000, batch_size=32):
    TIPS.__init__(self, state_shape, action_shape, lr=lr, maxEpisodes=maxEpisodes, epochTrainIts=epochTrainIts, dynamicsSamples=dynamicsSamples, batch_size=batch_size)

    # set which game to play
    self.env = gym.make('Reacher-v2')
    self.env.reset()
    self.env.render()  # Make the environment visible

    # Initialise Human feedback in external window
    self.human_feedback = Feedback_ext()
    self.human_feedback.viewer.render() # Render the additional feedback window
    # Set error constant multiplier for this environment
    # 0.01, 0.05, 0.1, 0.5, 1
    self.errorConst = 0.008#0.015
    # Render time delay for this environment (in s)
    self.render_delay = 0.05
    # Feedback training rate in the episode
    self.feedback_training_rate  = 10

    # Choose which feedback is valid with fb dictionary
    self.feedback_dict = {
      H_NULL: 0,
      H_UP: 1,
      H_DOWN: 1,
      H_LEFT: 1,
      H_RIGHT: 1,
      H_HOLD: 1,
      DO_NOTHING: 0
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
      if terminal or ((i%300)==0):
        state = self.env.reset()

      prev_s = state

      # Continuos action space
      # Actions between -1 and 1
      if (i%3 == 0):
        A = np.random.uniform(-1, 1, self.action_dim)
      else:
        A = np.array([0,0])

      state, _, terminal, _ = self.env.step(A)
      # self.env.render()
      # Zero redundant states
      z_index = [4,5,8,9,10]
      prev_s[z_index] = 0
      state[z_index] = 0

      States.append(prev_s)
      Nstates.append(state)
      Actions.append(A)

      if i and (i+1) % 1000 == 0:
        print("Collecting dynamics training data ", i+1)
        self.log_writer.write("Collecting dynamics training data " + str(i+1) + "\n")

    return States, Nstates, Actions


  def get_xy_pos(self, state):
    """get x-y cartesian position of the end effector or the reacher"""

    # theta1 = -inf to +inf
    theta1 = np.arctan2(state[:,2], state[:,0])
    # theta2 = -pi to +pi
    theta2 = np.arctan2(state[:,3], state[:,1])

    l1 = 0.1  # Length of arm 1
    l2 = 0.11 # Length of arm 2

    xpos = l1*state[:,0] + l2*np.cos(theta1+theta2)
    ypos = l1*state[:,2] + l2*np.sin(theta1+theta2)

    return xpos, ypos

  def get_state_corrected(self, h_fb, state):
    """get corrected state label for this environment using feedback"""
    # state_corrected = np.copy(state)
    state_corrected = np.zeros(2)

    # Get x-y position
    state_x, state_y = self.get_xy_pos(np.reshape(state, [-1,self.state_dim]))

    # IF CHANGING TYPE OF STATE FEEDBACK, ALSO CHANGE get_corrected_action()
    if (h_fb == H_LEFT):
      state_corrected[0] = state_x - self.errorConst
      state_corrected[1] = state_y
      # state_corrected[6] += self.errorConst  # Angular velocity of 1st joint
      # state_corrected[7] = 0                 # Zero angular velocity of 2nd joint
    elif (h_fb == H_RIGHT):
      state_corrected[0] = state_x + self.errorConst
      state_corrected[1] = state_y
      # state_corrected[6] -= self.errorConst  # Angular velocity of 1st joint
      # state_corrected[7] = 0                 # Zero angular velocity of 2nd joint
    elif (h_fb == H_UP):
      state_corrected[0] = state_x
      state_corrected[1] = state_y + self.errorConst
      # state_corrected[6] = 0                 # Zero angular velocity of 1st joint
      # state_corrected[7] += self.errorConst  # Angular velocity of 2nd joint
    elif (h_fb == H_DOWN):
      state_corrected[0] = state_x
      state_corrected[1] = state_y - self.errorConst
      # state_corrected[6] = 0                 # Zero angular velocity of 1st joint
      # state_corrected[7] -= self.errorConst  # Angular velocity of 2nd joint
    else:# (h_fb == H_HOLD):
      state_corrected[0] = state_x
      state_corrected[1] = state_y
      # state_corrected[6] = 0                 # Zero angular velocity of 1st joint
      # state_corrected[7] = 0                 # Zero angular velocity of 2nd joint

    return state_corrected

  def get_corrected_action(self, h_fb, state, state_corrected):
    """get action to achieve next state close to state_corrected"""

    if (args.learnFDM):
      # prev_time = time.time()
      # Learnt FDM:

      # Zero redundant states
      z_index = [4,5,8,9,10]
      state[z_index] = 0

      # Make a vector of same states
      States = np.tile(state, (self.ifdm_queries,1))
      # Choose random actions
      # Continuous Actions
      Actions = np.random.uniform(-0.4, 0.4, (self.ifdm_queries,self.action_dim) )
      # Query ifdm to get next state
      Nstates = self.eval_fdm(States, Actions)

      # Get x-y position
      Nstates_x, Nstates_y = self.get_xy_pos(Nstates)

      # Calculate cost
      # cost = abs(state_corrected[6] - Nstates[:,6]) + abs(state_corrected[7] - Nstates[:,7])
      cost = abs(state_corrected[0] - Nstates_x) + abs(state_corrected[1] - Nstates_y)

      # Check for min_cost
      min_cost_index = cost.argmin(axis=0)
      min_action = Actions[min_cost_index]
      
      # Alternative: Get action that changes state the least
      # least_cost_inds = np.argpartition(cost, 20)[:20]
      # state_diffs = np.sum(abs(state-Nstates[:]), axis=1)
      # min_cost_index = (state_diffs[least_cost_inds]).argmin(axis=0)
      # min_action = Actions[least_cost_inds[min_cost_index]]
    else:
      # True FDM:

      # Continous Actions
      # min_action = np.random.uniform(-1, 1, self.action_dim)
      min_action = [1,1] # Start with Max action
      # min_state_diff = np.Inf
      min_cost = np.Inf

      for _ in range(1, self.ifdm_queries+1):
        # Choose random action
        # Continous Actions
        # curr_action = np.random.uniform(-1.0, 1.0, self.action_dim)
        curr_action = np.random.uniform(-0.4, 0.4, self.action_dim)
        # Discretization
        # val_set = [0.1*x for x in range(-5,6)]
        # curr_action = np.random.choice(val_set, self.action_dim)

        # Query ifdm to get next state
        nstate = fdm_cont(state, curr_action)

        # Get x-y position
        nstate = np.reshape(nstate, [-1,self.state_dim])
        nstate_x, nstate_y = self.get_xy_pos(nstate)

        # Check cost
        # cost = abs(state_corrected[6] - nstate[6]) + abs(state_corrected[7] - nstate[7])
        cost = abs(state_corrected[0] - nstate_x) + abs(state_corrected[1] - nstate_y)

        # Check for min_cost
        if(cost < min_cost):
          min_cost = cost
          min_action = curr_action
        # # Check for min_cost and non-uniqueness
        # if((cost < min_cost) or (abs(min_cost-cost) < 0.1)): # If cost is lower or in neighborhood
        #   # # Choose smaller action
        #   # if(np.linalg.norm(curr_action) < np.linalg.norm(min_action)):
        #   #   min_cost = cost
        #   #   min_action = curr_action
        #   # Choose smaller state_diff
        #   if(np.linalg.norm(state-nstate) < min_state_diff):
        #     min_cost = cost
        #     min_action = curr_action
        #     min_state_diff = np.linalg.norm(state-nstate)

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
        self.human_feedback.viewer.render() # Render the additional feedback window        
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
        # Continuous actions
        A = np.copy(a)
      else:
        if (args.learnFDM):
          # Debug: equal timing
          time.sleep(0.002)
          # pass
        else:
          # Debug: equal timing
          time.sleep(0.085)

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
      # Zero redundant states
      z_index = [4,5,8,9,10]
      state[0,z_index] = 0
      prev_s[0,z_index] = 0

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
      # Continuos action space
      A = np.reshape(self.eval_policy(state), [-1])
      state, reward, terminal, _ = self.env.step(A)
      total_reward += reward
      if args.render:
        self.env.render()
        time.sleep(self.render_delay)

    return total_reward
    
if __name__ == "__main__":
  tips = TIPS_reacher(11, 2, lr=args.lr, maxEpisodes=args.maxEpisodes)
  tips.run()
