from utils import *
import gym

class TIPS():
  def __init__(self, state_shape, action_shape, lr=0.001, maxEpisodes=40, epochTrainIts=5000, dynamicsSamples=5000, batch_size=32):
    # set initial value
    self.state_dim = state_shape            # state dimension
    self.action_dim = action_shape          # action dimension

    self.dynamicsSamples = dynamicsSamples  # number of samples to initially learn the dynamics
    self.lr = lr                            # model/policy learning rate
    self.epochTrainIts = epochTrainIts      # maximum training iterations every epoch
    self.batch_size = batch_size            # batch size
    
    self.ExpBuff  = []                      # Experience buffer for replay
    self.DemoBuff  = []                     # Demonstration buffer
    self.maxExpBuffSize = 20000             # Max Experience buffer size
    self.maxDemoBuffSize = 2000             # Max Demonstration buffer size
    
    self.maxEpisodes = maxEpisodes          # maximum episodes
    self.feedback_training_rate  = 10       # Feedback training rate in the episode

    # initial session
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True
    self.sess = tf.Session(config=config)

    # set the input placeholder
    with tf.variable_scope("placeholder") as scope:
      self.state = tf.placeholder(tf.float32, [None, self.state_dim], name="state")
      self.nstate = tf.placeholder(tf.float32, [None, self.state_dim], name="next_state")
      self.action = tf.placeholder(tf.float32, [None, self.action_dim], name="action")
    
    # build policy model and forward dynamic model
    self.build_policy_model()
    self.build_fdm_model()

    # tensorboard output (TODO: Check if you really need tensorboard)
    #writer = tf.summary.FileWriter("logdir/", graph=self.sess.graph)

  def load_demonstration(self):
    """Load demonstration from the file"""
    if args.input_filename is None or not os.path.isfile(args.input_filename):
      raise Exception("input filename does not exist")

    with open(args.input_filename, 'rb') as f:
      expert_data = pickle.load(f)
      inputs = expert_data['observations']
      targets = expert_data['observations_next']
    
    num_samples = len(inputs)
    if(num_samples > 10000):
      inputs = inputs[0:10000]
      targets = targets[0:10000]
      num_samples = 10000
    print("[[[Loaded %d demonstrations]]]" % num_samples)

    return num_samples, inputs, targets

  def sample_demo(self, num_samples):
    """sample demonstration"""
    sample_ids = np.random.choice(self.demo_examples, num_samples)
    S = [ self.inputs[i] for i in sample_ids ]
    nS = [ self.targets[i] for i in sample_ids ]
    return S, nS

  def build_policy_model(self):
    """buliding the policy model as two fully connected layers with leaky relu"""
    raise NotImplementedError

  def build_fdm_model(self):
    """building the forward dynamic model as two fully connnected layers with leaky relu"""
    raise NotImplementedError

  def eval_policy(self, state):
    """get the action by current state"""
    return self.sess.run(self.policy_pred_action, feed_dict={
      self.state: state
    })

  def eval_fdm(self, state, action):
    """get the next state using the forwards dynamic model"""
    return self.sess.run(self.fdm_pred_state, feed_dict={
      self.state: state,
      self.action: action
    })

  def dynamics_sampling(self):
    """uniform sampling of actions to generate (s_t, s_t+1) and action pairs"""
    raise NotImplementedError

  def feedback_run(self):
    """run and train using D-COACH framework incorporating human feedback"""
    raise NotImplementedError

  def eval_rwd_policy(self):
    """getting the reward by current policy model"""
    raise NotImplementedError

  def get_action(self, state, nstate_required):
    """get action to achieve next state close to nstate_required"""
    raise NotImplementedError
    
  def update_policy(self):
    """update policy model"""
    for it in range(1, self.epochTrainIts+1):
      batch_s, batch_ns =  self.sample_demo(self.batch_size)
      batch_a = []
      for i in range(self.batch_size):
        batch_a.append(self.get_action(batch_s[i],batch_ns[i]))
      batch_a = np.reshape(batch_a, [-1, self.action_dim])
      
      self.sess.run(self.policy_train_step, feed_dict={
      self.state : batch_s,
      self.action: batch_a
      })
      # Debug
      if it % 500 == 0:
        # Check policy loss on another data set.................
        S, nS = self.sample_demo(int(round(self.demo_examples/100))) # 1% of the demo data
        A = []
        for i in range(len(S)):
          A.append(self.get_action(S[i],nS[i]))
        A = np.reshape(A, [-1, self.action_dim])
        policy_loss = self.get_policy_loss(S, A)
        print('Policy train: iteration: %5d, policy_loss: %8.6f' % (it, policy_loss))
        self.log_writer.write("Policy train: iteration: " + str(it) + ", policy_loss: " + format(policy_loss, '8.6f') + "\n")
 
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

  def update_fdm(self):
    """update forward dynamic model"""

    num = len(self.ExpBuff)
    if(num >= self.batch_size):
      for it in range(1, self.epochTrainIts+1):
        minibatch_ids = np.random.choice(len(self.ExpBuff), self.batch_size)
        batch_s = [self.ExpBuff[id][0] for id in minibatch_ids]
        batch_ns = [self.ExpBuff[id][1] for id in minibatch_ids]
        batch_a = [self.ExpBuff[id][2] for id in minibatch_ids]
        self.sess.run(self.fdm_train_step, feed_dict={
          self.state : batch_s,
          self.nstate: batch_ns,
          self.action: batch_a
        })
        # Debug
        if it % 500 == 0:
          # Check fdm loss
          minibatch_ids = np.random.choice(len(self.ExpBuff), int(round( self.dynamicsSamples/100 )) ) # 1% of the dynamics data
          batch_s = [self.ExpBuff[id][0] for id in minibatch_ids]
          batch_ns = [self.ExpBuff[id][1] for id in minibatch_ids]
          batch_a = [self.ExpBuff[id][2] for id in minibatch_ids]

          fdm_loss = self.get_fdm_loss(batch_s, batch_ns, batch_a)
          print('FDM train: iteration: %5d, fdm_loss: %8.6f' % (it, fdm_loss))
          self.log_writer.write("FDM train: iteration: " + str(it) + ", fdm_loss: " + format(fdm_loss, '8.6f') + "\n")
    else:
      print("Error!! Batch size greater than number of samples provided for training")

  def get_policy_loss(self, state, action):
    """get policy loss"""
    return self.sess.run(self.policy_loss, feed_dict={
      self.state: state,
      self.action: action
    })

  def get_fdm_loss(self, state, nstate, action):
    """get inverse dynamic model loss"""
    fdm_loss = self.sess.run(self.fdm_loss, feed_dict={
      self.state: state,
      self.nstate: nstate,
      self.action: action
    })
    return fdm_loss

  def train(self):
    """training the policy and forward dynamics model"""
    
    if args.usePrevSession:
      saver_prev = tf.train.Saver()
      saver_prev.restore(self.sess, args.prev_session_dir)
      print('[Loaded previous model and session]')

      # NOTE: Re-init policy here if you wish
    else:
      # Start session
      self.sess.run(tf.global_variables_initializer())
    
      # Optional: Learn FDM using random sampling
      if (args.learnFDM):
        print("\n[Random sampling to learn FDM]")
        S, nS, A = self.dynamics_sampling()
        # Add to Experience Buffer
        for id in range(0, len(S)):
          self.ExpBuff.append((S[id], nS[id], A[id]))
        self.update_fdm()

      # Optional: Train initial policy from demonstrations
      if (args.initPolicy):      
        print("\n[Training initial policy]")
        self.update_policy()
    
    # Init model saver
    saver = tf.train.Saver(max_to_keep=1)
    # save current session    
    print('saving session')
    saver.save(self.sess, args.session_dir)
    
    if (args.runAgent):
      # Execute agent policy

      # Iterate over episodes
      for it in range(self.maxEpisodes):
        def should(freq):
          return freq > 0 and ((it+1) % freq==0 or it == self.maxEpisodes-1)
        
        # Optional: Countdown for trainer to be ready
        print('[Running new episode in....]')
        time.sleep(1)
        print('3')
        time.sleep(1)
        print('2')
        time.sleep(1)
        print('1')
        time.sleep(1)
        print('Start')
        # Optional: Update policy pi #######################
        # if should(1):
        #   self.update_policy()
        ##########################################
        
        # Run with human feedback
        self.feedback_run()
        print('[Episode ended]')

        # Optional: Update forward dynamic model
        if (args.learnFDM):
          if should(2):
            self.update_fdm()        
        
        if should(args.print_freq):

          policy_reward = 0
          numTrials = 10
          for _ in range(numTrials):
            policy_reward += self.eval_rwd_policy()
          avg_reward = policy_reward/numTrials

          # Check policy loss on another data set.................
          S, nS = self.sample_demo(int(round(self.demo_examples/100))) # 1% of the demo data
          A = []
          for i in range(len(S)):
            A.append(self.get_action(S[i],nS[i]))
          A = np.reshape(A, [-1, self.action_dim])
          policy_loss = self.get_policy_loss(S, A)
          # ......................................................

          # Check fdm loss on another data set....................
          minibatch_ids = np.random.choice(len(self.ExpBuff), int(round( self.dynamicsSamples/100 )) ) # 1% of the dynamics data
          batch_s = [self.ExpBuff[id][0] for id in minibatch_ids]
          batch_ns = [self.ExpBuff[id][1] for id in minibatch_ids]
          batch_a = [self.ExpBuff[id][2] for id in minibatch_ids]

          fdm_loss = self.get_fdm_loss(batch_s, batch_ns, batch_a)
          # ......................................................
          # print('iteration: %5d, average_reward: %5.1f, policy_loss: %8.6f, fdm_loss: %8.6f' % ((it+1), avg_reward, policy_loss, fdm_loss))
          print('iteration: %5d, average_reward: %5.1f' % ((it+1), avg_reward))
          self.result_writer.write( str(it+1) + " , " + format(avg_reward, '8.6f') + " , " + format(policy_loss, '8.6f') + " , " + format(fdm_loss, '8.6f') + "\n" )
          self.log_writer.write("\n" + "iteration: " + str(it+1) + ", average_reward: " + str(avg_reward) + ", policy_loss: " + format(policy_loss, '8.6f') + ", fdm_loss: " + format(fdm_loss, '8.6f') + "\n" + "\n")

        # saving session
        if should(args.save_freq):
          print('saving session')
          saver.save(self.sess, args.session_dir)
    
    else:      
      # End: Not running agent
      print("Note: Use --runAgent option to execute behavior\n[End]")

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
      self.logTime = dt.datetime.now().strftime('%d%m%H%M')
      
      self.exp = 0
      for self.exp in range(0, args.numExperiments):
        
        # Set random seed for experiment
        np.random.seed(self.exp + 5)
        
        self.result_writer = open(args.result_dir + self.logTime + "_" + str(self.exp) + ".csv", "w") # csv episode result log
        self.result_writer.write("iteration,average_reward,policy_loss,fdm_loss\n")

        self.log_writer = open(args.result_dir + self.logTime + "_" + str(self.exp) + ".txt", "w") # txt debug log with everything
        
        self.train() # Train epochs
        
        self.result_writer.close()
        self.log_writer.close()