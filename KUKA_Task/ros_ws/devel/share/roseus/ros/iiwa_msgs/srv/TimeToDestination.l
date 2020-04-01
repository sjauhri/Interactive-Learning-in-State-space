;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::TimeToDestination)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'TimeToDestination (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::TIMETODESTINATION")
  (make-package "IIWA_MSGS::TIMETODESTINATION"))
(unless (find-package "IIWA_MSGS::TIMETODESTINATIONREQUEST")
  (make-package "IIWA_MSGS::TIMETODESTINATIONREQUEST"))
(unless (find-package "IIWA_MSGS::TIMETODESTINATIONRESPONSE")
  (make-package "IIWA_MSGS::TIMETODESTINATIONRESPONSE"))

(in-package "ROS")





(defclass iiwa_msgs::TimeToDestinationRequest
  :super ros::object
  :slots ())

(defmethod iiwa_msgs::TimeToDestinationRequest
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

(defclass iiwa_msgs::TimeToDestinationResponse
  :super ros::object
  :slots (_remaining_time ))

(defmethod iiwa_msgs::TimeToDestinationResponse
  (:init
   (&key
    ((:remaining_time __remaining_time) 0.0)
    )
   (send-super :init)
   (setq _remaining_time (float __remaining_time))
   self)
  (:remaining_time
   (&optional __remaining_time)
   (if __remaining_time (setq _remaining_time __remaining_time)) _remaining_time)
  (:serialization-length
   ()
   (+
    ;; float64 _remaining_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _remaining_time
       (sys::poke _remaining_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _remaining_time
     (setq _remaining_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass iiwa_msgs::TimeToDestination
  :super ros::object
  :slots ())

(setf (get iiwa_msgs::TimeToDestination :md5sum-) "b71b59cce98847d0bd0310eb052e8f3f")
(setf (get iiwa_msgs::TimeToDestination :datatype-) "iiwa_msgs/TimeToDestination")
(setf (get iiwa_msgs::TimeToDestination :request) iiwa_msgs::TimeToDestinationRequest)
(setf (get iiwa_msgs::TimeToDestination :response) iiwa_msgs::TimeToDestinationResponse)

(defmethod iiwa_msgs::TimeToDestinationRequest
  (:response () (instance iiwa_msgs::TimeToDestinationResponse :init)))

(setf (get iiwa_msgs::TimeToDestinationRequest :md5sum-) "b71b59cce98847d0bd0310eb052e8f3f")
(setf (get iiwa_msgs::TimeToDestinationRequest :datatype-) "iiwa_msgs/TimeToDestinationRequest")
(setf (get iiwa_msgs::TimeToDestinationRequest :definition-)
      "---
float64 remaining_time

")

(setf (get iiwa_msgs::TimeToDestinationResponse :md5sum-) "b71b59cce98847d0bd0310eb052e8f3f")
(setf (get iiwa_msgs::TimeToDestinationResponse :datatype-) "iiwa_msgs/TimeToDestinationResponse")
(setf (get iiwa_msgs::TimeToDestinationResponse :definition-)
      "---
float64 remaining_time

")



(provide :iiwa_msgs/TimeToDestination "b71b59cce98847d0bd0310eb052e8f3f")


