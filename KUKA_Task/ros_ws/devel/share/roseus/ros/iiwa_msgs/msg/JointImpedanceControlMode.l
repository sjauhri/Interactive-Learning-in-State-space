;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::JointImpedanceControlMode)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'JointImpedanceControlMode (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::JOINTIMPEDANCECONTROLMODE")
  (make-package "IIWA_MSGS::JOINTIMPEDANCECONTROLMODE"))

(in-package "ROS")
;;//! \htmlinclude JointImpedanceControlMode.msg.html


(defclass iiwa_msgs::JointImpedanceControlMode
  :super ros::object
  :slots (_joint_stiffness _joint_damping ))

(defmethod iiwa_msgs::JointImpedanceControlMode
  (:init
   (&key
    ((:joint_stiffness __joint_stiffness) (instance iiwa_msgs::JointQuantity :init))
    ((:joint_damping __joint_damping) (instance iiwa_msgs::JointQuantity :init))
    )
   (send-super :init)
   (setq _joint_stiffness __joint_stiffness)
   (setq _joint_damping __joint_damping)
   self)
  (:joint_stiffness
   (&rest __joint_stiffness)
   (if (keywordp (car __joint_stiffness))
       (send* _joint_stiffness __joint_stiffness)
     (progn
       (if __joint_stiffness (setq _joint_stiffness (car __joint_stiffness)))
       _joint_stiffness)))
  (:joint_damping
   (&rest __joint_damping)
   (if (keywordp (car __joint_damping))
       (send* _joint_damping __joint_damping)
     (progn
       (if __joint_damping (setq _joint_damping (car __joint_damping)))
       _joint_damping)))
  (:serialization-length
   ()
   (+
    ;; iiwa_msgs/JointQuantity _joint_stiffness
    (send _joint_stiffness :serialization-length)
    ;; iiwa_msgs/JointQuantity _joint_damping
    (send _joint_damping :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; iiwa_msgs/JointQuantity _joint_stiffness
       (send _joint_stiffness :serialize s)
     ;; iiwa_msgs/JointQuantity _joint_damping
       (send _joint_damping :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; iiwa_msgs/JointQuantity _joint_stiffness
     (send _joint_stiffness :deserialize buf ptr-) (incf ptr- (send _joint_stiffness :serialization-length))
   ;; iiwa_msgs/JointQuantity _joint_damping
     (send _joint_damping :deserialize buf ptr-) (incf ptr- (send _joint_damping :serialization-length))
   ;;
   self)
  )

(setf (get iiwa_msgs::JointImpedanceControlMode :md5sum-) "c2267019473eba8c0a4619b649192c0d")
(setf (get iiwa_msgs::JointImpedanceControlMode :datatype-) "iiwa_msgs/JointImpedanceControlMode")
(setf (get iiwa_msgs::JointImpedanceControlMode :definition-)
      "# Stiffness values in [Nm/rad]. Stiffness values must be >= 0. 
JointQuantity joint_stiffness

# Damping values. Damping values must be between 0 and 1. 
JointQuantity joint_damping

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



(provide :iiwa_msgs/JointImpedanceControlMode "c2267019473eba8c0a4619b649192c0d")


