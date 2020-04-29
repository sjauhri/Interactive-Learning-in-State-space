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
params.minInertiaRatio = 0.1
# params.maxInertiaRatio = 0.4

# Set up the detector
detector = cv2.SimpleBlobDetector_create(params)

# Color Filter: BGR Values centered at [199, 86, 30]
COLOR_FILTER_low = np.array([80, 20, 10])
COLOR_FILTER_high = np.array([255, 120, 100])

# Flag to show kinect image stream
show_img = True
# Flag to show position of keypoints
show_pos = False
ball_pos = np.array([0,0])
ball_pos_x_sign = -1
GLASS_ORIGIN = np.array([300,375])
X_RANGE = 590
Z_RANGE = 427

## Play images:
print("[Running...]")
while(True):
    # Capture frame-by-frame
    ret, color_img = cap.read()
    if(not ret):
        print("No image stream")
        break
    ## Our operations on the frame come here
    # Flip Image:
    # color_img = cv2.flip(color_img, 1)
    # Partial image:
    color_img = color_img[:Z_RANGE, :X_RANGE, :] # color_img.shape[0]
    # Color mask: blue
    mask = cv2.inRange(color_img, COLOR_FILTER_low, COLOR_FILTER_high)
    # Detect blobs.
    keypoints = detector.detect(mask)
    # Debug: Uncomment to see mask:
    color_img = mask

    num_keyps = len(keypoints)
    if(num_keyps == 1):
        keyp = keypoints
        # Draw keypoints
        im_with_keypoints = cv2.drawKeypoints(color_img, keyp, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

        ball_pos = np.array([keypoints[0].pt[0], keypoints[0].pt[1]])
    elif(num_keyps > 1):
        # Get largest size keypoint
        index = np.argmax(keyp.size for keyp in keypoints)
        keyp = [keypoints[index]]
        # Draw keypoints
        im_with_keypoints = cv2.drawKeypoints(color_img, keyp, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

        ball_pos = np.array([keypoints[index].pt[0], keypoints[index].pt[1]])
    else:
        im_with_keypoints = color_img

    if(show_img):
        # Show keypoints
        cv2.imshow("Keypoints", im_with_keypoints)
    if(show_pos):
        print("Ball_position (X,Y): ", str(ball_pos))
        # print("Ball_X_position: ", str(ball_pos[0]))
        # Detect sign change for period
        if(ball_pos_x_sign != np.sign(ball_pos[0])):
            print("Zero crossing")
            ball_pos_x_sign = np.sign(ball_pos[0])

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()





# ## Test spped of image retreival
# # Initial:
# import cv2
# import time
# C920_CAM = 0
# # Setup capture
# cap = cv2.VideoCapture(C920_CAM)
# cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)

# # Speed test:
# curr_time = time.time()
# ret, color_img = cap.read()
# ret, color_img = cap.read()
# cv2.imshow("Keypoints", color_img)
# cv2.waitKey(1)
# print(time.time()- curr_time)
