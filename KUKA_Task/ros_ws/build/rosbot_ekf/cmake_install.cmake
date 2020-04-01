# Install script for directory: /home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbot_ekf/msg" TYPE FILE FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/msg/Imu.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbot_ekf/srv" TYPE FILE FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/srv/Configuration.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbot_ekf/cmake" TYPE FILE FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/build/rosbot_ekf/catkin_generated/installspace/rosbot_ekf-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/devel/include/rosbot_ekf")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/devel/share/roseus/ros/rosbot_ekf")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/devel/share/common-lisp/ros/rosbot_ekf")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/devel/share/gennodejs/ros/rosbot_ekf")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/devel/lib/python2.7/dist-packages/rosbot_ekf")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/devel/lib/python2.7/dist-packages/rosbot_ekf")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/build/rosbot_ekf/catkin_generated/installspace/rosbot_ekf.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbot_ekf/cmake" TYPE FILE FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/build/rosbot_ekf/catkin_generated/installspace/rosbot_ekf-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbot_ekf/cmake" TYPE FILE FILES
    "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/build/rosbot_ekf/catkin_generated/installspace/rosbot_ekfConfig.cmake"
    "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/build/rosbot_ekf/catkin_generated/installspace/rosbot_ekfConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbot_ekf" TYPE FILE FILES "/home/snehal/Desktop/Thesis/IfO/KUKA_Task/ros_ws/src/rosbot_ekf/package.xml")
endif()

