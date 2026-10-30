-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\MobileOperate\\Component\\MoveJoyStickUIComponent.lua

local UIComponent = require("Guis.Helper.UIComponent")
local Class = require("Core.Framework.Class")
local SysConfigData = require("Data.sys_config_data")
local ClientConst = require("Const.ClientConst")
local MessageName = require("Const.MessageName")
local JoyStickDragRelay = require("Guis.Helper.JoyStickDragRelay")
local logger = require("Core.Log.LoggerManager").getLogger("MoveJoyStickUIComponent")
local MoveJoyStickUIComponent = Class.LightClass("MoveJoyStickUIComponent", UIComponent)

MoveJoyStickUIComponent.messages = {
	[MessageName.APP_FOCUS_CHANGED] = {
		"onAppFocusChanged",
		true
	}
}

local CAMERA_DRAG_DELTA_VALID_TIME = 0.1

function MoveJoyStickUIComponent:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.joystick = self.objectReference:GetRefValue("joyStickUJoyStick")
	self.cameraGestureGesture = self.objectReference:GetRefValue("cameraCtrlUWidget")
	self.muteRotateCamera = false
	self.captureAimMuteRotateCamera = false
	self.lastCameraDragAxisX = 0
	self.lastCameraDragAxisY = 0
	self.lastCameraDragTime = nil
	self.cameraDecelerationTimer = nil

	JoyStickDragRelay.setJoyStick(self.joystick)
	self:initGesture()
end

function MoveJoyStickUIComponent:initView()
	function self.joystick.luaValueChanged(x, y, z)
		pg.global.inputMgr:SetMoveAxis(x, y, z)
	end

	self.joystick.longPressDragEnabled = true

	self:setJoystickMode(pg.game.setting:getMobileJoystickMode())

	function self.cameraGestureGesture.luaDragUpdate(x, y)
		self:onCameraDragUpdate(x, y)
	end

	function self.cameraGestureGesture.luaEndDrag()
		self:onCameraDragEnd()
	end
end

function MoveJoyStickUIComponent:installDynamicJoystickInput()
	local checkArea = self.joystick.checkArea

	if not checkArea or not checkArea.gameObject then
		return
	end

	local listener = CS.XGUI.EventSystems.ClickEventListener.Get(checkArea.gameObject)

	if self.dynamicJoystickListener == listener then
		return
	end

	self:uninstallDynamicJoystickInput()

	self.dynamicJoystickListener = listener
	self.dynamicJoystickPreviousOnPress = listener.onPress
	self.dynamicJoystickPreviousOnRelease = listener.onRelease

	local dragListener = CS.XGUI.EventSystems.DragEventListener.Get(checkArea.gameObject)

	self.dynamicJoystickDragListener = dragListener
	self.dynamicJoystickPreviousOnBeginDrag = dragListener.onBeginDrag
	self.dynamicJoystickPreviousOnEndDrag = dragListener.onEndDrag

	local joystick = self.joystick

	function listener.onPress(eventData)
		if self.dynamicJoystickPreviousOnPress then
			self.dynamicJoystickPreviousOnPress(eventData)
		end

		if not joystick.isDragging then
			joystick:DoBeginDrag(eventData)
		end
	end

	function listener.onRelease(eventData)
		if self.dynamicJoystickPreviousOnRelease then
			self.dynamicJoystickPreviousOnRelease(eventData)
		end

		joystick:DoEndDrag(eventData)
	end

	function dragListener.onBeginDrag(eventData)
		if joystick.isDragging then
			return
		end

		if self.dynamicJoystickPreviousOnBeginDrag then
			self.dynamicJoystickPreviousOnBeginDrag(eventData)
		end
	end

	function dragListener.onEndDrag(eventData)
		if not joystick.isDragging then
			return
		end

		if self.dynamicJoystickPreviousOnEndDrag then
			self.dynamicJoystickPreviousOnEndDrag(eventData)
		end
	end

	self.dynamicJoystickOwnOnPress = listener.onPress
	self.dynamicJoystickOwnOnRelease = listener.onRelease
	self.dynamicJoystickOwnOnBeginDrag = dragListener.onBeginDrag
	self.dynamicJoystickOwnOnEndDrag = dragListener.onEndDrag
end

function MoveJoyStickUIComponent:uninstallDynamicJoystickInput()
	local listener = self.dynamicJoystickListener

	if not listener then
		return
	end

	if listener.onPress == self.dynamicJoystickOwnOnPress then
		listener.onPress = self.dynamicJoystickPreviousOnPress
	end

	if listener.onRelease == self.dynamicJoystickOwnOnRelease then
		listener.onRelease = self.dynamicJoystickPreviousOnRelease
	end

	local dragListener = self.dynamicJoystickDragListener

	if dragListener then
		if dragListener.onBeginDrag == self.dynamicJoystickOwnOnBeginDrag then
			dragListener.onBeginDrag = self.dynamicJoystickPreviousOnBeginDrag
		end

		if dragListener.onEndDrag == self.dynamicJoystickOwnOnEndDrag then
			dragListener.onEndDrag = self.dynamicJoystickPreviousOnEndDrag
		end
	end

	self.dynamicJoystickListener = nil
	self.dynamicJoystickDragListener = nil
	self.dynamicJoystickPreviousOnPress = nil
	self.dynamicJoystickPreviousOnRelease = nil
	self.dynamicJoystickPreviousOnBeginDrag = nil
	self.dynamicJoystickPreviousOnEndDrag = nil
	self.dynamicJoystickOwnOnPress = nil
	self.dynamicJoystickOwnOnRelease = nil
	self.dynamicJoystickOwnOnBeginDrag = nil
	self.dynamicJoystickOwnOnEndDrag = nil
end

function MoveJoyStickUIComponent:onCameraDragUpdate(x, y)
	if self.muteRotateCamera or self.captureAimMuteRotateCamera then
		return
	end

	local interruptedDeceleration = self.cameraDecelerationTimer ~= nil

	self:stopCameraDeceleration(false)

	if interruptedDeceleration then
		self.lastCameraDragAxisX = 0
		self.lastCameraDragAxisY = 0
		self.lastCameraDragTime = nil
	end

	if x ~= 0 or y ~= 0 then
		self:notifyManualCameraInput()
	end

	local viewAxisX, viewAxisY = pg.game.input:setViewAxisByFrameDeltaPixel(x, y)

	if x ~= 0 or y ~= 0 then
		self.lastCameraDragAxisX = viewAxisX
		self.lastCameraDragAxisY = viewAxisY
		self.lastCameraDragTime = UnityTime.unscaledTime
	end
end

function MoveJoyStickUIComponent:onCameraDragEnd()
	self:startCameraDeceleration()
end

function MoveJoyStickUIComponent:setCaptureAimCameraDragMuted(muted)
	self.captureAimMuteRotateCamera = muted

	if muted then
		self:stopCameraDeceleration(true)
	end
end

function MoveJoyStickUIComponent:notifyManualCameraInput()
	local camera = pg.game.camera
	local playerCameraMode = camera and camera.playerCameraMode

	if playerCameraMode then
		playerCameraMode:onManualViewInput()
	end
end

function MoveJoyStickUIComponent:setJoystickMode(mode)
	local isDynamic = mode == ClientConst.MobileJoystickMode.Dynamic

	self.joystick.IsFixed = not isDynamic

	if isDynamic then
		self.joystick.clickMoveEnabled = false
		self.joystick.longPressDragEnabled = false

		self:installDynamicJoystickInput()
	else
		self:uninstallDynamicJoystickInput()

		self.joystick.clickMoveEnabled = false
		self.joystick.longPressDragEnabled = true
	end
end

function MoveJoyStickUIComponent:stopCameraDeceleration(resetViewAxis)
	if self.cameraDecelerationTimer then
		pg.game.camera:removeLateUpdateTimer(self.cameraDecelerationTimer)

		self.cameraDecelerationTimer = nil
	end

	if resetViewAxis then
		self.lastCameraDragAxisX = 0
		self.lastCameraDragAxisY = 0
		self.lastCameraDragTime = nil

		pg.game.input:setViewAxis(0, 0)
	end
end

function MoveJoyStickUIComponent:startCameraDeceleration()
	self:stopCameraDeceleration(false)

	local decelerationTime = SysConfigData.CAMERA_DECELERATION_TIME or 0.2
	local startTime = UnityTime.unscaledTime
	local dragDeltaAge = self.lastCameraDragTime and startTime - self.lastCameraDragTime

	if not pg.global.ui:runPlatformByMobile() or self.muteRotateCamera or self.captureAimMuteRotateCamera or decelerationTime <= 0 or dragDeltaAge == nil or dragDeltaAge > CAMERA_DRAG_DELTA_VALID_TIME or self.lastCameraDragAxisX == nil or self.lastCameraDragAxisY == nil or self.lastCameraDragAxisX == 0 and self.lastCameraDragAxisY == 0 then
		self:stopCameraDeceleration(true)

		return
	end

	local startAxisX, startAxisY = self.lastCameraDragAxisX, self.lastCameraDragAxisY

	self.cameraDecelerationTimer = pg.game.camera:addLateUpdateTimer(function()
		local elapsedTime = UnityTime.unscaledTime - startTime
		local progress = math.min(elapsedTime / decelerationTime, 1)

		if progress >= 1 or self.muteRotateCamera or self.captureAimMuteRotateCamera then
			self:stopCameraDeceleration(true)

			return
		end

		local speedRatio = 0.5 * (1 + math.cos(math.pi * progress))

		pg.game.input:setViewAxis(startAxisX * speedRatio, startAxisY * speedRatio)
	end)
end

function MoveJoyStickUIComponent:onZoom(dist)
	self:stopCameraDeceleration(true)

	if self.inMagnesis then
		if dist > 0 then
			pg.me:magnesisUpdateControlDistance(1)
		else
			pg.me:magnesisUpdateControlDistance(-1)
		end

		return
	end

	pg.game.camera:zoom(dist)

	self.muteRotateCamera = true

	pg.game.input:setViewAxisByDeltaPixel(0, 0)
end

function MoveJoyStickUIComponent:initGesture()
	self.muteRotateCamera = false

	fingerGestures.Active()
	fingerGestures.EnableTwist(false)
	fingerGestures.EnablePinch(true)
	fingerGestures.EnableTouchFilter(true)

	function fingerGestures.luaOnTouchUp2Fingers(gesture)
		self.muteRotateCamera = false
	end

	function fingerGestures.luaOnPinchIn(gesture)
		if gesture.touchCount >= 2 then
			self:cameraZoomOut(gesture)
		end
	end

	function fingerGestures.luaOnPinchOut(gesture)
		if gesture.touchCount >= 2 then
			self:cameraZoomIn(gesture)
		end
	end
end

function MoveJoyStickUIComponent:destroyGesture()
	self.muteRotateCamera = false

	fingerGestures.EnableTouchFilter(false)
	fingerGestures.DeActive()
end

function MoveJoyStickUIComponent:onDestroy()
	self:uninstallDynamicJoystickInput()
	JoyStickDragRelay.clearJoyStick(self.joystick)
	self:resetMoveInput()
	self:stopCameraDeceleration(true)
	self:destroyGesture()

	self.muteRotateCamera = false
	self.captureAimMuteRotateCamera = false
end

function MoveJoyStickUIComponent:resetMoveInput()
	pg.global.inputMgr:SetMoveAxis(0, 0, 0)

	if pg.game and pg.game.input then
		pg.game.input:handleMoveEvent(0, 0, 0)
	end
end

function MoveJoyStickUIComponent:onVisibleChange(visible)
	if not visible then
		self:resetMoveInput()
	end
end

function MoveJoyStickUIComponent:onAppFocusChanged(focus)
	if focus then
		return
	end

	local cameraGesture = self.cameraGestureGesture

	if cameraGesture and NotNil(cameraGesture) and cameraGesture.enabled then
		cameraGesture.enabled = false
		cameraGesture.enabled = true
	end

	self.muteRotateCamera = false
	self.captureAimMuteRotateCamera = false

	self:stopCameraDeceleration(true)
end

function MoveJoyStickUIComponent:changeMagnesisGestureBehavior(inMagnesis)
	if inMagnesis then
		function fingerGestures.luaOnPinchIn(gesture)
			if gesture.touchCount >= 2 then
				self:magnesisControlZoomOut(gesture)
			end
		end

		function fingerGestures.luaOnPinchOut(gesture)
			if gesture.touchCount >= 2 then
				self:magnesisControlZoomIn(gesture)
			end
		end
	else
		function fingerGestures.luaOnPinchIn(gesture)
			if gesture.touchCount >= 2 then
				self:cameraZoomOut(gesture)
			end
		end

		function fingerGestures.luaOnPinchOut(gesture)
			if gesture.touchCount >= 2 then
				self:cameraZoomIn(gesture)
			end
		end
	end
end

function MoveJoyStickUIComponent:getZoomDelta(deltaPinch)
	local zoomFactor = 25
	local zoomDelta = deltaPinch / zoomFactor

	return math.clamp(zoomDelta, -1, 1)
end

function MoveJoyStickUIComponent:cameraZoomIn(gesture)
	if pg.global.inputMgr.moveAxis[1] ~= 0 or pg.global.inputMgr.moveAxis[2] ~= 0 or pg.global.inputMgr.moveAxis[3] ~= 0 then
		return
	end

	self:stopCameraDeceleration(true)

	local zoomDelta = self:getZoomDelta(-gesture.deltaPinch)

	pg.game.camera:zoom(zoomDelta)

	self.muteRotateCamera = true

	pg.game.input:setViewAxisByDeltaPixel(0, 0)
end

function MoveJoyStickUIComponent:cameraZoomOut(gesture)
	if pg.global.inputMgr.moveAxis[1] ~= 0 or pg.global.inputMgr.moveAxis[2] ~= 0 or pg.global.inputMgr.moveAxis[3] ~= 0 then
		return
	end

	self:stopCameraDeceleration(true)

	local zoomDelta = self:getZoomDelta(gesture.deltaPinch)

	pg.game.camera:zoom(zoomDelta)

	self.muteRotateCamera = true

	pg.game.input:setViewAxisByDeltaPixel(0, 0)
end

function MoveJoyStickUIComponent:magnesisControlZoomOut(gesture)
	pg.me:magnesisUpdateControlDistance(1)

	self.muteRotateCamera = true
end

function MoveJoyStickUIComponent:magnesisControlZoomIn(gesture)
	pg.me:magnesisUpdateControlDistance(-1)

	self.muteRotateCamera = true
end

return MoveJoyStickUIComponent
