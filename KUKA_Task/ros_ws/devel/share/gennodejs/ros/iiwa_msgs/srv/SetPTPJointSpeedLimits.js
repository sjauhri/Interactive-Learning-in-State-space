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

class SetPTPJointSpeedLimitsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_relative_velocity = null;
      this.joint_relative_acceleration = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_relative_velocity')) {
        this.joint_relative_velocity = initObj.joint_relative_velocity
      }
      else {
        this.joint_relative_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('joint_relative_acceleration')) {
        this.joint_relative_acceleration = initObj.joint_relative_acceleration
      }
      else {
        this.joint_relative_acceleration = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetPTPJointSpeedLimitsRequest
    // Serialize message field [joint_relative_velocity]
    bufferOffset = _serializer.float64(obj.joint_relative_velocity, buffer, bufferOffset);
    // Serialize message field [joint_relative_acceleration]
    bufferOffset = _serializer.float64(obj.joint_relative_acceleration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPTPJointSpeedLimitsRequest
    let len;
    let data = new SetPTPJointSpeedLimitsRequest(null);
    // Deserialize message field [joint_relative_velocity]
    data.joint_relative_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_relative_acceleration]
    data.joint_relative_acceleration = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/SetPTPJointSpeedLimitsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cffe08de2ff0d463a331a61c2c921277';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    
    float64 joint_relative_velocity
    
    
    float64 joint_relative_acceleration
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetPTPJointSpeedLimitsRequest(null);
    if (msg.joint_relative_velocity !== undefined) {
      resolved.joint_relative_velocity = msg.joint_relative_velocity;
    }
    else {
      resolved.joint_relative_velocity = 0.0
    }

    if (msg.joint_relative_acceleration !== undefined) {
      resolved.joint_relative_acceleration = msg.joint_relative_acceleration;
    }
    else {
      resolved.joint_relative_acceleration = 0.0
    }

    return resolved;
    }
};

class SetPTPJointSpeedLimitsResponse {
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
    // Serializes a message object of type SetPTPJointSpeedLimitsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPTPJointSpeedLimitsResponse
    let len;
    let data = new SetPTPJointSpeedLimitsResponse(null);
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
    return 'iiwa_msgs/SetPTPJointSpeedLimitsResponse';
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
    const resolved = new SetPTPJointSpeedLimitsResponse(null);
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
  Request: SetPTPJointSpeedLimitsRequest,
  Response: SetPTPJointSpeedLimitsResponse,
  md5sum() { return 'e5ffdd082606e43192e0949ab1d5a1f3'; },
  datatype() { return 'iiwa_msgs/SetPTPJointSpeedLimits'; }
};
