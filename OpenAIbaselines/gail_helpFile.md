# Train GAIL with checkpoint_dir and log_path

# Hopper
OPENAI_LOGDIR=./baselines/gail/log/hopper/ python -m baselines.gail.run_mujoco --env_id=Hopper-v2 --expert_path=./baselines/gail/data/stochastic.trpo.Hopper.0.00.npz --checkpoint_dir=./baselines/gail/models/hopper/ --save_per_iter=5

# CartPole
OPENAI_LOGDIR=./baselines/gail/log/cartpole/ python -m baselines.gail.run_mujoco --env_id=CartPole-v0 --expert_path=./baselines/gail/data/CartPole-v0.pkl --checkpoint_dir=./baselines/gail/models/cartpole/ --save_per_iter=1

# Reacher
OPENAI_LOGDIR=./baselines/gail/log/reacher/ python -m baselines.gail.run_mujoco --env_id=Reacher-v2 --expert_path=./baselines/gail/data/Reacher-v2.pkl --checkpoint_dir=./baselines/gail/models/reacher/ --save_per_iter=1

# LunarLanderCont
OPENAI_LOGDIR=./baselines/gail/log/lunarlandercont/ python -m baselines.gail.run_mujoco --env_id=LunarLanderContinuous-v2 --expert_path=./baselines/gail/data/LunarLanderContinuous-v2.pkl --checkpoint_dir=./baselines/gail/models/lunarlandercont/ --save_per_iter=1

# Load and Train
OPENAI_LOGDIR=./baselines/gail/log/hopper/ python -m baselines.gail.run_mujoco --env_id=Hopper-v2 --load_model_path=./baselines/gail/models/hopper/ --expert_path=./baselines/gail/data/stochastic.trpo.Hopper.0.00.npz --task=train

# Load and Evaluate
OPENAI_LOGDIR=./baselines/gail/log/hopper/ python -m baselines.gail.run_mujoco --env_id=Hopper-v2 --load_model_path=./baselines/gail/models/hopper/trpo_gail.transition_limitation_-1.Hopper.g_step_3.d_step_1.policy_entcoeff_0.adversary_entcoeff_0.001.seed_0.meta --task=evaluate

# Options
OPENAI_LOG_FORMAT=csv,stdout,tensorboard
--save_per_iter: save model every xx iterations
--num_timesteps: number of total timesteps
--stochastic_policy   use stochastic/deterministic policy to evaluate
--save_sample         save the trajectories or not


# Plot
python gail_plotter.py