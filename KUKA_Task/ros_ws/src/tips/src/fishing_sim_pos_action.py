"""
ROS Interface for Fishing Task using KUKA lbr iiwa 7

Uses iiwa_stack:
https://github.com/IFL-CAMP/iiwa_stack
"""

import rospy
import actionlib
from sensor_msgs.msg import JointState
from nav_msgs.msg import Odometry
from control_msgs.msg import FollowJointTrajectoryAction, FollowJointTrajectoryGoal
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from std_msgs.msg import String, Float32
import std_srvs.srv
# tf2_msgs/TFMessage
import numpy as np
import time

BALL_ORIGIN = np.array([0.746439, 0.000074, 0.173802])
END_EFF_ORIGIN = np.array([0.746538, -0.000060, 0.458430]) # iiwa link 7
J2_Z_ORIGIN = 0.34
THETA1 = (50 * (np.pi /180)) # Joint 2 initial position
THETA2 = (30 * (np.pi /180)) # Joint 4 initial position
L1 = 0.4   # Length of arm 1
L2 = 0.4   # Length of arm 2
L3 = 0.126 # Length of arm 3

EPISODE_DURATION = 25 # seconds
ACTION_DURATION = 0.05 # seconds

class Fishing_Env():
    
    def __init__(self):
        rospy.init_node('tips_fishing', anonymous=True, disable_signals=True) # disable rospy handling of Ctrl+C
        
        self.start_time = time.time()
        self.terminal = True # Need to call reset first to start the environment

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

        ### Action Client
        self.action_client = actionlib.SimpleActionClient('iiwa/PositionJointInterface_trajectory_controller/follow_joint_trajectory', FollowJointTrajectoryAction)
        # Action Goal
        self.goal = FollowJointTrajectoryGoal()
        self.goal.trajectory.joint_names.append("iiwa_joint_1")
        self.goal.trajectory.joint_names.append("iiwa_joint_2")
        self.goal.trajectory.joint_names.append("iiwa_joint_3")
        self.goal.trajectory.joint_names.append("iiwa_joint_4")
        self.goal.trajectory.joint_names.append("iiwa_joint_5")
        self.goal.trajectory.joint_names.append("iiwa_joint_6")
        self.goal.trajectory.joint_names.append("iiwa_joint_7")

        self.goal.trajectory.points.append(JointTrajectoryPoint())
                                                       # joint 2      # joint 4
        self.goal.trajectory.points[0].positions =  [0,    0      ,0,     0     ,0,0,0]
        self.goal.trajectory.points[0].velocities = [0,    0      ,0,     0     ,0,0,0]
        self.goal.trajectory.points[0].time_from_start = rospy.Duration.from_sec(ACTION_DURATION)
        # Optional: set joint tolerance
        # self.goal.path_tolerance
        # self.goal.goal_tolerance
        # self.goal.goal_time_tolerance
        
        # Wait for gazebo simulation
        print("[Waiting for gazebo...]")
        rospy.wait_for_service('gazebo/reset_simulation')
        
        ### Service caller for the reset of Gazebo simulation
        self.reset_sim = rospy.ServiceProxy('gazebo/reset_simulation', std_srvs.srv.Empty())

        ### Service caller to pause/unpasue physics
        self.pause = rospy.ServiceProxy('gazebo/pause_physics', std_srvs.srv.Empty())
        self.unpause = rospy.ServiceProxy('gazebo/unpause_physics', std_srvs.srv.Empty())


    def curr_state(self):
        return np.array([
            self.joint_position[1], # Joint 2
            self.joint_position[3], # Joint 4
            self.joint_velocity[1], # Joint 2
            self.joint_velocity[3], # Joint 4
            self.ball_position[0],  # Ball x position
            self.ball_position[2],  # Ball z position
            self.ball_velocity[0],  # Ball x velocity
            self.ball_velocity[2]   # Ball z velocity
        ])


    def reset(self):
        ### Service call to un-pause physics
        self.unpause()
        # try:
        # except rospy.ServiceException:
        #     print("Service call failed")
        # Optional: WAIT for controller to be ready
        time.sleep(0.1)

        ### Take action to reset to zero position (with randomization)
        self.goal.trajectory.points[0].positions =  [0, np.random.uniform(-0.15, 0.15) ,0, np.random.uniform(-0.15, 0.15) ,0,0,0]
        # Optional: Wait for server
        # self.action_client.wait_for_server()
        # Send Action command
        self.action_client.send_goal(self.goal)
        # Wait for action completion
        self.action_client.wait_for_result()

        ### Optional: Service call to reset Gazebo sim
        # self.reset_sim()
        # Optional: WAIT (till a new joint state and ball odom is received)
        # time.sleep(0.01)
        
        # Set time for this episode
        self.start_time = time.time()

        # Reset terminal state
        self.terminal = False

        return self.curr_state()


    def step(self, a):
        vec = 0 # TODO: distance vector between cup and ball
        reward_dist = - np.linalg.norm(vec)
        # reward_ctrl = - np.square(a).sum()
        reward_ctrl = 0
        reward = reward_dist + reward_ctrl
        
        if (self.terminal):
            print("[Environment terminated. reset() needs to be called before environment can be run]")
        else:
            ### Take action a
            # Sanity check
            if((a >= -0.5).all() and (a <= 0.5).all()):
                # Set goal: Relative position change
                self.goal.trajectory.points[0].positions[1] +=  a[0]
                self.goal.trajectory.points[0].positions[3] +=  a[1]
                # Send Action command
                self.action_client.send_goal(self.goal)
                # Wait for action completion
                # print("Waiting for action completion...")
                self.action_client.wait_for_result()
                # Optional: WAIT (till a new joint state and ball odom is received)
                time.sleep(0.005)
            else:
                print("[Invalid action provided]")

            # Check if terminal based on total time elapsed since reset
            if ((time.time() - self.start_time) > EPISODE_DURATION):
                self.terminal = True
                # Pause physics
                self.pause()

        return self.curr_state(), reward, self.terminal, dict(reward_dist=reward_dist, reward_ctrl=reward_ctrl)


    ### Callbacks for subscribers

    def joint_states_callback(self, joint_state_msg):
        self.joint_position = np.array(joint_state_msg.position)
        self.joint_velocity = np.array(joint_state_msg.velocity)
        self.joint_effort = np.array(joint_state_msg.effort)

        # Debug print:
        # print("Positions: " + "\n" + str(self.joint_position) + "\n" + "Vels: " + "\n" + str(self.joint_velocity) + "\n" + "Efforts: " + "\n" + str(self.joint_effort))

    def odom_ball_callback(self, odom_msg):
        self.ball_position = np.array([odom_msg.pose.pose.position.x, odom_msg.pose.pose.position.y, odom_msg.pose.pose.position.z]) - BALL_ORIGIN
        self.ball_velocity = np.array([odom_msg.twist.twist.linear.x,odom_msg.twist.twist.linear.y,odom_msg.twist.twist.linear.z])

        # Debug print:
        # print("Positions: " + "\n" + str(self.ball_position) + "\n" + "Vels: " + "\n" + str(self.ball_velocity))

    ## Transform for end-effector position
    def get_end_eff_pos(self, state):
        """get x-z cartesian position of the end effector"""

        theta1 = THETA1 - state[:,0]
        theta2 = THETA2 - state[:,1]

        xpos = L1*np.cos(theta1) + L2*np.cos(theta1-theta2) + L3*np.sin(theta1-theta2)
        zpos = J2_Z_ORIGIN + L1*np.sin(theta1) + L2*np.sin(theta1-theta2) - L3*np.cos(theta1-theta2)

        return xpos, zpos
