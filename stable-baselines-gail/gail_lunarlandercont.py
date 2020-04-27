#!/usr/bin/env python3
import gym
from stable_baselines import GAIL#, SAC
# from stable_baselines.gail import ExpertDataset, generate_expert_traj
from dataset.dataset import ExpertDataset
from stable_baselines.bench import Monitor
from stable_baselines.logger import configure

#Logging
configure()

# Log directories
#export OPENAI_LOG_FORMAT='stdout,log,csv'
#export OPENAI_LOGDIR=./log/LunarLanderContinuous/

# Generate expert trajectories (train expert)
# model = SAC('MlpPolicy', 'LunarLanderContinuous-v2', verbose=1)
# generate_expert_traj(model, 'expert_LunarLanderContinuous', n_timesteps=100, n_episodes=10)

# Load the expert dataset
dataset = ExpertDataset(expert_path='dataset/LunarLanderContinuous-v2.pkl', traj_limitation=10, verbose=1)

model = GAIL('MlpPolicy', 'LunarLanderContinuous-v2', dataset, verbose=1)
# Note: in practice, you need to train for 1M steps to have a working policy
model.learn(total_timesteps=250000)
model.save("log/LunarLanderContinuous/gail_LunarLanderContinuous")

del model # remove to demonstrate saving and loading

model = GAIL.load("log/LunarLanderContinuous/gail_LunarLanderContinuous")

env = gym.make('LunarLanderContinuous-v2')
# Logs will be saved in log_dir/monitor.csv
env = Monitor(env, './log/LunarLanderContinuous/')
obs = env.reset()
while True:
  action, _states = model.predict(obs)
  obs, rewards, dones, info = env.step(action)
  env.render()
  if dones:
    obs = env.reset()