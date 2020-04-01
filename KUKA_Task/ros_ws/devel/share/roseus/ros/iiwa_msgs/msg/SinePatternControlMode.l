;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::SinePatternControlMode)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'SinePatternControlMode (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::SINEPATTERNCONTROLMODE")
  (make-package "IIWA_MSGS::SINEPATTERNCONTROLMODE"))

(in-package "ROS")
;;//! \htmlinclude SinePatternControlMode.msg.html


(defclass iiwa_msgs::SinePatternControlMode
  :super ros::object
  :slots (_cartesian_dof _frequency _amplitude _stiffness ))

(defmethod iiwa_msgs::SinePatternControlMode
  (:init
   (&key
    ((:cartesian_dof __cartesian_dof) 0)
    ((:frequency __frequency) 0.0)
    ((:amplitude __amplitude) 0.0)
    ((:stiffness __stiffness) 0.0)
    )
   (send-super :init)
   (setq _cartesian_dof (round __cartesian_dof))
   (setq _frequency (float __frequency))
   (setq _amplitude (float __amplitude))
   (setq _stiffness (float __stiffness))
   self)
  (:cartesian_dof
   (&optional __cartesian_dof)
   (if __cartesian_dof (setq _cartesian_dof __cartesian_dof)) _cartesian_dof)
  (:frequency
   (&optional __frequency)
   (if __frequency (setq _frequency __frequency)) _frequency)
  (:amplitude
   (&optional __amplitude)
   (if __amplitude (setq _amplitude __amplitude)) _amplitude)
  (:stiffness
   (&optional __stiffness)
   (if __stiffness (setq _stiffness __stiffness)) _stiffness)
  (:serialization-length
   ()
   (+
    ;; int32 _cartesian_dof
    4
    ;; float64 _frequency
    8
    ;; float64 _amplitude
    8
    ;; float64 _stiffness
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _cartesian_dof
       (write-long _cartesian_dof s)
     ;; float64 _frequency
       (sys::poke _frequency (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _amplitude
       (sys::poke _amplitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _stiffness
       (sys::poke _stiffness (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _cartesian_dof
     (setq _cartesian_dof (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _frequency
     (setq _frequency (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _amplitude
     (setq _amplitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _stiffness
     (setq _stiffness (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get iiwa_msgs::SinePatternControlMode :md5sum-) "e72785e47bec423cb99a63dd32ae2a54")
(setf (get iiwa_msgs::SinePatternControlMode :datatype-) "iiwa_msgs/SinePatternControlMode")
(setf (get iiwa_msgs::SinePatternControlMode :definition-)
      "# The degree of freedom for performing the sine oscillation.
int32 cartesian_dof

# The value of the frequency for the sine oscillation [Hz].
float64 frequency

# The value of the amplitude. In [N].
float64 amplitude

# The value of the stiffness. In [N/m].
float64 stiffness
")



(provide :iiwa_msgs/SinePatternControlMode "e72785e47bec423cb99a63dd32ae2a54")


