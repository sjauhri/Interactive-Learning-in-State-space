#!/bin/bash
python3 models/bc_reacher.py --mode=train --input_file=demonstration/expert_obs/Reacher-v2.pkl --result_dir=results/bc/reacher/ --session_dir=session/bc/reacher/ --maxEpochs=20 #--usePrevSession --prev_session_dir=prev_sessions/bc/reacher/
