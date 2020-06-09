#!/usr/bin/env python
# Software License Agreement (BSD License)
#
# Copyright (c) 2008, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Revision $Id$

## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import rospy
import numpy as np
from std_msgs.msg import String
from iiwa_msgs.msg import JointPosition, JointPositionVelocity, CartesianPose
A7_CONST = 0.22

def talker():
    # pub = rospy.Publisher('chatter', String, queue_size=10)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    action_pub = rospy.Publisher('iiwa/command/JointPosition', JointPosition, queue_size=10)

    goal = JointPosition()
    goal.position.a1 = 0.0 * (np.pi/180)
    goal.position.a2 = 0 * (np.pi/180)
    goal.position.a3 = 0 * (np.pi/180)
    goal.position.a4 = 0 * (np.pi/180)
    goal.position.a5 = 0 * (np.pi/180)
    goal.position.a6 = 0
    goal.position.a7 = 0 * (np.pi/180)

    # Origin
    # goal.position.a1 = 20.0 * (np.pi/180)
    # goal.position.a2 = 5 * (np.pi/180)
    # goal.position.a3 = -11 * (np.pi/180)
    # goal.position.a4 = -85 * (np.pi/180)
    # goal.position.a5 = -17.5 * (np.pi/180)
    # goal.position.a6 = 0
    # goal.position.a7 = 30.0 * (np.pi/180)
    
    # Limit top left
    # goal.position.a1 = 20.0 * (np.pi/180)
    # goal.position.a2 = 5 * (np.pi/180)
    # goal.position.a3 = 6 * (np.pi/180)
    # goal.position.a4 = -85 * (np.pi/180)
    # goal.position.a5 = -34 * (np.pi/180)
    # goal.position.a6 = 0
    # goal.position.a7 = 30.0 * (np.pi/180)

    # Limit bottom left
    # goal.position.a1 = 20.0 * (np.pi/180)
    # goal.position.a2 = 5 * (np.pi/180)
    # goal.position.a3 = 6 * (np.pi/180)
    # goal.position.a4 = -85 * (np.pi/180)
    # goal.position.a5 = -6.0  * (np.pi/180)
    # goal.position.a6 = 0
    # goal.position.a7 = 30.0 * (np.pi/180)

    # Limit top right
    # goal.position.a1 = 20.0 * (np.pi/180)
    # goal.position.a2 = 5 * (np.pi/180)
    # goal.position.a3 = -35 * (np.pi/180)
    # goal.position.a4 = -85 * (np.pi/180)
    # goal.position.a5 = -34 * (np.pi/180)
    # goal.position.a6 = 0
    # goal.position.a7 = 30.0 * (np.pi/180)

    # Limit bottom right
    # goal.position.a1 = 20.0 * (np.pi/180)
    # goal.position.a2 = 5 * (np.pi/180)
    # goal.position.a3 = -35 * (np.pi/180)
    # goal.position.a4 = -85 * (np.pi/180)
    # goal.position.a5 = -6 * (np.pi/180)
    # goal.position.a6 = 0
    # goal.position.a7 = 30.0 * (np.pi/180)

    rospy.Subscriber('iiwa/state/JointPosition', JointPosition, joint_pos_callback, queue_size=1)
    rospy.Subscriber('iiwa/state/JointPositionVelocity', JointPositionVelocity, joint_vel_callback, queue_size=1)
    rospy.Subscriber('iiwa/state/CartesianPose', CartesianPose, endeff_pos_callback, queue_size=1)

    while not rospy.is_shutdown():
        hello_str = "hello world %s" % rospy.get_time()
        rospy.loginfo(hello_str)
        # pub.publish(hello_str)
        action_pub.publish(goal)
        rate.sleep()

def joint_pos_callback(joint_pos_msg):
    joint_position = joint_pos_msg.position

    # Debug print:
    # print("Positions: " + "\n" + str(joint_position) + "\n")

def joint_vel_callback(joint_vel_msg):
    joint_velocity = joint_vel_msg.velocity

    # Debug print:
    # print("Velocities: " + "\n" + str(joint_velocity) + "\n")

def endeff_pos_callback(endeff_pos_msg):
    endeff_position = endeff_pos_msg.poseStamped.pose.position

    # Debug print:
    # print("End Eff Position: " + "\n" + str(endeff_position) + "\n")

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass