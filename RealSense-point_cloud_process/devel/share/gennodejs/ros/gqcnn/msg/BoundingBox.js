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

class BoundingBox {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.minX = null;
      this.minY = null;
      this.maxX = null;
      this.maxY = null;
    }
    else {
      if (initObj.hasOwnProperty('minX')) {
        this.minX = initObj.minX
      }
      else {
        this.minX = 0.0;
      }
      if (initObj.hasOwnProperty('minY')) {
        this.minY = initObj.minY
      }
      else {
        this.minY = 0.0;
      }
      if (initObj.hasOwnProperty('maxX')) {
        this.maxX = initObj.maxX
      }
      else {
        this.maxX = 0.0;
      }
      if (initObj.hasOwnProperty('maxY')) {
        this.maxY = initObj.maxY
      }
      else {
        this.maxY = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BoundingBox
    // Serialize message field [minX]
    bufferOffset = _serializer.float64(obj.minX, buffer, bufferOffset);
    // Serialize message field [minY]
    bufferOffset = _serializer.float64(obj.minY, buffer, bufferOffset);
    // Serialize message field [maxX]
    bufferOffset = _serializer.float64(obj.maxX, buffer, bufferOffset);
    // Serialize message field [maxY]
    bufferOffset = _serializer.float64(obj.maxY, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BoundingBox
    let len;
    let data = new BoundingBox(null);
    // Deserialize message field [minX]
    data.minX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [minY]
    data.minY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [maxX]
    data.maxX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [maxY]
    data.maxY = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gqcnn/BoundingBox';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '316ddfac9d67d96b86cd55005b01f75e';
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
    
    float64 minX
    float64 minY
    float64 maxX
    float64 maxY
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BoundingBox(null);
    if (msg.minX !== undefined) {
      resolved.minX = msg.minX;
    }
    else {
      resolved.minX = 0.0
    }

    if (msg.minY !== undefined) {
      resolved.minY = msg.minY;
    }
    else {
      resolved.minY = 0.0
    }

    if (msg.maxX !== undefined) {
      resolved.maxX = msg.maxX;
    }
    else {
      resolved.maxX = 0.0
    }

    if (msg.maxY !== undefined) {
      resolved.maxY = msg.maxY;
    }
    else {
      resolved.maxY = 0.0
    }

    return resolved;
    }
};

module.exports = BoundingBox;
