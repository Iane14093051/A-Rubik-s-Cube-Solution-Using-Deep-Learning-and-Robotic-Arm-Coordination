// Auto-generated. Do not edit!

// (in-package gqcnn.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Action {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.width = null;
      this.height = null;
      this.mask_data = null;
      this.action_type = null;
      this.action_data = null;
      this.confidence = null;
    }
    else {
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('mask_data')) {
        this.mask_data = initObj.mask_data
      }
      else {
        this.mask_data = [];
      }
      if (initObj.hasOwnProperty('action_type')) {
        this.action_type = initObj.action_type
      }
      else {
        this.action_type = '';
      }
      if (initObj.hasOwnProperty('action_data')) {
        this.action_data = initObj.action_data
      }
      else {
        this.action_data = [];
      }
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Action
    // Serialize message field [width]
    bufferOffset = _serializer.uint32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.uint32(obj.height, buffer, bufferOffset);
    // Serialize message field [mask_data]
    bufferOffset = _arraySerializer.uint8(obj.mask_data, buffer, bufferOffset, null);
    // Serialize message field [action_type]
    bufferOffset = _serializer.string(obj.action_type, buffer, bufferOffset);
    // Serialize message field [action_data]
    bufferOffset = _arraySerializer.float32(obj.action_data, buffer, bufferOffset, null);
    // Serialize message field [confidence]
    bufferOffset = _serializer.float32(obj.confidence, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Action
    let len;
    let data = new Action(null);
    // Deserialize message field [width]
    data.width = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [mask_data]
    data.mask_data = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    // Deserialize message field [action_type]
    data.action_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [action_data]
    data.action_data = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [confidence]
    data.confidence = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.mask_data.length;
    length += _getByteLength(object.action_type);
    length += 4 * object.action_data.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gqcnn/Action';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ec928182aa4f966ba689e9ac10b10d2d';
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
    
    uint32 width
    uint32 height
    uint8[] mask_data
    string action_type
    float32[] action_data
    float32 confidence
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Action(null);
    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.mask_data !== undefined) {
      resolved.mask_data = msg.mask_data;
    }
    else {
      resolved.mask_data = []
    }

    if (msg.action_type !== undefined) {
      resolved.action_type = msg.action_type;
    }
    else {
      resolved.action_type = ''
    }

    if (msg.action_data !== undefined) {
      resolved.action_data = msg.action_data;
    }
    else {
      resolved.action_data = []
    }

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = 0.0
    }

    return resolved;
    }
};

module.exports = Action;
