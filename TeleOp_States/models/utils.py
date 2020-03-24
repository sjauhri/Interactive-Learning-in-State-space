import argparse
import os
import pickle
import numpy as np
import time
import datetime as dt

parser = argparse.ArgumentParser()
parser.add_argument('--trueFDM', action='store_true')
parser.add_argument("--fdm_dir", required=True, help="where to load the forward dynamics model from")
parser.add_argument("--save_dir", required=True, help="where to save the demonstrations")
parser.add_argument("--maxEpisodes", type=int, default=50, help="the max number of episodes to run")
parser.add_argument('--record', action='store_true')

args = parser.parse_args()