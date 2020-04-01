;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::CartesianEulerPose)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'CartesianEulerPose (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::CARTESIANEULERPOSE")
  (make-package "IIWA_MSGS::CARTESIANEULERPOSE"))

(in-package "ROS")
;;//! \htmlinclude CartesianEulerPose.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass iiwa_msgs::CartesianEulerPose
  :super ros::object
  :slots (_header _pose ))

(defmethod iiwa_msgs::CartesianEulerPose
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance iiwa_msgs::CartesianQuantity :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; iiwa_msgs/CartesianQuantity _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; iiwa_msgs/CartesianQuantity _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; iiwa_msgs/CartesianQuantity _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(setf (get iiwa_msgs::CartesianEulerPose :md5sum-) "007ae8f5dcbe93f7ab42a1d24885796d")
(setf (get iiwa_msgs::CartesianEulerPose :datatype-) "iiwa_msgs/CartesianEulerPose")
(setf (get iiwa_msgs::CartesianEulerPose :definition-)
      "Header header
CartesianQuantity pose
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
MSG: iiwa_msgs/CartesianQuantity
float32 x
float32 y
float32 z
float32 a
float32 b
float32 c
")



(provide :iiwa_msgs/CartesianEulerPose "007ae8f5dcbe93f7ab42a1d24885796d")


