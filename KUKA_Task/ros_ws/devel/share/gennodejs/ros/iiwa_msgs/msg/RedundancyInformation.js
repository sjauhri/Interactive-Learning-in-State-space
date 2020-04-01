// Auto-generated. Do not edit!

// (in-package iiwa_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class RedundancyInformation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.e1 = null;
      this.status = null;
      this.turn = null;
    }
    else {
      if (initObj.hasOwnProperty('e1')) {
        this.e1 = initObj.e1
      }
      else {
        this.e1 = 0.0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
      if (initObj.hasOwnProperty('turn')) {
        this.turn = initObj.turn
      }
      else {
        this.turn = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RedundancyInformation
    // Serialize message field [e1]
    bufferOffset = _serializer.float64(obj.e1, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.int32(obj.status, buffer, bufferOffset);
    // Serialize message field [turn]
    bufferOffset = _serializer.int32(obj.turn, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RedundancyInformation
    let len;
    let data = new RedundancyInformation(null);
    // Deserialize message field [e1]
    data.e1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [turn]
    data.turn = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/RedundancyInformation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '890d08bd36db91494028e6c2e0f4ecc2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # E1 parameter
    # Specifies Angle of the elbow joint.
    float64 e1
    
    # Status parameter
    #   Bit 0: 1 - The robot is working above its head
    #          0 - The robot is working in the ground area
    #   Bit 1: 1 - Angle A4 < 0°
    #          0 - Angle A4 >= 0°
    #   Bit 2: 1 - Angle A6 <= 0
    #          0 - Angle A6 > 0
    int32 status
    
    # Turn parameter
    # According to Sunrise handbook this is not used for the iiwa.
    int32 turn
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RedundancyInformation(null);
    if (msg.e1 !== undefined) {
      resolved.e1 = msg.e1;
    }
    else {
      resolved.e1 = 0.0
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    if (msg.turn !== undefined) {
      resolved.turn = msg.turn;
    }
    else {
      resolved.turn = 0
    }

    return resolved;
    }
};

module.exports = RedundancyInformation;
