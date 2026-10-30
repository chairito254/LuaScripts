-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Camera\\CameraMode\\PlayerCamera\\PlayerClimbWaterfallCameraMode.lua

local CameraConst = require("GameApp.Camera.CameraConst")
local Class = require("Core.Framework.Class")
local ThirdPersonCameraMode = require("GameApp.Camera.CameraMode.ThirdPersonCameraMode")
local CLIMB_WATERFALL_CAMERA_RADIUS = 0.08
local DEFAULT_JUMP_TOP_CAMERA_ADJUST_TIME = 0.5
local DEFAULT_CLIMB_WATERFALL_CAMERA_TARGET_PITCH_ANGLE = -60
local DEFAULT_JUMP_TOP_CAMERA_TARGET_PITCH_ANGLE = 6
local PlayerClimbWaterfallCameraMode = Class.OldLightClass("PlayerClimbWaterfallCameraMode", ThirdPersonCameraMode)

local function getRange(data, key, defaultMin, defaultMax)
	local range = data[key]

	if range and range[1] ~= nil and range[2] ~= nil then
		return range[1], range[2]
	end

	return defaultMin, defaultMax
end

function PlayerClimbWaterfallCameraMode:onCtor()
	self.cameraMode.pivotOffset = Vector3.zero
	self.cameraMode.springArm.cameraRadius = CLIMB_WATERFALL_CAMERA_RADIUS

	self:refreshConfig()
end

function PlayerClimbWaterfallCameraMode:refreshConfig()
	local config = require("Data.ccc_global_const_data") or {}
	local armMin, armMax = getRange(config, "climbWaterfallCameraArmLengthRange", 10, 15)
	local pitchMin, pitchMax = getRange(config, "climbWaterfallCameraTargetPitchAngleRange", -85, -30)
	local yawMin, yawMax = getRange(config, "climbWaterfallCameraTargetYawAngleRange", -45, 45)
	local pitchDefault = config.climbWaterfallCameraTargetPitchAngleDefault or DEFAULT_CLIMB_WATERFALL_CAMERA_TARGET_PITCH_ANGLE

	pitchDefault = math.clamp(pitchDefault, pitchMin, pitchMax)
	self.cameraMode.fieldOfView = config.climbWaterfallCameraFov or 46

	self.cameraMode:SetArmLengthRange(armMin, armMax)

	self.targetPitchAngleMin = math.min(pitchMin, pitchMax)
	self.targetPitchAngleMax = math.max(pitchMin, pitchMax)
	self.targetPitchAngleDefault = pitchDefault
	self.targetYawAngleMin = yawMin
	self.targetYawAngleMax = yawMax
	self.jumpTopCameraAdjustTime = math.max(0, config.jumpTopCameraAdjustTime or DEFAULT_JUMP_TOP_CAMERA_ADJUST_TIME)
	self.jumpTopCameraTargetPitchAngle = config.jumpTopCameraTargetPitchAngle or DEFAULT_JUMP_TOP_CAMERA_TARGET_PITCH_ANGLE
end

function PlayerClimbWaterfallCameraMode:getCameraName()
	return CameraConst.CAMERA_NAME_CLIMB_WATERFALL
end

function PlayerClimbWaterfallCameraMode:getModeClass()
	return CS.FunPlus.WorldX.VirtualCamera.PlayerClimbWaterfallCameraMode
end

function PlayerClimbWaterfallCameraMode:setActive(isActive)
	if isActive == self:isActive() then
		if isActive then
			self:refreshConfig()
		end

		return
	end

	if isActive and self.parent and self.parent.defaultCamera then
		self.cameraMode:PrepareTransitionFromDefault(self.parent.defaultCamera.cameraMode)
		self:refreshConfig()
	end

	ThirdPersonCameraMode.setActive(self, isActive)
end

return PlayerClimbWaterfallCameraMode
