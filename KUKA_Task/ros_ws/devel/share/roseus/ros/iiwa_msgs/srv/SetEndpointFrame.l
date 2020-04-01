;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::SetEndpointFrame)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'SetEndpointFrame (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::SETENDPOINTFRAME")
  (make-package "IIWA_MSGS::SETENDPOINTFRAME"))
(unless (find-package "IIWA_MSGS::SETENDPOINTFRAMEREQUEST")
  (make-package "IIWA_MSGS::SETENDPOINTFRAMEREQUEST"))
(unless (find-package "IIWA_MSGS::SETENDPOINTFRAMERESPONSE")
  (make-package "IIWA_MSGS::SETENDPOINTFRAMERESPONSE"))

(in-package "ROS")





(defclass iiwa_msgs::SetEndpointFrameRequest
  :super ros::object
  :slots (_frame_id ))

(defmethod iiwa_msgs::SetEndpointFrameRequest
  (:init
   (&key
    ((:frame_id __frame_id) "")
    )
   (send-super :init)
   (setq _frame_id (string __frame_id))
   self)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:serialization-length
   ()
   (+
    ;; string _frame_id
    4 (length _frame_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _frame_id
       (write-long (length _frame_id) s) (princ _frame_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _frame_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass iiwa_msgs::SetEndpointFrameResponse
  :super ros::object
  :slots (_success _error ))

(defmethod iiwa_msgs::SetEndpointFrameResponse
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

(defclass iiwa_msgs::SetEndpointFrame
  :super ros::object
  :slots ())

(setf (get iiwa_msgs::SetEndpointFrame :md5sum-) "422abb646a850d7c7d04073e2d2f950e")
(setf (get iiwa_msgs::SetEndpointFrame :datatype-) "iiwa_msgs/SetEndpointFrame")
(setf (get iiwa_msgs::SetEndpointFrame :request) iiwa_msgs::SetEndpointFrameRequest)
(setf (get iiwa_msgs::SetEndpointFrame :response) iiwa_msgs::SetEndpointFrameResponse)

(defmethod iiwa_msgs::SetEndpointFrameRequest
  (:response () (instance iiwa_msgs::SetEndpointFrameResponse :init)))

(setf (get iiwa_msgs::SetEndpointFrameRequest :md5sum-) "422abb646a850d7c7d04073e2d2f950e")
(setf (get iiwa_msgs::SetEndpointFrameRequest :datatype-) "iiwa_msgs/SetEndpointFrameRequest")
(setf (get iiwa_msgs::SetEndpointFrameRequest :definition-)
      "


string frame_id

---

bool success
string error
")

(setf (get iiwa_msgs::SetEndpointFrameResponse :md5sum-) "422abb646a850d7c7d04073e2d2f950e")
(setf (get iiwa_msgs::SetEndpointFrameResponse :datatype-) "iiwa_msgs/SetEndpointFrameResponse")
(setf (get iiwa_msgs::SetEndpointFrameResponse :definition-)
      "


string frame_id

---

bool success
string error
")



(provide :iiwa_msgs/SetEndpointFrame "422abb646a850d7c7d04073e2d2f950e")


