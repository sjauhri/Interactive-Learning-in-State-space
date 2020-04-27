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
#export OPENAI_LOGDIR=./log/CartPole/

# Generate expert trajectories (train expert)
# model = SAC('MlpPolicy', 'CartPole-v0', verbose=1)
# generate_expert_traj(model, 'expert_CartPole', n_timesteps=100, n_episodes=10)

# Load the expert dataset
dataset = ExpertDataset(expert_path='dataset/CartPole-v0.pkl', traj_limitation=10, verbose=1)

model = GAIL('MlpPolicy', 'CartPole-v0', dataset, verbose=1)
# Note: in practice, you need to train for 1M steps to have a working policy
model.learn(total_timesteps=80000)
model.save("log/CartPole/gail_CartPole")

del model # remove to demonstrate saving and loading

model = GAIL.load("log/CartPole/gail_CartPole")

env = gym.make('CartPole-v0')
# Logs will be saved in log_dir/monitor.csv
env = Monitor(env, './log/CartPole/')
obs = env.reset()
while True:
  action, _states = model.predict(obs)
  obs, rewards, dones, info = env.step(action)
  env.render()
  if dones:
    break