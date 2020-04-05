# Train GAIL with checkpoint_dir and log_path
OPENAI_LOGDIR=./baselines/gail/log/ python -m baselines.gail.run_mujoco --env_id=Hopper-v2 --expert_path=./baselines/gail/data/stochastic.trpo.Hopper.0.00.npz --checkpoint_dir=./baselines/gail/models/ --log_dir=./baselines/gail/log/ --save_per_iter=5

# Load and Train and visualize (play)
OPENAI_LOGDIR=./baselines/gail/log/ python -m baselines.gail.run_mujoco --env_id=Hopper-v2 --load_model_path=./baselines/gail/models/ --expert_path=./baselines/gail/data/stochastic.trpo.Hopper.0.00.npz --task=train --play

# Load and Evaluate and visualize (play)
OPENAI_LOGDIR=./baselines/gail/log/ python -m baselines.gail.run_mujoco --env_id=Hopper-v2 --load_model_path=./baselines/gail/models/ --task=evaluate --play

# Options
OPENAI_LOG_FORMAT=csv,stdout,tensorboard
--save_per_iter: save model every xx iterations
--num_timesteps: number of timesteps per episode
--stochastic_policy   use stochastic/deterministic policy to evaluate
--save_sample         save the trajectories or not