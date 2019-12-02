#!/bin/bash
python3 models/bco_cartpole.py --mode=train --input_file=demonstration/expert_obs/CartPole-v0.pkl --model_dir=model/cartpole/ --print_freq=1 --save_freq=1