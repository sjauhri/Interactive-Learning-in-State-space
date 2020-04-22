import socket
import sys
import time
import numpy as np
import pygame
import cv2
from pylibfreenect2 import Freenect2, SyncMultiFrameListener, FrameListener
from pylibfreenect2 import FrameType, Registration, Frame, LoggerLevel, createConsoleLogger, setGlobalLogger

try:
    from pylibfreenect2 import OpenGLPacketPipeline
    pipeline = OpenGLPacketPipeline()
except:
    from pylibfreenect2 import CpuPacketPipeline
    pipeline = CpuPacketPipeline()


class RealPendulumHD:
    def __init__(self):
        # Kinect
        self.logger = createConsoleLogger(LoggerLevel.Debug)
        setGlobalLogger(self.logger)
        self.fn = Freenect2()
        self.device = self.fn.openDefaultDevice(pipeline=pipeline)

        self.listener = SyncMultiFrameListener(FrameType.Color)

        # Register listeners
        self.device.setColorFrameListener(self.listener)
        self.device.start()

        # Matlab comm
        sever_port = ('127.0.0.1', 54320)

        try:
            # create an AF_INET, STREAM socket (TCP)
            self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        except:
            print('Failed to create a socket. ')
            sys.exit()
        print('Socket Created :)')

        self.sock.connect(sever_port)
        print("start a client")
        time.sleep(0.01)

        s = "start"
        #At the beginning it will send a vector that is empty
        self.sock.sendall(s.encode('utf-8'))

        self.key = -1 # Dattari
        self.video_size = 200, 200 # Dattari
        self.screen = pygame.display.set_mode(self.video_size) # Dattari
        self.clock = pygame.time.Clock() # Dattari
        self.fps = 50  # Dattari
        self.i_image = 0

        self.h = np.array([0, 0])  # Dattari: human correction (reward)
        self.right_key_pressed = False
        self.left_key_pressed = False
        self.front_key_pressed = False
        self.back_key_pressed = False

        self.theta = None

    def _preprocess_observation(self, raw_observation):
        str_obs = raw_observation.decode('utf-8')[1:-1].split(',')
        self.theta = (float(str_obs[0]) - np.pi) * -1
        self.theta_mod = (self.theta + np.pi / 2) % (2 * np.pi)  # reference changed to pi/2
        self.theta = self.theta % (2 * np.pi)  # angle starts at equilibrium point and not counting laps
        return raw_observation

    def render(self):
        pass

    def reset(self):
        buf = self.sock.recv(100)  # read what it is recieving from the server
        frames = self.listener.waitForNewFrame()
        color = frames["color"]
        color = cv2.resize(color.asarray(), (int(1920 / 3), int(1080 / 3)))
        color = cv2.flip(color, 1)
        color = color[:, 140:-140, :3]

        cv2.imshow('frame', color)  # For debugging
        cv2.waitKey(delay=1)
        observation = color
        self.listener.release(frames)
        self._preprocess_observation(buf)

        return observation

    def step(self, action):
        # Send action
        str_action = str(action * 2)  # The server sends only string files
        self.sock.sendall(str_action.encode('utf-8'))

        # Receive observation
        buf = self.sock.recv(100)  # Not used in the HD case

        frames = self.listener.waitForNewFrame()
        color = frames["color"]
        color = cv2.resize(color.asarray(), (int(1920 / 3), int(1080 / 3)))
        color = cv2.flip(color, 1)
        #cv2.imwrite('pendulum_images/image_%i.png' % self.i_image,  color)
        color = color[:, 140:-140, :3]

        cv2.imshow('frame', color)  # For debugging
        cv2.waitKey(delay=1)
        observation = color
        self.listener.release(frames)
        self._preprocess_observation(buf)

        return observation, 0, False, {}

    ### Dattari: capture key from keyboard for COACH correction
    def capture_key(self):
        # process pygame events
        for event in pygame.event.get():
            # test events, set key states
            if event.type == pygame.KEYDOWN:
                if(event.key == 275):
                    pygame.display.flip()
                    self.clock.tick(self.fps)
                    #print('right key pressed', event.key)
                    return 'rightkeydown'
                elif(event.key == 276):
                    pygame.display.flip()
                    self.clock.tick(self.fps)
                    #print('left key pressed', event.key)
                    return 'leftkeydown'
                elif(event.key == 273):
                    pygame.display.flip()
                    self.clock.tick(self.fps)
                    return 'frontkeydown'
                elif(event.key == 274):
                    pygame.display.flip()
                    self.clock.tick(self.fps)
                    return 'backkeydown'
            if event.type == pygame.KEYUP:
                if(event.key == 275):
                    pygame.display.flip()
                    self.clock.tick(self.fps)
                    return 'rightkeyup'
                elif(event.key == 276):
                    pygame.display.flip()
                    self.clock.tick(self.fps)
                    return 'leftkeyup'
                elif(event.key == 273):
                    pygame.display.flip()
                    self.clock.tick(self.fps)
                    return 'frontkeyup'
                elif(event.key == 274):
                    pygame.display.flip()
                    self.clock.tick(self.fps)
                    return 'backkeyup'

        pygame.display.flip()
        self.clock.tick(self.fps)
        return -1

    def get_h(self):
        ### Dattari: capture key and show arrow in canvas
        self.key = self.capture_key()

        if self.key == 'rightkeyup':
            self.right_key_pressed = False
            self.h = np.array([0, 0])
        if self.key == 'leftkeyup':
            self.left_key_pressed = False
            self.h = np.array([0, 0])
        if self.key == 'frontkeyup':
            self.front_key_pressed = False
            self.h = np.array([0, 0])
        if self.key == 'backkeyup':
            self.back_key_pressed = False
            self.h = np.array([0, 0])
        if self.right_key_pressed:
            self.h = np.array([-1, 0])
        if self.left_key_pressed:
            self.h = np.array([1, 0])
        if self.front_key_pressed:
            self.h = np.array([0, -1])
        if self.back_key_pressed:
            self.h = np.array([0, 1])
        if self.key == 'rightkeydown':
            self.right_key_pressed = True
            self.h = np.array([-1, 0])  # go right
        if self.key == 'leftkeydown':
            self.left_key_pressed = True
            self.h = np.array([1, 0])  # go left
        if self.key == 'frontkeydown':
            self.front_key_pressed = True
            self.h = np.array([0, -1])  # go forward
        if self.key == 'backkeydown':
            self.back_key_pressed = True
            self.h = np.array([0, 1])  # stop

        h_t = - self.h[0]
        #h_t = self.h[0] * np.sign(np.cos(self.theta)) + self.h[1] * np.sign(np.sin(self.theta))

        return - h_t
