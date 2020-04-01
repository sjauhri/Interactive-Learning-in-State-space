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

class DesiredForceControlMode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cartesian_dof = null;
      this.desired_force = null;
      this.desired_stiffness = null;
    }
    else {
      if (initObj.hasOwnProperty('cartesian_dof')) {
        this.cartesian_dof = initObj.cartesian_dof
      }
      else {
        this.cartesian_dof = 0;
      }
      if (initObj.hasOwnProperty('desired_force')) {
        this.desired_force = initObj.desired_force
      }
      else {
        this.desired_force = 0.0;
      }
      if (initObj.hasOwnProperty('desired_stiffness')) {
        this.desired_stiffness = initObj.desired_stiffness
      }
      else {
        this.desired_stiffness = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DesiredForceControlMode
    // Serialize message field [cartesian_dof]
    bufferOffset = _serializer.int32(obj.cartesian_dof, buffer, bufferOffset);
    // Serialize message field [desired_force]
    bufferOffset = _serializer.float64(obj.desired_force, buffer, bufferOffset);
    // Serialize message field [desired_stiffness]
    bufferOffset = _serializer.float64(obj.desired_stiffness, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DesiredForceControlMode
    let len;
    let data = new DesiredForceControlMode(null);
    // Deserialize message field [cartesian_dof]
    data.cartesian_dof = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [desired_force]
    data.desired_force = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [desired_stiffness]
    data.desired_stiffness = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/DesiredForceControlMode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da11717a4c7e94e66d2e956ead0bf6f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The degree of freedom on which the desired force
    int32 cartesian_dof
    
    # The value of the desired force. In [N].
    float64 desired_force
    
    # The value of the stiffness. In [N/m].
    float64 desired_stiffness
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DesiredForceControlMode(null);
    if (msg.cartesian_dof !== undefined) {
      resolved.cartesian_dof = msg.cartesian_dof;
    }
    else {
      resolved.cartesian_dof = 0
    }

    if (msg.desired_force !== undefined) {
      resolved.desired_force = msg.desired_force;
    }
    else {
      resolved.desired_force = 0.0
    }

    if (msg.desired_stiffness !== undefined) {
      resolved.desired_stiffness = msg.desired_stiffness;
    }
    else {
      resolved.desired_stiffness = 0.0
    }

    return resolved;
    }
};

module.exports = DesiredForceControlMode;
