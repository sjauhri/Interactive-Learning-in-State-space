from utils import *

class TELE():
  def __init__(self, state_shape, action_shape, maxEpisodes=40):
    # set initial value
    self.state_dim = state_shape            # state dimension
    self.action_dim = action_shape          # action dimension

    self.maxDemoSize = 15000                # Max Demonstration dataset size
    
    self.maxEpisodes = maxEpisodes          # maximum episodes

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

  def get_action(self, state, nstate_required):
    """get action to achieve next state close to nstate_required"""
    raise NotImplementedError

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

        # Optional: Update FDM
        if (args.learnFDM):
          if (it < 16 and should(2)):
            S, nS, A = self.exploration_dynamics_sampling() # Sample policy with exploration and update forward dynamic model
            # Add to Experience Buffer
            for id in range(0, len(S)):
              self.ExpBuff.append((S[id], nS[id], A[id]))
              if (len(self.ExpBuff) > self.maxExpBuffSize):
                self.ExpBuff.pop(0)
            # Update FDM
            self.update_fdm()


        if should(args.print_freq):
          policy_reward = 0
          numTrials = 9
          for i in range(numTrials):
            policy_reward += self.eval_rwd_policy()
            print("Background Trial: ", i+1)
          avg_reward = policy_reward/numTrials

          # Check policy loss on another data set.................
          S, nS = self.sample_demo(int(round(self.demo_examples/10))) # 10% of the demo data
          A = []
          for i in range(len(S)):
            A.append(self.get_action(S[i],nS[i]))
          A = np.reshape(A, [-1, self.action_dim])
          policy_loss = self.get_policy_loss(S, A)
          # ......................................................

          # Check fdm loss on another data set....................
          minibatch_ids = np.random.choice(len(self.ExpBuff), int(round( self.dynamicsSamples/10 )) ) # 10% of the dynamics data
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

  def run(self):
    if not os.path.exists(args.session_dir):
      os.makedirs(args.session_dir)

    # Iterate over episodes
    for it in range(self.maxEpisodes):        
      
      self.train() # Train epochs
        
      self.result_writer.close()
      self.log_writer.close()