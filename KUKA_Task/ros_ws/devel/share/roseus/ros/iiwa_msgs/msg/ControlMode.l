;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::ControlMode)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'ControlMode (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::CONTROLMODE")
  (make-package "IIWA_MSGS::CONTROLMODE"))

(in-package "ROS")
;;//! \htmlinclude ControlMode.msg.html


(intern "*POSITION_CONTROL*" (find-package "IIWA_MSGS::CONTROLMODE"))
(shadow '*POSITION_CONTROL* (find-package "IIWA_MSGS::CONTROLMODE"))
(defconstant iiwa_msgs::ControlMode::*POSITION_CONTROL* 0)
(intern "*JOINT_IMPEDANCE*" (find-package "IIWA_MSGS::CONTROLMODE"))
(shadow '*JOINT_IMPEDANCE* (find-package "IIWA_MSGS::CONTROLMODE"))
(defconstant iiwa_msgs::ControlMode::*JOINT_IMPEDANCE* 1)
(intern "*CARTESIAN_IMPEDANCE*" (find-package "IIWA_MSGS::CONTROLMODE"))
(shadow '*CARTESIAN_IMPEDANCE* (find-package "IIWA_MSGS::CONTROLMODE"))
(defconstant iiwa_msgs::ControlMode::*CARTESIAN_IMPEDANCE* 2)
(intern "*DESIRED_FORCE*" (find-package "IIWA_MSGS::CONTROLMODE"))
(shadow '*DESIRED_FORCE* (find-package "IIWA_MSGS::CONTROLMODE"))
(defconstant iiwa_msgs::ControlMode::*DESIRED_FORCE* 3)
(intern "*SINE_PATTERN*" (find-package "IIWA_MSGS::CONTROLMODE"))
(shadow '*SINE_PATTERN* (find-package "IIWA_MSGS::CONTROLMODE"))
(defconstant iiwa_msgs::ControlMode::*SINE_PATTERN* 4)
(defclass iiwa_msgs::ControlMode
  :super ros::object
  :slots ())

(defmethod iiwa_msgs::ControlMode
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(setf (get iiwa_msgs::ControlMode :md5sum-) "fbf6f4c74f01882c27df4152be6af2d9")
(setf (get iiwa_msgs::ControlMode :datatype-) "iiwa_msgs/ControlMode")
(setf (get iiwa_msgs::ControlMode :definition-)
      "int32 POSITION_CONTROL = 0
int32 JOINT_IMPEDANCE =  1
int32 CARTESIAN_IMPEDANCE = 2
int32 DESIRED_FORCE = 3
int32 SINE_PATTERN = 4
")



(provide :iiwa_msgs/ControlMode "fbf6f4c74f01882c27df4152be6af2d9")


