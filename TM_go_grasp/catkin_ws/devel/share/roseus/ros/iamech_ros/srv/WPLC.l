;; Auto-generated. Do not edit!


(when (boundp 'iamech_ros::WPLC)
  (if (not (find-package "IAMECH_ROS"))
    (make-package "IAMECH_ROS"))
  (shadow 'WPLC (find-package "IAMECH_ROS")))
(unless (find-package "IAMECH_ROS::WPLC")
  (make-package "IAMECH_ROS::WPLC"))
(unless (find-package "IAMECH_ROS::WPLCREQUEST")
  (make-package "IAMECH_ROS::WPLCREQUEST"))
(unless (find-package "IAMECH_ROS::WPLCRESPONSE")
  (make-package "IAMECH_ROS::WPLCRESPONSE"))

(in-package "ROS")





(defclass iamech_ros::WPLCRequest
  :super ros::object
  :slots (_name _value ))

(defmethod iamech_ros::WPLCRequest
  (:init
   (&key
    ((:name __name) "")
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _value (round __value))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass iamech_ros::WPLCResponse
  :super ros::object
  :slots ())

(defmethod iamech_ros::WPLCResponse
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

(defclass iamech_ros::WPLC
  :super ros::object
  :slots ())

(setf (get iamech_ros::WPLC :md5sum-) "65fedc7a0cbfb8db035e46194a350bf1")
(setf (get iamech_ros::WPLC :datatype-) "iamech_ros/WPLC")
(setf (get iamech_ros::WPLC :request) iamech_ros::WPLCRequest)
(setf (get iamech_ros::WPLC :response) iamech_ros::WPLCResponse)

(defmethod iamech_ros::WPLCRequest
  (:response () (instance iamech_ros::WPLCResponse :init)))

(setf (get iamech_ros::WPLCRequest :md5sum-) "65fedc7a0cbfb8db035e46194a350bf1")
(setf (get iamech_ros::WPLCRequest :datatype-) "iamech_ros/WPLCRequest")
(setf (get iamech_ros::WPLCRequest :definition-)
      "string name
int32 value
---
")

(setf (get iamech_ros::WPLCResponse :md5sum-) "65fedc7a0cbfb8db035e46194a350bf1")
(setf (get iamech_ros::WPLCResponse :datatype-) "iamech_ros/WPLCResponse")
(setf (get iamech_ros::WPLCResponse :definition-)
      "string name
int32 value
---
")



(provide :iamech_ros/WPLC "65fedc7a0cbfb8db035e46194a350bf1")


