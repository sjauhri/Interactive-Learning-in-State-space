#!/usr/bin/env python

"""
Code to load an expert policy and generate roll-out data and copy to a text file.
Example usage:
    python expert_extractor.py experts/Humanoid-v1.pkl Humanoid-v1 --render            

Author of this script and included expert policies: Jonathan Ho (hoj@openai.com)
"""

import os
import pickle
import tensorflow as tf
import numpy as np
import tf_util
import gym
import load_policy

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('expert_policy_file', type=str)
    parser.add_argument('envname', type=str)
    parser.add_argument('--render', action='store_true')
    parser.add_argument("--max_timesteps", type=int)
    parser.add_argument('--num_rollouts', type=int, default=20, help='Number of expert roll outs')
    args = parser.parse_args()

    print('loading and building expert policy')
    policy_fn = load_policy.load_policy(args.expert_policy_file)
    print('loaded and built')

    with tf.Session():
        tf_util.initialize()

        import gym
        env = gym.make(args.envname)
        max_steps = args.max_timesteps or env.spec.timestep_limit

        returns = []
        observations = []
        actions = []
        # State transitions
        ob = [] # Current observation
        ob_next = [] # Next observation 
        for i in range(args.num_rollouts):
            if i%20 == 0: print('Rollout ', i+1)
            observations = [] # Reset observations since we want observation transitions
            obs = env.reset()
            done = False
            totalr = 0.
            steps = 0
            while not done:
                action = policy_fn(obs[None,:])
                observations.append(obs)
                actions.append(action)
                obs, r, done, _ = env.step(action)
                totalr += r
                steps += 1
                if args.render:
                    env.render()
                #if steps % 100 == 0: print("%i/%i"%(steps, max_steps))
                if steps >= max_steps:
                    break
            returns.append(totalr)
            ob.extend(observations[0:-1])
            ob_next.extend(observations[1:])

        #print('returns', returns)
        print('mean return', np.mean(returns))
        print('std of return', np.std(returns))
        
        print('OBS shape', np.array(observations).shape)
        print('obs1', np.array(observations)[0])
        #print('ACS', np.array(np.squeeze(actions)).shape)
        
        expert_obs_data = {'observations': ob,
                       'observations_next': ob_next}

        with open(os.path.join('expert_obs', args.envname + '.pkl'), 'wb') as f:
                pickle.dump(expert_obs_data,f)

if __name__ == '__main__':
    main()