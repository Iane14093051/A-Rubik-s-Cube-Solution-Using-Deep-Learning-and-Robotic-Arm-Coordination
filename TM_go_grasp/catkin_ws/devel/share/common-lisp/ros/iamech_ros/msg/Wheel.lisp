; Auto-generated. Do not edit!


(cl:in-package iamech_ros-msg)


;//! \htmlinclude Wheel.msg.html

(cl:defclass <Wheel> (roslisp-msg-protocol:ros-message)
  ((bReady
    :reader bReady
    :initarg :bReady
    :type cl:integer
    :initform 0)
   (bMoving
    :reader bMoving
    :initarg :bMoving
    :type cl:integer
    :initform 0)
   (bError
    :reader bError
    :initarg :bError
    :type cl:integer
    :initform 0)
   (pos
    :reader pos
    :initarg :pos
    :type cl:integer
    :initform 0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:integer
    :initform 0)
   (ErrorCode
    :reader ErrorCode
    :initarg :ErrorCode
    :type cl:integer
    :initform 0)
   (temperature
    :reader temperature
    :initarg :temperature
    :type cl:integer
    :initform 0)
   (volt
    :reader volt
    :initarg :volt
    :type cl:integer
    :initform 0))
)

(cl:defclass Wheel (<Wheel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Wheel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Wheel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iamech_ros-msg:<Wheel> is deprecated: use iamech_ros-msg:Wheel instead.")))

(cl:ensure-generic-function 'bReady-val :lambda-list '(m))
(cl:defmethod bReady-val ((m <Wheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:bReady-val is deprecated.  Use iamech_ros-msg:bReady instead.")
  (bReady m))

(cl:ensure-generic-function 'bMoving-val :lambda-list '(m))
(cl:defmethod bMoving-val ((m <Wheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:bMoving-val is deprecated.  Use iamech_ros-msg:bMoving instead.")
  (bMoving m))

(cl:ensure-generic-function 'bError-val :lambda-list '(m))
(cl:defmethod bError-val ((m <Wheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:bError-val is deprecated.  Use iamech_ros-msg:bError instead.")
  (bError m))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <Wheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:pos-val is deprecated.  Use iamech_ros-msg:pos instead.")
  (pos m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <Wheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:velocity-val is deprecated.  Use iamech_ros-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'ErrorCode-val :lambda-list '(m))
(cl:defmethod ErrorCode-val ((m <Wheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:ErrorCode-val is deprecated.  Use iamech_ros-msg:ErrorCode instead.")
  (ErrorCode m))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <Wheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:temperature-val is deprecated.  Use iamech_ros-msg:temperature instead.")
  (temperature m))

(cl:ensure-generic-function 'volt-val :lambda-list '(m))
(cl:defmethod volt-val ((m <Wheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iamech_ros-msg:volt-val is deprecated.  Use iamech_ros-msg:volt instead.")
  (volt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Wheel>) ostream)
  "Serializes a message object of type '<Wheel>"
  (cl:let* ((signed (cl:slot-value msg 'bReady)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'bMoving)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'bError)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ErrorCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'temperature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'volt)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Wheel>) istream)
  "Deserializes a message object of type '<Wheel>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bReady) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bMoving) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bError) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pos) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ErrorCode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'temperature) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'volt) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Wheel>)))
  "Returns string type for a message object of type '<Wheel>"
  "iamech_ros/Wheel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Wheel)))
  "Returns string type for a message object of type 'Wheel"
  "iamech_ros/Wheel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Wheel>)))
  "Returns md5sum for a message object of type '<Wheel>"
  "cb0e446b2d87810af5b33fbf4f7f9055")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Wheel)))
  "Returns md5sum for a message object of type 'Wheel"
  "cb0e446b2d87810af5b33fbf4f7f9055")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Wheel>)))
  "Returns full string definition for message of type '<Wheel>"
  (cl:format cl:nil "int32 bReady~%int32 bMoving~%int32 bError~%int32 pos~%int32 velocity~%int32 ErrorCode~%int32 temperature~%int32 volt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Wheel)))
  "Returns full string definition for message of type 'Wheel"
  (cl:format cl:nil "int32 bReady~%int32 bMoving~%int32 bError~%int32 pos~%int32 velocity~%int32 ErrorCode~%int32 temperature~%int32 volt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Wheel>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Wheel>))
  "Converts a ROS message object to a list"
  (cl:list 'Wheel
    (cl:cons ':bReady (bReady msg))
    (cl:cons ':bMoving (bMoving msg))
    (cl:cons ':bError (bError msg))
    (cl:cons ':pos (pos msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':ErrorCode (ErrorCode msg))
    (cl:cons ':temperature (temperature msg))
    (cl:cons ':volt (volt msg))
))
