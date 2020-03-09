from pyglet.window import key

H_NULL = 0 # Human feedback values
H_UP = 1
H_DOWN = 2
H_LEFT = 3
H_RIGHT = 4
H_HOLD = 5
DO_NOTHING = 6
H_UPLEFT = 7
H_UPRIGHT = 8
H_DOWNLEFT = 9
H_DOWNRIGHT = 10


class Feedback_lunar:
    def __init__(self, env):
        env.unwrapped.viewer.window.on_key_press = self.key_press
        env.unwrapped.viewer.window.on_key_release = self.key_release

        self.up_pressed = False
        self.down_pressed = False
        self.left_pressed = False
        self.right_pressed = False

        self.h_fb = H_NULL
        self.restart = False
        self.end = False

    def key_press(self, k, mod):
        if k == key.ENTER:
            self.end = True
        if k == key.SPACE:
            self.restart = True
        if k == key.LEFT:
            self.left_pressed = True
            if ((self.up_pressed == True) and (self.down_pressed == False)):
                self.h_fb = H_UPLEFT
            elif ((self.up_pressed == False) and (self.down_pressed == True)):
                self.h_fb = H_DOWNLEFT
            else:    
                self.h_fb = H_LEFT
        elif k == key.RIGHT:
            self.right_pressed = True
            if ((self.up_pressed == True) and (self.down_pressed == False)):
                self.h_fb = H_UPRIGHT
            elif ((self.up_pressed == False) and (self.down_pressed == True)):
                self.h_fb = H_DOWNRIGHT
            else:    
                self.h_fb = H_RIGHT
        elif k == key.UP:
            self.up_pressed = True
            if ((self.left_pressed == True) and (self.right_pressed == False)):
                self.h_fb = H_UPLEFT
            elif ((self.left_pressed == False) and (self.right_pressed == True)):
                self.h_fb = H_UPRIGHT
            else:    
                self.h_fb = H_UP
        elif k == key.DOWN:
            self.down_pressed = True
            if ((self.left_pressed == True) and (self.right_pressed == False)):
                self.h_fb = H_DOWNLEFT
            elif ((self.left_pressed == False) and (self.right_pressed == True)):
                self.h_fb = H_DOWNRIGHT
            else:    
                self.h_fb = H_DOWN
        if k == key.Z:
            self.h_fb = H_HOLD
        if k == key.X:
            self.h_fb = DO_NOTHING

    def key_release(self, k, mod):
        if k == key.UP:
            self.up_pressed = False
            if (self.left_pressed == True):
                self.h_fb = H_LEFT
            elif (self.right_pressed == True):
                self.h_fb = H_RIGHT
            else:
                self.h_fb = H_NULL
        elif k == key.DOWN:
            self.down_pressed = False
            if (self.left_pressed == True):
                self.h_fb = H_LEFT
            elif (self.right_pressed == True):
                self.h_fb = H_RIGHT
            else:
                self.h_fb = H_NULL
        elif k == key.LEFT:
            self.left_pressed = False
            if (self.up_pressed == True):
                self.h_fb = H_UP
            elif (self.down_pressed == True):
                self.h_fb = H_DOWN
            else:
                self.h_fb = H_NULL
        elif k == key.RIGHT:
            self.right_pressed = False
            if (self.up_pressed == True):
                self.h_fb = H_UP
            elif (self.down_pressed == True):
                self.h_fb = H_DOWN
            else:
                self.h_fb = H_NULL

        if (k==key.Z or k==key.X):
            self.h_fb = H_NULL

    def get_h(self):
        return self.h_fb

    def ask_for_done(self):
        done = self.restart
        self.restart = False
        return done

    def ask_for_end(self):
        return self.end