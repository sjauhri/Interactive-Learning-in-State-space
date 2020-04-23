#!/usr/bin/env python2
import sys
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
GLASS_POS = np.array([0,0])

## Setup:
# Kinect
# logger = createConsoleLogger(LoggerLevel.Debug)
# setGlobalLogger(logger)
fn = Freenect2()
assert fn.enumerateDevices() > 0, "No kinect device found"
device = fn.openDefaultDevice(pipeline=pipeline)

listener = SyncMultiFrameListener(FrameType.Color)

# Register listeners
device.setColorFrameListener(listener)
device.start()

## Play images:
while (1):
    # Optional: Delay
    # time.sleep(0.2)

    frame = listener.waitForNewFrame()
    color_im = frame["color"]
    color_im = color_im.asarray()
    # Throw away last column
    color_im = color_im[:, :, :3]
    # Scale image:
    # color_im = cv2.resize(color_im, (int(1920 / 2), int(1080 / 2)))
    # Flip about y-axis
    color_im = cv2.flip(color_im, 1)
    # Save image:
    # cv2.imwrite('pendulum_images/image_%i.png' % self.i_image,  color_im)
    # Partial image:
    color_im = color_im[200:, 450:-250, :]

    ## Blob detection:
    # color_im = cv2.imread("fishing.png")
    color_img = color_im.copy()
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
    params.minInertiaRatio = 0.25
    
    mask = cv2.inRange(color_img, COLOR_FILTER_low, COLOR_FILTER_high)
    # Set up the detector
    detector = cv2.SimpleBlobDetector_create(params)
    # Detect blobs.
    keypoints = detector.detect(mask)
    # Draw detected blobs as red circles.
    # cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS ensures the size of the circle corresponds to the size of blob
    # im_with_keypoints = cv2.drawKeypoints(color_img, keypoints, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

    im_with_keypoints = mask.copy()
    num_keyps = len(keypoints)
    if(num_keyps == 1):
        # Draw detected blobs as red circles.
        # cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS ensures the size of the circle corresponds to the size of blob
        im_with_keypoints = cv2.drawKeypoints(mask, keypoints, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
    elif(num_keyps > 1):
        # Get largest size keypoint
        index = np.argmax(keyp.size for keyp in keypoints)
        keyp = [keypoints[index]]
        im_with_keypoints = cv2.drawKeypoints(mask, keyp, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

    # Show keypoints
    cv2.imshow("Keypoints", im_with_keypoints)
    # cv2.imshow('current_frame', color_im)
    cv2.waitKey(delay=1)
    listener.release(frame)