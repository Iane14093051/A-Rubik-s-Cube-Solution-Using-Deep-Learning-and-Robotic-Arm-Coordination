// Auto-generated. Do not edit!

// (in-package gqcnn.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

let GQCNNGrasp = require('../msg/GQCNNGrasp.js');

//-----------------------------------------------------------

class GQCNNGraspPlannerRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.color_image = null;
      this.depth_image = null;
      this.camera_info = null;
    }
    else {
      if (initObj.hasOwnProperty('color_image')) {
        this.color_image = initObj.color_image
      }
      else {
        this.color_image = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('depth_image')) {
        this.depth_image = initObj.depth_image
      }
      else {
        this.depth_image = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('camera_info')) {
        this.camera_info = initObj.camera_info
      }
      else {
        this.camera_info = new sensor_msgs.msg.CameraInfo();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GQCNNGraspPlannerRequest
    // Serialize message field [color_image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.color_image, buffer, bufferOffset);
    // Serialize message field [depth_image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.depth_image, buffer, bufferOffset);
    // Serialize message field [camera_info]
    bufferOffset = sensor_msgs.msg.CameraInfo.serialize(obj.camera_info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GQCNNGraspPlannerRequest
    let len;
    let data = new GQCNNGraspPlannerRequest(null);
    // Deserialize message field [color_image]
    data.color_image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [depth_image]
    data.depth_image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [camera_info]
    data.camera_info = sensor_msgs.msg.CameraInfo.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.Image.getMessageSize(object.color_image);
    length += sensor_msgs.msg.Image.getMessageSize(object.depth_image);
    length += sensor_msgs.msg.CameraInfo.getMessageSize(object.camera_info);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gqcnn/GQCNNGraspPlannerRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '03b0dc52e65aaa491bdce634928a0bcd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Copyright ©2017. The Regents of the University of California (Regents).
    # All Rights Reserved. Permission to use, copy, modify, and distribute this
    # software and its documentation for educational, research, and not-for-profit
    # purposes, without fee and without a signed licensing agreement, is hereby
    # granted, provided that the above copyright notice, this paragraph and the
    # following two paragraphs appear in all copies, modifications, and
    # distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150
    # Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,
    # otl@berkeley.edu,
    # http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.
    
    # IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,
    # INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF
    # THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN
    # ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    
    # REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
    # THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    # PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED
    # HEREUNDER IS PROVIDED "AS IS". REGENTS HAS NO OBLIGATION TO PROVIDE
    # MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
    
    # request params
    sensor_msgs/Image color_image
    sensor_msgs/Image depth_image
    sensor_msgs/CameraInfo camera_info
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
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
    MSG: sensor_msgs/CameraInfo
    # This message defines meta information for a camera. It should be in a
    # camera namespace on topic "camera_info" and accompanied by up to five
    # image topics named:
    #
    #   image_raw - raw data from the camera driver, possibly Bayer encoded
    #   image            - monochrome, distorted
    #   image_color      - color, distorted
    #   image_rect       - monochrome, rectified
    #   image_rect_color - color, rectified
    #
    # The image_pipeline contains packages (image_proc, stereo_image_proc)
    # for producing the four processed image topics from image_raw and
    # camera_info. The meaning of the camera parameters are described in
    # detail at http://www.ros.org/wiki/image_pipeline/CameraInfo.
    #
    # The image_geometry package provides a user-friendly interface to
    # common operations using this meta information. If you want to, e.g.,
    # project a 3d point into image coordinates, we strongly recommend
    # using image_geometry.
    #
    # If the camera is uncalibrated, the matrices D, K, R, P should be left
    # zeroed out. In particular, clients may assume that K[0] == 0.0
    # indicates an uncalibrated camera.
    
    #######################################################################
    #                     Image acquisition info                          #
    #######################################################################
    
    # Time of image acquisition, camera coordinate frame ID
    Header header    # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into the plane of the image
    
    
    #######################################################################
    #                      Calibration Parameters                         #
    #######################################################################
    # These are fixed during camera calibration. Their values will be the #
    # same in all messages until the camera is recalibrated. Note that    #
    # self-calibrating systems may "recalibrate" frequently.              #
    #                                                                     #
    # The internal parameters can be used to warp a raw (distorted) image #
    # to:                                                                 #
    #   1. An undistorted image (requires D and K)                        #
    #   2. A rectified image (requires D, K, R)                           #
    # The projection matrix P projects 3D points into the rectified image.#
    #######################################################################
    
    # The image dimensions with which the camera was calibrated. Normally
    # this will be the full camera resolution in pixels.
    uint32 height
    uint32 width
    
    # The distortion model used. Supported models are listed in
    # sensor_msgs/distortion_models.h. For most cameras, "plumb_bob" - a
    # simple model of radial and tangential distortion - is sufficient.
    string distortion_model
    
    # The distortion parameters, size depending on the distortion model.
    # For "plumb_bob", the 5 parameters are: (k1, k2, t1, t2, k3).
    float64[] D
    
    # Intrinsic camera matrix for the raw (distorted) images.
    #     [fx  0 cx]
    # K = [ 0 fy cy]
    #     [ 0  0  1]
    # Projects 3D points in the camera coordinate frame to 2D pixel
    # coordinates using the focal lengths (fx, fy) and principal point
    # (cx, cy).
    float64[9]  K # 3x3 row-major matrix
    
    # Rectification matrix (stereo cameras only)
    # A rotation matrix aligning the camera coordinate system to the ideal
    # stereo image plane so that epipolar lines in both stereo images are
    # parallel.
    float64[9]  R # 3x3 row-major matrix
    
    # Projection/camera matrix
    #     [fx'  0  cx' Tx]
    # P = [ 0  fy' cy' Ty]
    #     [ 0   0   1   0]
    # By convention, this matrix specifies the intrinsic (camera) matrix
    #  of the processed (rectified) image. That is, the left 3x3 portion
    #  is the normal camera intrinsic matrix for the rectified image.
    # It projects 3D points in the camera coordinate frame to 2D pixel
    #  coordinates using the focal lengths (fx', fy') and principal point
    #  (cx', cy') - these may differ from the values in K.
    # For monocular cameras, Tx = Ty = 0. Normally, monocular cameras will
    #  also have R = the identity and P[1:3,1:3] = K.
    # For a stereo pair, the fourth column [Tx Ty 0]' is related to the
    #  position of the optical center of the second camera in the first
    #  camera's frame. We assume Tz = 0 so both cameras are in the same
    #  stereo image plane. The first camera always has Tx = Ty = 0. For
    #  the right (second) camera of a horizontal stereo pair, Ty = 0 and
    #  Tx = -fx' * B, where B is the baseline between the cameras.
    # Given a 3D point [X Y Z]', the projection (x, y) of the point onto
    #  the rectified image is given by:
    #  [u v w]' = P * [X Y Z 1]'
    #         x = u / w
    #         y = v / w
    #  This holds for both images of a stereo pair.
    float64[12] P # 3x4 row-major matrix
    
    
    #######################################################################
    #                      Operational Parameters                         #
    #######################################################################
    # These define the image region actually captured by the camera       #
    # driver. Although they affect the geometry of the output image, they #
    # may be changed freely without recalibrating the camera.             #
    #######################################################################
    
    # Binning refers here to any camera setting which combines rectangular
    #  neighborhoods of pixels into larger "super-pixels." It reduces the
    #  resolution of the output image to
    #  (width / binning_x) x (height / binning_y).
    # The default values binning_x = binning_y = 0 is considered the same
    #  as binning_x = binning_y = 1 (no subsampling).
    uint32 binning_x
    uint32 binning_y
    
    # Region of interest (subwindow of full camera resolution), given in
    #  full resolution (unbinned) image coordinates. A particular ROI
    #  always denotes the same window of pixels on the camera sensor,
    #  regardless of binning settings.
    # The default setting of roi (all values 0) is considered the same as
    #  full resolution (roi.width = width, roi.height = height).
    RegionOfInterest roi
    
    ================================================================================
    MSG: sensor_msgs/RegionOfInterest
    # This message is used to specify a region of interest within an image.
    #
    # When used to specify the ROI setting of the camera when the image was
    # taken, the height and width fields should either match the height and
    # width fields for the associated image; or height = width = 0
    # indicates that the full resolution image was captured.
    
    uint32 x_offset  # Leftmost pixel of the ROI
                     # (0 if the ROI includes the left edge of the image)
    uint32 y_offset  # Topmost pixel of the ROI
                     # (0 if the ROI includes the top edge of the image)
    uint32 height    # Height of ROI
    uint32 width     # Width of ROI
    
    # True if a distinct rectified ROI should be calculated from the "raw"
    # ROI in this message. Typically this should be False if the full image
    # is captured (ROI not used), and True if a subwindow is captured (ROI
    # used).
    bool do_rectify
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GQCNNGraspPlannerRequest(null);
    if (msg.color_image !== undefined) {
      resolved.color_image = sensor_msgs.msg.Image.Resolve(msg.color_image)
    }
    else {
      resolved.color_image = new sensor_msgs.msg.Image()
    }

    if (msg.depth_image !== undefined) {
      resolved.depth_image = sensor_msgs.msg.Image.Resolve(msg.depth_image)
    }
    else {
      resolved.depth_image = new sensor_msgs.msg.Image()
    }

    if (msg.camera_info !== undefined) {
      resolved.camera_info = sensor_msgs.msg.CameraInfo.Resolve(msg.camera_info)
    }
    else {
      resolved.camera_info = new sensor_msgs.msg.CameraInfo()
    }

    return resolved;
    }
};

class GQCNNGraspPlannerResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.grasp = null;
    }
    else {
      if (initObj.hasOwnProperty('grasp')) {
        this.grasp = initObj.grasp
      }
      else {
        this.grasp = new GQCNNGrasp();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GQCNNGraspPlannerResponse
    // Serialize message field [grasp]
    bufferOffset = GQCNNGrasp.serialize(obj.grasp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GQCNNGraspPlannerResponse
    let len;
    let data = new GQCNNGraspPlannerResponse(null);
    // Deserialize message field [grasp]
    data.grasp = GQCNNGrasp.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += GQCNNGrasp.getMessageSize(object.grasp);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gqcnn/GQCNNGraspPlannerResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed2996f74c00186d31646a6475f8155c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # response params
    GQCNNGrasp grasp
    
    
    ================================================================================
    MSG: gqcnn/GQCNNGrasp
    # Copyright ©2017. The Regents of the University of California (Regents).
    # All Rights Reserved. Permission to use, copy, modify, and distribute this
    # software and its documentation for educational, research, and not-for-profit
    # purposes, without fee and without a signed licensing agreement, is hereby
    # granted, provided that the above copyright notice, this paragraph and the
    # following two paragraphs appear in all copies, modifications, and
    # distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150
    # Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,
    # otl@berkeley.edu,
    # http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.
    
    # IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,
    # INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF
    # THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN
    # ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    
    # REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
    # THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    # PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED
    # HEREUNDER IS PROVIDED "AS IS". REGENTS HAS NO OBLIGATION TO PROVIDE
    # MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
    
    geometry_msgs/Pose pose
    float64 q_value
    
    uint8 PARALLEL_JAW=0
    uint8 SUCTION=1
    uint8 grasp_type
    
    float64[2] center_px
    float64 angle
    float64 depth
    sensor_msgs/Image thumbnail
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GQCNNGraspPlannerResponse(null);
    if (msg.grasp !== undefined) {
      resolved.grasp = GQCNNGrasp.Resolve(msg.grasp)
    }
    else {
      resolved.grasp = new GQCNNGrasp()
    }

    return resolved;
    }
};

module.exports = {
  Request: GQCNNGraspPlannerRequest,
  Response: GQCNNGraspPlannerResponse,
  md5sum() { return 'be2b5a0ae6a907891671c87f1b537a42'; },
  datatype() { return 'gqcnn/GQCNNGraspPlanner'; }
};
