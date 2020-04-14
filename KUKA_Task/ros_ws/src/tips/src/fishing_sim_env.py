"""
ROS Interface for Fishing Task using KUKA lbr iiwa 7

Uses iiwa_stack:
https://github.com/IFL-CAMP/iiwa_stack
"""

import rospy
from std_msgs.msg import String
# sensor_msgs/JointState
from nav_msgs.msg import Odometry
# trajectory_msgs/JointTrajectory
# actionlib_msgs/GoalStatusArray
# control_msgs/FollowJointTrajectoryActionGoal
# tf2_msgs/TFMessage
# std_srvs/Empty
import numpy as np

class Fishing_Env():
    def __init__(self):
        rospy.init_node('tips_fishing', anonymous=True)

        # Subscriber for joint states
        rospy.Subscriber('joint_states', String, callback, queue_size=1)

        # Subscriber for tfs, tf_static to compute end-effector position in x-z plane
        rospy.Subscriber('end_eff_tf', String, callback, queue_size=1)

        # Subscriber for ball pose, twist
        rospy.Subscriber('ball_odom', Odometry, callback, queue_size=1)

        # Publisher for actions
        # Subscriber for action status

        # Service caller to pause/unpasue physics

        # Service caller for the reset of Gazebo sim (add randomization BEFORE reset with controller)

    def reset(self):
        # Service call to un-pause physics
            # WAIT till unpaused (service response)

        # Publish for actions with randomization
            # WAIT till completion of action

        # Service call to reset Gazebo sim
            # WAIT (till a new joint state and ball odom is received)
        
        # Set time for this file

        return state

    def step(self, a):
        vec = 0 # TODO: distance vector between cup and ball
        reward_dist = - np.linalg.norm(vec)
        reward_ctrl = - np.square(a).sum()
        reward = reward_dist + reward_ctrl
        
        # Take action: action command publish
            # Wait for action completion
            # Wait till a new state, ball_odom is received?

        # Check if terminal based on total time elapsed since reset
        # if terminal:
            # Pause physics

        return state, reward, terminal, dict(reward_dist=reward_dist, reward_ctrl=reward_ctrl)

def listener_callback(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data.data)
