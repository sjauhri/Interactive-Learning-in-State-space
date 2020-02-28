#!/bin/bash
python3 models/bcoach_ifdm_reacher.py --mode=train --input_file=demonstration/expert_obs/Reacher-v2.pkl --result_dir=results/bcoach_ifdm/reacher/ --model_dir=model/bcoach_ifdm/reacher/ --maxEpochs=50 --numExperiments=1
