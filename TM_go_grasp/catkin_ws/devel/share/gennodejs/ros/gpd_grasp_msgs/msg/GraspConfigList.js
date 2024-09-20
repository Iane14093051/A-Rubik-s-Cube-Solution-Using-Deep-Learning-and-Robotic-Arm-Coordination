// Auto-generated. Do not edit!

// (in-package gpd_grasp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let GraspConfig = require('./GraspConfig.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class GraspConfigList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.grasps = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('grasps')) {
        this.grasps = initObj.grasps
      }
      else {
        this.grasps = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraspConfigList
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [grasps]
    // Serialize the length for message field [grasps]
    bufferOffset = _serializer.uint32(obj.grasps.length, buffer, bufferOffset);
    obj.grasps.forEach((val) => {
      bufferOffset = GraspConfig.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraspConfigList
    let len;
    let data = new GraspConfigList(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [grasps]
    // Deserialize array length for message field [grasps]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.grasps = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.grasps[i] = GraspConfig.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 176 * object.grasps.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gpd_grasp_msgs/GraspConfigList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5e1675cb2ef4eacde35945da8d7b8c6f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message stores a list of grasp configurations.
    
    # The time of acquisition, and the coordinate frame ID.
    Header header
    
    # The list of grasp configurations.
    gpd_grasp_msgs/GraspConfig[] grasps
    
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
    MSG: gpd_grasp_msgs/GraspConfig
    # This message describes a 2-finger grasp configuration by its 6-DOF pose, 
    # consisting of a 3-DOF position and 3-DOF orientation, and the opening 
    # width of the robot hand.
    
    # Position
    geometry_msgs/Point bottom # centered bottom/base of the robot hand)
    geometry_msgs/Point top # centered top/fingertip of the robot hand)
    geometry_msgs/Point surface # centered position on object surface
    
    # Orientation represented as three axis (R = [approach binormal axis])
    geometry_msgs/Vector3 approach # The grasp approach direction
    geometry_msgs/Vector3 binormal # The binormal
    geometry_msgs/Vector3 axis # The hand axis
    
    geometry_msgs/Point sample # Point at which the grasp was found
    
    std_msgs/Float32 width # Required aperture (opening width) of the robot hand 
    
    std_msgs/Float32 score # Score assigned to the grasp by the classifier
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: std_msgs/Float32
    float32 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraspConfigList(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.grasps !== undefined) {
      resolved.grasps = new Array(msg.grasps.length);
      for (let i = 0; i < resolved.grasps.length; ++i) {
        resolved.grasps[i] = GraspConfig.Resolve(msg.grasps[i]);
      }
    }
    else {
      resolved.grasps = []
    }

    return resolved;
    }
};

module.exports = GraspConfigList;
