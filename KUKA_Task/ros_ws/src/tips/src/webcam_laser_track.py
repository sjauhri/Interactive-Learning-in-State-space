#!/usr/bin/env python2
import numpy as np
import cv2
import time
import pdb
from feedback_ext import *

# Webcam types:
IN_BUILT_CAM = 0
C920_CAM = 2

# Color Filter: BGR Values
# THESE VALUES ARE ALLOWED
COLOR_FILTER_low = np.array([0, 0, 0])
COLOR_FILTER_high = np.array([255, 255, 180])

# Ball position tracking
ORIGIN = np.array([270.0,90.0])
X_RANGE = 420
Z_RANGE = 407

class Webcam_capture():
    
    def __init__(self):
        # Setup capture
        self.cap = cv2.VideoCapture(C920_CAM)
        self.cap.set(cv2.CAP_PROP_BUFFERSIZE, 1) # Buffer of 1 to throw away old frames
        # Capture a frame
        self.cap.grab() # Throw previous frame in buffer
        ret, frame = self.cap.read()
        if(not ret):
            print("Warning: No image stream from webcam")
        self.im_with_keypoints = frame
        
        self.recordVid = False
        if(self.recordVid):
            self.im_with_keypoints = cv2.imread("results/tips/laser/" + "CO" + "_draw.png")
            self.vid = cv2.VideoWriter('Laser_Video_COR.mp4', 0x7634706d, 10, (640, 480)) # mp4

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
        params.minArea = 1
        params.maxArea = 30
        # Filter by Circularity
        params.filterByCircularity = False
        # params.minCircularity = 0.2
        # Filter by Convexity
        params.filterByConvexity = False
        # params.minConvexity = 0.5
        # Filter by Inertia
        params.filterByInertia = False
        # params.minInertiaRatio = 0.4
        # params.maxInertiaRatio = 0.4

        # Set up the detector
        self.detector = cv2.SimpleBlobDetector_create(params)

        # Flag to show kinect image stream
        self.show_img = True
        # Flag to show position of keypoints
        self.show_pos = False
        
        self.laser_pos = np.array([117.8,65.7]) # O
        #np.array([92.5,47.1]) # C
        #np.array([117.8,65.7]) # O
        self.laser_vel = np.array([0.0,0.0])

        # Init webcam and let it adjust exposure for 2 seconds
        self.prev_time = time.time()
        start = time.time()
        elapsed = time.time() - start
        while (elapsed < 1):
            pos = self.get_laser_state()
            print("laser_position (X,Z): ", pos)
            elapsed = time.time() - start


    def get_laser_state(self, h_feedback=0):
        # Capture frame        
        self.cap.grab() # Throw previous frame in buffer
        ret, frame = self.cap.read()
        if(not ret):
            print("Warning: No image stream from webcam")
            return
        
        # Cut image:
        color_img = frame[21:428, 92:510, :]
        # Color mask: blue
        mask = cv2.inRange(color_img, COLOR_FILTER_low, COLOR_FILTER_high)
        color_img = cv2.bitwise_and(color_img,color_img, mask=mask) # AND with main image
        # Detect blobs
        keypoints = self.detector.detect(color_img)
        color_img = frame
        # Debug: Uncomment to see mask:
        # color_img = mask

        num_keyps = len(keypoints)
        if(num_keyps >= 1):
            # Get largest size keypoint
            index = np.argmax(keyp.size for keyp in keypoints)
            keyp = [keypoints[index]]
            
            # Time interval (for velocity calculation)
            dt = time.time()- self.prev_time
            # print("Time interval:", dt)
            self.prev_time = time.time()
            
            laser_pos_now = np.array([keypoints[index].pt[0], keypoints[index].pt[1]])
            
            if(self.show_img):
                # Draw keypoints
                # self.im_with_keypoints = cv2.drawKeypoints(color_img[21:428, 92:510, :], keyp, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
                self.im_with_keypoints = cv2.line(self.im_with_keypoints,(int(self.laser_pos[0]+92),int(self.laser_pos[1]+21)),(int(laser_pos_now[0]+92),int(laser_pos_now[1]+21)),(0,0,255),2)
                # pt1 = (int(laser_pos_now[0]+92),int(laser_pos_now[1]+21))
                # if (h_feedback < 5 and h_feedback > 0):
                #     if (h_feedback == H_UP):
                #         pt2 = (int(keypoints[index].pt[0]+92),int(keypoints[index].pt[1]+21-30))
                #     elif (h_feedback == H_DOWN):
                #         pt2 = (int(keypoints[index].pt[0]+92),int(keypoints[index].pt[1]+21+30))
                #     elif (h_feedback == H_LEFT):
                #         pt2 = (int(keypoints[index].pt[0]+92-30),int(keypoints[index].pt[1]+21))
                #     elif (h_feedback == H_RIGHT):
                #         pt2 = (int(keypoints[index].pt[0]+92+30),int(keypoints[index].pt[1]+21))
                #     self.im_with_keypoints = cv2.arrowedLine(color_img, pt1, pt2, (0,0,255), 8)

            #KF: Curently removed
            self.laser_vel = (laser_pos_now - self.laser_pos)/dt
            self.laser_pos = laser_pos_now
            # meas = np.array([[laser_pos_now[0]],[laser_pos_now[1]]])
            # est_state = kalman.correct(meas)
            # self.laser_pos[0] = est_state[0]
            # self.laser_pos[1] = est_state[1]
            # self.laser_pos[0] = est_state[2]
            # self.laser_pos[1] = est_state[3]
            # kalman.predict() # predict next

        # Optional: Display stuff
        if(self.show_img):
            # Show keypoints
            cv2.imshow("Keypoints", self.im_with_keypoints)
            print("laser_position (X,Z): ", str(self.laser_pos))
            if(self.recordVid):
                self.vid.write(self.im_with_keypoints)
        if(self.show_pos):
            print("laser_position (X,Z): ", str(self.laser_pos))
        if cv2.waitKey(1) & 0xFF == ord('q'):
            self.show_img = False
            self.show_pos = False
            if(self.recordVid):
                cv2.imwrite("O_draw.png", self.im_with_keypoints)
                self.vid.release()
            cv2.destroyAllWindows()

        # Normalize and return:
        laser_p = np.array([0.0,0.0])
        laser_p[0] = (self.laser_pos[0] - ORIGIN[0])/X_RANGE  # Laser x position
        laser_p[1] = (ORIGIN[1] - self.laser_pos[1])/Z_RANGE  # Laser z position
        # laser_v = np.array([0.0,0.0])
        # laser_v[0] = self.laser_vel[0]/X_RANGE  # Laser x velocity
        # laser_v[1] = -self.laser_vel[1]/Z_RANGE  # Laser z velocity

        return laser_p

    def reset_laser_img(self):
        self.get_laser_state()

        # Capture new frames
        self.cap.grab() # Throw previous frame in buffer
        ret, frame = self.cap.read()
        self.cap.grab() # Throw previous frame in buffer
        ret, frame = self.cap.read()
        self.cap.grab() # Throw previous frame in buffer
        ret, frame = self.cap.read()
        self.cap.grab() # Throw previous frame in buffer
        ret, frame = self.cap.read()
        if(not ret):
            print("Warning: No image stream from webcam")
            return
        self.im_with_keypoints = frame
        if(self.recordVid):
            self.im_with_keypoints = cv2.imread("results/tips/laser/" + "CO" + "_draw.png")
        
        return

    def img_compare(self, char):
        # import cv2
        # import numpy as np
        # char = "O"
        # comp_img = cv2.imread("results/tips/laser/" + char + "_draw.png")
        # comp_img = cv2.cvtColor(comp_img, cv2.COLOR_BGR2GRAY)
        ref_img = cv2.imread("results/tips/laser/" + char + "_ref.png")
        ref_img = cv2.cvtColor(ref_img, cv2.COLOR_BGR2GRAY)
        # null_img1 = np.zeros(ref_img.shape)
        # null_img2 = np.zeros(ref_img.shape)

        # Segment current image
        RED_FILTER_low = np.array([0, 0, 0])
        RED_FILTER_high = np.array([255, 255, 254])
        comp_img = cv2.inRange(self.im_with_keypoints[21:428, 92:510, :], RED_FILTER_low, RED_FILTER_high)

        # Get contours
        ref_contours, _ = cv2.findContours(cv2.bitwise_not(ref_img), cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)
        comp_contours, _ = cv2.findContours(cv2.bitwise_not(comp_img), cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)

        # Debug: draw contours
        # ref_cnt = ref_contours[1]
        # ref_img_cont = cv2.drawContours(null_img1, [ref_cnt], 0, (255,255,255), 1)
        # comp_cnt = comp_contours[0]
        # comp_img_cont = cv2.drawContours(null_img2, [comp_cnt], 0, (255,255,255), 1)

        # Debug: draw contour points
        # ref_points = np.squeeze(ref_contours[0])
        # comp_points = np.squeeze(comp_contours[0])
        # for point in ref_points:
        #     ref_img_cont = cv2.circle(null_img1,tuple(point),1,(255,255,255))

        # for point in comp_points:
        #     comp_img_cont = cv2.circle(null_img2,tuple(point),1,(255,255,255))


        # cv2.imshow(".", ref_img_cont)
        # cv2.waitKey(1)
        # cv2.imshow("..", comp_img_cont)
        # cv2.waitKey(1)

        # Compare haussdorf distance
        # hd = cv2.createHausdorffDistanceExtractor(cv2.NORM_L2, 1) # 1 for full proportion of points
        # dist = hd.computeDistance(ref_contours[0],comp_contours[0])
        # import pdb; pdb.set_trace()
        from scipy.spatial.distance import directed_hausdorff
        dist = directed_hausdorff( np.squeeze(ref_contours[0]),np.squeeze(comp_contours[0]) )[0]

        reward = -dist

        return reward