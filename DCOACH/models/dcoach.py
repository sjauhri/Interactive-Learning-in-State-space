from utils import *
import gym

class DCOACH():
  def __init__(self, state_shape, action_shape, lr=0.001, maxEpisodes=40, epochTrainIts=5000, dynamicsSamples=5000, batch_size=32):
    # set initial value
    self.state_dim = state_shape            # state dimension
    self.action_dim = action_shape          # action dimension

    self.lr = lr                            # model/policy learning rate
    self.batch_size = batch_size            # batch size
    
    self.DemoBuff  = []                     # Demonstration buffer
    self.maxDemoBuffSize = 4000             # Max Demonstration buffer size
    
    self.maxEpisodes = maxEpisodes          # maximum episodes

    # initial session
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True
    self.sess = tf.Session(config=config)

    # set the input placeholder
    with tf.variable_scope("placeholder") as scope:
      self.state = tf.placeholder(tf.float32, [None, self.state_dim], name="state")
      self.action = tf.placeholder(tf.float32, [None, self.action_dim], name="action")
    
    # build policy model
    self.build_policy_model()

  def build_policy_model(self):
    """buliding the policy model as two fully connected layers with leaky relu"""
    raise NotImplementedError

  def eval_policy(self, state):
    """get the action by current state"""
    return self.sess.run(self.policy_pred_action, feed_dict={
      self.state: state
    })

  def feedback_run(self):
    """run and train using D-COACH framework incorporating human feedback"""
    raise NotImplementedError

  def eval_rwd_policy(self):
    """getting the reward by current policy model"""
    raise NotImplementedError
 
  def update_policy_feedback(self):
    """update policy using labels from Demo Buffer"""
    num = len(self.DemoBuff)
    if(num >= self.batch_size):
      minibatch_ids = np.random.choice(len(self.DemoBuff), self.batch_size)
      batch_s = [self.DemoBuff[id][0] for id in minibatch_ids]
      batch_a = [self.DemoBuff[id][1] for id in minibatch_ids]

      self.sess.run(self.policy_train_step, feed_dict={
      self.state : batch_s,
      self.action: batch_a
      })

  def update_policy_feedback_immediate(self, state, action):
    """update policy using given label"""
    # Train single step
    self.sess.run(self.policy_train_step, feed_dict={
      self.state : state,
      self.action: action
      })

  def train(self):
    """training the policy"""
    
    if args.usePrevSession:
      saver_prev = tf.train.Saver()
      saver_prev.restore(self.sess, args.prev_session_dir)
      print('[Loaded previous session]')

    else:
      # Start session
      self.sess.run(tf.global_variables_initializer())
    
    # Init model saver
    saver = tf.train.Saver(max_to_keep=1)

    # Iterate over episodes
    for it in range(self.maxEpisodes):
      def should(freq):
        return freq > 0 and ((it+1) % freq==0 or it == self.maxEpisodes-1)
      
      # Optional: Countdown for trainer to be ready
      if (not args.fast):
        print('[Running new episode in....]')
        time.sleep(1)
        print('3')
        time.sleep(1)
        print('2')
        time.sleep(1)
        print('1')
        time.sleep(1)
        print('Start')
      
      # Run with human feedback, get feedback rate
      feedback_rate = self.feedback_run()
      print('[Episode ended]')

      if should(args.print_freq):
        policy_reward = 0
        numTrials = 9
        for i in range(numTrials):
          curr_reward = self.eval_rwd_policy()
          policy_reward += curr_reward
          print("Background Trial: %d, reward: %5.1f" % (i+1, curr_reward))
          self.log_writer.write("\n" + "Background Trial: " + str(i+1) + ", reward: " + str(curr_reward))
          self.reward_writer.write(format(curr_reward, '8.6f') + "\n" )
        avg_reward = policy_reward/numTrials

        print('Iteration: %5d, average_reward: %5.1f, feedback_rate: %1.3f' % ((it+1), avg_reward, feedback_rate))
        self.result_writer.write( str(it+1) + " , " + format(avg_reward, '8.6f') + " , " + format(feedback_rate, '8.6f') + "\n" )
        self.log_writer.write("\n" + "Iteration: " + str(it+1) + ", average_reward: " + str(avg_reward) + ", feedback_rate: " + str(feedback_rate) + "\n" + "\n")

      # saving session
      if should(args.save_freq):
        print('saving session')
        saver.save(self.sess, args.session_dir)

  def test(self):
    saver = tf.train.Saver()
    saver.restore(self.sess, args.session_dir)
    print('\n[Testing]\nFinal reward: %5.1f' % self.eval_rwd_policy())

  def run(self):
    if not os.path.exists(args.session_dir):
      os.makedirs(args.session_dir)

    if args.mode == 'test':
      if args.session_dir is None:
        raise Exception("checkpoint required for test mode")

      self.test()

    if args.mode == 'train':
      if not os.path.exists(args.result_dir):
        os.makedirs(args.result_dir)

      # store datetime for saving logs
      self.logTime = dt.datetime.now().strftime('%d%m%H%M%S')
      
      self.exp = 0
      for self.exp in range(0, args.numExperiments):
        
        # Set random seed for experiment
        np.random.seed(self.exp + 5)
        
        self.result_writer = open(args.result_dir + self.logTime + "_" + str(self.exp) + ".csv", "w") # csv episode result log
        self.reward_writer = open(args.result_dir + self.logTime + "_rwd_" + str(self.exp) + ".csv", "w") # csv all rewards log
        self.result_writer.write("iteration,average_reward,feedback_rate\n")
        self.reward_writer.write("agent_rewards\n")

        self.log_writer = open(args.result_dir + self.logTime + "_" + str(self.exp) + ".txt", "w") # txt debug log with everything
        
        self.train() # Train epochs
        
        self.result_writer.close()
        self.reward_writer.close()
        self.log_writer.close()