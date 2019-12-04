#!/bin/bash
python3 models/bco_mcar.py --mode=train --input_file=demonstration/expert_obs/MountainCar-v0.pkl --result_dir=results/mcar/ --model_dir=model/mcar/ --print_freq=1 --save_freq=1