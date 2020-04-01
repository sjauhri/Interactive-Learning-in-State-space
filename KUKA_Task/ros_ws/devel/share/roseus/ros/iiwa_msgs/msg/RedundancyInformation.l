;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::RedundancyInformation)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'RedundancyInformation (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::REDUNDANCYINFORMATION")
  (make-package "IIWA_MSGS::REDUNDANCYINFORMATION"))

(in-package "ROS")
;;//! \htmlinclude RedundancyInformation.msg.html


(defclass iiwa_msgs::RedundancyInformation
  :super ros::object
  :slots (_e1 _status _turn ))

(defmethod iiwa_msgs::RedundancyInformation
  (:init
   (&key
    ((:e1 __e1) 0.0)
    ((:status __status) 0)
    ((:turn __turn) 0)
    )
   (send-super :init)
   (setq _e1 (float __e1))
   (setq _status (round __status))
   (setq _turn (round __turn))
   self)
  (:e1
   (&optional __e1)
   (if __e1 (setq _e1 __e1)) _e1)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:turn
   (&optional __turn)
   (if __turn (setq _turn __turn)) _turn)
  (:serialization-length
   ()
   (+
    ;; float64 _e1
    8
    ;; int32 _status
    4
    ;; int32 _turn
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _e1
       (sys::poke _e1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _status
       (write-long _status s)
     ;; int32 _turn
       (write-long _turn s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _e1
     (setq _e1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _status
     (setq _status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _turn
     (setq _turn (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get iiwa_msgs::RedundancyInformation :md5sum-) "890d08bd36db91494028e6c2e0f4ecc2")
(setf (get iiwa_msgs::RedundancyInformation :datatype-) "iiwa_msgs/RedundancyInformation")
(setf (get iiwa_msgs::RedundancyInformation :definition-)
      "# E1 parameter
# Specifies Angle of the elbow joint.
float64 e1

# Status parameter
#   Bit 0: 1 - The robot is working above its head
#          0 - The robot is working in the ground area
#   Bit 1: 1 - Angle A4 < 0°
#          0 - Angle A4 >= 0°
#   Bit 2: 1 - Angle A6 <= 0
#          0 - Angle A6 > 0
int32 status

# Turn parameter
# According to Sunrise handbook this is not used for the iiwa.
int32 turn

")



(provide :iiwa_msgs/RedundancyInformation "890d08bd36db91494028e6c2e0f4ecc2")


