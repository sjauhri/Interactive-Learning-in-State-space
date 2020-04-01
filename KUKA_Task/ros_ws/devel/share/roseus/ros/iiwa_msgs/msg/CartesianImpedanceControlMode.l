;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::CartesianImpedanceControlMode)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'CartesianImpedanceControlMode (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::CARTESIANIMPEDANCECONTROLMODE")
  (make-package "IIWA_MSGS::CARTESIANIMPEDANCECONTROLMODE"))

(in-package "ROS")
;;//! \htmlinclude CartesianImpedanceControlMode.msg.html


(defclass iiwa_msgs::CartesianImpedanceControlMode
  :super ros::object
  :slots (_cartesian_stiffness _cartesian_damping _nullspace_stiffness _nullspace_damping ))

(defmethod iiwa_msgs::CartesianImpedanceControlMode
  (:init
   (&key
    ((:cartesian_stiffness __cartesian_stiffness) (instance iiwa_msgs::CartesianQuantity :init))
    ((:cartesian_damping __cartesian_damping) (instance iiwa_msgs::CartesianQuantity :init))
    ((:nullspace_stiffness __nullspace_stiffness) 0.0)
    ((:nullspace_damping __nullspace_damping) 0.0)
    )
   (send-super :init)
   (setq _cartesian_stiffness __cartesian_stiffness)
   (setq _cartesian_damping __cartesian_damping)
   (setq _nullspace_stiffness (float __nullspace_stiffness))
   (setq _nullspace_damping (float __nullspace_damping))
   self)
  (:cartesian_stiffness
   (&rest __cartesian_stiffness)
   (if (keywordp (car __cartesian_stiffness))
       (send* _cartesian_stiffness __cartesian_stiffness)
     (progn
       (if __cartesian_stiffness (setq _cartesian_stiffness (car __cartesian_stiffness)))
       _cartesian_stiffness)))
  (:cartesian_damping
   (&rest __cartesian_damping)
   (if (keywordp (car __cartesian_damping))
       (send* _cartesian_damping __cartesian_damping)
     (progn
       (if __cartesian_damping (setq _cartesian_damping (car __cartesian_damping)))
       _cartesian_damping)))
  (:nullspace_stiffness
   (&optional __nullspace_stiffness)
   (if __nullspace_stiffness (setq _nullspace_stiffness __nullspace_stiffness)) _nullspace_stiffness)
  (:nullspace_damping
   (&optional __nullspace_damping)
   (if __nullspace_damping (setq _nullspace_damping __nullspace_damping)) _nullspace_damping)
  (:serialization-length
   ()
   (+
    ;; iiwa_msgs/CartesianQuantity _cartesian_stiffness
    (send _cartesian_stiffness :serialization-length)
    ;; iiwa_msgs/CartesianQuantity _cartesian_damping
    (send _cartesian_damping :serialization-length)
    ;; float64 _nullspace_stiffness
    8
    ;; float64 _nullspace_damping
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; iiwa_msgs/CartesianQuantity _cartesian_stiffness
       (send _cartesian_stiffness :serialize s)
     ;; iiwa_msgs/CartesianQuantity _cartesian_damping
       (send _cartesian_damping :serialize s)
     ;; float64 _nullspace_stiffness
       (sys::poke _nullspace_stiffness (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _nullspace_damping
       (sys::poke _nullspace_damping (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; iiwa_msgs/CartesianQuantity _cartesian_stiffness
     (send _cartesian_stiffness :deserialize buf ptr-) (incf ptr- (send _cartesian_stiffness :serialization-length))
   ;; iiwa_msgs/CartesianQuantity _cartesian_damping
     (send _cartesian_damping :deserialize buf ptr-) (incf ptr- (send _cartesian_damping :serialization-length))
   ;; float64 _nullspace_stiffness
     (setq _nullspace_stiffness (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _nullspace_damping
     (setq _nullspace_damping (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get iiwa_msgs::CartesianImpedanceControlMode :md5sum-) "7c03442e16efac806b59fb2795f102eb")
(setf (get iiwa_msgs::CartesianImpedanceControlMode :datatype-) "iiwa_msgs/CartesianImpedanceControlMode")
(setf (get iiwa_msgs::CartesianImpedanceControlMode :definition-)
      "
# Stiffness values [x, y, z, a, b, c] for the cartesian impedance, x, y, z in [N/m], a, b, c in [Nm/rad]. 
# Precondition: 0.0 <= x, y, z <= 5000.0 and 0.0 <= a, b, c <= 300.0. 
CartesianQuantity cartesian_stiffness

# Dimensionless damping values for the cartesian impedance control, for all degrees of freedom : [x, y, z, a, b, c].
# Precondition: 0.1 <= x, y, z, a, b, c <= 1.0. 
CartesianQuantity cartesian_damping

# The stiffness value for null space [Nm/rad]. 
# Precondition: 0.0 <= value. 
float64 nullspace_stiffness

# The damping parameter for null space [Nm*s/rad]. 
# Precondition: value >= 0.3 and value <= 1.0. - A good damping value is 0.7. 
float64 nullspace_damping
================================================================================
MSG: iiwa_msgs/CartesianQuantity
float32 x
float32 y
float32 z
float32 a
float32 b
float32 c
")



(provide :iiwa_msgs/CartesianImpedanceControlMode "7c03442e16efac806b59fb2795f102eb")


