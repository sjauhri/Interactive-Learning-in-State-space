from utils import *
from bc import BC
import gym

class BC_cartpole(BC):
  def __init__(self, state_shape, action_shape, lr=0.0005, maxEpochs=20, epochTrainIts=4000, batch_size=16):
    BC.__init__(self, state_shape, action_shape, lr=lr, maxEpochs=maxEpochs, epochTrainIts=epochTrainIts, batch_size=batch_size)

    # set which game to play
    self.env = gym.make('CartPole-v0')

    # Delay when rendering
    self.render_delay = 0.075

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
  bclone = BC_cartpole(4, 2, lr=args.lr, maxEpochs=args.maxEpochs)
  bclone.run()
