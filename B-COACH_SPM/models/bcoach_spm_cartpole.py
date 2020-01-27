from utils import *
from bcoach_spm import BCOACH_SPM
from feedback import *
import gym

class BCOACH_SPM_cartpole(BCOACH_SPM):
  def __init__(self, state_shape, action_shape, lr=0.001, maxEpochs=20, epochTrainIts=5000, M=10, batch_size=8):  
    BCOACH_SPM.__init__(self, state_shape, action_shape, lr=lr, maxEpochs=maxEpochs, epochTrainIts=epochTrainIts, M=M, batch_size=batch_size)

    # set which game to play
    self.env = gym.make('CartPole-v0')
    self.env.reset()
    self.env.render()  # Make the environment visible
    #pdb.set_trace()
    #print(self.env.observation_space.high)

    # Initialise Human feedback (call render before this)
    self.human_feedback = Feedback(self.env)
    # Set error constant multiplier for this environment
    # 0.01, 0.05, 0.1, 0.5
    self.errorConst = 0.05
    # Render time delay for this environment (in s)
    self.render_delay = 0.1
    # Choose which feedback to act on with fb dictionary
    self.feedback_dict = {
      H_NULL: 0,      
      H_UP: 0,
      H_DOWN: 0,
      H_LEFT: -1,
      H_RIGHT: 1
    }
  
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
        idm_h1 = tf.layers.dense(idm_input, 8, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        idm_h1 = tf.nn.leaky_relu(idm_h1, 0.2, name="LeakyRelu_1")
        idm_h2 = tf.layers.dense(idm_h1, 8, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
        idm_h2 = tf.nn.leaky_relu(idm_h2, 0.2, name="LeakyRelu_2")

      with tf.variable_scope("output") as scope:
        idm_pred_action = tf.layers.dense(idm_h2, self.action_dim, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense")
        self.idm_pred_action = tf.one_hot(tf.argmax(idm_pred_action, axis=1), self.action_dim, name="one_hot")

      with tf.variable_scope("loss") as scope:
        self.idm_loss = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(labels=self.action, logits=idm_pred_action))
      with tf.variable_scope("train_step") as scope:
        self.idm_train_step = tf.train.AdamOptimizer(self.lr).minimize(self.idm_loss)

  def build_spm_model(self):
    """building the state prediction model as two fully connnected layers with leaky relu"""
    with tf.variable_scope("state_prediction_model") as scope:
      with tf.variable_scope("input") as scope:
        spm_input = tf.concat([self.state, self.state_corrected], 1)
      with tf.variable_scope("model") as scope:
        spm_h1 = tf.layers.dense(spm_input, 16, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_1")
        spm_h1 = tf.nn.leaky_relu(spm_h1, 0.2, name="LeakyRelu_1")
        spm_h2 = tf.layers.dense(spm_h1, 16, kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense_2")
        spm_h2 = tf.nn.leaky_relu(spm_h2, 0.2, name="LeakyRelu_2")

      with tf.variable_scope("output") as scope:
        self.spm_pred_state = tf.layers.dense(spm_h2, (self.state_dim-1), kernel_initializer=weight_initializer(), bias_initializer=bias_initializer(), name="dense")

      with tf.variable_scope("loss") as scope:
        self.spm_loss = tf.reduce_mean(tf.squared_difference(self.spm_pred_state, self.nstate_partial))
      with tf.variable_scope("train_step") as scope:
        self.spm_train_step = tf.train.AdamOptimizer(self.lr).minimize(self.spm_loss)


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

  def get_feedback_label(self, h_fb, nstate):
    """get new state transition label for this environment using feedback"""
    fb_value = self.feedback_dict.get(h_fb)
        
    # Acting on only pole angle
    new_s_transition = np.copy(nstate)
    #new_s_transition[0][0] += self.errorConst*fb_value
    new_s_transition[0][1] += self.errorConst*fb_value*2
    #new_s_transition[0][2] -= self.errorConst*fb_value
    #new_s_transition[0][3] -= self.errorConst*fb_value*5
    return new_s_transition

  def get_state_corrected(self, h_fb, nstate):
    """get corrected state label for this environment using feedback"""
    fb_value = self.feedback_dict.get(h_fb)

    # Acting on only pole angle
    state_corrected = np.copy(nstate)
    #state_corrected[0][0] += self.errorConst*fb_value
    state_corrected[0][1] += self.errorConst*fb_value*2
    #state_corrected[0][2] -= self.errorConst*fb_value
    #state_corrected[0][3] -= self.errorConst*fb_value*5
    return state_corrected[0][1] # Change this!!

  def eval_spm(self, state, state_corrected):
    """get the action by inverse dynamic model from current state and next state"""
    nstate_partial = self.sess.run(self.spm_pred_state, feed_dict={
      self.state: state,
      self.state_corrected: state_corrected
    })
    nstate = np.insert(nstate_partial, 1, values=state_corrected, axis=1)
    return nstate

  def update_spm(self):
    """update state prediction model"""
    for it in range(1, self.epochTrainIts+1):
      batch_s, batch_ns =  self.sample_demo(self.batch_size)  
      # Use the corresponding state from next_state as corrected state
      batch_state_corrected = [ [st[1]] for st in batch_ns ]
      # Remove this state column from batch_ns
      batch_ns_partial = np.delete(batch_ns, 1, axis=1)
      self.sess.run(self.spm_train_step, feed_dict={
      self.state: batch_s,
      self.state_corrected: batch_state_corrected,
      self.nstate_partial: batch_ns_partial
      })
      # Debug
      if it % 500 == 0:
        # TODO: Get loss on another dataset
        spm_loss = self.get_spm_loss(batch_s, batch_state_corrected, batch_ns_partial)
        print('SPM train: iteration: %5d, spm_loss: %8.6f' % (it, spm_loss))
        self.log_writer.write("SPM train: iteration: " + str(it) + ", spm_loss: " + format(spm_loss, '8.6f') + "\n")

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
        time.sleep(self.render_delay)

    return total_reward
    
if __name__ == "__main__":
  bcoach_spm = BCOACH_SPM_cartpole(4, 2, lr=args.lr, maxEpochs=args.maxEpochs)
  bcoach_spm.run()
