"""
ROS Interface for Fishing Task using KUKA lbr iiwa 7

Uses iiwa_stack:
https://github.com/IFL-CAMP/iiwa_stack
"""
import rospy
from std_msgs.msg import String
import numpy as np

class Fishing_Env():
    def __init__(self):
        rospy.init_node('tips_fishing', anonymous=True)

        rospy.Subscriber('chatter', String, callback)

    def reset(self):
        qpos = self.np_random.uniform(low=-0.1, high=0.1, size=self.model.nq) + self.init_qpos
        # while True:
        #     self.goal = self.np_random.uniform(low=-.2, high=.2, size=2)
        #     if np.linalg.norm(self.goal) < 0.2:
        #         break
        self.goal = [-0.11977868, 0.11620387]
        qpos[-2:] = self.goal
        qvel = self.init_qvel + self.np_random.uniform(low=-.005, high=.005, size=self.model.nv)
        qvel[-2:] = 0
        self.set_state(qpos, qvel)
        return self._get_obs()

    def step(self, a):
        vec = self.get_body_com("fingertip")-self.get_body_com("target")
        reward_dist = - np.linalg.norm(vec)
        reward_ctrl = - np.square(a).sum()
        reward = reward_dist + reward_ctrl
        self.do_simulation(a, self.frame_skip)
        ob = self._get_obs()
        done = False
        return ob, reward, done, dict(reward_dist=reward_dist, reward_ctrl=reward_ctrl)

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data.data)
