#!/bin/bash
python3 models/bco_cartpole.py --mode=train --input_file=demonstration/expert_obs/CartPole-v0.pkl --result_dir=results/cartpole/ --model_dir=model/cartpole/ --maxEpochs=10