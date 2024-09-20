// Auto-generated. Do not edit!

// (in-package iamech_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Wheel {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bReady = null;
      this.bMoving = null;
      this.bError = null;
      this.pos = null;
      this.velocity = null;
      this.ErrorCode = null;
      this.temperature = null;
      this.volt = null;
    }
    else {
      if (initObj.hasOwnProperty('bReady')) {
        this.bReady = initObj.bReady
      }
      else {
        this.bReady = 0;
      }
      if (initObj.hasOwnProperty('bMoving')) {
        this.bMoving = initObj.bMoving
      }
      else {
        this.bMoving = 0;
      }
      if (initObj.hasOwnProperty('bError')) {
        this.bError = initObj.bError
      }
      else {
        this.bError = 0;
      }
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = 0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0;
      }
      if (initObj.hasOwnProperty('ErrorCode')) {
        this.ErrorCode = initObj.ErrorCode
      }
      else {
        this.ErrorCode = 0;
      }
      if (initObj.hasOwnProperty('temperature')) {
        this.temperature = initObj.temperature
      }
      else {
        this.temperature = 0;
      }
      if (initObj.hasOwnProperty('volt')) {
        this.volt = initObj.volt
      }
      else {
        this.volt = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Wheel
    // Serialize message field [bReady]
    bufferOffset = _serializer.int32(obj.bReady, buffer, bufferOffset);
    // Serialize message field [bMoving]
    bufferOffset = _serializer.int32(obj.bMoving, buffer, bufferOffset);
    // Serialize message field [bError]
    bufferOffset = _serializer.int32(obj.bError, buffer, bufferOffset);
    // Serialize message field [pos]
    bufferOffset = _serializer.int32(obj.pos, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.int32(obj.velocity, buffer, bufferOffset);
    // Serialize message field [ErrorCode]
    bufferOffset = _serializer.int32(obj.ErrorCode, buffer, bufferOffset);
    // Serialize message field [temperature]
    bufferOffset = _serializer.int32(obj.temperature, buffer, bufferOffset);
    // Serialize message field [volt]
    bufferOffset = _serializer.int32(obj.volt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Wheel
    let len;
    let data = new Wheel(null);
    // Deserialize message field [bReady]
    data.bReady = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [bMoving]
    data.bMoving = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [bError]
    data.bError = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pos]
    data.pos = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ErrorCode]
    data.ErrorCode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [temperature]
    data.temperature = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [volt]
    data.volt = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iamech_ros/Wheel';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb0e446b2d87810af5b33fbf4f7f9055';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Wheel(null);
    if (msg.bReady !== undefined) {
      resolved.bReady = msg.bReady;
    }
    else {
      resolved.bReady = 0
    }

    if (msg.bMoving !== undefined) {
      resolved.bMoving = msg.bMoving;
    }
    else {
      resolved.bMoving = 0
    }

    if (msg.bError !== undefined) {
      resolved.bError = msg.bError;
    }
    else {
      resolved.bError = 0
    }

    if (msg.pos !== undefined) {
      resolved.pos = msg.pos;
    }
    else {
      resolved.pos = 0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0
    }

    if (msg.ErrorCode !== undefined) {
      resolved.ErrorCode = msg.ErrorCode;
    }
    else {
      resolved.ErrorCode = 0
    }

    if (msg.temperature !== undefined) {
      resolved.temperature = msg.temperature;
    }
    else {
      resolved.temperature = 0
    }

    if (msg.volt !== undefined) {
      resolved.volt = msg.volt;
    }
    else {
      resolved.volt = 0
    }

    return resolved;
    }
};

module.exports = Wheel;
