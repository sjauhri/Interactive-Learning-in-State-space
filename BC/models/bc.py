from utils import *
import gym

class BC():
  def __init__(self, state_shape, action_shape, lr=0.001, maxEpochs=20, epochTrainIts=5000, dynamicsSamples=5000, batch_size=32):
    # set initial value
    self.state_dim = state_shape            # state dimension
    self.action_dim = action_shape          # action dimension

    self.lr = lr                            # model/policy learning rate
    self.epochTrainIts = epochTrainIts      # maximum training iterations every epoch
    self.maxEpochs = maxEpochs              # maximum epochs to run
    self.batch_size = batch_size            # batch size
    
    self.ExpBuff  = []                      # Experience buffer for replay
    self.DemoBuff  = []                     # Demonstration buffer

    # initial session
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True
    self.sess = tf.Session(config=config)

    # set the input placeholder
    with tf.variable_scope("placeholder") as scope:
      self.state = tf.placeholder(tf.float32, [None, self.state_dim], name="state")
      self.action = tf.placeholder(tf.float32, [None, self.action_dim], name="action")
    
    # build policy model and forward dynamic model
    self.build_policy_model()

    # tensorboard output (TODO: Check if you really need tensorboard)
    #writer = tf.summary.FileWriter("logdir/", graph=self.sess.graph)

  def load_demonstration(self):
    """Load demonstration from the file"""
    if args.input_filename is None or not os.path.isfile(args.input_filename):
      raise Exception("input filename does not exist")

    with open(args.input_filename, 'rb') as f:
      expert_data = pickle.load(f)
      inputs = expert_data['observations']
      targets = expert_data['actions']
    
    num_samples = len(inputs)
    if(num_samples > 15000):
      inputs = inputs[0:15000]
      targets = targets[0:15000]
      num_samples = 15000
    print("[[[Loaded %d demonstrations]]]" % num_samples)

    return num_samples, inputs, targets

  def sample_demo(self, num_samples):
    """sample demonstration"""
    sample_ids = np.random.choice(self.demo_examples, num_samples)
    S = [ self.inputs[i] for i in sample_ids ]
    A = [ self.targets[i] for i in sample_ids ]
    return S, A

  def build_policy_model(self):
    """buliding the policy model as two fully connected layers with leaky relu"""
    raise NotImplementedError

  def eval_policy(self, state):
    """get the action by current state"""
    return self.sess.run(self.policy_pred_action, feed_dict={
      self.state: state
    })

  def eval_rwd_policy(self):
    """getting the reward by current policy model"""
    raise NotImplementedError
    
  def update_policy(self):
    """update policy model"""
    for it in range(1, self.epochTrainIts+1):
      batch_s, batch_a =  self.sample_demo(self.batch_size)
      # batch_a = []
      # for i in range(self.batch_size):
      #   batch_a.append(self.get_action(batch_s[i],batch_ns[i]))
      # batch_a = np.reshape(batch_a, [-1, self.action_dim])
      
      self.sess.run(self.policy_train_step, feed_dict={
      self.state : batch_s,
      self.action: batch_a
      })
      # Debug
      if it % 500 == 0:
        # Check policy loss on another data set.................
        S, A = self.sample_demo(int(round(self.demo_examples/10))) # 10% of the demo data
        # A = []
        # for i in range(len(S)):
        #   A.append(self.get_action(S[i],nS[i]))
        # A = np.reshape(A, [-1, self.action_dim])
        policy_loss = self.get_policy_loss(S, A)
        print('Policy train: iteration: %5d, policy_loss: %8.6f' % (it, policy_loss))
        self.log_writer.write("Policy train: iteration: " + str(it) + ", policy_loss: " + format(policy_loss, '8.6f') + "\n")
 
  def get_policy_loss(self, state, action):
    """get policy loss"""
    return self.sess.run(self.policy_loss, feed_dict={
      self.state: state,
      self.action: action
    })

  def train(self):
    """training the policy"""
    
    if args.usePrevSession:
      saver_prev = tf.train.Saver()
      saver_prev.restore(self.sess, args.prev_session_dir)
      print('[Loaded previous policy and session]')

    else:
      # Start session
      self.sess.run(tf.global_variables_initializer())
    
    # Init model saver
    saver = tf.train.Saver(max_to_keep=1)

    # Iterate over epochs
    for it in range(self.maxEpochs):
      def should(freq):
        return freq > 0 and ((it+1) % freq==0 or it == self.maxEpochs-1)
      
      # Train agent policy
      print("\n[Training policy]")
      self.update_policy()

      # saving session
      print('saving session')
      saver.save(self.sess, args.session_dir)

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

        print('Iteration: %5d, average_reward: %5.1f' % ((it+1), avg_reward))
        self.result_writer.write( str(it+1) + " , " + format(avg_reward, '8.6f') + "\n" )
        self.log_writer.write("\n" + "Iteration: " + str(it+1) + ", average_reward: " + str(avg_reward) + "\n" + "\n")

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

      # read demonstration data
      self.demo_examples, self.inputs, self.targets = self.load_demonstration()

      # store datetime for saving logs
      self.logTime = dt.datetime.now().strftime('%d%m%H%M%S')
        
      # Set random seed for experiment
      np.random.seed(5)
        
      self.result_writer = open(args.result_dir + self.logTime + ".csv", "w") # csv episode result log
      self.reward_writer = open(args.result_dir + self.logTime + "_rwd" + ".csv", "w") # csv all rewards log
      self.result_writer.write("iteration,average_reward,\n")
      self.reward_writer.write("agent_rewards\n")

      self.log_writer = open(args.result_dir + self.logTime + ".txt", "w") # txt debug log with everything

      self.train() # Train epochs
        
      self.result_writer.close()
      self.reward_writer.close()
      self.log_writer.close()