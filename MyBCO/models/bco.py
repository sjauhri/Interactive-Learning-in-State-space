from utils import *
import gym

class BCO():
  def __init__(self, state_shape, action_shape, lr=0.001, maxEpochs=200, epochTrainIts=5000, M=50, batch_size=32):
    # set initial value
    self.state_dim = state_shape            # state dimension
    self.action_dim = action_shape          # action dimension
    self.lr = lr                            # model update learning rate
    self.maxEpochs = maxEpochs              # maximum epochs
    self.epochTrainIts = epochTrainIts      # maximum training iterations every epoch
    self.batch_size = batch_size            # batch size
    self.alpha = 0.01                       # alpha = | post_demo | / | pre_demo |
    self.M = M                              # samples to update inverse dynamic model
    self.ExpBuff  = []                      # Experience buffer for replay 

    # initial session
    config = tf.ConfigProto()  
    config.gpu_options.allow_growth=True
    self.sess = tf.Session(config=config)

    # set the input placeholder
    with tf.variable_scope("placeholder") as scope:
      self.state = tf.placeholder(tf.float32, [None, self.state_dim], name="state")
      self.nstate = tf.placeholder(tf.float32, [None, self.state_dim], name="next_state")
      self.action = tf.placeholder(tf.float32, [None, self.action_dim], name="action")
    
    # build policy model and inverse dynamic model
    self.build_policy_model()
    self.build_idm_model()

    # tensorboard output
    writer = tf.summary.FileWriter("logdir/", graph=self.sess.graph)    

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
    print("Loaded %d demonstrations" % num_samples)
    #pdb.set_trace()

    return num_samples, inputs, targets

  def sample_demo(self, num_samples):
    """sample demonstration"""
    sample_idx = range(self.demo_examples)
    sample_idx = np.random.choice(sample_idx, num_samples)
    S = [ self.inputs[i] for i in sample_idx ]
    nS = [ self.targets[i] for i in sample_idx ]
    return S, nS

  def build_policy_model(self):
    """buliding the policy model as two fully connected layers with leaky relu"""
    raise NotImplementedError

  def build_idm_model(self):
    """building the inverse dynamic model as two fully connnected layers with leaky relu"""
    raise NotImplementedError

  def eval_policy(self, state):
    """get the action by current state"""
    return self.sess.run(self.policy_pred_action, feed_dict={
      self.state: state
    })

  def eval_idm(self, state, nstate):
    """get the action by inverse dynamic model from current state and next state"""    
    return self.sess.run(self.idm_pred_action, feed_dict={
      self.state: state,
      self.nstate: nstate
    })

  def pre_demonstration(self):
    """uniform sample action to generate (s_t, s_t+1) and action pairs"""
    raise NotImplementedError

  def post_demonstration(self, M):
    """using policy to generate (s_t, s_t+1) and action pairs"""
    raise NotImplementedError

  def eval_rwd_policy(self):
    """getting the reward by current policy model"""
    raise NotImplementedError
    
  def update_policy(self):
    """update policy model"""
    for it in range(1, self.epochTrainIts+1):
      batch_s, batch_ns =  self.sample_demo(self.batch_size)
      batch_a = self.eval_idm(batch_s, batch_ns)
      self.sess.run(self.policy_train_step, feed_dict={
      self.state : batch_s,
      self.action: batch_a
      })
      # Debug
      if it % 500 == 0:
        policy_loss = self.get_policy_loss(batch_s, batch_a)
        print('Policy train: iteration: %5d, policy loss: %8.6f' % (it, policy_loss))    
 
  def update_idm(self):
    """update inverse dynamic model"""
    num = len(self.ExpBuff)
    if(num >= self.batch_size):
      for it in range(1, self.epochTrainIts+1):        
        minibatch = random.sample(self.ExpBuff, self.batch_size)
        batch_s = [e[0] for e in minibatch]
        batch_ns = [e[1] for e in minibatch]
        batch_a = [e[2] for e in minibatch]        
        self.sess.run(self.idm_train_step, feed_dict={
          self.state : batch_s,
          self.nstate: batch_ns,
          self.action: batch_a
        })
        # Debug
        if it % 500 == 0:
          idm_loss = self.get_idm_loss(batch_s, batch_ns, batch_a)
          print('IDM train: iteration: %5d, idm loss: %8.6f' % (it, idm_loss))
    else:
      print("Error!! Batch size greater than number of samples provided for training")

  def get_policy_loss(self, state, action):
    """get policy model loss"""
    return self.sess.run(self.policy_loss, feed_dict={
      self.state: state,
      self.action: action
    })

  def get_idm_loss(self, state, nstate, action):
    """get inverse dynamic model loss"""
    idm_loss = self.sess.run(self.idm_loss, feed_dict={
      self.state: state,
      self.nstate: nstate,
      self.action: action
    })
    return idm_loss

  def train(self):
    """training the policy model and inverse dynamic model by behavioral cloning"""    
    
    # Start session
    self.sess.run(tf.global_variables_initializer())

    print("\n[Training]")
    # pre demonstration to update inverse dynamic model
    S, nS, A = self.pre_demonstration()
    # Add to Experience Buffer
    for id in range(0, len(S)):
      self.ExpBuff.append((S[id], nS[id], A[id]))
    self.update_idm()
    
    # Init model saver
    saver = tf.train.Saver(max_to_keep=1)

    for it in range(self.maxEpochs):
      def should(freq):
        return freq > 0 and ((it+1) % freq==0 or it == self.maxEpochs-1)

      # update policy pi
      currTime = time.time()
      self.update_policy()
      
      # Print time taken for debug
      if (args.printTime and should(args.print_freq)):
        print("Policy Learning time: ", time.time() - currTime)    

      # update inverse dynamic model
      S, nS, A = self.post_demonstration(self.M)
      for id in range(0, len(S)):
        self.ExpBuff.append((S[id], nS[id], A[id]))        
      currTime = time.time()
      self.update_idm()
      
      # Print time taken for debug
      if (args.printTime and should(args.print_freq)):
        print("Model Learning time: ", time.time() - currTime)      

      if should(args.print_freq):
        policy_reward = self.eval_rwd_policy()

        # Check policy loss on another data set.................
        S, nS = self.sample_demo(int(round(self.demo_examples/20))) # 5% of the demo data
        A = self.eval_idm(S, nS)
        policy_loss = self.get_policy_loss(S, A)
        # ...............................................        
        
        # Check idm loss on another data set.................
        S, nS, A = self.post_demonstration(self.M)
        idm_loss = self.get_idm_loss(S, nS, A)
        # ...............................................
        print('iteration: %5d, total reward: %5.1f, policy loss: %8.6f, idm loss: %8.6f' % ((it+1), policy_reward, policy_loss, idm_loss))

      # saving model
      if should(args.save_freq):
        print('saving model')
        saver.save(self.sess, args.model_dir)

      # Debug
      # After 5 iterations, redo pre demo learning
      #if should(5):
      #  S, nS, A = self.pre_demonstration()
      #for id in range(0, len(S)):
      #  self.ExpBuff.append((S[id], nS[id], A[id]))
      #  self.update_idm()


  def test(self):
    saver = tf.train.Saver()
    saver.restore(self.sess, args.model_dir)
    print('\n[Testing]\nFinal reward: %5.1f' % self.eval_rwd_policy())

  def run(self):
    if not os.path.exists(args.model_dir):
      os.makedirs(args.model_dir)

    if args.mode == 'test':
      if args.model_dir is None:
        raise Exception("checkpoint required for test mode")    

      self.test()

    if args.mode == 'train':
      # read demonstration data
      self.demo_examples, self.inputs, self.targets = self.load_demonstration()      

      self.train()

