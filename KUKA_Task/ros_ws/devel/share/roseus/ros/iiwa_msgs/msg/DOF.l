;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::DOF)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'DOF (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::DOF")
  (make-package "IIWA_MSGS::DOF"))

(in-package "ROS")
;;//! \htmlinclude DOF.msg.html


(intern "*X*" (find-package "IIWA_MSGS::DOF"))
(shadow '*X* (find-package "IIWA_MSGS::DOF"))
(defconstant iiwa_msgs::DOF::*X* 1)
(intern "*Y*" (find-package "IIWA_MSGS::DOF"))
(shadow '*Y* (find-package "IIWA_MSGS::DOF"))
(defconstant iiwa_msgs::DOF::*Y* 2)
(intern "*Z*" (find-package "IIWA_MSGS::DOF"))
(shadow '*Z* (find-package "IIWA_MSGS::DOF"))
(defconstant iiwa_msgs::DOF::*Z* 3)
(intern "*A*" (find-package "IIWA_MSGS::DOF"))
(shadow '*A* (find-package "IIWA_MSGS::DOF"))
(defconstant iiwa_msgs::DOF::*A* 4)
(intern "*B*" (find-package "IIWA_MSGS::DOF"))
(shadow '*B* (find-package "IIWA_MSGS::DOF"))
(defconstant iiwa_msgs::DOF::*B* 5)
(intern "*C*" (find-package "IIWA_MSGS::DOF"))
(shadow '*C* (find-package "IIWA_MSGS::DOF"))
(defconstant iiwa_msgs::DOF::*C* 6)
(intern "*ROT*" (find-package "IIWA_MSGS::DOF"))
(shadow '*ROT* (find-package "IIWA_MSGS::DOF"))
(defconstant iiwa_msgs::DOF::*ROT* 7)
(intern "*TRANSL*" (find-package "IIWA_MSGS::DOF"))
(shadow '*TRANSL* (find-package "IIWA_MSGS::DOF"))
(defconstant iiwa_msgs::DOF::*TRANSL* 8)
(intern "*ALL*" (find-package "IIWA_MSGS::DOF"))
(shadow '*ALL* (find-package "IIWA_MSGS::DOF"))
(defconstant iiwa_msgs::DOF::*ALL* 9)
(defclass iiwa_msgs::DOF
  :super ros::object
  :slots ())

(defmethod iiwa_msgs::DOF
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

(setf (get iiwa_msgs::DOF :md5sum-) "c1a133d87080cb4a84e23090e4a06363")
(setf (get iiwa_msgs::DOF :datatype-) "iiwa_msgs/DOF")
(setf (get iiwa_msgs::DOF :definition-)
      "int32 X = 1
int32 Y = 2
int32 Z = 3
int32 A = 4
int32 B = 5
int32 C = 6
int32 ROT = 7
int32 TRANSL = 8
int32 ALL = 9

")



(provide :iiwa_msgs/DOF "c1a133d87080cb4a84e23090e4a06363")


