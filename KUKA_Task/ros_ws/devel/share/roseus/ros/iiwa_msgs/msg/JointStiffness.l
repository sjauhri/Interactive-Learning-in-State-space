;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::JointStiffness)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'JointStiffness (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::JOINTSTIFFNESS")
  (make-package "IIWA_MSGS::JOINTSTIFFNESS"))

(in-package "ROS")
;;//! \htmlinclude JointStiffness.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass iiwa_msgs::JointStiffness
  :super ros::object
  :slots (_header _stiffness ))

(defmethod iiwa_msgs::JointStiffness
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:stiffness __stiffness) (instance iiwa_msgs::JointQuantity :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _stiffness __stiffness)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:stiffness
   (&rest __stiffness)
   (if (keywordp (car __stiffness))
       (send* _stiffness __stiffness)
     (progn
       (if __stiffness (setq _stiffness (car __stiffness)))
       _stiffness)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; iiwa_msgs/JointQuantity _stiffness
    (send _stiffness :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; iiwa_msgs/JointQuantity _stiffness
       (send _stiffness :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; iiwa_msgs/JointQuantity _stiffness
     (send _stiffness :deserialize buf ptr-) (incf ptr- (send _stiffness :serialization-length))
   ;;
   self)
  )

(setf (get iiwa_msgs::JointStiffness :md5sum-) "36eb539f80d8414d77a80b821ac39758")
(setf (get iiwa_msgs::JointStiffness :datatype-) "iiwa_msgs/JointStiffness")
(setf (get iiwa_msgs::JointStiffness :definition-)
      "Header header
JointQuantity stiffness
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



(provide :iiwa_msgs/JointStiffness "36eb539f80d8414d77a80b821ac39758")


