;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::CartesianPlane)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'CartesianPlane (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::CARTESIANPLANE")
  (make-package "IIWA_MSGS::CARTESIANPLANE"))

(in-package "ROS")
;;//! \htmlinclude CartesianPlane.msg.html


(intern "*XY*" (find-package "IIWA_MSGS::CARTESIANPLANE"))
(shadow '*XY* (find-package "IIWA_MSGS::CARTESIANPLANE"))
(defconstant iiwa_msgs::CartesianPlane::*XY* 1)
(intern "*XZ*" (find-package "IIWA_MSGS::CARTESIANPLANE"))
(shadow '*XZ* (find-package "IIWA_MSGS::CARTESIANPLANE"))
(defconstant iiwa_msgs::CartesianPlane::*XZ* 2)
(intern "*YZ*" (find-package "IIWA_MSGS::CARTESIANPLANE"))
(shadow '*YZ* (find-package "IIWA_MSGS::CARTESIANPLANE"))
(defconstant iiwa_msgs::CartesianPlane::*YZ* 3)
(defclass iiwa_msgs::CartesianPlane
  :super ros::object
  :slots ())

(defmethod iiwa_msgs::CartesianPlane
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

(setf (get iiwa_msgs::CartesianPlane :md5sum-) "15617e8d13d4abd04145334685da37ba")
(setf (get iiwa_msgs::CartesianPlane :datatype-) "iiwa_msgs/CartesianPlane")
(setf (get iiwa_msgs::CartesianPlane :definition-)
      "int32 XY = 1
int32 XZ = 2
int32 YZ = 3
")



(provide :iiwa_msgs/CartesianPlane "15617e8d13d4abd04145334685da37ba")


