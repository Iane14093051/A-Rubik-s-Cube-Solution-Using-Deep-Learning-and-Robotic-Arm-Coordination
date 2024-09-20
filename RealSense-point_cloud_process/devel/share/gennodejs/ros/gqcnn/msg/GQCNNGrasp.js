// Auto-generated. Do not edit!

// (in-package gqcnn.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GQCNNGrasp {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose = null;
      this.q_value = null;
      this.grasp_type = null;
      this.center_px = null;
      this.angle = null;
      this.depth = null;
      this.thumbnail = null;
    }
    else {
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('q_value')) {
        this.q_value = initObj.q_value
      }
      else {
        this.q_value = 0.0;
      }
      if (initObj.hasOwnProperty('grasp_type')) {
        this.grasp_type = initObj.grasp_type
      }
      else {
        this.grasp_type = 0;
      }
      if (initObj.hasOwnProperty('center_px')) {
        this.center_px = initObj.center_px
      }
      else {
        this.center_px = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
      if (initObj.hasOwnProperty('depth')) {
        this.depth = initObj.depth
      }
      else {
        this.depth = 0.0;
      }
      if (initObj.hasOwnProperty('thumbnail')) {
        this.thumbnail = initObj.thumbnail
      }
      else {
        this.thumbnail = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GQCNNGrasp
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [q_value]
    bufferOffset = _serializer.float64(obj.q_value, buffer, bufferOffset);
    // Serialize message field [grasp_type]
    bufferOffset = _serializer.uint8(obj.grasp_type, buffer, bufferOffset);
    // Check that the constant length array field [center_px] has the right length
    if (obj.center_px.length !== 2) {
      throw new Error('Unable to serialize array field center_px - length must be 2')
    }
    // Serialize message field [center_px]
    bufferOffset = _arraySerializer.float64(obj.center_px, buffer, bufferOffset, 2);
    // Serialize message field [angle]
    bufferOffset = _serializer.float64(obj.angle, buffer, bufferOffset);
    // Serialize message field [depth]
    bufferOffset = _serializer.float64(obj.depth, buffer, bufferOffset);
    // Serialize message field [thumbnail]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.thumbnail, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GQCNNGrasp
    let len;
    let data = new GQCNNGrasp(null);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [q_value]
    data.q_value = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [grasp_type]
    data.grasp_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [center_px]
    data.center_px = _arrayDeserializer.float64(buffer, bufferOffset, 2)
    // Deserialize message field [angle]
    data.angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth]
    data.depth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [thumbnail]
    data.thumbnail = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.Image.getMessageSize(object.thumbnail);
    return length + 97;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gqcnn/GQCNNGrasp';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '42d4b9ffbd41cf1bdd4a4e08ef7d0dec';
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
    const resolved = new GQCNNGrasp(null);
    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    if (msg.q_value !== undefined) {
      resolved.q_value = msg.q_value;
    }
    else {
      resolved.q_value = 0.0
    }

    if (msg.grasp_type !== undefined) {
      resolved.grasp_type = msg.grasp_type;
    }
    else {
      resolved.grasp_type = 0
    }

    if (msg.center_px !== undefined) {
      resolved.center_px = msg.center_px;
    }
    else {
      resolved.center_px = new Array(2).fill(0)
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    if (msg.depth !== undefined) {
      resolved.depth = msg.depth;
    }
    else {
      resolved.depth = 0.0
    }

    if (msg.thumbnail !== undefined) {
      resolved.thumbnail = sensor_msgs.msg.Image.Resolve(msg.thumbnail)
    }
    else {
      resolved.thumbnail = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

// Constants for message
GQCNNGrasp.Constants = {
  PARALLEL_JAW: 0,
  SUCTION: 1,
}

module.exports = GQCNNGrasp;
