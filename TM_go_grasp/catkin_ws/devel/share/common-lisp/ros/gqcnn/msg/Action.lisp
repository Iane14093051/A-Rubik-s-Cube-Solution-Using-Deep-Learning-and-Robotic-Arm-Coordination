; Auto-generated. Do not edit!


(cl:in-package gqcnn-msg)


;//! \htmlinclude Action.msg.html

(cl:defclass <Action> (roslisp-msg-protocol:ros-message)
  ((width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0)
   (mask_data
    :reader mask_data
    :initarg :mask_data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (action_type
    :reader action_type
    :initarg :action_type
    :type cl:string
    :initform "")
   (action_data
    :reader action_data
    :initarg :action_data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (confidence
    :reader confidence
    :initarg :confidence
    :type cl:float
    :initform 0.0))
)

(cl:defclass Action (<Action>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Action>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Action)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gqcnn-msg:<Action> is deprecated: use gqcnn-msg:Action instead.")))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <Action>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:width-val is deprecated.  Use gqcnn-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <Action>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:height-val is deprecated.  Use gqcnn-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'mask_data-val :lambda-list '(m))
(cl:defmethod mask_data-val ((m <Action>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:mask_data-val is deprecated.  Use gqcnn-msg:mask_data instead.")
  (mask_data m))

(cl:ensure-generic-function 'action_type-val :lambda-list '(m))
(cl:defmethod action_type-val ((m <Action>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:action_type-val is deprecated.  Use gqcnn-msg:action_type instead.")
  (action_type m))

(cl:ensure-generic-function 'action_data-val :lambda-list '(m))
(cl:defmethod action_data-val ((m <Action>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:action_data-val is deprecated.  Use gqcnn-msg:action_data instead.")
  (action_data m))

(cl:ensure-generic-function 'confidence-val :lambda-list '(m))
(cl:defmethod confidence-val ((m <Action>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:confidence-val is deprecated.  Use gqcnn-msg:confidence instead.")
  (confidence m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Action>) ostream)
  "Serializes a message object of type '<Action>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mask_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'mask_data))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action_type))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'action_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'action_data))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'confidence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Action>) istream)
  "Deserializes a message object of type '<Action>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'mask_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mask_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'action_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'action_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'confidence) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Action>)))
  "Returns string type for a message object of type '<Action>"
  "gqcnn/Action")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Action)))
  "Returns string type for a message object of type 'Action"
  "gqcnn/Action")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Action>)))
  "Returns md5sum for a message object of type '<Action>"
  "ec928182aa4f966ba689e9ac10b10d2d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Action)))
  "Returns md5sum for a message object of type 'Action"
  "ec928182aa4f966ba689e9ac10b10d2d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Action>)))
  "Returns full string definition for message of type '<Action>"
  (cl:format cl:nil "# Copyright ©2017. The Regents of the University of California (Regents).~%# All Rights Reserved. Permission to use, copy, modify, and distribute this~%# software and its documentation for educational, research, and not-for-profit~%# purposes, without fee and without a signed licensing agreement, is hereby~%# granted, provided that the above copyright notice, this paragraph and the~%# following two paragraphs appear in all copies, modifications, and~%# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150~%# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,~%# otl@berkeley.edu,~%# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.~%~%# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,~%# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF~%# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN~%# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.~%~%# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,~%# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR~%# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED~%# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE~%# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.~%~%uint32 width~%uint32 height~%uint8[] mask_data~%string action_type~%float32[] action_data~%float32 confidence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Action)))
  "Returns full string definition for message of type 'Action"
  (cl:format cl:nil "# Copyright ©2017. The Regents of the University of California (Regents).~%# All Rights Reserved. Permission to use, copy, modify, and distribute this~%# software and its documentation for educational, research, and not-for-profit~%# purposes, without fee and without a signed licensing agreement, is hereby~%# granted, provided that the above copyright notice, this paragraph and the~%# following two paragraphs appear in all copies, modifications, and~%# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150~%# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,~%# otl@berkeley.edu,~%# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.~%~%# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,~%# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF~%# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN~%# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.~%~%# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,~%# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR~%# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED~%# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE~%# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.~%~%uint32 width~%uint32 height~%uint8[] mask_data~%string action_type~%float32[] action_data~%float32 confidence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Action>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mask_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:length (cl:slot-value msg 'action_type))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'action_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Action>))
  "Converts a ROS message object to a list"
  (cl:list 'Action
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':mask_data (mask_data msg))
    (cl:cons ':action_type (action_type msg))
    (cl:cons ':action_data (action_data msg))
    (cl:cons ':confidence (confidence msg))
))
