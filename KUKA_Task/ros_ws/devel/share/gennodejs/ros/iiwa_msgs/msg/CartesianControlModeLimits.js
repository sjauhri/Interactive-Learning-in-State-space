// Auto-generated. Do not edit!

// (in-package iiwa_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CartesianQuantity = require('./CartesianQuantity.js');

//-----------------------------------------------------------

class CartesianControlModeLimits {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max_path_deviation = null;
      this.max_control_force = null;
      this.max_control_force_stop = null;
      this.max_cartesian_velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('max_path_deviation')) {
        this.max_path_deviation = initObj.max_path_deviation
      }
      else {
        this.max_path_deviation = new CartesianQuantity();
      }
      if (initObj.hasOwnProperty('max_control_force')) {
        this.max_control_force = initObj.max_control_force
      }
      else {
        this.max_control_force = new CartesianQuantity();
      }
      if (initObj.hasOwnProperty('max_control_force_stop')) {
        this.max_control_force_stop = initObj.max_control_force_stop
      }
      else {
        this.max_control_force_stop = false;
      }
      if (initObj.hasOwnProperty('max_cartesian_velocity')) {
        this.max_cartesian_velocity = initObj.max_cartesian_velocity
      }
      else {
        this.max_cartesian_velocity = new CartesianQuantity();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartesianControlModeLimits
    // Serialize message field [max_path_deviation]
    bufferOffset = CartesianQuantity.serialize(obj.max_path_deviation, buffer, bufferOffset);
    // Serialize message field [max_control_force]
    bufferOffset = CartesianQuantity.serialize(obj.max_control_force, buffer, bufferOffset);
    // Serialize message field [max_control_force_stop]
    bufferOffset = _serializer.bool(obj.max_control_force_stop, buffer, bufferOffset);
    // Serialize message field [max_cartesian_velocity]
    bufferOffset = CartesianQuantity.serialize(obj.max_cartesian_velocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartesianControlModeLimits
    let len;
    let data = new CartesianControlModeLimits(null);
    // Deserialize message field [max_path_deviation]
    data.max_path_deviation = CartesianQuantity.deserialize(buffer, bufferOffset);
    // Deserialize message field [max_control_force]
    data.max_control_force = CartesianQuantity.deserialize(buffer, bufferOffset);
    // Deserialize message field [max_control_force_stop]
    data.max_control_force_stop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [max_cartesian_velocity]
    data.max_cartesian_velocity = CartesianQuantity.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 73;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/CartesianControlModeLimits';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '36b3a99aeab262cf60ecef9129ccb529';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Sets the maximum cartesian deviation accepted. If the deviation is exceeded a stop condition occurs. 
    # [x, y, z] in [mm]. Precondition: value > 0.0.
    # [a, b, c] in [rad]. Precondition: value > 0.0.
    CartesianQuantity max_path_deviation
    
    # The maximum control force parameter.
    # [x, y, z] in [N]. Precondition: value > 0.0.
    # [a, b, c] in [Nm]. Precondition: value > 0.0.
    CartesianQuantity max_control_force
    
    # Indicates whether a stop condition is fired if the maximum control force is exceeded. 
    bool max_control_force_stop
    
    # Maximum Cartesian velocity parameter 
    # [x, y, z] in [mm/s]. Precondition: value > 0.0.
    # [a, b, c] in [rad/s]. Precondition: value > 0.0.
    CartesianQuantity max_cartesian_velocity 
    
    ================================================================================
    MSG: iiwa_msgs/CartesianQuantity
    float32 x
    float32 y
    float32 z
    float32 a
    float32 b
    float32 c
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CartesianControlModeLimits(null);
    if (msg.max_path_deviation !== undefined) {
      resolved.max_path_deviation = CartesianQuantity.Resolve(msg.max_path_deviation)
    }
    else {
      resolved.max_path_deviation = new CartesianQuantity()
    }

    if (msg.max_control_force !== undefined) {
      resolved.max_control_force = CartesianQuantity.Resolve(msg.max_control_force)
    }
    else {
      resolved.max_control_force = new CartesianQuantity()
    }

    if (msg.max_control_force_stop !== undefined) {
      resolved.max_control_force_stop = msg.max_control_force_stop;
    }
    else {
      resolved.max_control_force_stop = false
    }

    if (msg.max_cartesian_velocity !== undefined) {
      resolved.max_cartesian_velocity = CartesianQuantity.Resolve(msg.max_cartesian_velocity)
    }
    else {
      resolved.max_cartesian_velocity = new CartesianQuantity()
    }

    return resolved;
    }
};

module.exports = CartesianControlModeLimits;
