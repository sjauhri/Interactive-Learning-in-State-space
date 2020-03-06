from pyglet.window import key
from gym.envs.classic_control import rendering

H_NULL = 0 # Human feedback values
H_UP = 1
H_DOWN = 2
H_LEFT = 3
H_RIGHT = 4
H_HOLD = 5
DO_NOTHING = 6

class Feedback_ext:
    def __init__(self):
        screen_width = 200
        screen_height = 100
        self.viewer = rendering.Viewer(screen_width, screen_height)          

        self.viewer.window.on_key_press = self.key_press
        self.viewer.window.on_key_release = self.key_release        

        self.h_fb = H_NULL
        self.restart = False

    def key_press(self, k, mod):
        if k == key.SPACE:
            self.restart = True
        if k == key.LEFT:
            self.h_fb = H_LEFT
        if k == key.RIGHT:
            self.h_fb = H_RIGHT
        if k == key.UP:
            self.h_fb = H_UP
        if k == key.DOWN:
            self.h_fb = H_DOWN
        if k == key.Z:
            self.h_fb = H_HOLD
        if k == key.X:
            self.h_fb = DO_NOTHING

    def key_release(self, k, mod):
        if k == key.LEFT or k == key.RIGHT or k == key.UP or k == key.DOWN or k==key.Z or k==key.X:
            self.h_fb = H_NULL

    def get_h(self):
        return self.h_fb

    def ask_for_done(self):
        done = self.restart
        self.restart = False
        return done
