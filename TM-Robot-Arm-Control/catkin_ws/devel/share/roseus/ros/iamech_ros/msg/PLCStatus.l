;; Auto-generated. Do not edit!


(when (boundp 'iamech_ros::PLCStatus)
  (if (not (find-package "IAMECH_ROS"))
    (make-package "IAMECH_ROS"))
  (shadow 'PLCStatus (find-package "IAMECH_ROS")))
(unless (find-package "IAMECH_ROS::PLCSTATUS")
  (make-package "IAMECH_ROS::PLCSTATUS"))

(in-package "ROS")
;;//! \htmlinclude PLCStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass iamech_ros::PLCStatus
  :super ros::object
  :slots (_header _ServeON _right _left ))

(defmethod iamech_ros::PLCStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ServeON __ServeON) 0)
    ((:right __right) (instance iamech_ros::Wheel :init))
    ((:left __left) (instance iamech_ros::Wheel :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _ServeON (round __ServeON))
   (setq _right __right)
   (setq _left __left)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ServeON
   (&optional __ServeON)
   (if __ServeON (setq _ServeON __ServeON)) _ServeON)
  (:right
   (&rest __right)
   (if (keywordp (car __right))
       (send* _right __right)
     (progn
       (if __right (setq _right (car __right)))
       _right)))
  (:left
   (&rest __left)
   (if (keywordp (car __left))
       (send* _left __left)
     (progn
       (if __left (setq _left (car __left)))
       _left)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _ServeON
    4
    ;; iamech_ros/Wheel _right
    (send _right :serialization-length)
    ;; iamech_ros/Wheel _left
    (send _left :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _ServeON
       (write-long _ServeON s)
     ;; iamech_ros/Wheel _right
       (send _right :serialize s)
     ;; iamech_ros/Wheel _left
       (send _left :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _ServeON
     (setq _ServeON (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; iamech_ros/Wheel _right
     (send _right :deserialize buf ptr-) (incf ptr- (send _right :serialization-length))
   ;; iamech_ros/Wheel _left
     (send _left :deserialize buf ptr-) (incf ptr- (send _left :serialization-length))
   ;;
   self)
  )

(setf (get iamech_ros::PLCStatus :md5sum-) "3ef7303dd3b56e2cbae2954451853687")
(setf (get iamech_ros::PLCStatus :datatype-) "iamech_ros/PLCStatus")
(setf (get iamech_ros::PLCStatus :definition-)
      "std_msgs/Header header
int32 ServeON
Wheel right
Wheel left
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: iamech_ros/Wheel
int32 bReady
int32 bMoving
int32 bError
int32 pos
int32 velocity
int32 ErrorCode
int32 temperature
int32 volt

")



(provide :iamech_ros/PLCStatus "3ef7303dd3b56e2cbae2954451853687")


