from utils import *
from feedback_lunar import *
from fdm_lunarl import *
import tensorflow as tf
import gym

class TELE_lunarlandercont():
  def __init__(self):    

    # For recording
    self.observations = []
    self.actions = []

    # Max Demonstration dataset size
    self.maxDemoSize = 15000
    
    # Set which game to play
    self.env = gym.make('LunarLanderContinuous-v2')
    self.state_dim = 8       # state dimension
    self.action_dim = 2      # action dimension

    self.env.reset()
    self.env.render()  # Make the environment visible

    # Initialise Human feedback (call render before this)
    self.human_feedback = Feedback_lunar(self.env)
    
    # Render time delay for this environment (in s)
    self.render_delay = 0.075

    # Min reward for environment
    self.min_reward = -70 # Atleast land lunarlander to be considered demonstration

    # Set error constant multiplier for this environment
    # 0.01, 0.05, 0.1, 0.5
    self.errorConst = 0.15

    self.ifdm_queries = 500 # Two continuous actions

    # Choose which feedback is valid with fb dictionary
    self.feedback_dict = {
      H_NULL: 0,
      H_UP: 1,
      H_DOWN: 1,
      H_LEFT: 1,
      H_RIGHT: 1,
      H_HOLD: 0,
      DO_NOTHING: 0,
      H_UPLEFT: 1,
      H_UPRIGHT: 1,
      H_DOWNLEFT: 1,
      H_DOWNRIGHT: 1
    }


  def setup_fdm_model(self):
    """setup variables for the forward dynamics model as two fully connnected layers with leaky relu"""
    with tf.variable_scope("forward_dynamic_model") as scope:
      with tf.variable_scope("input") as scope:
        fdm_input = tf.concat([self.state, self.action], 1)
      with tf.variable_scope("model") as scope:
        fdm_h1 = tf.layers.dense(fdm_input, 64, kernel_initializer=tf.truncated_normal_initializer(stddev=0.0001), bias_initializer=tf.truncated_normal_initializer(stddev=0.0001), name="dense_1")
        fdm_h1 = tf.nn.leaky_relu(fdm_h1, 0.2, name="LeakyRelu_1")
        fdm_h2 = tf.layers.dense(fdm_h1, 64, kernel_initializer=tf.truncated_normal_initializer(stddev=0.0001), bias_initializer=tf.truncated_normal_initializer(stddev=0.0001), name="dense_2")
        fdm_h2 = tf.nn.leaky_relu(fdm_h2, 0.2, name="LeakyRelu_2")

      with tf.variable_scope("output") as scope:                
        self.fdm_pred_state = tf.layers.dense(fdm_h2, self.state_dim, kernel_initializer=tf.truncated_normal_initializer(stddev=0.0001), bias_initializer=tf.truncated_normal_initializer(stddev=0.0001), name="dense")

      with tf.variable_scope("loss") as scope:
        self.fdm_loss = tf.reduce_mean(tf.squared_difference(self.fdm_pred_state, self.nstate))
      with tf.variable_scope("train_step") as scope:
        self.fdm_train_step = tf.train.AdamOptimizer(0.0005).minimize(self.fdm_loss)


  def eval_fdm(self, state, action):
    """get the next state using the forwards dynamic model"""
    return self.sess.run(self.fdm_pred_state, feed_dict={
      self.state: state,
      self.action: action
    })


  def get_state_corrected(self, h_fb, state):
    """get corrected state label for this environment using feedback"""

    state_corrected = np.copy(state)

    # IF CHANGING TYPE OF STATE FEEDBACK, ALSO CHANGE get_corrected_action()
    if (h_fb == H_LEFT):
      state_corrected[3] = 0                  # Zero vertical velocity
      state_corrected[5] += self.errorConst   # Angular velocity      
      # state_corrected[4] += self.errorConst   # Angular pos
      # state_corrected[0] -= self.errorConst   # Horizontal pos
    elif (h_fb == H_RIGHT):
      state_corrected[3] = 0                  # Zero vertical velocity
      state_corrected[5] -= self.errorConst   # Angular velocity
      # state_corrected[4] -= self.errorConst   # Angular pos
      # state_corrected[0] += self.errorConst   # Horizontal pos
    elif (h_fb == H_UP):
      state_corrected[3] += self.errorConst   # Vertical velocity      
      # state_corrected[1] += self.errorConst   # Vertical pos
      state_corrected[5] = 0                  # Zero angular velocity
    elif (h_fb == H_UPLEFT):
      state_corrected[3] += self.errorConst   # Vertical velocity
      state_corrected[5] += self.errorConst   # Angular velocity
      # state_corrected[0] -= self.errorConst   # Horizontal pos
      # state_corrected[4] += self.errorConst   # Angular pos
      # state_corrected[1] += self.errorConst   # Vertical pos
    elif (h_fb == H_UPRIGHT):
      state_corrected[3] += self.errorConst   # Vertical velocity
      state_corrected[5] -= self.errorConst   # Angular velocity
      # state_corrected[4] -= self.errorConst   # Angular pos
      # state_corrected[0] += self.errorConst   # Horizontal pos
      # state_corrected[1] += self.errorConst   # Vertical pos
    elif (h_fb == H_DOWN):
      state_corrected[3] -= self.errorConst   # Vertical velocity
      # state_corrected[1] -= self.errorConst   # Vertical pos
      state_corrected[5] = 0                  # Zero angular velocity
    elif (h_fb == H_DOWNLEFT):
      state_corrected[3] -= self.errorConst   # Vertical velocity
      state_corrected[5] += self.errorConst   # Angular velocity
      # state_corrected[0] -= self.errorConst   # Horizontal pos
      # state_corrected[4] += self.errorConst   # Angular pos
      # state_corrected[1] -= self.errorConst   # Vertical pos
    elif (h_fb == H_DOWNRIGHT):
      state_corrected[3] -= self.errorConst   # Vertical velocity
      state_corrected[5] -= self.errorConst   # Angular velocity
      # state_corrected[0] += self.errorConst   # Horizontal pos
      # state_corrected[4] -= self.errorConst   # Angular pos
      # state_corrected[1] -= self.errorConst   # Vertical pos

    return state_corrected


  def get_corrected_action(self, h_fb, state, state_corrected):
    """get action to achieve next state close to state_corrected"""

    if (h_fb == H_DOWN):
      min_action = np.array((-1,0)) # Dont fire any engine
      if (not args.trueFDM):
        # Debug: equal timing
        time.sleep(0.005)
        # pass
      else:
        # Debug: equal timing
        time.sleep(0.04)
    elif (not args.trueFDM):
      # Learnt FDM:

      # Make a vector of same states
      States = np.tile(state, (self.ifdm_queries,1))
      # Choose random actions
      # Continuous Actions
      Actions = np.random.uniform(-1, 1, (self.ifdm_queries,self.action_dim) )
      # Query ifdm to get next state
      Nstates = self.eval_fdm(States, Actions)

      # Calculate cost
      cost = abs(state_corrected[3] - Nstates[:,3]) + abs(state_corrected[5] - Nstates[:,5])      

      # Check for min_cost
      min_cost_index = cost.argmin(axis=0)
      min_action = Actions[min_cost_index]
    else:
      # True FDM:
      # Continous Actions
      min_action = np.random.uniform(-1, 1, self.action_dim)
      min_cost = np.Inf

      for _ in range(1, self.ifdm_queries+1):
        # Choose random action
        # Continous Actions
        curr_action = np.random.uniform(-1, 1, self.action_dim)
        # Discretization
        # val_set = [0.2*x for x in range(-5,6)]
        # curr_action = np.random.choice(val_set, self.action_dim)

        # Query ifdm to get next state
        nstate = fdm_cont(state, curr_action)

        # Check cost
        cost = abs(state_corrected[3] - nstate[3]) + abs(state_corrected[5] - nstate[5])

        # Check for min_cost
        if(cost < min_cost):
          min_cost = cost
          min_action = curr_action

    return min_action


  def run(self):
    """run and tele-operate agent"""
    terminal = False
    total_reward = 0
    state = self.env.reset()
    observations = []
    actions = []

    # Iterate over the episode
    while((not terminal) and (not self.human_feedback.ask_for_done()) and (not self.human_feedback.ask_for_end()) ):
      self.env.render()  # Make the environment visible
      time.sleep(self.render_delay)    # Add delay to rendering if necessary

      # Get feedback signal
      h_fb = self.human_feedback.get_h()

      if (self.feedback_dict.get(h_fb) != 0):  # if feedback is not zero i.e. is valid
        
        # Get new state transition label using feedback
        state_corrected = self.get_state_corrected(h_fb, state)

        # Get action from ifdm
        a = self.get_corrected_action(h_fb, state, state_corrected)
        # print("Requested Action: ", a)

      else:
        # Do nothing action
        # Continuous actions
        a = np.array([-1, 0])

      # Store observation, action pair
      observations.append(state)
      actions.append(a)

      # Act
      state, reward, terminal, _ = self.env.step(a)
      total_reward += reward

    return total_reward, observations, actions


  def save(self):
    # Save demonstrations in pickle file

    ob = [] # Observations
    act = [] # Actions taken
    ob_next = [] # Next observations

    # Optional: Search for existing file and add to it?
    # found = os.path.isfile(os.path.join(args.save_dir, self.env.unwrapped.spec.id + '.pkl'))
    # if found:
    #   with open(os.path.join(args.save_dir, self.env.unwrapped.spec.id + '.pkl'), 'rb') as f:
    #             expert_data = pickle.load(f)
    #             ob = expert_data['observations']
    #             act = expert_data['actions']
    #             ob_next = expert_data['observations_next']

    ob.extend(self.observations[0:-1])
    act.extend(self.actions[0:-1])
    ob_next.extend(self.observations[1:])
    
    expert_obs_data = {'observations': ob,
                       'actions': act,
                       'observations_next': ob_next}

    with open(os.path.join(args.save_dir, self.env.unwrapped.spec.id + '.pkl'), 'wb') as f:
                pickle.dump(expert_obs_data,f)

    print("Saved %d demonstration samples" % len(ob))


if __name__ == "__main__":
  tele = TELE_lunarlandercont()

  if not os.path.exists(args.save_dir):
    os.makedirs(args.save_dir)

  if (not args.trueFDM):
    # initial session
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True
    tele.sess = tf.Session(config=config)

    # set the input placeholder
    with tf.variable_scope("placeholder") as scope:
      tele.state = tf.placeholder(tf.float32, [None, tele.state_dim], name="state")
      tele.nstate = tf.placeholder(tf.float32, [None, tele.state_dim], name="next_state")
      tele.action = tf.placeholder(tf.float32, [None, tele.action_dim], name="action")

    # setup forward dynamic model
    tele.setup_fdm_model()

    # Restore previosly saved model
    fdm_variables =  tf.get_collection(tf.GraphKeys.VARIABLES, scope="forward_dynamic_model")
    saver_prev = tf.train.Saver(var_list=fdm_variables)
    saver_prev.restore(tele.sess, args.fdm_dir)
    print('[Loaded previous model and session]')
  
  # Save logs of runs
  logTime = dt.datetime.now().strftime('%d%m%H%M%S')
  result_writer = open(args.save_dir + logTime + ".csv", "w") # csv episode result log
  result_writer.write("iteration,reward,average_reward\n")
  log_writer = open(args.save_dir + logTime + ".txt", "w") # txt debug log with everything

  # Track average reward
  average_reward = 0

  # Successes
  success_count = 0

  # Iterate over episodes
  for it in range(args.maxEpisodes):

    # Optional: Countdown for trainer to be ready
    print("[Minimum reward for success is %5.1f]" % tele.min_reward)
    print("[Press Enter to save and finish session]")
    print('[Running new episode in....]')
    time.sleep(1)
    print('3')
    time.sleep(1)
    print('2')
    time.sleep(1)
    print('1')
    time.sleep(1)
    print('Start')
    
    reward, obs, acts = tele.run()

    if(tele.human_feedback.ask_for_end()):
      break

    if (reward >= tele.min_reward): # Min reward to consider it as demonstration
      print("[SUCCESS]")
      success_count += 1
      tele.observations.extend(obs)
      tele.actions.extend(acts)
      
    # Average rewards
    average_reward = average_reward*(it)
    average_reward = (average_reward + reward)/(it+1)

    print('episode_reward: %5.1f' % reward)
    print('Iteration %d: average_reward: %5.1f' % (it, average_reward))
    result_writer.write( str(it+1) + " , " + format(reward, '5.1f') + " , " + format(average_reward, '5.1f') + "\n" )
    log_writer.write("\n" + "Iteration " + str(it) + ": average_reward: " + format(average_reward, '5.1f'))
  
  if(args.record):
    tele.save()
    
  result_writer.close()
  log_writer.close()    
  print("End")