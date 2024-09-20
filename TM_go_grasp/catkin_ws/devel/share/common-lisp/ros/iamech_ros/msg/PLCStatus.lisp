; Auto-generated. Do not edit!


(cl:in-package iamech_ros-msg)


;//! \htmlinclude PLCStatus.msg.html

(cl:defclass <PLCStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (ServeON
    :reader ServeON
    :initarg :ServeON
    :type cl:integer
    :initform 0)
   (right
    :reader right
    :initarg :right
    :type iamech_ros-msg:Wheel
    :initform (cl:make-instance 'iamech_ros-msg:Wheel))
   (left
    :reader left
    :initarg :left
    :type iamech_ros-msg:Wheel
    :initform (cl:make-instance 'iamech_ros-msg:Wheel)))
)

(cl:defclass PLCStatus (<PLCStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PLCStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PLCStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iamech_ros-msg:<PLCStatus> is deprecated: use iamech_ros-msg:PLCStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PLCStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:header-val is deprecated.  Use iamech_ros-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'ServeON-val :lambda-list '(m))
(cl:defmethod ServeON-val ((m <PLCStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:ServeON-val is deprecated.  Use iamech_ros-msg:ServeON instead.")
  (ServeON m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <PLCStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:right-val is deprecated.  Use iamech_ros-msg:right instead.")
  (right m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <PLCStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:left-val is deprecated.  Use iamech_ros-msg:left instead.")
  (left m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PLCStatus>) ostream)
  "Serializes a message object of type '<PLCStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'ServeON)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'right) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'left) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PLCStatus>) istream)
  "Deserializes a message object of type '<PLCStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ServeON) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'right) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'left) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PLCStatus>)))
  "Returns string type for a message object of type '<PLCStatus>"
  "iamech_ros/PLCStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PLCStatus)))
  "Returns string type for a message object of type 'PLCStatus"
  "iamech_ros/PLCStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PLCStatus>)))
  "Returns md5sum for a message object of type '<PLCStatus>"
  "3ef7303dd3b56e2cbae2954451853687")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PLCStatus)))
  "Returns md5sum for a message object of type 'PLCStatus"
  "3ef7303dd3b56e2cbae2954451853687")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PLCStatus>)))
  "Returns full string definition for message of type '<PLCStatus>"
  (cl:format cl:nil "std_msgs/Header header~%int32 ServeON~%Wheel right~%Wheel left~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iamech_ros/Wheel~%int32 bReady~%int32 bMoving~%int32 bError~%int32 pos~%int32 velocity~%int32 ErrorCode~%int32 temperature~%int32 volt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PLCStatus)))
  "Returns full string definition for message of type 'PLCStatus"
  (cl:format cl:nil "std_msgs/Header header~%int32 ServeON~%Wheel right~%Wheel left~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iamech_ros/Wheel~%int32 bReady~%int32 bMoving~%int32 bError~%int32 pos~%int32 velocity~%int32 ErrorCode~%int32 temperature~%int32 volt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PLCStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'right))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'left))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PLCStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'PLCStatus
    (cl:cons ':header (header msg))
    (cl:cons ':ServeON (ServeON msg))
    (cl:cons ':right (right msg))
    (cl:cons ':left (left msg))
))
