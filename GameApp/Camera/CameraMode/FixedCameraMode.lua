-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Camera\\CameraMode\\FixedCameraMode.lua

local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local ClientConst = require("Const.ClientConst")
local CameraConst = require("GameApp.Camera.CameraConst")
local CameraMode = require("GameApp.Camera.CameraMode.CameraMode")
local LoggerManager = require("Core.Log.LoggerManager")
local logger = LoggerManager.getLogger("FixedCameraMode")
local CameraShakeModifier = CS.FunPlus.WorldX.VirtualCamera.CameraShakeModifier
local CameraFovCurveModifier = CS.FunPlus.WorldX.VirtualCamera.CameraFovCurveModifier
local Vector3 = Vector3
local FixedCameraMode = Class.OldLightClass("FixedCameraMode", CameraMode)

function FixedCameraMode:onCtor()
	function self.cameraMode.luaOnFinishBlend()
		self:onCameraBlendFinish()
	end

	self.cameraShakeModifier = CameraShakeModifier()

	self:addCameraModifier(self.cameraShakeModifier, 11)

	self.fovCurveModifier = CameraFovCurveModifier()

	self:addCameraModifier(self.fovCurveModifier, 13)
end

function FixedCameraMode:playFovCurveAnim(fovCurve, blendInTime, duration, blendOutTime)
	self.fovCurveModifier:StartPlayCurveAnim(fovCurve, blendInTime, duration, blendOutTime)
end

function FixedCameraMode:getCameraName()
	return CameraConst.CAMERA_NAME_FIXED
end

function FixedCameraMode:getModeClass()
	return CS.FunPlus.WorldX.VirtualCamera.FixedCameraMode
end

function FixedCameraMode:setPosition(pos)
	if self.cameraMode then
		self.cameraMode:SetPosition(pos)

		self.lastPos = pos
	end
end

function FixedCameraMode:setRotation(rotation)
	if self.cameraMode then
		self.cameraMode:SetRotation(rotation)

		self.lastRotation = rotation
	end
end

function FixedCameraMode:setEnableShake(enableShake)
	enableShake = enableShake or false

	if self.cameraShakeModifier then
		self.cameraShakeModifier:SetEnabled(enableShake)
	end
end

function FixedCameraMode:setFov(fov)
	fov = fov or 0

	if self.cameraMode then
		self.cameraMode:SetFov(fov)

		self.lastFov = fov
	end
end

function FixedCameraMode:onCameraBlendFinish()
	if self.finishMark then
		return
	end

	self.finishMark = true

	self:startMovement()

	if self.finishBlendCb then
		self.finishBlendCb()
	end
end

function FixedCameraMode:setMovementData(movementData)
	self.movementData = movementData
end

function FixedCameraMode:startMovement()
	local movementData = self.movementData
	local movementTime = movementData and movementData.blendTime or 0

	if movementData == nil or movementData.type == nil or movementData.type == 0 or movementTime <= 0 then
		return
	end

	local movementVector = movementData.vector or Vector3.zero

	if movementData.type == 3 then
		movementVector = movementData.axis or Vector3.up
	end

	self.cameraMode:StartMovement(movementData.type, movementVector, movementData.center or Vector3.zero, movementData.angle or 0, movementTime, movementData.mode or 0, movementData.blendFunc or 0, movementData.blendExp or 2)
end

function FixedCameraMode:setFinishBlendCb(cb)
	self.finishBlendCb = cb
	self.finishMark = false
end

function FixedCameraMode:onCanceled()
	if not self.finishMark and self.cancelBlendCb then
		local cancelBlendCb = self.cancelBlendCb

		self.cancelBlendCb = nil

		local isOk, result = xpcall(cancelBlendCb, debug.traceback)

		if not isOk then
			logger:error("FixedCameraMode onCanceled failed. trace:", result)
		end
	end
end

function FixedCameraMode:setCancelBlendCb(cb)
	self.cancelBlendCb = cb
end

return FixedCameraMode
