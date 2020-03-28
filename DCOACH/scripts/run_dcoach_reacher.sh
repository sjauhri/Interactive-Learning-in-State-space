#!/bin/bash
python3 models/dcoach_reacher.py --mode=train --result_dir=results/dcoach/reacher/ --session_dir=session/dcoach/reacher/ --maxEpisodes=50 --numExperiments=1 # --usePrevSession --prev_session_dir=prev_sessions/dcoach/reacher/
