"""
ROS Interface for Fishing Task using KUKA lbr iiwa 7

Uses iiwa_stack:
https://github.com/IFL-CAMP/iiwa_stack
"""

import rospy
from webcam_util import *
from std_msgs.msg import String, Float32
from iiwa_msgs.msg import JointPosition, JointPositionVelocity, CartesianPose
import numpy as np
import time

J2_Z_ORIGIN = 0.34
THETA1 = (90 * (np.pi /180)) # Joint 2 initial position
THETA2 = 0#(45 * (np.pi /180)) # Joint 4 initial position
THETA3 = (45 * (np.pi /180)) # Joint 6 initial position
L1 = 0.4   # Length of arm 1
L2 = 0.4   # Length of arm 2
L3 = 0.186 # Length of arm 3 # 6cm tool
EPISODE_DURATION = 30 # seconds
ACTION_DURATION = 0 # seconds
ACTION_RESET_DURATION = 0.5 # seconds
A2_SETPOINT = 40 * (np.pi/180)
A4_SETPOINT = -50 * (np.pi/180)
A6_SETPOINT = 45 * (np.pi/180)
A6_NOISE = 45 * (np.pi/180)
END_EFF_Z_MIN = 0.45
END_EFF_Z_MAX = 1.0
END_EFF_X_ORIGIN = 0.74
END_EFF_Z_ORIGIN = 0.5516

class Fishing_Env():
    
    def __init__(self):
        rospy.init_node('tips_fishing_real', anonymous=True, disable_signals=True) # disable rospy handling of Ctrl+C
        
        self.start_time = time.time()
        self.terminal = True # Need to call reset first to start the environment

        ### Joint States
        self.joint_position = np.zeros(7) # Seven joints of the KUKA
        self.joint_velocity = np.zeros(7) # Seven joints of the KUKA

        # Subscribers for joint states:
        rospy.Subscriber('iiwa/state/JointPosition', JointPosition, self.joint_pos_callback, queue_size=1)
        rospy.Subscriber('iiwa/state/JointPositionVelocity', JointPositionVelocity, self.joint_vel_callback, queue_size=1)

        # Subscriber for end effector position:
        rospy.Subscriber('iiwa/state/CartesianPose', CartesianPose, self.endeff_pos_callback, queue_size=1)

        ### Ball state
        # Setup webcam ball tracking:
        self.Webcam = Webcam_capture()
        self.ball_position = np.zeros(2) # x,z position
        self.ball_velocity = np.zeros(2) # x,z velocity
        
        ### Publisher for controller commands
        self.action_pub = rospy.Publisher('iiwa/command/JointPosition', JointPosition, queue_size=1)
        # Command Goal
        self.goal = JointPosition()
        self.goal.position.a1 = 0.0
        self.goal.position.a2 = A2_SETPOINT
        self.goal.position.a3 = 0.0
        self.goal.position.a4 = A4_SETPOINT
        self.goal.position.a5 = 0.0
        self.goal.position.a6 = A6_SETPOINT
        self.goal.position.a7 = 0.22

    def curr_state(self):
        self.ball_position, self.ball_velocity = self.Webcam.get_ball_state() # Causes a delay of about 100ms

        return np.array([
            self.joint_position.a2, # Joint 2
            self.joint_position.a4, # Joint 4
            self.joint_velocity.a2, # Joint 2
            self.joint_velocity.a4, # Joint 4
            self.ball_position[0],  # Ball x position
            self.ball_position[1],  # Ball z position
            self.ball_velocity[0],  # Ball x velocity
            self.ball_velocity[1],   # Ball z velocity
            self.endeff_position.x - END_EFF_X_ORIGIN,
            self.endeff_position.z - END_EFF_Z_ORIGIN
        ])


    def reset(self):
        ### Take action to reset to zero position (with randomization)
        j2_goal = A2_SETPOINT + np.random.uniform(-0.25,0.25)
        j4_goal = A4_SETPOINT + np.random.uniform(-0.25,0.25)

        if not (j2_goal >= (THETA1 - (np.pi/2)) and j2_goal <= THETA1):
            j2_goal = A2_SETPOINT # Setpoint
            print("[Action outside joint limits]")
        if not (j4_goal >= (THETA2 - (np.pi/2)) and j4_goal <= THETA2):
            j4_goal = A4_SETPOINT # Setpoint
            print("[Action outside joint limits]")
        
        # Check for end-effector collision:
        _, z_goal = self.get_end_eff_pos(np.array([[j2_goal, j4_goal]]))
        if((z_goal >= END_EFF_Z_MIN) and (z_goal <= END_EFF_Z_MAX)):
            # Accepted (command within limits)
            self.goal.position.a2 =  j2_goal
            self.goal.position.a4 =  j4_goal
        else:
            j2_goal = A2_SETPOINT # Setpoint
            j4_goal = A4_SETPOINT # Setpoint
            print("[End Effector: minimum height reached]")

        # Optional : Move joint 6 to make ball move more aggresively
        i = np.random.choice([-1,1])
        self.goal.position.a6 = A6_SETPOINT + (i*A6_NOISE)

        # Send Action command
        self.action_pub.publish(self.goal)
        # Wait for action completion
        time.sleep(ACTION_RESET_DURATION)
        # Optional : Move joint 6 to make ball move more aggresively
        self.goal.position.a6 = A6_SETPOINT
        self.action_pub.publish(self.goal)
        # Wait for action completion
        time.sleep(ACTION_RESET_DURATION)
        
        # Set time for this episode
        self.start_time = time.time()

        # Reset terminal state
        self.terminal = False

        return self.curr_state()


    def step(self, a):
        # vec: distance vector between ball and cup
        vec = self.ball_position # Already normalized such
        reward_dist = - np.linalg.norm(vec)
        reward_ctrl = - np.square(a).sum()
        reward = reward_dist + reward_ctrl
        valid_act = True
        
        if (self.terminal):
            print("[Episode ended. reset() needs to be called before new episode can be run]")
        else:
            ### Take action a
            # Sanity check
            if((a >= -0.5).all() and (a <= 0.5).all()):
                # Set goal: Relative position change
                j2_goal = self.goal.position.a2 +  a[0]
                j4_goal = self.goal.position.a4 +  a[1]

                if not (j2_goal >= (THETA1 - (np.pi/2)) and j2_goal <= THETA1):
                    j2_goal = self.goal.position.a2 # Unchanged
                    print("[Action outside joint limits]")
                    valid_act = False
                if not (j4_goal >= (THETA2 - (np.pi/2)) and j4_goal <= THETA2):
                    j4_goal = self.goal.position.a4 # Unchanged
                    print("[Action outside joint limits]")
                    valid_act = False
                
                # Check for end-effector collision:
                _, z_goal = self.get_end_eff_pos(np.array([[j2_goal, j4_goal]]))
                if((z_goal >= END_EFF_Z_MIN) and (z_goal <= END_EFF_Z_MAX)):
                    # Accepted (command within limits)
                    self.goal.position.a2 =  j2_goal
                    self.goal.position.a4 =  j4_goal
                else:
                    print("[End Effector: limit reached]")
                    valid_act = False

                # Send Action command
                self.action_pub.publish(self.goal)
                # Wait for action completion
                time.sleep(ACTION_DURATION)
            else:
                print("[Action provided is too large]")
                valid_act = False

            # Check if terminal based on total time elapsed since reset
            if ((time.time() - self.start_time) > EPISODE_DURATION):
                self.terminal = True

        return self.curr_state(), reward, self.terminal, valid_act


    ### Callbacks for subscribers

    def joint_pos_callback(self, joint_pos_msg):
        self.joint_position = joint_pos_msg.position

        # Debug print:
        # print("Positions: " + "\n" + str(self.joint_position) + "\n" + "Vels: " + "\n" + str(self.joint_velocity) + "\n" + "Efforts: " + "\n" + str(self.joint_effort))

    def joint_vel_callback(self, joint_vel_msg):
        self.joint_velocity = joint_vel_msg.velocity

        # Debug print:
        # print("Positions: " + "\n" + str(joint_position) + "\n")

    def endeff_pos_callback(self, endeff_pos_msg):
        self.endeff_position = endeff_pos_msg.poseStamped.pose.position

        # Debug print:
        # print("End Eff Position: " + "\n" + str(endeff_position) + "\n")

    ## Transform for end-effector position
    def get_end_eff_pos(self, state):
        """get x-z cartesian position of the end effector"""

        theta1 = THETA1 - state[:,0]
        theta2 = THETA2 - state[:,1]

        xpos = L1*np.cos(theta1) + L2*np.cos(theta1-theta2) + L3*np.sin(theta1-theta2-THETA3+(np.pi/2))
        zpos = J2_Z_ORIGIN + L1*np.sin(theta1) + L2*np.sin(theta1-theta2) - L3*np.cos(theta1-theta2-THETA3+(np.pi/2))

        return xpos, zpos