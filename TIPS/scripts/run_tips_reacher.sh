#!/bin/bash
python3 models/tips_reacher.py --mode=train --input_file=demonstration/expert_obs/Reacher-v2.pkl --result_dir=results/tips/reacher/ --model_dir=model/tips/reacher/ --maxEpochs=50 --numExperiments=1
