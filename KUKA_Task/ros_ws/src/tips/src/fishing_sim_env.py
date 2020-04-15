"""
ROS Interface for Fishing Task using KUKA lbr iiwa 7

Uses iiwa_stack:
https://github.com/IFL-CAMP/iiwa_stack
"""

import rospy
import actionlib
from control_msgs.msg import FollowJointTrajectoryActionGoal
from std_msgs.msg import String
from sensor_msgs.msg import JointState
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

        ### Joint States
        self.joint_position = np.zeros(7) # Seven joints of the KUKA
        self.joint_velocity = np.zeros(7) # Seven joints of the KUKA
        self.joint_effort = np.zeros(7) # Seven joints of the KUKA
        # Subscriber for joint states:
        rospy.Subscriber('iiwa/joint_states', JointState, self.joint_states_callback, queue_size=1)

        # Subscriber for tfs, tf_static to compute end-effector position in x-z plane
        # rospy.Subscriber('end_eff_tf', String, callback, queue_size=1)

        ### Ball state
        self.ball_position = np.zeros(3) # x,y,z position
        self.ball_velocity = np.zeros(3) # x,y,z velocity
        # Subscriber for ball pose, twist
        rospy.Subscriber('odom/ball', Odometry, self.odom_ball_callback, queue_size=1)

        # Action Client
        action_client = actionlib.SimpleActionClient('fibonacci', FollowJointTrajectoryActionGoal)

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


    ### Callbacks for subscribers

    def joint_states_callback(self, joint_state_msg):
        self.joint_position = np.array(joint_state_msg.position)
        self.joint_velocity = np.array(joint_state_msg.velocity)
        self.joint_effort = np.array(joint_state_msg.effort)

        # Debug print:
        # print("Positions: " + "\n" + str(self.joint_position) + "\n" + "Vels: " + "\n" + str(self.joint_velocity) + "\n" + "Efforts: " + "\n" + str(self.joint_effort))

    def odom_ball_callback(self, odom_msg):
        self.ball_position = np.array([odom_msg.pose.pose.position.x, odom_msg.pose.pose.position.y, odom_msg.pose.pose.position.z])
        self.ball_velocity = np.array([odom_msg.twist.twist.linear.x,odom_msg.twist.twist.linear.y,odom_msg.twist.twist.linear.z])

        # Debug print:
        # print("Positions: " + "\n" + str(self.ball_position) + "\n" + "Vels: " + "\n" + str(self.ball_velocity))
