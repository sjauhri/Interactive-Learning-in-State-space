;; Auto-generated. Do not edit!


(when (boundp 'rosbot_ekf::Imu)
  (if (not (find-package "ROSBOT_EKF"))
    (make-package "ROSBOT_EKF"))
  (shadow 'Imu (find-package "ROSBOT_EKF")))
(unless (find-package "ROSBOT_EKF::IMU")
  (make-package "ROSBOT_EKF::IMU"))

(in-package "ROS")
;;//! \htmlinclude Imu.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass rosbot_ekf::Imu
  :super ros::object
  :slots (_header _orientation _angular_velocity _linear_acceleration ))

(defmethod rosbot_ekf::Imu
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:orientation __orientation) (instance geometry_msgs::Quaternion :init))
    ((:angular_velocity __angular_velocity) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:linear_acceleration __linear_acceleration) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _orientation __orientation)
   (setq _angular_velocity __angular_velocity)
   (setq _linear_acceleration __linear_acceleration)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:angular_velocity
   (&optional __angular_velocity)
   (if __angular_velocity (setq _angular_velocity __angular_velocity)) _angular_velocity)
  (:linear_acceleration
   (&optional __linear_acceleration)
   (if __linear_acceleration (setq _linear_acceleration __linear_acceleration)) _linear_acceleration)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Quaternion _orientation
    (send _orientation :serialization-length)
    ;; float32[3] _angular_velocity
    (* 4    3)
    ;; float32[3] _linear_acceleration
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Quaternion _orientation
       (send _orientation :serialize s)
     ;; float32[3] _angular_velocity
     (dotimes (i 3)
       (sys::poke (elt _angular_velocity i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _linear_acceleration
     (dotimes (i 3)
       (sys::poke (elt _linear_acceleration i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;; float32[3] _angular_velocity
   (dotimes (i (length _angular_velocity))
     (setf (elt _angular_velocity i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _linear_acceleration
   (dotimes (i (length _linear_acceleration))
     (setf (elt _linear_acceleration i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get rosbot_ekf::Imu :md5sum-) "3d83bdcabfe2927ed38c36f102a9f646")
(setf (get rosbot_ekf::Imu :datatype-) "rosbot_ekf/Imu")
(setf (get rosbot_ekf::Imu :definition-)
      "Header header

geometry_msgs/Quaternion orientation

float32[3] angular_velocity         # [gx, gy, gz] in DPS (degrees per second)

float32[3] linear_acceleration      # [ax, ay, az] in g's (gravitational acceleration)


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :rosbot_ekf/Imu "3d83bdcabfe2927ed38c36f102a9f646")


