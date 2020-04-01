# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rosbot_ekf: 1 messages, 1 services")

set(MSG_I_FLAGS "-Irosbot_ekf:/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rosbot_ekf_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg" NAME_WE)
add_custom_target(_rosbot_ekf_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbot_ekf" "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg" "geometry_msgs/Quaternion:std_msgs/Header"
)

get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv" NAME_WE)
add_custom_target(_rosbot_ekf_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbot_ekf" "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbot_ekf
)

### Generating Services
_generate_srv_cpp(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbot_ekf
)

### Generating Module File
_generate_module_cpp(rosbot_ekf
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbot_ekf
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rosbot_ekf_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rosbot_ekf_generate_messages rosbot_ekf_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_cpp _rosbot_ekf_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_cpp _rosbot_ekf_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbot_ekf_gencpp)
add_dependencies(rosbot_ekf_gencpp rosbot_ekf_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbot_ekf_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosbot_ekf
)

### Generating Services
_generate_srv_eus(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosbot_ekf
)

### Generating Module File
_generate_module_eus(rosbot_ekf
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosbot_ekf
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rosbot_ekf_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rosbot_ekf_generate_messages rosbot_ekf_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_eus _rosbot_ekf_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_eus _rosbot_ekf_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbot_ekf_geneus)
add_dependencies(rosbot_ekf_geneus rosbot_ekf_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbot_ekf_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbot_ekf
)

### Generating Services
_generate_srv_lisp(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbot_ekf
)

### Generating Module File
_generate_module_lisp(rosbot_ekf
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbot_ekf
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rosbot_ekf_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rosbot_ekf_generate_messages rosbot_ekf_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_lisp _rosbot_ekf_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_lisp _rosbot_ekf_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbot_ekf_genlisp)
add_dependencies(rosbot_ekf_genlisp rosbot_ekf_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbot_ekf_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosbot_ekf
)

### Generating Services
_generate_srv_nodejs(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosbot_ekf
)

### Generating Module File
_generate_module_nodejs(rosbot_ekf
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosbot_ekf
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rosbot_ekf_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rosbot_ekf_generate_messages rosbot_ekf_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_nodejs _rosbot_ekf_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_nodejs _rosbot_ekf_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbot_ekf_gennodejs)
add_dependencies(rosbot_ekf_gennodejs rosbot_ekf_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbot_ekf_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbot_ekf
)

### Generating Services
_generate_srv_py(rosbot_ekf
  "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbot_ekf
)

### Generating Module File
_generate_module_py(rosbot_ekf
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbot_ekf
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rosbot_ekf_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rosbot_ekf_generate_messages rosbot_ekf_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_py _rosbot_ekf_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv" NAME_WE)
add_dependencies(rosbot_ekf_generate_messages_py _rosbot_ekf_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbot_ekf_genpy)
add_dependencies(rosbot_ekf_genpy rosbot_ekf_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbot_ekf_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbot_ekf)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbot_ekf
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rosbot_ekf_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(rosbot_ekf_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosbot_ekf)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rosbot_ekf
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(rosbot_ekf_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(rosbot_ekf_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbot_ekf)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbot_ekf
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rosbot_ekf_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(rosbot_ekf_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosbot_ekf)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rosbot_ekf
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(rosbot_ekf_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(rosbot_ekf_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbot_ekf)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbot_ekf\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbot_ekf
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rosbot_ekf_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(rosbot_ekf_generate_messages_py geometry_msgs_generate_messages_py)
endif()
