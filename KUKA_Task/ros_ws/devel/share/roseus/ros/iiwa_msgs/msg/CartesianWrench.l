;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::CartesianWrench)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'CartesianWrench (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::CARTESIANWRENCH")
  (make-package "IIWA_MSGS::CARTESIANWRENCH"))

(in-package "ROS")
;;//! \htmlinclude CartesianWrench.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass iiwa_msgs::CartesianWrench
  :super ros::object
  :slots (_header _wrench _inaccuracy ))

(defmethod iiwa_msgs::CartesianWrench
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:wrench __wrench) (instance geometry_msgs::Wrench :init))
    ((:inaccuracy __inaccuracy) (instance geometry_msgs::Wrench :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _wrench __wrench)
   (setq _inaccuracy __inaccuracy)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:wrench
   (&rest __wrench)
   (if (keywordp (car __wrench))
       (send* _wrench __wrench)
     (progn
       (if __wrench (setq _wrench (car __wrench)))
       _wrench)))
  (:inaccuracy
   (&rest __inaccuracy)
   (if (keywordp (car __inaccuracy))
       (send* _inaccuracy __inaccuracy)
     (progn
       (if __inaccuracy (setq _inaccuracy (car __inaccuracy)))
       _inaccuracy)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Wrench _wrench
    (send _wrench :serialization-length)
    ;; geometry_msgs/Wrench _inaccuracy
    (send _inaccuracy :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Wrench _wrench
       (send _wrench :serialize s)
     ;; geometry_msgs/Wrench _inaccuracy
       (send _inaccuracy :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Wrench _wrench
     (send _wrench :deserialize buf ptr-) (incf ptr- (send _wrench :serialization-length))
   ;; geometry_msgs/Wrench _inaccuracy
     (send _inaccuracy :deserialize buf ptr-) (incf ptr- (send _inaccuracy :serialization-length))
   ;;
   self)
  )

(setf (get iiwa_msgs::CartesianWrench :md5sum-) "b710d3269f35c0e4079ef3ef88f25c6c")
(setf (get iiwa_msgs::CartesianWrench :datatype-) "iiwa_msgs/CartesianWrench")
(setf (get iiwa_msgs::CartesianWrench :definition-)
      "# Cartesian Wrench
Header header
geometry_msgs/Wrench wrench
geometry_msgs/Wrench inaccuracy

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
MSG: geometry_msgs/Wrench
# This represents force in free space, separated into
# its linear and angular parts.
Vector3  force
Vector3  torque

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :iiwa_msgs/CartesianWrench "b710d3269f35c0e4079ef3ef88f25c6c")


