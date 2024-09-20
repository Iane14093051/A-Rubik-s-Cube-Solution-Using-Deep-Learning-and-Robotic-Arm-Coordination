; Auto-generated. Do not edit!


(cl:in-package iamech_ros-srv)


;//! \htmlinclude WPLC-request.msg.html

(cl:defclass <WPLC-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass WPLC-request (<WPLC-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WPLC-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WPLC-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iamech_ros-srv:<WPLC-request> is deprecated: use iamech_ros-srv:WPLC-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <WPLC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-srv:name-val is deprecated.  Use iamech_ros-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <WPLC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-srv:value-val is deprecated.  Use iamech_ros-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WPLC-request>) ostream)
  "Serializes a message object of type '<WPLC-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WPLC-request>) istream)
  "Deserializes a message object of type '<WPLC-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WPLC-request>)))
  "Returns string type for a service object of type '<WPLC-request>"
  "iamech_ros/WPLCRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WPLC-request)))
  "Returns string type for a service object of type 'WPLC-request"
  "iamech_ros/WPLCRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WPLC-request>)))
  "Returns md5sum for a message object of type '<WPLC-request>"
  "65fedc7a0cbfb8db035e46194a350bf1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WPLC-request)))
  "Returns md5sum for a message object of type 'WPLC-request"
  "65fedc7a0cbfb8db035e46194a350bf1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WPLC-request>)))
  "Returns full string definition for message of type '<WPLC-request>"
  (cl:format cl:nil "string name~%int32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WPLC-request)))
  "Returns full string definition for message of type 'WPLC-request"
  (cl:format cl:nil "string name~%int32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WPLC-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WPLC-request>))
  "Converts a ROS message object to a list"
  (cl:list 'WPLC-request
    (cl:cons ':name (name msg))
    (cl:cons ':value (value msg))
))
;//! \htmlinclude WPLC-response.msg.html

(cl:defclass <WPLC-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass WPLC-response (<WPLC-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WPLC-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WPLC-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iamech_ros-srv:<WPLC-response> is deprecated: use iamech_ros-srv:WPLC-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WPLC-response>) ostream)
  "Serializes a message object of type '<WPLC-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WPLC-response>) istream)
  "Deserializes a message object of type '<WPLC-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WPLC-response>)))
  "Returns string type for a service object of type '<WPLC-response>"
  "iamech_ros/WPLCResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WPLC-response)))
  "Returns string type for a service object of type 'WPLC-response"
  "iamech_ros/WPLCResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WPLC-response>)))
  "Returns md5sum for a message object of type '<WPLC-response>"
  "65fedc7a0cbfb8db035e46194a350bf1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WPLC-response)))
  "Returns md5sum for a message object of type 'WPLC-response"
  "65fedc7a0cbfb8db035e46194a350bf1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WPLC-response>)))
  "Returns full string definition for message of type '<WPLC-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WPLC-response)))
  "Returns full string definition for message of type 'WPLC-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WPLC-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WPLC-response>))
  "Converts a ROS message object to a list"
  (cl:list 'WPLC-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'WPLC)))
  'WPLC-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'WPLC)))
  'WPLC-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WPLC)))
  "Returns string type for a service object of type '<WPLC>"
  "iamech_ros/WPLC")