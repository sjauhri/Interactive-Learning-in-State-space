#!/bin/bash
rosrun tips tips_laser.py --mode=train --input_file=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/demonstration/expert_obs/Fishing.pkl --result_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/results/tips/laser/ --session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/session/tips/laser/ --maxEpisodes=150 --numExperiments=1 --runAgent --learnFDM

#--usePrevSession --prev_session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/learnt_fdms/laser_fdm/
#--usePrevSession --prev_session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/prev_sessions/tips/laser/
#--usePrevSession --prev_session_dir=/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/tips/init_policy_sess/tips/laser/