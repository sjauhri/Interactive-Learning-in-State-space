#!/bin/bash
python3 models/tele_reacher.py --save_dir=demonstration/reacher/ --fdm_dir=learnt_fdms/reacher/ --maxEpisodes=50 --record
