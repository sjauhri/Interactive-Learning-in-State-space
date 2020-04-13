# Source ros_ws
. /home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/devel/setup.sh

# Launch gazebo sim
roslaunch iiwa_gazebo iiwa_gazebo.launch model:=iiwa7

# Control commands
## Individual Joints
rostopic pub -1 /iiwa/PositionJointInterface_J2_controller/command std_msgs/Float64 "data: -1.047197551"

rostopic pub -1 /iiwa/PositionJointInterface_J4_controller/command std_msgs/Float64 "data: -0.3"

rostopic pub -1 /iiwa/PositionJointInterface_J6_controller/command std_msgs/Float64 "data: -1.047197551"

## Trajectory
rostopic pub -1 /iiwa/PositionJointInterface_trajectory_controller/command trajectory_msgs/JointTrajectory '{joint_names: ["iiwa_joint_1","iiwa_joint_2","iiwa_joint_3","iiwa_joint_4","iiwa_joint_5","iiwa_joint_6","iiwa_joint_7"], points: [{positions:[0,0,0,0,0,0,0],velocities:[0,0,0,0,0,0,0],time_from_start: [1,0]}]}'

# Control:
## Install ros_control
sudo apt-get install ros-melodic-ros-control ros-melodic-ros-controllers --fix-missing

## Packages
controler_manager
joint_state_controller
robot_state_publisher

--timeout 60 in controller_manager

velocity_controllers/JointVelocityController

# Controller types:
rosservice call /iiwa/controller_manager/list_controller_types

# Ball true pose:
rostopic echo odom/ball

# Pause/Unpause sim:
rosservice call gazebo/pause_physics
rosservice call gazebo/unpause_physics

# Reset sim:
rosservice call /gazebo/reset_simulation "{}"