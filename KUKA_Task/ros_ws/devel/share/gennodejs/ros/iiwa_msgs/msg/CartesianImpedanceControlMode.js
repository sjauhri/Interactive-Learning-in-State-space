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

class CartesianImpedanceControlMode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cartesian_stiffness = null;
      this.cartesian_damping = null;
      this.nullspace_stiffness = null;
      this.nullspace_damping = null;
    }
    else {
      if (initObj.hasOwnProperty('cartesian_stiffness')) {
        this.cartesian_stiffness = initObj.cartesian_stiffness
      }
      else {
        this.cartesian_stiffness = new CartesianQuantity();
      }
      if (initObj.hasOwnProperty('cartesian_damping')) {
        this.cartesian_damping = initObj.cartesian_damping
      }
      else {
        this.cartesian_damping = new CartesianQuantity();
      }
      if (initObj.hasOwnProperty('nullspace_stiffness')) {
        this.nullspace_stiffness = initObj.nullspace_stiffness
      }
      else {
        this.nullspace_stiffness = 0.0;
      }
      if (initObj.hasOwnProperty('nullspace_damping')) {
        this.nullspace_damping = initObj.nullspace_damping
      }
      else {
        this.nullspace_damping = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartesianImpedanceControlMode
    // Serialize message field [cartesian_stiffness]
    bufferOffset = CartesianQuantity.serialize(obj.cartesian_stiffness, buffer, bufferOffset);
    // Serialize message field [cartesian_damping]
    bufferOffset = CartesianQuantity.serialize(obj.cartesian_damping, buffer, bufferOffset);
    // Serialize message field [nullspace_stiffness]
    bufferOffset = _serializer.float64(obj.nullspace_stiffness, buffer, bufferOffset);
    // Serialize message field [nullspace_damping]
    bufferOffset = _serializer.float64(obj.nullspace_damping, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartesianImpedanceControlMode
    let len;
    let data = new CartesianImpedanceControlMode(null);
    // Deserialize message field [cartesian_stiffness]
    data.cartesian_stiffness = CartesianQuantity.deserialize(buffer, bufferOffset);
    // Deserialize message field [cartesian_damping]
    data.cartesian_damping = CartesianQuantity.deserialize(buffer, bufferOffset);
    // Deserialize message field [nullspace_stiffness]
    data.nullspace_stiffness = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [nullspace_damping]
    data.nullspace_damping = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/CartesianImpedanceControlMode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7c03442e16efac806b59fb2795f102eb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Stiffness values [x, y, z, a, b, c] for the cartesian impedance, x, y, z in [N/m], a, b, c in [Nm/rad]. 
    # Precondition: 0.0 <= x, y, z <= 5000.0 and 0.0 <= a, b, c <= 300.0. 
    CartesianQuantity cartesian_stiffness
    
    # Dimensionless damping values for the cartesian impedance control, for all degrees of freedom : [x, y, z, a, b, c].
    # Precondition: 0.1 <= x, y, z, a, b, c <= 1.0. 
    CartesianQuantity cartesian_damping
    
    # The stiffness value for null space [Nm/rad]. 
    # Precondition: 0.0 <= value. 
    float64 nullspace_stiffness
    
    # The damping parameter for null space [Nm*s/rad]. 
    # Precondition: value >= 0.3 and value <= 1.0. - A good damping value is 0.7. 
    float64 nullspace_damping
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
    const resolved = new CartesianImpedanceControlMode(null);
    if (msg.cartesian_stiffness !== undefined) {
      resolved.cartesian_stiffness = CartesianQuantity.Resolve(msg.cartesian_stiffness)
    }
    else {
      resolved.cartesian_stiffness = new CartesianQuantity()
    }

    if (msg.cartesian_damping !== undefined) {
      resolved.cartesian_damping = CartesianQuantity.Resolve(msg.cartesian_damping)
    }
    else {
      resolved.cartesian_damping = new CartesianQuantity()
    }

    if (msg.nullspace_stiffness !== undefined) {
      resolved.nullspace_stiffness = msg.nullspace_stiffness;
    }
    else {
      resolved.nullspace_stiffness = 0.0
    }

    if (msg.nullspace_damping !== undefined) {
      resolved.nullspace_damping = msg.nullspace_damping;
    }
    else {
      resolved.nullspace_damping = 0.0
    }

    return resolved;
    }
};

module.exports = CartesianImpedanceControlMode;
