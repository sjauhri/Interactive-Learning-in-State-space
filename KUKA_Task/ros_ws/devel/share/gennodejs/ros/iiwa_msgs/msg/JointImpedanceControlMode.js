// Auto-generated. Do not edit!

// (in-package iiwa_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let JointQuantity = require('./JointQuantity.js');

//-----------------------------------------------------------

class JointImpedanceControlMode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_stiffness = null;
      this.joint_damping = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_stiffness')) {
        this.joint_stiffness = initObj.joint_stiffness
      }
      else {
        this.joint_stiffness = new JointQuantity();
      }
      if (initObj.hasOwnProperty('joint_damping')) {
        this.joint_damping = initObj.joint_damping
      }
      else {
        this.joint_damping = new JointQuantity();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointImpedanceControlMode
    // Serialize message field [joint_stiffness]
    bufferOffset = JointQuantity.serialize(obj.joint_stiffness, buffer, bufferOffset);
    // Serialize message field [joint_damping]
    bufferOffset = JointQuantity.serialize(obj.joint_damping, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointImpedanceControlMode
    let len;
    let data = new JointImpedanceControlMode(null);
    // Deserialize message field [joint_stiffness]
    data.joint_stiffness = JointQuantity.deserialize(buffer, bufferOffset);
    // Deserialize message field [joint_damping]
    data.joint_damping = JointQuantity.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/JointImpedanceControlMode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c2267019473eba8c0a4619b649192c0d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Stiffness values in [Nm/rad]. Stiffness values must be >= 0. 
    JointQuantity joint_stiffness
    
    # Damping values. Damping values must be between 0 and 1. 
    JointQuantity joint_damping
    
    ================================================================================
    MSG: iiwa_msgs/JointQuantity
    float32 a1
    float32 a2
    float32 a3
    float32 a4
    float32 a5
    float32 a6
    float32 a7
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointImpedanceControlMode(null);
    if (msg.joint_stiffness !== undefined) {
      resolved.joint_stiffness = JointQuantity.Resolve(msg.joint_stiffness)
    }
    else {
      resolved.joint_stiffness = new JointQuantity()
    }

    if (msg.joint_damping !== undefined) {
      resolved.joint_damping = JointQuantity.Resolve(msg.joint_damping)
    }
    else {
      resolved.joint_damping = new JointQuantity()
    }

    return resolved;
    }
};

module.exports = JointImpedanceControlMode;
