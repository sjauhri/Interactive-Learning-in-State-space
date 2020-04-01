;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::CartesianControlModeLimits)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'CartesianControlModeLimits (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::CARTESIANCONTROLMODELIMITS")
  (make-package "IIWA_MSGS::CARTESIANCONTROLMODELIMITS"))

(in-package "ROS")
;;//! \htmlinclude CartesianControlModeLimits.msg.html


(defclass iiwa_msgs::CartesianControlModeLimits
  :super ros::object
  :slots (_max_path_deviation _max_control_force _max_control_force_stop _max_cartesian_velocity ))

(defmethod iiwa_msgs::CartesianControlModeLimits
  (:init
   (&key
    ((:max_path_deviation __max_path_deviation) (instance iiwa_msgs::CartesianQuantity :init))
    ((:max_control_force __max_control_force) (instance iiwa_msgs::CartesianQuantity :init))
    ((:max_control_force_stop __max_control_force_stop) nil)
    ((:max_cartesian_velocity __max_cartesian_velocity) (instance iiwa_msgs::CartesianQuantity :init))
    )
   (send-super :init)
   (setq _max_path_deviation __max_path_deviation)
   (setq _max_control_force __max_control_force)
   (setq _max_control_force_stop __max_control_force_stop)
   (setq _max_cartesian_velocity __max_cartesian_velocity)
   self)
  (:max_path_deviation
   (&rest __max_path_deviation)
   (if (keywordp (car __max_path_deviation))
       (send* _max_path_deviation __max_path_deviation)
     (progn
       (if __max_path_deviation (setq _max_path_deviation (car __max_path_deviation)))
       _max_path_deviation)))
  (:max_control_force
   (&rest __max_control_force)
   (if (keywordp (car __max_control_force))
       (send* _max_control_force __max_control_force)
     (progn
       (if __max_control_force (setq _max_control_force (car __max_control_force)))
       _max_control_force)))
  (:max_control_force_stop
   (&optional __max_control_force_stop)
   (if __max_control_force_stop (setq _max_control_force_stop __max_control_force_stop)) _max_control_force_stop)
  (:max_cartesian_velocity
   (&rest __max_cartesian_velocity)
   (if (keywordp (car __max_cartesian_velocity))
       (send* _max_cartesian_velocity __max_cartesian_velocity)
     (progn
       (if __max_cartesian_velocity (setq _max_cartesian_velocity (car __max_cartesian_velocity)))
       _max_cartesian_velocity)))
  (:serialization-length
   ()
   (+
    ;; iiwa_msgs/CartesianQuantity _max_path_deviation
    (send _max_path_deviation :serialization-length)
    ;; iiwa_msgs/CartesianQuantity _max_control_force
    (send _max_control_force :serialization-length)
    ;; bool _max_control_force_stop
    1
    ;; iiwa_msgs/CartesianQuantity _max_cartesian_velocity
    (send _max_cartesian_velocity :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; iiwa_msgs/CartesianQuantity _max_path_deviation
       (send _max_path_deviation :serialize s)
     ;; iiwa_msgs/CartesianQuantity _max_control_force
       (send _max_control_force :serialize s)
     ;; bool _max_control_force_stop
       (if _max_control_force_stop (write-byte -1 s) (write-byte 0 s))
     ;; iiwa_msgs/CartesianQuantity _max_cartesian_velocity
       (send _max_cartesian_velocity :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; iiwa_msgs/CartesianQuantity _max_path_deviation
     (send _max_path_deviation :deserialize buf ptr-) (incf ptr- (send _max_path_deviation :serialization-length))
   ;; iiwa_msgs/CartesianQuantity _max_control_force
     (send _max_control_force :deserialize buf ptr-) (incf ptr- (send _max_control_force :serialization-length))
   ;; bool _max_control_force_stop
     (setq _max_control_force_stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; iiwa_msgs/CartesianQuantity _max_cartesian_velocity
     (send _max_cartesian_velocity :deserialize buf ptr-) (incf ptr- (send _max_cartesian_velocity :serialization-length))
   ;;
   self)
  )

(setf (get iiwa_msgs::CartesianControlModeLimits :md5sum-) "36b3a99aeab262cf60ecef9129ccb529")
(setf (get iiwa_msgs::CartesianControlModeLimits :datatype-) "iiwa_msgs/CartesianControlModeLimits")
(setf (get iiwa_msgs::CartesianControlModeLimits :definition-)
      "# Sets the maximum cartesian deviation accepted. If the deviation is exceeded a stop condition occurs. 
# [x, y, z] in [mm]. Precondition: value > 0.0.
# [a, b, c] in [rad]. Precondition: value > 0.0.
CartesianQuantity max_path_deviation

# The maximum control force parameter.
# [x, y, z] in [N]. Precondition: value > 0.0.
# [a, b, c] in [Nm]. Precondition: value > 0.0.
CartesianQuantity max_control_force

# Indicates whether a stop condition is fired if the maximum control force is exceeded. 
bool max_control_force_stop

# Maximum Cartesian velocity parameter 
# [x, y, z] in [mm/s]. Precondition: value > 0.0.
# [a, b, c] in [rad/s]. Precondition: value > 0.0.
CartesianQuantity max_cartesian_velocity 

================================================================================
MSG: iiwa_msgs/CartesianQuantity
float32 x
float32 y
float32 z
float32 a
float32 b
float32 c
")



(provide :iiwa_msgs/CartesianControlModeLimits "36b3a99aeab262cf60ecef9129ccb529")


