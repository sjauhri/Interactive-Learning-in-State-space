#!/bin/bash
python3 models/bco_hopper.py --mode=train --input_file=demonstration/expert_obs/Hopper-v2.pkl --model_dir=model/hopper/ --save_freq=10 --premodel_dir=premodel/hopper/ --savedPreModel