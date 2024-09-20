// Auto-generated. Do not edit!

// (in-package iamech_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Wheel = require('./Wheel.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class PLCStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.ServeON = null;
      this.right = null;
      this.left = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('ServeON')) {
        this.ServeON = initObj.ServeON
      }
      else {
        this.ServeON = 0;
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = new Wheel();
      }
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = new Wheel();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PLCStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [ServeON]
    bufferOffset = _serializer.int32(obj.ServeON, buffer, bufferOffset);
    // Serialize message field [right]
    bufferOffset = Wheel.serialize(obj.right, buffer, bufferOffset);
    // Serialize message field [left]
    bufferOffset = Wheel.serialize(obj.left, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PLCStatus
    let len;
    let data = new PLCStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [ServeON]
    data.ServeON = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [right]
    data.right = Wheel.deserialize(buffer, bufferOffset);
    // Deserialize message field [left]
    data.left = Wheel.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 68;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iamech_ros/PLCStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3ef7303dd3b56e2cbae2954451853687';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    int32 ServeON
    Wheel right
    Wheel left
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
    MSG: iamech_ros/Wheel
    int32 bReady
    int32 bMoving
    int32 bError
    int32 pos
    int32 velocity
    int32 ErrorCode
    int32 temperature
    int32 volt
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PLCStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.ServeON !== undefined) {
      resolved.ServeON = msg.ServeON;
    }
    else {
      resolved.ServeON = 0
    }

    if (msg.right !== undefined) {
      resolved.right = Wheel.Resolve(msg.right)
    }
    else {
      resolved.right = new Wheel()
    }

    if (msg.left !== undefined) {
      resolved.left = Wheel.Resolve(msg.left)
    }
    else {
      resolved.left = new Wheel()
    }

    return resolved;
    }
};

module.exports = PLCStatus;
