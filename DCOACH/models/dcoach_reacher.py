from utils import *
from dcoach import DCOACH
from feedback_ext import *
import gym

class DCOACH_reacher(DCOACH):
  def __init__(self, state_shape, action_shape, lr=0.001, maxEpisodes=20, batch_size=32):
    DCOACH.__init__(self, state_shape, action_shape, lr=lr, maxEpisodes=maxEpisodes, batch_size=batch_size)

    # set which game to play
    self.env = gym.make('Reacher-v2')
    self.env.reset()
    self.env.render()  # Make the environment visible

    # Initialise Human feedback in external window
    self.human_feedback = Feedback_ext()
    self.human_feedback.viewer.render() # Render the additional feedback window
    # Set error constant multiplier for this environment
    # 0.01, 0.05, 0.1, 0.5, 0.75 1
    self.errorConst = 0.15
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
      H_HOLD: 0,
      DO_NOTHING: 0
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

        # Get corrected action
        if (h_fb == H_LEFT):
          a[0] += self.errorConst  # 1st joint anticlockwise
          a[1] = 0                 # Don't move 2nd joint
        elif (h_fb == H_RIGHT):
          a[0] -= self.errorConst  # 1st jointclockwise
          a[1] = 0                 # Don't move 2nd joint
        elif (h_fb == H_UP):
          a[0] = 0                 # Don't move 1st joint
          a[1] += self.errorConst  # 2nd joint anticlockwise
        elif (h_fb == H_DOWN):
          a[0] = 0                 # Don't move 1st joint
          a[1] -= self.errorConst  # 2nd joint clockwise

        # print("Computed Action: ", a)
        # Clip action to permissible values
        a = np.clip(a, -1, 1)

        # Update policy (immediate)
        a = np.reshape(a, [-1, self.action_dim])
        self.update_policy_feedback_immediate(prev_s, a)

        # Add state-action pair to demo buffer
        self.DemoBuff.append((prev_s[0], a[0]))
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
  d_coach = DCOACH_reacher(11, 2, lr=args.lr, maxEpisodes=args.maxEpisodes)
  d_coach.run()
