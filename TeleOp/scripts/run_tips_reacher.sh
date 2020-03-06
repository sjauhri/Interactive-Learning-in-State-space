#!/bin/bash
python3 models/tips_reacher.py --mode=train --input_file=demonstration/expert_obs/Reacher-v2.pkl --result_dir=results/tips/reacher/ --session_dir=session/tips/reacher/ --maxEpisodes=50 --numExperiments=1 --runAgent --learnFDM #--usePrevSession --prev_session_dir=prev_sessions/tips/lunarlandercont/
