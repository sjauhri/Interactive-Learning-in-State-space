import pickle
import os
import argparse
import numpy as np

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--final_model_file", help="demonstration text file with obs, obs_next")
    parser.add_argument("--envname", type=str)
    args = parser.parse_args()

    states = []
    next_states = []
    for line in open(args.final_model_file):
        state, next_state = line.replace("\n", "").split(" ")
        state = eval(state)
        next_state = eval(next_state)
        states.append(state)
        next_states.append(next_state)

    print('OBS shape', np.array(states).shape)
    print('obs1', np.array(states)[0])    
        
    expert_obs_data = {'observations': states,
                   'observations_next': next_states}

    with open(os.path.join('expert_obs', args.envname + '.pkl'), 'wb') as f:
            pickle.dump(expert_obs_data,f)

if __name__ == '__main__':
    main()            