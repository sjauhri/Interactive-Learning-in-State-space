// Auto-generated. Do not edit!

// (in-package iiwa_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetSmartServoLinSpeedLimitsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max_cartesian_velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('max_cartesian_velocity')) {
        this.max_cartesian_velocity = initObj.max_cartesian_velocity
      }
      else {
        this.max_cartesian_velocity = new geometry_msgs.msg.Twist();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetSmartServoLinSpeedLimitsRequest
    // Serialize message field [max_cartesian_velocity]
    bufferOffset = geometry_msgs.msg.Twist.serialize(obj.max_cartesian_velocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetSmartServoLinSpeedLimitsRequest
    let len;
    let data = new SetSmartServoLinSpeedLimitsRequest(null);
    // Deserialize message field [max_cartesian_velocity]
    data.max_cartesian_velocity = geometry_msgs.msg.Twist.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/SetSmartServoLinSpeedLimitsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b0bfa3511a969819a8206a03ae719380';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    geometry_msgs/Twist max_cartesian_velocity
    
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetSmartServoLinSpeedLimitsRequest(null);
    if (msg.max_cartesian_velocity !== undefined) {
      resolved.max_cartesian_velocity = geometry_msgs.msg.Twist.Resolve(msg.max_cartesian_velocity)
    }
    else {
      resolved.max_cartesian_velocity = new geometry_msgs.msg.Twist()
    }

    return resolved;
    }
};

class SetSmartServoLinSpeedLimitsResponse {
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
    // Serializes a message object of type SetSmartServoLinSpeedLimitsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetSmartServoLinSpeedLimitsResponse
    let len;
    let data = new SetSmartServoLinSpeedLimitsResponse(null);
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
    return 'iiwa_msgs/SetSmartServoLinSpeedLimitsResponse';
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
    const resolved = new SetSmartServoLinSpeedLimitsResponse(null);
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
  Request: SetSmartServoLinSpeedLimitsRequest,
  Response: SetSmartServoLinSpeedLimitsResponse,
  md5sum() { return 'ba27ded3da7c7c0e58e5316ff3ba3f60'; },
  datatype() { return 'iiwa_msgs/SetSmartServoLinSpeedLimits'; }
};
