#!/bin/bash
python3 models/bco_acrobot.py --mode=train --input_file=demonstration/expert_obs/Acrobot-v1.pkl --model_dir=model/acrobot/ --premodel_dir=premodel/acrobot/ --print_freq=1 --save_freq=1