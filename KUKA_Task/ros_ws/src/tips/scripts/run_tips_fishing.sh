#!/bin/bash
# python3 src/tips_fishing.py --mode=train --input_file=demonstration/expert_obs/Fishing.pkl --result_dir=results/tips/fishing/ --session_dir=session/tips/fishing/ --maxEpisodes=50 --numExperiments=1 --runAgent #--learnFDM
rosrun tips tips_fishing.py --mode=train --input_file=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/demonstration/expert_obs/Fishing.pkl --result_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/results/tips/fishing/ --session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/session/tips/fishing/ --maxEpisodes=50 --numExperiments=1 --runAgent #--learnFDM


#--usePrevSession --prev_session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/learnt_fdms/fishing/
#--usePrevSession --prev_session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/prev_sessions/tips/fishing/
#--usePrevSession --prev_session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/init_policy_sess/tips/fishing/