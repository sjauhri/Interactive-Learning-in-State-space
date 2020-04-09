# Source ros_ws
. /home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/devel/setup.sh

# Launch gazebo sim
roslaunch iiwa_gazebo iiwa_gazebo.launch model:=iiwa7

# Control
rostopic pub -1 /iiwa/PositionJointInterface_J2_controller/command std_msgs/Float64 "data: -1.047197551"

rostopic pub -1 /iiwa/PositionJointInterface_J4_controller/command std_msgs/Float64 "data: 0.523598776"

rostopic pub -1 /iiwa/PositionJointInterface_J6_controller/command std_msgs/Float64 "data: -1.047197551"