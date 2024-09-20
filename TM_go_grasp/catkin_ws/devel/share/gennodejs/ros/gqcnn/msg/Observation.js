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

class Observation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.width = null;
      this.height = null;
      this.image_data = null;
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
      if (initObj.hasOwnProperty('image_data')) {
        this.image_data = initObj.image_data
      }
      else {
        this.image_data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Observation
    // Serialize message field [width]
    bufferOffset = _serializer.uint32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.uint32(obj.height, buffer, bufferOffset);
    // Serialize message field [image_data]
    bufferOffset = _arraySerializer.float32(obj.image_data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Observation
    let len;
    let data = new Observation(null);
    // Deserialize message field [width]
    data.width = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [image_data]
    data.image_data = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.image_data.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gqcnn/Observation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c65489c2c2d2e14daf0f0525a5d2a78';
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
    float32[] image_data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Observation(null);
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

    if (msg.image_data !== undefined) {
      resolved.image_data = msg.image_data;
    }
    else {
      resolved.image_data = []
    }

    return resolved;
    }
};

module.exports = Observation;
