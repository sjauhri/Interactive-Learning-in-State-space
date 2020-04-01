;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::JointDamping)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'JointDamping (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::JOINTDAMPING")
  (make-package "IIWA_MSGS::JOINTDAMPING"))

(in-package "ROS")
;;//! \htmlinclude JointDamping.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass iiwa_msgs::JointDamping
  :super ros::object
  :slots (_header _damping ))

(defmethod iiwa_msgs::JointDamping
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:damping __damping) (instance iiwa_msgs::JointQuantity :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _damping __damping)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:damping
   (&rest __damping)
   (if (keywordp (car __damping))
       (send* _damping __damping)
     (progn
       (if __damping (setq _damping (car __damping)))
       _damping)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; iiwa_msgs/JointQuantity _damping
    (send _damping :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; iiwa_msgs/JointQuantity _damping
       (send _damping :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; iiwa_msgs/JointQuantity _damping
     (send _damping :deserialize buf ptr-) (incf ptr- (send _damping :serialization-length))
   ;;
   self)
  )

(setf (get iiwa_msgs::JointDamping :md5sum-) "92566eca940b47ec439bd2e3591ff78a")
(setf (get iiwa_msgs::JointDamping :datatype-) "iiwa_msgs/JointDamping")
(setf (get iiwa_msgs::JointDamping :definition-)
      "Header header
JointQuantity damping
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
MSG: iiwa_msgs/JointQuantity
float32 a1
float32 a2
float32 a3
float32 a4
float32 a5
float32 a6
float32 a7
")



(provide :iiwa_msgs/JointDamping "92566eca940b47ec439bd2e3591ff78a")


