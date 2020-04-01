// Auto-generated. Do not edit!

// (in-package iiwa_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetSpeedOverrideRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.override_reduction = null;
    }
    else {
      if (initObj.hasOwnProperty('override_reduction')) {
        this.override_reduction = initObj.override_reduction
      }
      else {
        this.override_reduction = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetSpeedOverrideRequest
    // Serialize message field [override_reduction]
    bufferOffset = _serializer.float64(obj.override_reduction, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetSpeedOverrideRequest
    let len;
    let data = new SetSpeedOverrideRequest(null);
    // Deserialize message field [override_reduction]
    data.override_reduction = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/SetSpeedOverrideRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '45f4da4800337d6726e14c18e252b8dc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float64 override_reduction
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetSpeedOverrideRequest(null);
    if (msg.override_reduction !== undefined) {
      resolved.override_reduction = msg.override_reduction;
    }
    else {
      resolved.override_reduction = 0.0
    }

    return resolved;
    }
};

class SetSpeedOverrideResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.error = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetSpeedOverrideResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetSpeedOverrideResponse
    let len;
    let data = new SetSpeedOverrideResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.error.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/SetSpeedOverrideResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '45872d25d65c97743cc71afc6d4e884d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool success
    string error
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetSpeedOverrideResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SetSpeedOverrideRequest,
  Response: SetSpeedOverrideResponse,
  md5sum() { return '5cb6d9d155adc8ed76143d144d178f68'; },
  datatype() { return 'iiwa_msgs/SetSpeedOverride'; }
};
