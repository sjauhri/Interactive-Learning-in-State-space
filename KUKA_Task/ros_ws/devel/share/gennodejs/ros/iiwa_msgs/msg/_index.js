
"use strict";

let JointVelocity = require('./JointVelocity.js');
let DOF = require('./DOF.js');
let SinePatternControlMode = require('./SinePatternControlMode.js');
let ControlMode = require('./ControlMode.js');
let SplineSegment = require('./SplineSegment.js');
let JointDamping = require('./JointDamping.js');
let CartesianEulerPose = require('./CartesianEulerPose.js');
let CartesianVelocity = require('./CartesianVelocity.js');
let CartesianWrench = require('./CartesianWrench.js');
let JointTorque = require('./JointTorque.js');
let JointStiffness = require('./JointStiffness.js');
let JointPosition = require('./JointPosition.js');
let CartesianControlModeLimits = require('./CartesianControlModeLimits.js');
let DesiredForceControlMode = require('./DesiredForceControlMode.js');
let JointQuantity = require('./JointQuantity.js');
let RedundancyInformation = require('./RedundancyInformation.js');
let CartesianPose = require('./CartesianPose.js');
let CartesianPlane = require('./CartesianPlane.js');
let JointPositionVelocity = require('./JointPositionVelocity.js');
let CartesianQuantity = require('./CartesianQuantity.js');
let Spline = require('./Spline.js');
let JointImpedanceControlMode = require('./JointImpedanceControlMode.js');
let CartesianImpedanceControlMode = require('./CartesianImpedanceControlMode.js');
let MoveAlongSplineAction = require('./MoveAlongSplineAction.js');
let MoveAlongSplineActionGoal = require('./MoveAlongSplineActionGoal.js');
let MoveAlongSplineFeedback = require('./MoveAlongSplineFeedback.js');
let MoveAlongSplineActionFeedback = require('./MoveAlongSplineActionFeedback.js');
let MoveToCartesianPoseActionResult = require('./MoveToCartesianPoseActionResult.js');
let MoveToCartesianPoseResult = require('./MoveToCartesianPoseResult.js');
let MoveToCartesianPoseFeedback = require('./MoveToCartesianPoseFeedback.js');
let MoveAlongSplineActionResult = require('./MoveAlongSplineActionResult.js');
let MoveToCartesianPoseActionGoal = require('./MoveToCartesianPoseActionGoal.js');
let MoveToCartesianPoseAction = require('./MoveToCartesianPoseAction.js');
let MoveToJointPositionGoal = require('./MoveToJointPositionGoal.js');
let MoveToJointPositionActionGoal = require('./MoveToJointPositionActionGoal.js');
let MoveToJointPositionResult = require('./MoveToJointPositionResult.js');
let MoveToJointPositionActionFeedback = require('./MoveToJointPositionActionFeedback.js');
let MoveAlongSplineResult = require('./MoveAlongSplineResult.js');
let MoveToJointPositionAction = require('./MoveToJointPositionAction.js');
let MoveAlongSplineGoal = require('./MoveAlongSplineGoal.js');
let MoveToJointPositionActionResult = require('./MoveToJointPositionActionResult.js');
let MoveToJointPositionFeedback = require('./MoveToJointPositionFeedback.js');
let MoveToCartesianPoseActionFeedback = require('./MoveToCartesianPoseActionFeedback.js');
let MoveToCartesianPoseGoal = require('./MoveToCartesianPoseGoal.js');

module.exports = {
  JointVelocity: JointVelocity,
  DOF: DOF,
  SinePatternControlMode: SinePatternControlMode,
  ControlMode: ControlMode,
  SplineSegment: SplineSegment,
  JointDamping: JointDamping,
  CartesianEulerPose: CartesianEulerPose,
  CartesianVelocity: CartesianVelocity,
  CartesianWrench: CartesianWrench,
  JointTorque: JointTorque,
  JointStiffness: JointStiffness,
  JointPosition: JointPosition,
  CartesianControlModeLimits: CartesianControlModeLimits,
  DesiredForceControlMode: DesiredForceControlMode,
  JointQuantity: JointQuantity,
  RedundancyInformation: RedundancyInformation,
  CartesianPose: CartesianPose,
  CartesianPlane: CartesianPlane,
  JointPositionVelocity: JointPositionVelocity,
  CartesianQuantity: CartesianQuantity,
  Spline: Spline,
  JointImpedanceControlMode: JointImpedanceControlMode,
  CartesianImpedanceControlMode: CartesianImpedanceControlMode,
  MoveAlongSplineAction: MoveAlongSplineAction,
  MoveAlongSplineActionGoal: MoveAlongSplineActionGoal,
  MoveAlongSplineFeedback: MoveAlongSplineFeedback,
  MoveAlongSplineActionFeedback: MoveAlongSplineActionFeedback,
  MoveToCartesianPoseActionResult: MoveToCartesianPoseActionResult,
  MoveToCartesianPoseResult: MoveToCartesianPoseResult,
  MoveToCartesianPoseFeedback: MoveToCartesianPoseFeedback,
  MoveAlongSplineActionResult: MoveAlongSplineActionResult,
  MoveToCartesianPoseActionGoal: MoveToCartesianPoseActionGoal,
  MoveToCartesianPoseAction: MoveToCartesianPoseAction,
  MoveToJointPositionGoal: MoveToJointPositionGoal,
  MoveToJointPositionActionGoal: MoveToJointPositionActionGoal,
  MoveToJointPositionResult: MoveToJointPositionResult,
  MoveToJointPositionActionFeedback: MoveToJointPositionActionFeedback,
  MoveAlongSplineResult: MoveAlongSplineResult,
  MoveToJointPositionAction: MoveToJointPositionAction,
  MoveAlongSplineGoal: MoveAlongSplineGoal,
  MoveToJointPositionActionResult: MoveToJointPositionActionResult,
  MoveToJointPositionFeedback: MoveToJointPositionFeedback,
  MoveToCartesianPoseActionFeedback: MoveToCartesianPoseActionFeedback,
  MoveToCartesianPoseGoal: MoveToCartesianPoseGoal,
};
