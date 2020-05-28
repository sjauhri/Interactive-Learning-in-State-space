"""
ROS Interface for Fishing Task using KUKA lbr iiwa 7

Uses iiwa_stack:
https://github.com/IFL-CAMP/iiwa_stack
"""

import rospy
from webcam_laser_track import *
from std_msgs.msg import String, Float32
from iiwa_msgs.msg import JointPosition, JointPositionVelocity, CartesianPose
import numpy as np
import time

EPISODE_DURATION = 10 # seconds
ACTION_DURATION = 0#0.8 # seconds
ACTION_RESET_DURATION = 1 # seconds

A1_SETPOINT = 20.0 * (np.pi/180) # Joint 1 initial position
A2_SETPOINT = 5.0 * (np.pi/180) # Joint 2 initial position
A3_SETPOINT = -14.0 * (np.pi/180) # Joint 3 initial position
A4_SETPOINT = -85.0 * (np.pi/180) # Joint 4 initial position
A5_SETPOINT = -24.0 * (np.pi/180) # Joint 5 initial position
A6_SETPOINT = 0.0 # Joint 6 initial position
A7_SETPOINT = 30.0 * (np.pi/180) # Joint 7 initial position

A3_LIMIT_HIGH = 6 * (np.pi/180)
A3_LIMIT_LOW  = -35.0 * (np.pi/180)
A5_LIMIT_HIGH = -5.0 * (np.pi/180)
A5_LIMIT_LOW  = -34.0 * (np.pi/180)

ACTION_LIMIT = 0.1

class Laser_Env():
    
    def __init__(self):
        rospy.init_node('tips_laser', anonymous=True, disable_signals=True) # disable rospy handling of Ctrl+C
        
        self.start_time = time.time()
        self.terminal = True # Need to call reset first to start the environment

        ### Joint States
        self.joint_position = np.zeros(7) # Seven joints of the KUKA
        self.joint_velocity = np.zeros(7) # Seven joints of the KUKA

        # Subscribers for joint states:
        rospy.Subscriber('iiwa/state/JointPosition', JointPosition, self.joint_pos_callback, queue_size=1)
        rospy.Subscriber('iiwa/state/JointPositionVelocity', JointPositionVelocity, self.joint_vel_callback, queue_size=1)

        ### Laser pointer state
        # Setup webcam laser tracking:
        self.Webcam = Webcam_capture()
        self.laser_position = np.zeros(2) # x,z position
        
        ### Publisher for controller commands
        self.action_pub = rospy.Publisher('iiwa/command/JointPosition', JointPosition, queue_size=1)
        # Command Goal
        self.goal = JointPosition()
        self.goal.position.a1 = A1_SETPOINT
        self.goal.position.a2 = A2_SETPOINT
        self.goal.position.a3 = A3_SETPOINT
        self.goal.position.a4 = A4_SETPOINT
        self.goal.position.a5 = A5_SETPOINT
        self.goal.position.a6 = A6_SETPOINT
        self.goal.position.a7 = A7_SETPOINT

        self.h_fb = 0

    def curr_state(self):
        self.laser_position = self.Webcam.get_laser_state(self.h_fb) # Causes a delay of about 100ms
        # Debug: No position
        # self.laser_position[0] = 0
        # self.laser_position[1] = 0
        # No velocity
        self.joint_velocity.a3 = 0 # Joint 3
        self.joint_velocity.a5 = 0 # Joint 5

        return np.array([
            self.joint_position.a3, # Joint 3
            self.joint_position.a5, # Joint 5
            self.joint_velocity.a3, # Joint 3
            self.joint_velocity.a5, # Joint 5
            self.laser_position[0],  # laser x position
            self.laser_position[1]  # laser z position
        ])


    def reset(self):
        # ### Take action to reset to zero position with randomization        
        # j3_goal = A3_SETPOINT + np.random.uniform(-0.1,0.1)
        # j5_goal = A5_SETPOINT + np.random.uniform(-0.1,0.1)
        # if (not (j3_goal >= A3_LIMIT_LOW and j3_goal <= A3_LIMIT_HIGH)) or (not (j5_goal >= A5_LIMIT_LOW and j5_goal <= A5_LIMIT_HIGH)):
        #     j3_goal = self.goal.position.a3 # Unchanged
        #     j5_goal = self.goal.position.a5 # Unchanged
        #     print("[Action outside joint limits]")
        # self.goal.position.a3 =  j3_goal
        # self.goal.position.a5 =  j5_goal
        
        ### Take action to reset to fixed top left position
        # "C"
        self.goal.position.a3 =  3 * (np.pi/180)
        self.goal.position.a5 =  -30 * (np.pi/180)
        # "O"
        # self.goal.position.a3 =  0
        # self.goal.position.a5 =  -30 * (np.pi/180)
        # "R"
        # self.goal.position.a3 =  -5 * (np.pi/180)
        # self.goal.position.a5 =  -22 * (np.pi/180)
        # "L"
        # self.goal.position.a3 =  -13 * (np.pi/180)
        # self.goal.position.a5 =  -30.2 * (np.pi/180)

        # Send Action command
        self.action_pub.publish(self.goal)
        time.sleep(ACTION_RESET_DURATION)

        # Set time for this episode
        self.start_time = time.time()

        # Reset terminal state
        self.terminal = False
        return self.curr_state()


    def step(self, a, h_fb=0):
        act_taken = np.copy(a)
        
        if (self.terminal):
            print("[Episode ended. reset() needs to be called before new episode can be run]")
            act_taken = np.array([0.0 , 0.0])
        else:
            ### Take action a
            # Sanity check
            if((a >= -ACTION_LIMIT).all() and (a <= ACTION_LIMIT).all()):
                # Set goal: Relative position change
                j3_goal = self.goal.position.a3 +  a[0]
                j5_goal = self.goal.position.a5 +  a[1]

                if (not (j3_goal >= A3_LIMIT_LOW and j3_goal <= A3_LIMIT_HIGH)) or (not (j5_goal >= A5_LIMIT_LOW and j5_goal <= A5_LIMIT_HIGH)):
                    j3_goal = self.goal.position.a3 # Unchanged
                    j5_goal = self.goal.position.a5 # Unchanged
                    print("[Action outside joint limits]")
                    act_taken[0] = 0.0
                    act_taken[1] = 0.0
                
                self.goal.position.a3 =  j3_goal
                self.goal.position.a5 =  j5_goal
                self.h_fb = h_fb

                # Send Action command
                self.action_pub.publish(self.goal)
                # print("Goal: ",self.goal)
                # Wait for action completion
                time.sleep(ACTION_DURATION)
            else:
                print("[Action provided is too large]")
                act_taken = np.array([0.0 , 0.0])

            # Check if terminal based on total time elapsed since reset
            if ((time.time() - self.start_time) > EPISODE_DURATION):
                self.terminal = True

        # vec: distance vector between laser point and reference
        # vec = self.laser_position # Already normalized such
        # reward_dist = - np.linalg.norm(vec)
        # reward_ctrl = - np.square(act_taken).sum()
        # reward = reward_dist + reward_ctrl
        reward = 0

        return self.curr_state(), reward, self.terminal, act_taken


    ### Callbacks for subscribers
    def joint_pos_callback(self, joint_pos_msg):
        self.joint_position = joint_pos_msg.position

        # Debug print:
        # print("Positions: " + "\n" + str(self.joint_position) + "\n" + "Vels: " + "\n" + str(self.joint_velocity) + "\n" + "Efforts: " + "\n" + str(self.joint_effort))

    def joint_vel_callback(self, joint_vel_msg):
        self.joint_velocity = joint_vel_msg.velocity

        # Debug print:
        # print("Velocities: " + "\n" + str(self.joint_velocity) + "\n")