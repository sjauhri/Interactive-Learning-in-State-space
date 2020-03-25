#!/bin/bash
python3 models/tips_lunarlandercont.py --mode=train --input_file=demonstration/expert_obs/LunarLanderContinuous-v2.pkl --result_dir=results/tips/lunarlandercont/ --session_dir=session/tips/lunarlandercont/ --maxEpisodes=50 --numExperiments=1 --learnFDM --runAgent --usePrevSession --prev_session_dir=learnt_fdms/lunarlandercont/
#--usePrevSession --prev_session_dir=prev_sessions/tips/lunarlandercont/
#--usePrevSession --prev_session_dir=init_policy_sess/tips/lunarlandercont/