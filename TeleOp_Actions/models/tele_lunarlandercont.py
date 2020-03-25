from utils import *
from feedback_lunar import *
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
    self.action_dim = 2          # action dimension

    self.env.reset()
    self.env.render()  # Make the environment visible

    # Initialise Human feedback (call render before this)
    self.human_feedback = Feedback_lunar(self.env)
    
    # Render time delay for this environment (in s)
    self.render_delay = 0.08

    # Min reward for environment
    self.min_reward = -70 # Atleast land lunarlander to be considered demonstration

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
        # Get requested action
        # Continuous actions
        if (h_fb == H_LEFT):
          a = np.array([0, -1])
        elif (h_fb == H_RIGHT):
          a = np.array([0, 1])
        elif (h_fb == H_UP):
          a = np.array([1, 0])
        elif (h_fb == H_UPLEFT):
          a = np.array([1, -1])
        elif (h_fb == H_UPRIGHT):
          a = np.array([1, 1])
        elif (h_fb == H_DOWN):
          a = np.array([-1, 0])
        elif (h_fb == H_DOWNLEFT):
          a = np.array([-1, -1])
        elif (h_fb == H_DOWNRIGHT):
          a = np.array([-1, 1])
        # print("Action: ", a)
      else:
        # Do nothing action
        # Continuous actions
        a = np.array([-1, 0])

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