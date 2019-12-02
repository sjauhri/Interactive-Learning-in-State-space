#!/bin/bash
python3 models/bco_hopper.py --mode=train --input_file=demonstration/expert_obs/Hopper-v2.pkl --model_dir=model/hopper/ --print_freq=1 --save_freq=1 --maxEpochs=100