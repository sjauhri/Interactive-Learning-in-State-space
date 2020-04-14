#!/bin/bash
# python3 src/tips_fishing.py --mode=train --input_file=demonstration/expert_obs/Fishing.pkl --result_dir=results/tips/fishing/ --session_dir=session/tips/fishing/ --maxEpisodes=50 --numExperiments=1 --runAgent #--learnFDM
rosrun tips tips_fishing.py --mode=train --input_file=demonstration/expert_obs/Fishing.pkl --result_dir=results/tips/fishing/ --session_dir=session/tips/fishing/ --maxEpisodes=50 --numExperiments=1 --runAgent #--learnFDM


#--usePrevSession --prev_session_dir=learnt_fdms/fishing/
#--usePrevSession --prev_session_dir=prev_sessions/tips/fishing/
#--usePrevSession --prev_session_dir=init_policy_sess/tips/fishing/