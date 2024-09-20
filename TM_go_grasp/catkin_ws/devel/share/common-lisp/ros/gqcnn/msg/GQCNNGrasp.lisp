; Auto-generated. Do not edit!


(cl:in-package gqcnn-msg)


;//! \htmlinclude GQCNNGrasp.msg.html

(cl:defclass <GQCNNGrasp> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (q_value
    :reader q_value
    :initarg :q_value
    :type cl:float
    :initform 0.0)
   (grasp_type
    :reader grasp_type
    :initarg :grasp_type
    :type cl:fixnum
    :initform 0)
   (center_px
    :reader center_px
    :initarg :center_px
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (depth
    :reader depth
    :initarg :depth
    :type cl:float
    :initform 0.0)
   (thumbnail
    :reader thumbnail
    :initarg :thumbnail
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass GQCNNGrasp (<GQCNNGrasp>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GQCNNGrasp>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GQCNNGrasp)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gqcnn-msg:<GQCNNGrasp> is deprecated: use gqcnn-msg:GQCNNGrasp instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <GQCNNGrasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:pose-val is deprecated.  Use gqcnn-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'q_value-val :lambda-list '(m))
(cl:defmethod q_value-val ((m <GQCNNGrasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:q_value-val is deprecated.  Use gqcnn-msg:q_value instead.")
  (q_value m))

(cl:ensure-generic-function 'grasp_type-val :lambda-list '(m))
(cl:defmethod grasp_type-val ((m <GQCNNGrasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:grasp_type-val is deprecated.  Use gqcnn-msg:grasp_type instead.")
  (grasp_type m))

(cl:ensure-generic-function 'center_px-val :lambda-list '(m))
(cl:defmethod center_px-val ((m <GQCNNGrasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:center_px-val is deprecated.  Use gqcnn-msg:center_px instead.")
  (center_px m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <GQCNNGrasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:angle-val is deprecated.  Use gqcnn-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <GQCNNGrasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:depth-val is deprecated.  Use gqcnn-msg:depth instead.")
  (depth m))

(cl:ensure-generic-function 'thumbnail-val :lambda-list '(m))
(cl:defmethod thumbnail-val ((m <GQCNNGrasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gqcnn-msg:thumbnail-val is deprecated.  Use gqcnn-msg:thumbnail instead.")
  (thumbnail m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<GQCNNGrasp>)))
    "Constants for message type '<GQCNNGrasp>"
  '((:PARALLEL_JAW . 0)
    (:SUCTION . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'GQCNNGrasp)))
    "Constants for message type 'GQCNNGrasp"
  '((:PARALLEL_JAW . 0)
    (:SUCTION . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GQCNNGrasp>) ostream)
  "Serializes a message object of type '<GQCNNGrasp>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'q_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'grasp_type)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'center_px))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'thumbnail) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GQCNNGrasp>) istream)
  "Deserializes a message object of type '<GQCNNGrasp>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'q_value) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'grasp_type)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'center_px) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'center_px)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'thumbnail) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GQCNNGrasp>)))
  "Returns string type for a message object of type '<GQCNNGrasp>"
  "gqcnn/GQCNNGrasp")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GQCNNGrasp)))
  "Returns string type for a message object of type 'GQCNNGrasp"
  "gqcnn/GQCNNGrasp")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GQCNNGrasp>)))
  "Returns md5sum for a message object of type '<GQCNNGrasp>"
  "42d4b9ffbd41cf1bdd4a4e08ef7d0dec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GQCNNGrasp)))
  "Returns md5sum for a message object of type 'GQCNNGrasp"
  "42d4b9ffbd41cf1bdd4a4e08ef7d0dec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GQCNNGrasp>)))
  "Returns full string definition for message of type '<GQCNNGrasp>"
  (cl:format cl:nil "# Copyright ©2017. The Regents of the University of California (Regents).~%# All Rights Reserved. Permission to use, copy, modify, and distribute this~%# software and its documentation for educational, research, and not-for-profit~%# purposes, without fee and without a signed licensing agreement, is hereby~%# granted, provided that the above copyright notice, this paragraph and the~%# following two paragraphs appear in all copies, modifications, and~%# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150~%# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,~%# otl@berkeley.edu,~%# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.~%~%# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,~%# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF~%# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN~%# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.~%~%# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,~%# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR~%# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED~%# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE~%# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.~%~%geometry_msgs/Pose pose~%float64 q_value~%~%uint8 PARALLEL_JAW=0~%uint8 SUCTION=1~%uint8 grasp_type~%~%float64[2] center_px~%float64 angle~%float64 depth~%sensor_msgs/Image thumbnail~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GQCNNGrasp)))
  "Returns full string definition for message of type 'GQCNNGrasp"
  (cl:format cl:nil "# Copyright ©2017. The Regents of the University of California (Regents).~%# All Rights Reserved. Permission to use, copy, modify, and distribute this~%# software and its documentation for educational, research, and not-for-profit~%# purposes, without fee and without a signed licensing agreement, is hereby~%# granted, provided that the above copyright notice, this paragraph and the~%# following two paragraphs appear in all copies, modifications, and~%# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150~%# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,~%# otl@berkeley.edu,~%# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.~%~%# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,~%# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF~%# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN~%# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.~%~%# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,~%# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR~%# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED~%# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE~%# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.~%~%geometry_msgs/Pose pose~%float64 q_value~%~%uint8 PARALLEL_JAW=0~%uint8 SUCTION=1~%uint8 grasp_type~%~%float64[2] center_px~%float64 angle~%float64 depth~%sensor_msgs/Image thumbnail~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GQCNNGrasp>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     8
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'center_px) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'thumbnail))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GQCNNGrasp>))
  "Converts a ROS message object to a list"
  (cl:list 'GQCNNGrasp
    (cl:cons ':pose (pose msg))
    (cl:cons ':q_value (q_value msg))
    (cl:cons ':grasp_type (grasp_type msg))
    (cl:cons ':center_px (center_px msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':depth (depth msg))
    (cl:cons ':thumbnail (thumbnail msg))
))
