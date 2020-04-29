#!/bin/bash
rosrun tips tips_fishing_real.py --mode=train --input_file=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/demonstration/expert_obs/Fishing.pkl --result_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/results/tips/fishing_real/ --session_dir=/home/snehal/De
sktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/session/tips/fishing_real/ --maxEpisodes=50 --numExperiments=1 --runAgent

#--usePrevSession --prev_session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/learnt_fdms/fishing/
#--usePrevSession --prev_session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/prev_sessions/tips/fishing/
#--usePrevSession --prev_session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/init_policy_sess/tips/fishing/