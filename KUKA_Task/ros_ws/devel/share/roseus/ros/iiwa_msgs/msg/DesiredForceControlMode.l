;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::DesiredForceControlMode)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'DesiredForceControlMode (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::DESIREDFORCECONTROLMODE")
  (make-package "IIWA_MSGS::DESIREDFORCECONTROLMODE"))

(in-package "ROS")
;;//! \htmlinclude DesiredForceControlMode.msg.html


(defclass iiwa_msgs::DesiredForceControlMode
  :super ros::object
  :slots (_cartesian_dof _desired_force _desired_stiffness ))

(defmethod iiwa_msgs::DesiredForceControlMode
  (:init
   (&key
    ((:cartesian_dof __cartesian_dof) 0)
    ((:desired_force __desired_force) 0.0)
    ((:desired_stiffness __desired_stiffness) 0.0)
    )
   (send-super :init)
   (setq _cartesian_dof (round __cartesian_dof))
   (setq _desired_force (float __desired_force))
   (setq _desired_stiffness (float __desired_stiffness))
   self)
  (:cartesian_dof
   (&optional __cartesian_dof)
   (if __cartesian_dof (setq _cartesian_dof __cartesian_dof)) _cartesian_dof)
  (:desired_force
   (&optional __desired_force)
   (if __desired_force (setq _desired_force __desired_force)) _desired_force)
  (:desired_stiffness
   (&optional __desired_stiffness)
   (if __desired_stiffness (setq _desired_stiffness __desired_stiffness)) _desired_stiffness)
  (:serialization-length
   ()
   (+
    ;; int32 _cartesian_dof
    4
    ;; float64 _desired_force
    8
    ;; float64 _desired_stiffness
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _cartesian_dof
       (write-long _cartesian_dof s)
     ;; float64 _desired_force
       (sys::poke _desired_force (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _desired_stiffness
       (sys::poke _desired_stiffness (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _cartesian_dof
     (setq _cartesian_dof (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _desired_force
     (setq _desired_force (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _desired_stiffness
     (setq _desired_stiffness (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get iiwa_msgs::DesiredForceControlMode :md5sum-) "da11717a4c7e94e66d2e956ead0bf6f3")
(setf (get iiwa_msgs::DesiredForceControlMode :datatype-) "iiwa_msgs/DesiredForceControlMode")
(setf (get iiwa_msgs::DesiredForceControlMode :definition-)
      "# The degree of freedom on which the desired force
int32 cartesian_dof

# The value of the desired force. In [N].
float64 desired_force

# The value of the stiffness. In [N/m].
float64 desired_stiffness
")



(provide :iiwa_msgs/DesiredForceControlMode "da11717a4c7e94e66d2e956ead0bf6f3")


