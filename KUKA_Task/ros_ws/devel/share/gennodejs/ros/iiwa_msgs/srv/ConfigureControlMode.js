// Auto-generated. Do not edit!

// (in-package iiwa_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let JointImpedanceControlMode = require('../msg/JointImpedanceControlMode.js');
let CartesianImpedanceControlMode = require('../msg/CartesianImpedanceControlMode.js');
let DesiredForceControlMode = require('../msg/DesiredForceControlMode.js');
let SinePatternControlMode = require('../msg/SinePatternControlMode.js');
let CartesianControlModeLimits = require('../msg/CartesianControlModeLimits.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ConfigureControlModeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.control_mode = null;
      this.joint_impedance = null;
      this.cartesian_impedance = null;
      this.desired_force = null;
      this.sine_pattern = null;
      this.limits = null;
    }
    else {
      if (initObj.hasOwnProperty('control_mode')) {
        this.control_mode = initObj.control_mode
      }
      else {
        this.control_mode = 0;
      }
      if (initObj.hasOwnProperty('joint_impedance')) {
        this.joint_impedance = initObj.joint_impedance
      }
      else {
        this.joint_impedance = new JointImpedanceControlMode();
      }
      if (initObj.hasOwnProperty('cartesian_impedance')) {
        this.cartesian_impedance = initObj.cartesian_impedance
      }
      else {
        this.cartesian_impedance = new CartesianImpedanceControlMode();
      }
      if (initObj.hasOwnProperty('desired_force')) {
        this.desired_force = initObj.desired_force
      }
      else {
        this.desired_force = new DesiredForceControlMode();
      }
      if (initObj.hasOwnProperty('sine_pattern')) {
        this.sine_pattern = initObj.sine_pattern
      }
      else {
        this.sine_pattern = new SinePatternControlMode();
      }
      if (initObj.hasOwnProperty('limits')) {
        this.limits = initObj.limits
      }
      else {
        this.limits = new CartesianControlModeLimits();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ConfigureControlModeRequest
    // Serialize message field [control_mode]
    bufferOffset = _serializer.int32(obj.control_mode, buffer, bufferOffset);
    // Serialize message field [joint_impedance]
    bufferOffset = JointImpedanceControlMode.serialize(obj.joint_impedance, buffer, bufferOffset);
    // Serialize message field [cartesian_impedance]
    bufferOffset = CartesianImpedanceControlMode.serialize(obj.cartesian_impedance, buffer, bufferOffset);
    // Serialize message field [desired_force]
    bufferOffset = DesiredForceControlMode.serialize(obj.desired_force, buffer, bufferOffset);
    // Serialize message field [sine_pattern]
    bufferOffset = SinePatternControlMode.serialize(obj.sine_pattern, buffer, bufferOffset);
    // Serialize message field [limits]
    bufferOffset = CartesianControlModeLimits.serialize(obj.limits, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ConfigureControlModeRequest
    let len;
    let data = new ConfigureControlModeRequest(null);
    // Deserialize message field [control_mode]
    data.control_mode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [joint_impedance]
    data.joint_impedance = JointImpedanceControlMode.deserialize(buffer, bufferOffset);
    // Deserialize message field [cartesian_impedance]
    data.cartesian_impedance = CartesianImpedanceControlMode.deserialize(buffer, bufferOffset);
    // Deserialize message field [desired_force]
    data.desired_force = DesiredForceControlMode.deserialize(buffer, bufferOffset);
    // Deserialize message field [sine_pattern]
    data.sine_pattern = SinePatternControlMode.deserialize(buffer, bufferOffset);
    // Deserialize message field [limits]
    data.limits = CartesianControlModeLimits.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 245;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/ConfigureControlModeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5e02ca4e5bba97a102b6f5d4c0a7fc99';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    int32 control_mode
    iiwa_msgs/JointImpedanceControlMode joint_impedance
    iiwa_msgs/CartesianImpedanceControlMode cartesian_impedance
    iiwa_msgs/DesiredForceControlMode desired_force
    iiwa_msgs/SinePatternControlMode sine_pattern
    iiwa_msgs/CartesianControlModeLimits limits
    
    ================================================================================
    MSG: iiwa_msgs/JointImpedanceControlMode
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
    ================================================================================
    MSG: iiwa_msgs/CartesianImpedanceControlMode
    
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
    ================================================================================
    MSG: iiwa_msgs/DesiredForceControlMode
    # The degree of freedom on which the desired force
    int32 cartesian_dof
    
    # The value of the desired force. In [N].
    float64 desired_force
    
    # The value of the stiffness. In [N/m].
    float64 desired_stiffness
    ================================================================================
    MSG: iiwa_msgs/SinePatternControlMode
    # The degree of freedom for performing the sine oscillation.
    int32 cartesian_dof
    
    # The value of the frequency for the sine oscillation [Hz].
    float64 frequency
    
    # The value of the amplitude. In [N].
    float64 amplitude
    
    # The value of the stiffness. In [N/m].
    float64 stiffness
    ================================================================================
    MSG: iiwa_msgs/CartesianControlModeLimits
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ConfigureControlModeRequest(null);
    if (msg.control_mode !== undefined) {
      resolved.control_mode = msg.control_mode;
    }
    else {
      resolved.control_mode = 0
    }

    if (msg.joint_impedance !== undefined) {
      resolved.joint_impedance = JointImpedanceControlMode.Resolve(msg.joint_impedance)
    }
    else {
      resolved.joint_impedance = new JointImpedanceControlMode()
    }

    if (msg.cartesian_impedance !== undefined) {
      resolved.cartesian_impedance = CartesianImpedanceControlMode.Resolve(msg.cartesian_impedance)
    }
    else {
      resolved.cartesian_impedance = new CartesianImpedanceControlMode()
    }

    if (msg.desired_force !== undefined) {
      resolved.desired_force = DesiredForceControlMode.Resolve(msg.desired_force)
    }
    else {
      resolved.desired_force = new DesiredForceControlMode()
    }

    if (msg.sine_pattern !== undefined) {
      resolved.sine_pattern = SinePatternControlMode.Resolve(msg.sine_pattern)
    }
    else {
      resolved.sine_pattern = new SinePatternControlMode()
    }

    if (msg.limits !== undefined) {
      resolved.limits = CartesianControlModeLimits.Resolve(msg.limits)
    }
    else {
      resolved.limits = new CartesianControlModeLimits()
    }

    return resolved;
    }
};

class ConfigureControlModeResponse {
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
    // Serializes a message object of type ConfigureControlModeResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ConfigureControlModeResponse
    let len;
    let data = new ConfigureControlModeResponse(null);
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
    return 'iiwa_msgs/ConfigureControlModeResponse';
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
    const resolved = new ConfigureControlModeResponse(null);
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
  Request: ConfigureControlModeRequest,
  Response: ConfigureControlModeResponse,
  md5sum() { return '680a54772ae74cfe325dd171700c3d78'; },
  datatype() { return 'iiwa_msgs/ConfigureControlMode'; }
};
