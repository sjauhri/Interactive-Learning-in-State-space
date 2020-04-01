;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::SetPTPCartesianSpeedLimits)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'SetPTPCartesianSpeedLimits (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::SETPTPCARTESIANSPEEDLIMITS")
  (make-package "IIWA_MSGS::SETPTPCARTESIANSPEEDLIMITS"))
(unless (find-package "IIWA_MSGS::SETPTPCARTESIANSPEEDLIMITSREQUEST")
  (make-package "IIWA_MSGS::SETPTPCARTESIANSPEEDLIMITSREQUEST"))
(unless (find-package "IIWA_MSGS::SETPTPCARTESIANSPEEDLIMITSRESPONSE")
  (make-package "IIWA_MSGS::SETPTPCARTESIANSPEEDLIMITSRESPONSE"))

(in-package "ROS")





(defclass iiwa_msgs::SetPTPCartesianSpeedLimitsRequest
  :super ros::object
  :slots (_maxCartesianVelocity _maxOrientationVelocity _maxCartesianAcceleration _maxOrientationAcceleration _maxCartesianJerk _maxOrientationJerk ))

(defmethod iiwa_msgs::SetPTPCartesianSpeedLimitsRequest
  (:init
   (&key
    ((:maxCartesianVelocity __maxCartesianVelocity) 0.0)
    ((:maxOrientationVelocity __maxOrientationVelocity) 0.0)
    ((:maxCartesianAcceleration __maxCartesianAcceleration) 0.0)
    ((:maxOrientationAcceleration __maxOrientationAcceleration) 0.0)
    ((:maxCartesianJerk __maxCartesianJerk) 0.0)
    ((:maxOrientationJerk __maxOrientationJerk) 0.0)
    )
   (send-super :init)
   (setq _maxCartesianVelocity (float __maxCartesianVelocity))
   (setq _maxOrientationVelocity (float __maxOrientationVelocity))
   (setq _maxCartesianAcceleration (float __maxCartesianAcceleration))
   (setq _maxOrientationAcceleration (float __maxOrientationAcceleration))
   (setq _maxCartesianJerk (float __maxCartesianJerk))
   (setq _maxOrientationJerk (float __maxOrientationJerk))
   self)
  (:maxCartesianVelocity
   (&optional __maxCartesianVelocity)
   (if __maxCartesianVelocity (setq _maxCartesianVelocity __maxCartesianVelocity)) _maxCartesianVelocity)
  (:maxOrientationVelocity
   (&optional __maxOrientationVelocity)
   (if __maxOrientationVelocity (setq _maxOrientationVelocity __maxOrientationVelocity)) _maxOrientationVelocity)
  (:maxCartesianAcceleration
   (&optional __maxCartesianAcceleration)
   (if __maxCartesianAcceleration (setq _maxCartesianAcceleration __maxCartesianAcceleration)) _maxCartesianAcceleration)
  (:maxOrientationAcceleration
   (&optional __maxOrientationAcceleration)
   (if __maxOrientationAcceleration (setq _maxOrientationAcceleration __maxOrientationAcceleration)) _maxOrientationAcceleration)
  (:maxCartesianJerk
   (&optional __maxCartesianJerk)
   (if __maxCartesianJerk (setq _maxCartesianJerk __maxCartesianJerk)) _maxCartesianJerk)
  (:maxOrientationJerk
   (&optional __maxOrientationJerk)
   (if __maxOrientationJerk (setq _maxOrientationJerk __maxOrientationJerk)) _maxOrientationJerk)
  (:serialization-length
   ()
   (+
    ;; float64 _maxCartesianVelocity
    8
    ;; float64 _maxOrientationVelocity
    8
    ;; float64 _maxCartesianAcceleration
    8
    ;; float64 _maxOrientationAcceleration
    8
    ;; float64 _maxCartesianJerk
    8
    ;; float64 _maxOrientationJerk
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _maxCartesianVelocity
       (sys::poke _maxCartesianVelocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _maxOrientationVelocity
       (sys::poke _maxOrientationVelocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _maxCartesianAcceleration
       (sys::poke _maxCartesianAcceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _maxOrientationAcceleration
       (sys::poke _maxOrientationAcceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _maxCartesianJerk
       (sys::poke _maxCartesianJerk (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _maxOrientationJerk
       (sys::poke _maxOrientationJerk (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _maxCartesianVelocity
     (setq _maxCartesianVelocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _maxOrientationVelocity
     (setq _maxOrientationVelocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _maxCartesianAcceleration
     (setq _maxCartesianAcceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _maxOrientationAcceleration
     (setq _maxOrientationAcceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _maxCartesianJerk
     (setq _maxCartesianJerk (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _maxOrientationJerk
     (setq _maxOrientationJerk (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass iiwa_msgs::SetPTPCartesianSpeedLimitsResponse
  :super ros::object
  :slots (_success _error ))

(defmethod iiwa_msgs::SetPTPCartesianSpeedLimitsResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:error __error) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _error (string __error))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _error
    4 (length _error)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _error
       (write-long (length _error) s) (princ _error s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _error
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _error (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass iiwa_msgs::SetPTPCartesianSpeedLimits
  :super ros::object
  :slots ())

(setf (get iiwa_msgs::SetPTPCartesianSpeedLimits :md5sum-) "f4c42c9db5a373c4820a5b6872a3a795")
(setf (get iiwa_msgs::SetPTPCartesianSpeedLimits :datatype-) "iiwa_msgs/SetPTPCartesianSpeedLimits")
(setf (get iiwa_msgs::SetPTPCartesianSpeedLimits :request) iiwa_msgs::SetPTPCartesianSpeedLimitsRequest)
(setf (get iiwa_msgs::SetPTPCartesianSpeedLimits :response) iiwa_msgs::SetPTPCartesianSpeedLimitsResponse)

(defmethod iiwa_msgs::SetPTPCartesianSpeedLimitsRequest
  (:response () (instance iiwa_msgs::SetPTPCartesianSpeedLimitsResponse :init)))

(setf (get iiwa_msgs::SetPTPCartesianSpeedLimitsRequest :md5sum-) "f4c42c9db5a373c4820a5b6872a3a795")
(setf (get iiwa_msgs::SetPTPCartesianSpeedLimitsRequest :datatype-) "iiwa_msgs/SetPTPCartesianSpeedLimitsRequest")
(setf (get iiwa_msgs::SetPTPCartesianSpeedLimitsRequest :definition-)
      "



float64 maxCartesianVelocity


float64 maxOrientationVelocity


float64 maxCartesianAcceleration


float64 maxOrientationAcceleration


float64 maxCartesianJerk


float64 maxOrientationJerk

---
bool success
string error

")

(setf (get iiwa_msgs::SetPTPCartesianSpeedLimitsResponse :md5sum-) "f4c42c9db5a373c4820a5b6872a3a795")
(setf (get iiwa_msgs::SetPTPCartesianSpeedLimitsResponse :datatype-) "iiwa_msgs/SetPTPCartesianSpeedLimitsResponse")
(setf (get iiwa_msgs::SetPTPCartesianSpeedLimitsResponse :definition-)
      "



float64 maxCartesianVelocity


float64 maxOrientationVelocity


float64 maxCartesianAcceleration


float64 maxOrientationAcceleration


float64 maxCartesianJerk


float64 maxOrientationJerk

---
bool success
string error

")



(provide :iiwa_msgs/SetPTPCartesianSpeedLimits "f4c42c9db5a373c4820a5b6872a3a795")


