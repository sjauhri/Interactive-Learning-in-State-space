#!/bin/bash
python3 models/tips_cartpole.py --mode=train --input_file=demonstration/expert_obs/CartPole-v0.pkl --result_dir=results/tips/cartpole/ --session_dir=session/tips/cartpole/ --maxEpisodes=50 --numExperiments=1 --learnFDM --runAgent #--usePrevSession --prev_session_dir=prev_sessions/tips/cartpole/
#--usePrevSession --prev_session_dir=init_policy_sess/tips/cartpole/