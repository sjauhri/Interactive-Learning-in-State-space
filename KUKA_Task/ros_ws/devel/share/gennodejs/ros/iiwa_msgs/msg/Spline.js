// Auto-generated. Do not edit!

// (in-package iiwa_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SplineSegment = require('./SplineSegment.js');

//-----------------------------------------------------------

class Spline {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.segments = null;
    }
    else {
      if (initObj.hasOwnProperty('segments')) {
        this.segments = initObj.segments
      }
      else {
        this.segments = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Spline
    // Serialize message field [segments]
    // Serialize the length for message field [segments]
    bufferOffset = _serializer.uint32(obj.segments.length, buffer, bufferOffset);
    obj.segments.forEach((val) => {
      bufferOffset = SplineSegment.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Spline
    let len;
    let data = new Spline(null);
    // Deserialize message field [segments]
    // Deserialize array length for message field [segments]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.segments = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.segments[i] = SplineSegment.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.segments.forEach((val) => {
      length += SplineSegment.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/Spline';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '153600aaca0e725c65b5a93c215f43c9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The describes a motion along a spline
    
    SplineSegment[] segments
    ================================================================================
    MSG: iiwa_msgs/SplineSegment
    # This message describes a segment of a spline path
    
    int32 SPL = 0
    int32 LIN =  1
    int32 CIRC = 2
    
    # The type of the spline segment
    int32 type
    
    # The endpoint of the current segment
    CartesianPose point
    
    # Auxiliary point. Only used for circular segments
    CartesianPose point_aux
    ================================================================================
    MSG: iiwa_msgs/CartesianPose
    # Target Pose including redundancy information.
    geometry_msgs/PoseStamped poseStamped
    
    # If you have issues with the robot not executing the motion copy this value from the Cartesian Position Tab of the
    # robot SmartPad. Set both parameters to -1 to disable them.
    RedundancyInformation redundancy
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: iiwa_msgs/RedundancyInformation
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
    const resolved = new Spline(null);
    if (msg.segments !== undefined) {
      resolved.segments = new Array(msg.segments.length);
      for (let i = 0; i < resolved.segments.length; ++i) {
        resolved.segments[i] = SplineSegment.Resolve(msg.segments[i]);
      }
    }
    else {
      resolved.segments = []
    }

    return resolved;
    }
};

module.exports = Spline;
