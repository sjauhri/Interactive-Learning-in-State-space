#!/bin/bash
python3 models/bco_acrobot.py --mode=train --input_file=demonstration/expert_obs/Acrobot-v1.pkl --model_dir=model/acrobot/ --print_freq=10 --premodel_dir=premodel/acrobot/ --savedPreModel