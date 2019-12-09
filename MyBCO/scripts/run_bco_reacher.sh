#!/bin/bash
python3 models/bco_reacher.py --mode=train --input_file=demonstration/expert_obs/Reacher-v2.pkl --result_dir=results/reacher/ --model_dir=model/reacher/
