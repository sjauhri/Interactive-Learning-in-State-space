;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::SetPTPJointSpeedLimits)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'SetPTPJointSpeedLimits (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::SETPTPJOINTSPEEDLIMITS")
  (make-package "IIWA_MSGS::SETPTPJOINTSPEEDLIMITS"))
(unless (find-package "IIWA_MSGS::SETPTPJOINTSPEEDLIMITSREQUEST")
  (make-package "IIWA_MSGS::SETPTPJOINTSPEEDLIMITSREQUEST"))
(unless (find-package "IIWA_MSGS::SETPTPJOINTSPEEDLIMITSRESPONSE")
  (make-package "IIWA_MSGS::SETPTPJOINTSPEEDLIMITSRESPONSE"))

(in-package "ROS")





(defclass iiwa_msgs::SetPTPJointSpeedLimitsRequest
  :super ros::object
  :slots (_joint_relative_velocity _joint_relative_acceleration ))

(defmethod iiwa_msgs::SetPTPJointSpeedLimitsRequest
  (:init
   (&key
    ((:joint_relative_velocity __joint_relative_velocity) 0.0)
    ((:joint_relative_acceleration __joint_relative_acceleration) 0.0)
    )
   (send-super :init)
   (setq _joint_relative_velocity (float __joint_relative_velocity))
   (setq _joint_relative_acceleration (float __joint_relative_acceleration))
   self)
  (:joint_relative_velocity
   (&optional __joint_relative_velocity)
   (if __joint_relative_velocity (setq _joint_relative_velocity __joint_relative_velocity)) _joint_relative_velocity)
  (:joint_relative_acceleration
   (&optional __joint_relative_acceleration)
   (if __joint_relative_acceleration (setq _joint_relative_acceleration __joint_relative_acceleration)) _joint_relative_acceleration)
  (:serialization-length
   ()
   (+
    ;; float64 _joint_relative_velocity
    8
    ;; float64 _joint_relative_acceleration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _joint_relative_velocity
       (sys::poke _joint_relative_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_relative_acceleration
       (sys::poke _joint_relative_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _joint_relative_velocity
     (setq _joint_relative_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_relative_acceleration
     (setq _joint_relative_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass iiwa_msgs::SetPTPJointSpeedLimitsResponse
  :super ros::object
  :slots (_success _error ))

(defmethod iiwa_msgs::SetPTPJointSpeedLimitsResponse
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

(defclass iiwa_msgs::SetPTPJointSpeedLimits
  :super ros::object
  :slots ())

(setf (get iiwa_msgs::SetPTPJointSpeedLimits :md5sum-) "e5ffdd082606e43192e0949ab1d5a1f3")
(setf (get iiwa_msgs::SetPTPJointSpeedLimits :datatype-) "iiwa_msgs/SetPTPJointSpeedLimits")
(setf (get iiwa_msgs::SetPTPJointSpeedLimits :request) iiwa_msgs::SetPTPJointSpeedLimitsRequest)
(setf (get iiwa_msgs::SetPTPJointSpeedLimits :response) iiwa_msgs::SetPTPJointSpeedLimitsResponse)

(defmethod iiwa_msgs::SetPTPJointSpeedLimitsRequest
  (:response () (instance iiwa_msgs::SetPTPJointSpeedLimitsResponse :init)))

(setf (get iiwa_msgs::SetPTPJointSpeedLimitsRequest :md5sum-) "e5ffdd082606e43192e0949ab1d5a1f3")
(setf (get iiwa_msgs::SetPTPJointSpeedLimitsRequest :datatype-) "iiwa_msgs/SetPTPJointSpeedLimitsRequest")
(setf (get iiwa_msgs::SetPTPJointSpeedLimitsRequest :definition-)
      "



float64 joint_relative_velocity


float64 joint_relative_acceleration

---

bool success
string error

")

(setf (get iiwa_msgs::SetPTPJointSpeedLimitsResponse :md5sum-) "e5ffdd082606e43192e0949ab1d5a1f3")
(setf (get iiwa_msgs::SetPTPJointSpeedLimitsResponse :datatype-) "iiwa_msgs/SetPTPJointSpeedLimitsResponse")
(setf (get iiwa_msgs::SetPTPJointSpeedLimitsResponse :definition-)
      "



float64 joint_relative_velocity


float64 joint_relative_acceleration

---

bool success
string error

")



(provide :iiwa_msgs/SetPTPJointSpeedLimits "e5ffdd082606e43192e0949ab1d5a1f3")


