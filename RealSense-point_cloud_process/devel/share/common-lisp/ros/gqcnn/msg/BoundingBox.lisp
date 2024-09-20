; Auto-generated. Do not edit!


(cl:in-package gqcnn-msg)


;//! \htmlinclude BoundingBox.msg.html

(cl:defclass <BoundingBox> (roslisp-msg-protocol:ros-message)
  ((minX
    :reader minX
    :initarg :minX
    :type cl:float
    :initform 0.0)
   (minY
    :reader minY
    :initarg :minY
    :type cl:float
    :initform 0.0)
   (maxX
    :reader maxX
    :initarg :maxX
    :type cl:float
    :initform 0.0)
   (maxY
    :reader maxY
    :initarg :maxY
    :type cl:float
    :initform 0.0))
)

(cl:defclass BoundingBox (<BoundingBox>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoundingBox>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoundingBox)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gqcnn-msg:<BoundingBox> is deprecated: use gqcnn-msg:BoundingBox instead.")))

(cl:ensure-generic-function 'minX-val :lambda-list '(m))
(cl:defmethod minX-val ((m <BoundingBox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:minX-val is deprecated.  Use gqcnn-msg:minX instead.")
  (minX m))

(cl:ensure-generic-function 'minY-val :lambda-list '(m))
(cl:defmethod minY-val ((m <BoundingBox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:minY-val is deprecated.  Use gqcnn-msg:minY instead.")
  (minY m))

(cl:ensure-generic-function 'maxX-val :lambda-list '(m))
(cl:defmethod maxX-val ((m <BoundingBox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:maxX-val is deprecated.  Use gqcnn-msg:maxX instead.")
  (maxX m))

(cl:ensure-generic-function 'maxY-val :lambda-list '(m))
(cl:defmethod maxY-val ((m <BoundingBox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:maxY-val is deprecated.  Use gqcnn-msg:maxY instead.")
  (maxY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoundingBox>) ostream)
  "Serializes a message object of type '<BoundingBox>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'minX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'minY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maxX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maxY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoundingBox>) istream)
  "Deserializes a message object of type '<BoundingBox>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'minX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'minY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxY) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoundingBox>)))
  "Returns string type for a message object of type '<BoundingBox>"
  "gqcnn/BoundingBox")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoundingBox)))
  "Returns string type for a message object of type 'BoundingBox"
  "gqcnn/BoundingBox")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoundingBox>)))
  "Returns md5sum for a message object of type '<BoundingBox>"
  "316ddfac9d67d96b86cd55005b01f75e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoundingBox)))
  "Returns md5sum for a message object of type 'BoundingBox"
  "316ddfac9d67d96b86cd55005b01f75e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoundingBox>)))
  "Returns full string definition for message of type '<BoundingBox>"
  (cl:format cl:nil "# Copyright ©2017. The Regents of the University of California (Regents).~%# All Rights Reserved. Permission to use, copy, modify, and distribute this~%# software and its documentation for educational, research, and not-for-profit~%# purposes, without fee and without a signed licensing agreement, is hereby~%# granted, provided that the above copyright notice, this paragraph and the~%# following two paragraphs appear in all copies, modifications, and~%# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150~%# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,~%# otl@berkeley.edu,~%# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.~%~%# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,~%# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF~%# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN~%# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.~%~%# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,~%# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR~%# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED~%# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE~%# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.~%~%float64 minX~%float64 minY~%float64 maxX~%float64 maxY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoundingBox)))
  "Returns full string definition for message of type 'BoundingBox"
  (cl:format cl:nil "# Copyright ©2017. The Regents of the University of California (Regents).~%# All Rights Reserved. Permission to use, copy, modify, and distribute this~%# software and its documentation for educational, research, and not-for-profit~%# purposes, without fee and without a signed licensing agreement, is hereby~%# granted, provided that the above copyright notice, this paragraph and the~%# following two paragraphs appear in all copies, modifications, and~%# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150~%# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,~%# otl@berkeley.edu,~%# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.~%~%# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,~%# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF~%# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN~%# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.~%~%# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,~%# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR~%# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED~%# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE~%# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.~%~%float64 minX~%float64 minY~%float64 maxX~%float64 maxY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoundingBox>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoundingBox>))
  "Converts a ROS message object to a list"
  (cl:list 'BoundingBox
    (cl:cons ':minX (minX msg))
    (cl:cons ':minY (minY msg))
    (cl:cons ':maxX (maxX msg))
    (cl:cons ':maxY (maxY msg))
))
