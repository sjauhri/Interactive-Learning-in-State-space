#!/usr/bin/env python2
import time
import numpy as np
import cv2
import pdb

# Webcam types:
IN_BUILT_CAM = 0
C920_CAM = 2

# Setup capture
cap = cv2.VideoCapture(C920_CAM)
cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)

## Blob detection:
# Setup SimpleBlobDetector parameters
params = cv2.SimpleBlobDetector_Params()
# Change thresholds
params.minThreshold = 0
params.maxThreshold = 500
# Filter by center of blob color
params.filterByColor = False
# params.blobColor = 0 # Dark center
# Filter by Area.
params.filterByArea = True
params.minArea = 75
params.maxArea = 750
# Filter by Circularity
params.filterByCircularity = False
# params.minCircularity = 0.2
# Filter by Convexity
params.filterByConvexity = False
# params.minConvexity = 0.5
# Filter by Inertia
params.filterByInertia = True
params.minInertiaRatio = 0.4#0.1
# params.maxInertiaRatio = 0.4

# Set up the detector
detector = cv2.SimpleBlobDetector_create(params)

# Color Filter: BGR Values centered at [199, 86, 30]
COLOR_FILTER_low = np.array([0, 20, 15])
COLOR_FILTER_high = np.array([255, 200, 200])

# Flag to show kinect image stream
show_img = True
# Flag to show position of keypoints
show_pos = True
GLASS_POS = np.array([300,375])
ball_pos = GLASS_POS
ball_pos_x_sign = -1
ball_vel = np.array([0.0,0.0])

## KF Setup:
kalman = cv2.KalmanFilter(4, 2, 0)
kalman.transitionMatrix = np.array([[1., 0., 0.1, 0.], [0., 1., 0., 0.1], [0., 0., 1., 0.], [0., 0., 0., 1.]])
kalman.measurementMatrix = np.array([[1., 0., 0., 0.], [0., 1., 0., 0.]])
kalman.processNoiseCov = np.array([[1e-2, 0., 0., 0.], [0., 1e-2, 0., 0.], [0., 0, 1e-2, 0.], [0., 0, 0., 1e-2]])#1e-2 * np.eye(4) # TUNE
kalman.measurementNoiseCov = 1e-1 * np.eye(2) # TUNE
kalman.errorCovPost = 1. * np.eye(4)
kalman.statePost = 0. *np.zeros((4,1))
kalman.statePost[0] = ball_pos[0]
kalman.statePost[1] = ball_pos[1]
kalman.statePost[2] = ball_vel[0]
kalman.statePost[3] = ball_vel[1]

pred_state = kalman.predict()
# meas = np.array([[375.0],[400.0]])
# est = kalman.correct(meas)

## Play images:
print("[Running...]")
prev_time = time.time()
ret, im_with_keypoints = cap.read()
while(True):
    # Capture frame-by-frame
    cap.grab()
    ret, frame = cap.read()
    if(not ret):
        print("No image stream")
        break

    ## Our operations on the frame come here
    # Flip Image:
    # frame = cv2.flip(frame, 1)
    # Partial image:
    color_img = frame[:427, :590, :]
    # Color mask: reject grey
    # grey_mask = ((color_img[:, :, 1] - color_img[:, :, 0]) > 50).astype('uint8', copy=True)
    # color_img = cv2.bitwise_and(color_img,color_img, mask=grey_mask) # AND with main image
    # Color mask: blue
    mask = cv2.inRange(color_img, COLOR_FILTER_low, COLOR_FILTER_high)    
    color_img = cv2.bitwise_and(color_img,color_img, mask=mask) # AND with main image
    # Detect blobs.
    keypoints = detector.detect(color_img)
    # Debug: Uncomment to see mask:
    # color_img = frame

    num_keyps = len(keypoints)
    if(num_keyps >= 1):
        # Get largest size keypoint
        index = np.argmax(keyp.size for keyp in keypoints)
        keyp = [keypoints[index]]

        # Time interval (for velocity calculation)
        dt = time.time() - prev_time
        if (dt < 0.1):
            time.sleep(0.1-dt)
        print("Time interval:", time.time()- prev_time)# 0.06 to 0.11
        prev_time = time.time()

        # ball_pos_prev = ball_pos
        # ball_vel_prev = ball_vel
        ball_pos_now = np.array([keypoints[index].pt[0], keypoints[index].pt[1]])
        # ball_vel = (ball_pos - ball_pos_prev)/dt

        #KF: Curently removed
        ball_vel = (ball_pos_now - ball_pos)/dt
        ball_pos = ball_pos_now
        # meas = np.array([[ball_pos_now[0]],[ball_pos_now[1]]])
        # est_state = kalman.correct(meas)
        # ball_pos[0] = est_state[0]
        # ball_pos[1] = est_state[1]
        # ball_vel[0] = est_state[2]
        # ball_vel[1] = est_state[3]
        # kalman.predict() # predict next

        # Draw keypoints      
        im_with_keypoints = cv2.drawKeypoints(color_img, keyp, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
    # else:
    #     im_with_keypoints = color_img

    if(show_img):
        # Show keypoints
        # radius = 5
        # thickness = -1
        # color = (0, 255, 255)  
        # im_with_keypoints = cv2.circle(im_with_keypoints, (int(ball_pos[0]),int(ball_pos[1])), radius, color, thickness)
        cv2.imshow("Keypoints", im_with_keypoints)
    if(show_pos):
        print("Ball_position (X,Y): ", str(ball_pos))
        # print("Ball_X_position: ", str(ball_pos[0]))
        # Detect sign change for period
        if(ball_pos_x_sign != np.sign(ball_pos[0])):
            print("Zero crossing")
            ball_pos_x_sign = np.sign(ball_pos[0])
        print("Ball_velocity (X,Y): ", str(ball_vel))

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()





# ## Test spped of image retreival
# # Initial:
# import cv2
# import time
# C920_CAM = 2
# # Setup capture
# cap = cv2.VideoCapture(C920_CAM)
# cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)

# # Speed test:
# curr_time = time.time()
# cap.grab()
# ret, color_img = cap.read()
# cv2.imshow("Keypoints", color_img)
# cv2.waitKey(1)
# print(time.time()- curr_time)