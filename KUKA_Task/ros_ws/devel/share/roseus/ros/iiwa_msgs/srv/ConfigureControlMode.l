;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::ConfigureControlMode)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'ConfigureControlMode (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::CONFIGURECONTROLMODE")
  (make-package "IIWA_MSGS::CONFIGURECONTROLMODE"))
(unless (find-package "IIWA_MSGS::CONFIGURECONTROLMODEREQUEST")
  (make-package "IIWA_MSGS::CONFIGURECONTROLMODEREQUEST"))
(unless (find-package "IIWA_MSGS::CONFIGURECONTROLMODERESPONSE")
  (make-package "IIWA_MSGS::CONFIGURECONTROLMODERESPONSE"))

(in-package "ROS")





(defclass iiwa_msgs::ConfigureControlModeRequest
  :super ros::object
  :slots (_control_mode _joint_impedance _cartesian_impedance _desired_force _sine_pattern _limits ))

(defmethod iiwa_msgs::ConfigureControlModeRequest
  (:init
   (&key
    ((:control_mode __control_mode) 0)
    ((:joint_impedance __joint_impedance) (instance iiwa_msgs::JointImpedanceControlMode :init))
    ((:cartesian_impedance __cartesian_impedance) (instance iiwa_msgs::CartesianImpedanceControlMode :init))
    ((:desired_force __desired_force) (instance iiwa_msgs::DesiredForceControlMode :init))
    ((:sine_pattern __sine_pattern) (instance iiwa_msgs::SinePatternControlMode :init))
    ((:limits __limits) (instance iiwa_msgs::CartesianControlModeLimits :init))
    )
   (send-super :init)
   (setq _control_mode (round __control_mode))
   (setq _joint_impedance __joint_impedance)
   (setq _cartesian_impedance __cartesian_impedance)
   (setq _desired_force __desired_force)
   (setq _sine_pattern __sine_pattern)
   (setq _limits __limits)
   self)
  (:control_mode
   (&optional __control_mode)
   (if __control_mode (setq _control_mode __control_mode)) _control_mode)
  (:joint_impedance
   (&rest __joint_impedance)
   (if (keywordp (car __joint_impedance))
       (send* _joint_impedance __joint_impedance)
     (progn
       (if __joint_impedance (setq _joint_impedance (car __joint_impedance)))
       _joint_impedance)))
  (:cartesian_impedance
   (&rest __cartesian_impedance)
   (if (keywordp (car __cartesian_impedance))
       (send* _cartesian_impedance __cartesian_impedance)
     (progn
       (if __cartesian_impedance (setq _cartesian_impedance (car __cartesian_impedance)))
       _cartesian_impedance)))
  (:desired_force
   (&rest __desired_force)
   (if (keywordp (car __desired_force))
       (send* _desired_force __desired_force)
     (progn
       (if __desired_force (setq _desired_force (car __desired_force)))
       _desired_force)))
  (:sine_pattern
   (&rest __sine_pattern)
   (if (keywordp (car __sine_pattern))
       (send* _sine_pattern __sine_pattern)
     (progn
       (if __sine_pattern (setq _sine_pattern (car __sine_pattern)))
       _sine_pattern)))
  (:limits
   (&rest __limits)
   (if (keywordp (car __limits))
       (send* _limits __limits)
     (progn
       (if __limits (setq _limits (car __limits)))
       _limits)))
  (:serialization-length
   ()
   (+
    ;; int32 _control_mode
    4
    ;; iiwa_msgs/JointImpedanceControlMode _joint_impedance
    (send _joint_impedance :serialization-length)
    ;; iiwa_msgs/CartesianImpedanceControlMode _cartesian_impedance
    (send _cartesian_impedance :serialization-length)
    ;; iiwa_msgs/DesiredForceControlMode _desired_force
    (send _desired_force :serialization-length)
    ;; iiwa_msgs/SinePatternControlMode _sine_pattern
    (send _sine_pattern :serialization-length)
    ;; iiwa_msgs/CartesianControlModeLimits _limits
    (send _limits :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _control_mode
       (write-long _control_mode s)
     ;; iiwa_msgs/JointImpedanceControlMode _joint_impedance
       (send _joint_impedance :serialize s)
     ;; iiwa_msgs/CartesianImpedanceControlMode _cartesian_impedance
       (send _cartesian_impedance :serialize s)
     ;; iiwa_msgs/DesiredForceControlMode _desired_force
       (send _desired_force :serialize s)
     ;; iiwa_msgs/SinePatternControlMode _sine_pattern
       (send _sine_pattern :serialize s)
     ;; iiwa_msgs/CartesianControlModeLimits _limits
       (send _limits :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _control_mode
     (setq _control_mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; iiwa_msgs/JointImpedanceControlMode _joint_impedance
     (send _joint_impedance :deserialize buf ptr-) (incf ptr- (send _joint_impedance :serialization-length))
   ;; iiwa_msgs/CartesianImpedanceControlMode _cartesian_impedance
     (send _cartesian_impedance :deserialize buf ptr-) (incf ptr- (send _cartesian_impedance :serialization-length))
   ;; iiwa_msgs/DesiredForceControlMode _desired_force
     (send _desired_force :deserialize buf ptr-) (incf ptr- (send _desired_force :serialization-length))
   ;; iiwa_msgs/SinePatternControlMode _sine_pattern
     (send _sine_pattern :deserialize buf ptr-) (incf ptr- (send _sine_pattern :serialization-length))
   ;; iiwa_msgs/CartesianControlModeLimits _limits
     (send _limits :deserialize buf ptr-) (incf ptr- (send _limits :serialization-length))
   ;;
   self)
  )

(defclass iiwa_msgs::ConfigureControlModeResponse
  :super ros::object
  :slots (_success _error ))

(defmethod iiwa_msgs::ConfigureControlModeResponse
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

(defclass iiwa_msgs::ConfigureControlMode
  :super ros::object
  :slots ())

(setf (get iiwa_msgs::ConfigureControlMode :md5sum-) "680a54772ae74cfe325dd171700c3d78")
(setf (get iiwa_msgs::ConfigureControlMode :datatype-) "iiwa_msgs/ConfigureControlMode")
(setf (get iiwa_msgs::ConfigureControlMode :request) iiwa_msgs::ConfigureControlModeRequest)
(setf (get iiwa_msgs::ConfigureControlMode :response) iiwa_msgs::ConfigureControlModeResponse)

(defmethod iiwa_msgs::ConfigureControlModeRequest
  (:response () (instance iiwa_msgs::ConfigureControlModeResponse :init)))

(setf (get iiwa_msgs::ConfigureControlModeRequest :md5sum-) "680a54772ae74cfe325dd171700c3d78")
(setf (get iiwa_msgs::ConfigureControlModeRequest :datatype-) "iiwa_msgs/ConfigureControlModeRequest")
(setf (get iiwa_msgs::ConfigureControlModeRequest :definition-)
      "


int32 control_mode
iiwa_msgs/JointImpedanceControlMode joint_impedance
iiwa_msgs/CartesianImpedanceControlMode cartesian_impedance
iiwa_msgs/DesiredForceControlMode desired_force
iiwa_msgs/SinePatternControlMode sine_pattern
iiwa_msgs/CartesianControlModeLimits limits

================================================================================
MSG: iiwa_msgs/JointImpedanceControlMode
# Stiffness values in [Nm/rad]. Stiffness values must be >= 0. 
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
================================================================================
MSG: iiwa_msgs/CartesianImpedanceControlMode

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
================================================================================
MSG: iiwa_msgs/DesiredForceControlMode
# The degree of freedom on which the desired force
int32 cartesian_dof

# The value of the desired force. In [N].
float64 desired_force

# The value of the stiffness. In [N/m].
float64 desired_stiffness
================================================================================
MSG: iiwa_msgs/SinePatternControlMode
# The degree of freedom for performing the sine oscillation.
int32 cartesian_dof

# The value of the frequency for the sine oscillation [Hz].
float64 frequency

# The value of the amplitude. In [N].
float64 amplitude

# The value of the stiffness. In [N/m].
float64 stiffness
================================================================================
MSG: iiwa_msgs/CartesianControlModeLimits
# Sets the maximum cartesian deviation accepted. If the deviation is exceeded a stop condition occurs. 
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
---
bool success
string error
")

(setf (get iiwa_msgs::ConfigureControlModeResponse :md5sum-) "680a54772ae74cfe325dd171700c3d78")
(setf (get iiwa_msgs::ConfigureControlModeResponse :datatype-) "iiwa_msgs/ConfigureControlModeResponse")
(setf (get iiwa_msgs::ConfigureControlModeResponse :definition-)
      "


int32 control_mode
iiwa_msgs/JointImpedanceControlMode joint_impedance
iiwa_msgs/CartesianImpedanceControlMode cartesian_impedance
iiwa_msgs/DesiredForceControlMode desired_force
iiwa_msgs/SinePatternControlMode sine_pattern
iiwa_msgs/CartesianControlModeLimits limits

================================================================================
MSG: iiwa_msgs/JointImpedanceControlMode
# Stiffness values in [Nm/rad]. Stiffness values must be >= 0. 
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
================================================================================
MSG: iiwa_msgs/CartesianImpedanceControlMode

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
================================================================================
MSG: iiwa_msgs/DesiredForceControlMode
# The degree of freedom on which the desired force
int32 cartesian_dof

# The value of the desired force. In [N].
float64 desired_force

# The value of the stiffness. In [N/m].
float64 desired_stiffness
================================================================================
MSG: iiwa_msgs/SinePatternControlMode
# The degree of freedom for performing the sine oscillation.
int32 cartesian_dof

# The value of the frequency for the sine oscillation [Hz].
float64 frequency

# The value of the amplitude. In [N].
float64 amplitude

# The value of the stiffness. In [N/m].
float64 stiffness
================================================================================
MSG: iiwa_msgs/CartesianControlModeLimits
# Sets the maximum cartesian deviation accepted. If the deviation is exceeded a stop condition occurs. 
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
---
bool success
string error
")



(provide :iiwa_msgs/ConfigureControlMode "680a54772ae74cfe325dd171700c3d78")


