#!/bin/bash
python3 models/bco_hcheetah.py --mode=train --input_file=demonstration/expert_obs/HalfCheetah-v2.pkl --model_dir=model/hcheetah/ --print_freq=1 --save_freq=1