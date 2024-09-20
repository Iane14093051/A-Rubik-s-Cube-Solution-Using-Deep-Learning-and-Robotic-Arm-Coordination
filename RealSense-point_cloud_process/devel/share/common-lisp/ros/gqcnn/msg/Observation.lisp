; Auto-generated. Do not edit!


(cl:in-package gqcnn-msg)


;//! \htmlinclude Observation.msg.html

(cl:defclass <Observation> (roslisp-msg-protocol:ros-message)
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
   (image_data
    :reader image_data
    :initarg :image_data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Observation (<Observation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Observation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Observation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gqcnn-msg:<Observation> is deprecated: use gqcnn-msg:Observation instead.")))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:width-val is deprecated.  Use gqcnn-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:height-val is deprecated.  Use gqcnn-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'image_data-val :lambda-list '(m))
(cl:defmethod image_data-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:image_data-val is deprecated.  Use gqcnn-msg:image_data instead.")
  (image_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Observation>) ostream)
  "Serializes a message object of type '<Observation>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'image_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'image_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Observation>) istream)
  "Deserializes a message object of type '<Observation>"
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
  (cl:setf (cl:slot-value msg 'image_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'image_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Observation>)))
  "Returns string type for a message object of type '<Observation>"
  "gqcnn/Observation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Observation)))
  "Returns string type for a message object of type 'Observation"
  "gqcnn/Observation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Observation>)))
  "Returns md5sum for a message object of type '<Observation>"
  "0c65489c2c2d2e14daf0f0525a5d2a78")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Observation)))
  "Returns md5sum for a message object of type 'Observation"
  "0c65489c2c2d2e14daf0f0525a5d2a78")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Observation>)))
  "Returns full string definition for message of type '<Observation>"
  (cl:format cl:nil "# Copyright ©2017. The Regents of the University of California (Regents).~%# All Rights Reserved. Permission to use, copy, modify, and distribute this~%# software and its documentation for educational, research, and not-for-profit~%# purposes, without fee and without a signed licensing agreement, is hereby~%# granted, provided that the above copyright notice, this paragraph and the~%# following two paragraphs appear in all copies, modifications, and~%# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150~%# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,~%# otl@berkeley.edu,~%# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.~%~%# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,~%# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF~%# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN~%# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.~%~%# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,~%# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR~%# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED~%# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE~%# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.~%~%uint32 width~%uint32 height~%float32[] image_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Observation)))
  "Returns full string definition for message of type 'Observation"
  (cl:format cl:nil "# Copyright ©2017. The Regents of the University of California (Regents).~%# All Rights Reserved. Permission to use, copy, modify, and distribute this~%# software and its documentation for educational, research, and not-for-profit~%# purposes, without fee and without a signed licensing agreement, is hereby~%# granted, provided that the above copyright notice, this paragraph and the~%# following two paragraphs appear in all copies, modifications, and~%# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150~%# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,~%# otl@berkeley.edu,~%# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.~%~%# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,~%# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF~%# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN~%# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.~%~%# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,~%# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR~%# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED~%# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE~%# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.~%~%uint32 width~%uint32 height~%float32[] image_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Observation>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'image_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Observation>))
  "Converts a ROS message object to a list"
  (cl:list 'Observation
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':image_data (image_data msg))
))
