from utils import *
from bcoach import BCOACH
import gym

class BCOACH_acrobot(BCOACH):
  def __init__(self, state_shape, action_shape, lr=0.001, maxEpochs=20, epochTrainIts=5000, M=80):
    BCOACH.__init__(self, state_shape, action_shape, lr=lr, maxEpochs=maxEpochs, epochTrainIts=epochTrainIts, M=M)

    # set which game to play
    self.env = gym.make('Acrobot-v1')    
    #print(self.env.observation_space)    
    self.env.render()
    #import pdb; pdb.set_trace()
    self.env.viewer.window.on_key_press = key_press
    self.env.viewer.window.on_key_release = key_release
  
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
        policy_pred_action = tf.layers.dense(policy_h2, self.action_dim, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense")
        self.tmp_policy_pred_action = policy_pred_action
        self.policy_pred_action = tf.one_hot(tf.argmax(policy_pred_action, axis=1), self.action_dim, name="one_hot")

      with tf.variable_scope("loss") as scope:
        self.policy_loss = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(labels=self.action, logits=policy_pred_action))
      with tf.variable_scope("train_step") as scope:
        self.policy_train_step = tf.train.AdamOptimizer(self.lr).minimize(self.policy_loss)

  def build_idm_model(self):
    """building the inverse dynamic model as two fully connnected layers with leaky relu"""
    with tf.variable_scope("inverse_dynamic_model") as scope:
      with tf.variable_scope("input") as scope:
        idm_input = tf.concat([self.state, self.nstate], 1)
      with tf.variable_scope("model") as scope:
        idm_h1 = tf.layers.dense(idm_input, 100, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        idm_h1 = tf.nn.leaky_relu(idm_h1, 0.2, name="LeakyRelu_1")
        idm_h2 = tf.layers.dense(idm_h1, 100, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
        idm_h2 = tf.nn.leaky_relu(idm_h2, 0.2, name="LeakyRelu_2")

      with tf.variable_scope("output") as scope:
        idm_pred_action = tf.layers.dense(idm_h2, self.action_dim, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense")
        self.idm_pred_action = tf.one_hot(tf.argmax(idm_pred_action, axis=1), self.action_dim, name="one_hot")

      with tf.variable_scope("loss") as scope:
        self.idm_loss = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(labels=self.action, logits=idm_pred_action))
      with tf.variable_scope("train_step") as scope:
        self.idm_train_step = tf.train.AdamOptimizer(self.lr).minimize(self.idm_loss)

  def pre_demonstration(self):
    """uniform sample action to generate (s_t, s_t+1) and action pairs"""
    terminal = True
    States = []
    Nstates = []
    Actions = []

    for i in range(int(round(self.M) / self.alpha)):
      if terminal:
        state = self.env.reset()

      prev_s = state
      state = np.reshape(state, [-1, self.state_dim])

      A = np.random.randint(self.action_dim)
      a = np.zeros([self.action_dim])
      a[A] = 1

      state, _, terminal, _ = self.env.step(A)

      States.append(prev_s)
      Nstates.append(state)
      Actions.append(a)

      if i and (i+1) % 1000 == 0:
        print("Collecting idm training data ", i+1)
        self.log_writer.write("Collecting idm training data " + str(i+1) + "\n")

    return States, Nstates, Actions

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

      a = np.reshape(self.eval_policy(state), [-1])
      A = np.argmax(a)
      state, _, terminal, _ = self.env.step(A)

      States.append(prev_s)
      Nstates.append(state)
      Actions.append(a)

    return States, Nstates, Actions

  def eval_rwd_policy(self):
    """getting the reward by current policy model"""
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
        time.sleep(0.05)

    return total_reward
    
if __name__ == "__main__":
  bcoach = BCOACH_acrobot(6, 3, lr=args.lr, maxEpochs=args.maxEpochs)
  bcoach.run()
