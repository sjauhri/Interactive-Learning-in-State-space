# Source ros_ws
. /home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/devel/setup.sh

# Launch gazebo sim
roslaunch iiwa_gazebo iiwa_gazebo.launch model:=iiwa7

# Control commands
rostopic pub -1 /iiwa/PositionJointInterface_J2_controller/command std_msgs/Float64 "data: -1.047197551"

rostopic pub -1 /iiwa/PositionJointInterface_J4_controller/command std_msgs/Float64 "data: -0.3"

rostopic pub -1 /iiwa/PositionJointInterface_J6_controller/command std_msgs/Float64 "data: -1.047197551"

# Control:
controler_manager
joint_state_controller
robot_state_publisher

--timeout 60 in controller_manager

velocity_controllers/JointVelocityController