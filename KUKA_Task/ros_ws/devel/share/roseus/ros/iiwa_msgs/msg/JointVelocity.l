;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::JointVelocity)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'JointVelocity (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::JOINTVELOCITY")
  (make-package "IIWA_MSGS::JOINTVELOCITY"))

(in-package "ROS")
;;//! \htmlinclude JointVelocity.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass iiwa_msgs::JointVelocity
  :super ros::object
  :slots (_header _velocity ))

(defmethod iiwa_msgs::JointVelocity
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:velocity __velocity) (instance iiwa_msgs::JointQuantity :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _velocity __velocity)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; iiwa_msgs/JointQuantity _velocity
    (send _velocity :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; iiwa_msgs/JointQuantity _velocity
       (send _velocity :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; iiwa_msgs/JointQuantity _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;;
   self)
  )

(setf (get iiwa_msgs::JointVelocity :md5sum-) "efbc089b284716f4747aa2e483b101e1")
(setf (get iiwa_msgs::JointVelocity :datatype-) "iiwa_msgs/JointVelocity")
(setf (get iiwa_msgs::JointVelocity :definition-)
      "Header header
JointQuantity velocity
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



(provide :iiwa_msgs/JointVelocity "efbc089b284716f4747aa2e483b101e1")


