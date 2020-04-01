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

class SetPTPCartesianSpeedLimitsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.maxCartesianVelocity = null;
      this.maxOrientationVelocity = null;
      this.maxCartesianAcceleration = null;
      this.maxOrientationAcceleration = null;
      this.maxCartesianJerk = null;
      this.maxOrientationJerk = null;
    }
    else {
      if (initObj.hasOwnProperty('maxCartesianVelocity')) {
        this.maxCartesianVelocity = initObj.maxCartesianVelocity
      }
      else {
        this.maxCartesianVelocity = 0.0;
      }
      if (initObj.hasOwnProperty('maxOrientationVelocity')) {
        this.maxOrientationVelocity = initObj.maxOrientationVelocity
      }
      else {
        this.maxOrientationVelocity = 0.0;
      }
      if (initObj.hasOwnProperty('maxCartesianAcceleration')) {
        this.maxCartesianAcceleration = initObj.maxCartesianAcceleration
      }
      else {
        this.maxCartesianAcceleration = 0.0;
      }
      if (initObj.hasOwnProperty('maxOrientationAcceleration')) {
        this.maxOrientationAcceleration = initObj.maxOrientationAcceleration
      }
      else {
        this.maxOrientationAcceleration = 0.0;
      }
      if (initObj.hasOwnProperty('maxCartesianJerk')) {
        this.maxCartesianJerk = initObj.maxCartesianJerk
      }
      else {
        this.maxCartesianJerk = 0.0;
      }
      if (initObj.hasOwnProperty('maxOrientationJerk')) {
        this.maxOrientationJerk = initObj.maxOrientationJerk
      }
      else {
        this.maxOrientationJerk = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetPTPCartesianSpeedLimitsRequest
    // Serialize message field [maxCartesianVelocity]
    bufferOffset = _serializer.float64(obj.maxCartesianVelocity, buffer, bufferOffset);
    // Serialize message field [maxOrientationVelocity]
    bufferOffset = _serializer.float64(obj.maxOrientationVelocity, buffer, bufferOffset);
    // Serialize message field [maxCartesianAcceleration]
    bufferOffset = _serializer.float64(obj.maxCartesianAcceleration, buffer, bufferOffset);
    // Serialize message field [maxOrientationAcceleration]
    bufferOffset = _serializer.float64(obj.maxOrientationAcceleration, buffer, bufferOffset);
    // Serialize message field [maxCartesianJerk]
    bufferOffset = _serializer.float64(obj.maxCartesianJerk, buffer, bufferOffset);
    // Serialize message field [maxOrientationJerk]
    bufferOffset = _serializer.float64(obj.maxOrientationJerk, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPTPCartesianSpeedLimitsRequest
    let len;
    let data = new SetPTPCartesianSpeedLimitsRequest(null);
    // Deserialize message field [maxCartesianVelocity]
    data.maxCartesianVelocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [maxOrientationVelocity]
    data.maxOrientationVelocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [maxCartesianAcceleration]
    data.maxCartesianAcceleration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [maxOrientationAcceleration]
    data.maxOrientationAcceleration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [maxCartesianJerk]
    data.maxCartesianJerk = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [maxOrientationJerk]
    data.maxOrientationJerk = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/SetPTPCartesianSpeedLimitsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '469cc9876df809f4fef0a769a1863a33';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    
    float64 maxCartesianVelocity
    
    
    float64 maxOrientationVelocity
    
    
    float64 maxCartesianAcceleration
    
    
    float64 maxOrientationAcceleration
    
    
    float64 maxCartesianJerk
    
    
    float64 maxOrientationJerk
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetPTPCartesianSpeedLimitsRequest(null);
    if (msg.maxCartesianVelocity !== undefined) {
      resolved.maxCartesianVelocity = msg.maxCartesianVelocity;
    }
    else {
      resolved.maxCartesianVelocity = 0.0
    }

    if (msg.maxOrientationVelocity !== undefined) {
      resolved.maxOrientationVelocity = msg.maxOrientationVelocity;
    }
    else {
      resolved.maxOrientationVelocity = 0.0
    }

    if (msg.maxCartesianAcceleration !== undefined) {
      resolved.maxCartesianAcceleration = msg.maxCartesianAcceleration;
    }
    else {
      resolved.maxCartesianAcceleration = 0.0
    }

    if (msg.maxOrientationAcceleration !== undefined) {
      resolved.maxOrientationAcceleration = msg.maxOrientationAcceleration;
    }
    else {
      resolved.maxOrientationAcceleration = 0.0
    }

    if (msg.maxCartesianJerk !== undefined) {
      resolved.maxCartesianJerk = msg.maxCartesianJerk;
    }
    else {
      resolved.maxCartesianJerk = 0.0
    }

    if (msg.maxOrientationJerk !== undefined) {
      resolved.maxOrientationJerk = msg.maxOrientationJerk;
    }
    else {
      resolved.maxOrientationJerk = 0.0
    }

    return resolved;
    }
};

class SetPTPCartesianSpeedLimitsResponse {
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
    // Serializes a message object of type SetPTPCartesianSpeedLimitsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPTPCartesianSpeedLimitsResponse
    let len;
    let data = new SetPTPCartesianSpeedLimitsResponse(null);
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
    return 'iiwa_msgs/SetPTPCartesianSpeedLimitsResponse';
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
    const resolved = new SetPTPCartesianSpeedLimitsResponse(null);
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
  Request: SetPTPCartesianSpeedLimitsRequest,
  Response: SetPTPCartesianSpeedLimitsResponse,
  md5sum() { return 'f4c42c9db5a373c4820a5b6872a3a795'; },
  datatype() { return 'iiwa_msgs/SetPTPCartesianSpeedLimits'; }
};
