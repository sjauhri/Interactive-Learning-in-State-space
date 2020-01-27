from utils import *
from bcoach import BCOACH
from feedback import *
import gym

class BCOACH_lunarlandercont(BCOACH):
  def __init__(self, state_shape, action_shape, lr=0.001, maxEpochs=20, epochTrainIts=7000, M=200, batch_size=32):
    BCOACH.__init__(self, state_shape, action_shape, lr=lr, maxEpochs=maxEpochs, epochTrainIts=epochTrainIts, M=M, batch_size=batch_size)

    # set which game to play
    self.env = gym.make('LunarLanderContinuous-v2')
    self.env.reset()
    self.env.render()  # Make the environment visible
    #pdb.set_trace()
    #print(self.env.observation_space.high)

    # Initialise Human feedback (call render before this)
    self.human_feedback = Feedback(self.env)
    # Set error constant multiplier for this environment
    # 0.01, 0.05, 0.1, 0.5, 1, 5
    self.errorConst = 0.25
    # Render time delay for this environment (in s)
    self.render_delay = 0.05
    # Choose which feedback to act on with fb dictionary
    self.feedback_dict = {
      H_NULL: 0,      
      H_UP: 1,
      H_DOWN: 1,
      H_LEFT: 1,
      H_RIGHT: 1
    }
  
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

  def build_idm_model(self):
    """building the inverse dynamic model as two fully connnected layers with leaky relu"""
    with tf.variable_scope("inverse_dynamic_model") as scope:
      with tf.variable_scope("input") as scope:
        idm_input = tf.concat([self.state, self.nstate], 1)
      with tf.variable_scope("model") as scope:
        idm_h1 = tf.layers.dense(idm_input, 32, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        idm_h1 = tf.nn.leaky_relu(idm_h1, 0.2, name="LeakyRelu_1")
        idm_h2 = tf.layers.dense(idm_h1, 32, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
        idm_h2 = tf.nn.leaky_relu(idm_h2, 0.2, name="LeakyRelu_2")

      with tf.variable_scope("output") as scope:
        self.tmp_idm_pred_action = tf.layers.dense(idm_h2, self.action_dim, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense")
        self.idm_pred_action = tf.clip_by_value(self.tmp_idm_pred_action, clip_value_min=-1, clip_value_max=1)

      with tf.variable_scope("loss") as scope:
        self.idm_loss = tf.reduce_mean(tf.squared_difference(self.idm_pred_action, self.action))
      with tf.variable_scope("train_step") as scope:
        self.idm_train_step = tf.train.AdamOptimizer(self.lr).minimize(self.idm_loss)

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
        print("Collecting idm training data ", i+1)
        self.log_writer.write("Collecting idm training data " + str(i+1) + "\n")

    return States, Nstates, Actions

  def get_feedback_label(self, h_fb, nstate):
    """get new state transition label for this environment using feedback"""
    #fb_value = self.feedback_dict.get(h_fb)
    
    new_s_transition = np.copy(nstate)

    if (h_fb == H_LEFT): # Angular velocity
      new_s_transition[0][5] += self.errorConst
    elif (h_fb == H_RIGHT):
      new_s_transition[0][5] -= self.errorConst
    elif (h_fb == H_UP):
      new_s_transition[0][3] += self.errorConst
    elif (h_fb == H_DOWN):
      new_s_transition[0][3] -= self.errorConst
    
    return new_s_transition

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
  bcoach = BCOACH_lunarlandercont(8, 2, lr=args.lr, maxEpochs=args.maxEpochs)
  bcoach.run()
