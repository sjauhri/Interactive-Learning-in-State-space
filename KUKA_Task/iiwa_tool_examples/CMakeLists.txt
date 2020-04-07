cmake_minimum_required(VERSION 2.8.3)
project(iiwa_tool_examples)

set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")

find_package(catkin REQUIRED COMPONENTS
  roscpp
  iiwa_ros
  moveit_core 
  moveit_ros_planning
  moveit_ros_planning_interface
)

catkin_package()

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(command_robot src/command_robot.cpp)
add_dependencies(command_robot iiwa_msgs_generate_messages_cpp)
target_link_libraries(command_robot ${catkin_LIBRARIES})

add_executable(command_robot_moveit src/command_robot_moveit.cpp)
add_dependencies(command_robot_moveit iiwa_msgs_generate_messages_cpp)
target_link_libraries(command_robot_moveit ${catkin_LIBRARIES})

add_executable(setting_control_mode src/setting_control_mode.cpp)
add_dependencies(setting_control_mode iiwa_msgs_generate_messages_cpp)
target_link_libraries(setting_control_mode ${catkin_LIBRARIES})