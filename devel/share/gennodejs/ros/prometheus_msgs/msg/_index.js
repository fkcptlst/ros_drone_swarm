
"use strict";

let MultiArucoInfo = require('./MultiArucoInfo.js');
let MultiDetectionInfo = require('./MultiDetectionInfo.js');
let UgvState = require('./UgvState.js');
let ArucoInfo = require('./ArucoInfo.js');
let SwarmCommand = require('./SwarmCommand.js');
let IndoorSearch = require('./IndoorSearch.js');
let PositionReference = require('./PositionReference.js');
let LogMessage = require('./LogMessage.js');
let BoundingBoxes = require('./BoundingBoxes.js');
let Message = require('./Message.js');
let Msg104 = require('./Msg104.js');
let Case3Result = require('./Case3Result.js');
let ControlCommand = require('./ControlCommand.js');
let DetectionInfo = require('./DetectionInfo.js');
let LogMessageDetection = require('./LogMessageDetection.js');
let LogMessagePlanning = require('./LogMessagePlanning.js');
let StationCommand = require('./StationCommand.js');
let DroneState = require('./DroneState.js');
let BoundingBox = require('./BoundingBox.js');
let Case2Result = require('./Case2Result.js');
let UgvCommand = require('./UgvCommand.js');
let Msg103 = require('./Msg103.js');
let ControlOutput = require('./ControlOutput.js');
let AttitudeReference = require('./AttitudeReference.js');
let Formation = require('./Formation.js');
let Commitment = require('./Commitment.js');
let LogMessageControl = require('./LogMessageControl.js');
let CheckForObjectsAction = require('./CheckForObjectsAction.js');
let CheckForObjectsFeedback = require('./CheckForObjectsFeedback.js');
let CheckForObjectsActionResult = require('./CheckForObjectsActionResult.js');
let CheckForObjectsGoal = require('./CheckForObjectsGoal.js');
let CheckForObjectsActionFeedback = require('./CheckForObjectsActionFeedback.js');
let CheckForObjectsResult = require('./CheckForObjectsResult.js');
let CheckForObjectsActionGoal = require('./CheckForObjectsActionGoal.js');

module.exports = {
  MultiArucoInfo: MultiArucoInfo,
  MultiDetectionInfo: MultiDetectionInfo,
  UgvState: UgvState,
  ArucoInfo: ArucoInfo,
  SwarmCommand: SwarmCommand,
  IndoorSearch: IndoorSearch,
  PositionReference: PositionReference,
  LogMessage: LogMessage,
  BoundingBoxes: BoundingBoxes,
  Message: Message,
  Msg104: Msg104,
  Case3Result: Case3Result,
  ControlCommand: ControlCommand,
  DetectionInfo: DetectionInfo,
  LogMessageDetection: LogMessageDetection,
  LogMessagePlanning: LogMessagePlanning,
  StationCommand: StationCommand,
  DroneState: DroneState,
  BoundingBox: BoundingBox,
  Case2Result: Case2Result,
  UgvCommand: UgvCommand,
  Msg103: Msg103,
  ControlOutput: ControlOutput,
  AttitudeReference: AttitudeReference,
  Formation: Formation,
  Commitment: Commitment,
  LogMessageControl: LogMessageControl,
  CheckForObjectsAction: CheckForObjectsAction,
  CheckForObjectsFeedback: CheckForObjectsFeedback,
  CheckForObjectsActionResult: CheckForObjectsActionResult,
  CheckForObjectsGoal: CheckForObjectsGoal,
  CheckForObjectsActionFeedback: CheckForObjectsActionFeedback,
  CheckForObjectsResult: CheckForObjectsResult,
  CheckForObjectsActionGoal: CheckForObjectsActionGoal,
};
