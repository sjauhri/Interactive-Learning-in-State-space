#!/usr/bin/env python2
import time
import numpy as np
import cv2
from pylibfreenect2 import Freenect2, SyncMultiFrameListener, FrameListener
from pylibfreenect2 import FrameType, Registration, Frame, LoggerLevel, createConsoleLogger, setGlobalLogger
import pdb

try:
    from pylibfreenect2 import OpenGLPacketPipeline
    pipeline = OpenGLPacketPipeline()
except:
    from pylibfreenect2 import CpuPacketPipeline
    pipeline = CpuPacketPipeline()

# BGR Value centered at [199, 86, 30]
COLOR_FILTER_low = np.array([110, 20, 0])
COLOR_FILTER_high = np.array([255, 120, 100])
GLASS_POS = np.array([496,716])

## Setup:
# Kinect
# Optional: Logging
# logger = createConsoleLogger(LoggerLevel.Debug)
logger = None
print("[Logging surpressed]")
setGlobalLogger(logger)
fn = Freenect2()
assert fn.enumerateDevices() > 0, "No kinect device found"
device = fn.openDefaultDevice(pipeline=pipeline)

listener = SyncMultiFrameListener(FrameType.Color)

# Register listeners
device.setColorFrameListener(listener)
device.start()

## Blob detection:
# Setup SimpleBlobDetector parameters.
params = cv2.SimpleBlobDetector_Params()
# Change thresholds
params.minThreshold = 0
params.maxThreshold = 200
# # Filter by center of blob color
params.filterByColor = False
# params.blobColor = 0 # Dark center
# # Filter by Area.
# CHECK VALUE THRESHOLD!
params.filterByArea = True
params.minArea = 500
params.maxArea = 30000
# # Filter by Circularity
params.filterByCircularity = False
# params.minCircularity = 0.2
# # Filter by Convexity
params.filterByConvexity = False
# params.minConvexity = 0.5
# # Filter by Inertia
params.filterByInertia = True
params.minInertiaRatio = 0.15

# Set up the detector
detector = cv2.SimpleBlobDetector_create(params)

# Flag to show kinect image stream
show_img = False
# Flag to show position of keypoints
show_pos = True
ball_pos = np.array([0,0])
ball_pos_x_sign = -1

## Play images:
print("[Running...]")
while (1):
    # Optional: Delay
    # time.sleep(0.2)

    frame = listener.waitForNewFrame()
    color_img = frame["color"].asarray()
    # Scale image:
    # color_img = cv2.resize(color_img, (int(1920 / 2), int(1080 / 2)))
    # Flip about y-axis
    color_img = cv2.flip(color_img, 1)
    # Save image:
    # cv2.imwrite('pendulum_images/image_%i.png' % self.i_image,  color_im)
    # Partial image:
    color_img = color_img[200:, 450:-500, :3]
    
    # Color mask: blue
    mask = cv2.inRange(color_img, COLOR_FILTER_low, COLOR_FILTER_high)
    # Detect blobs.
    keypoints = detector.detect(mask)

    num_keyps = len(keypoints)
    if(num_keyps == 1):
        keyp = keypoints
        ball_pos = np.array([keypoints[0].pt[0], keypoints[0].pt[1]]) - GLASS_POS
    elif(num_keyps > 1):
        # Get largest size keypoint
        index = np.argmax(keyp.size for keyp in keypoints)
        keyp = [keypoints[index]]
        ball_pos = np.array([keypoints[index].pt[0], keypoints[index].pt[1]]) - GLASS_POS
    else:
        im_with_keypoints = color_img

    if(show_img):
        # Draw keypoints
        im_with_keypoints = cv2.drawKeypoints(color_img, keyp, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
        # Show keypoints
        cv2.imshow("Keypoints", im_with_keypoints)
        # cv2.imshow('current_frame', color_img)
        cv2.waitKey(delay=1)
    if(show_pos):
        # print("Ball_position (X,Y): ", str(ball_pos))
        print("Ball_X_position: ", str(ball_pos[0]))
        # Detect sign change for period
        if(ball_pos_x_sign != np.sign(ball_pos[0])):
            print("Zero crossing")
            ball_pos_x_sign = np.sign(ball_pos[0])


    listener.release(frame)