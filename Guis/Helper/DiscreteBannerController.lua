-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Helper\\DiscreteBannerController.lua

local Class = require("Core.Framework.Class")
local Utils = require("Common.Utils.Utils")
local UnityInput = CS.UnityEngine.Input
local DragEventListener = CS.XGUI.EventSystems.DragEventListener
local DiscreteBannerController = Class.LightClass("DiscreteBannerController")

DiscreteBannerController.DEFAULT_DIRECTION_THRESHOLD = 8
DiscreteBannerController.DEFAULT_SWIPE_DISTANCE = 80

function DiscreteBannerController:ctor(uList, options)
	assert(uList, "DiscreteBannerController requires a ULoopList")
	assert(Utils.isTable(options), "DiscreteBannerController requires options")
	assert(type(options.getCurrentIndex) == "function", "DiscreteBannerController requires getCurrentIndex")
	assert(type(options.getItemCount) == "function", "DiscreteBannerController requires getItemCount")
	assert(type(options.onSwitch) == "function", "DiscreteBannerController requires onSwitch")

	self._uList = uList
	self._getCurrentIndex = options.getCurrentIndex
	self._getItemCount = options.getItemCount
	self._onSwitch = options.onSwitch
	self._onDragBegin = options.onDragBegin
	self._onDragEnd = options.onDragEnd
	self._directionThreshold = tonumber(options.directionThreshold) or DiscreteBannerController.DEFAULT_DIRECTION_THRESHOLD
	self._swipeDistance = tonumber(options.swipeDistance) or DiscreteBannerController.DEFAULT_SWIPE_DISTANCE
	self._enabled = false
	self._destroyed = false

	function self._listInitDragCallback()
		self:_initDrag(UnityInput.mousePosition)
	end

	function self._listBeginDragCallback()
		self:_beginDrag(UnityInput.mousePosition)
	end

	function self._listDragCallback()
		local eventData = self._currentDragEventData

		self:_updateDrag(eventData and eventData.position or UnityInput.mousePosition)
	end

	function self._listEndDragCallback()
		self:_endDrag()
	end

	function self._listenerDragCallback(eventData)
		self:_onListenerDrag(eventData)
	end

	function self._listenerEndDragCallback(eventData)
		self:_onListenerEndDrag(eventData)
	end
end

function DiscreteBannerController:setEnabled(enabled)
	if self._destroyed then
		return
	end

	local itemCount = math.max(0, tonumber(self._getItemCount()) or 0)

	self._enabled = enabled == true and itemCount > 1

	self._uList:SetScrollDisabled(not self._enabled)
	self._uList:SetDragBubbleDirectionArbitration(self._enabled, 0)

	self._uList.luaInitDrag = self._enabled and self._listInitDragCallback or nil
	self._uList.luaBeginDrag = self._enabled and self._listBeginDragCallback or nil
	self._uList.luaDrag = self._enabled and self._listDragCallback or nil
	self._uList.luaEndDrag = self._enabled and self._listEndDragCallback or nil

	if self._enabled then
		self:_bindDragListener()
	else
		self:_unbindDragListener()
		self:_resetDragState()
	end
end

function DiscreteBannerController:_bindDragListener()
	if self._dragListener or not self._uList or IsNil(self._uList) then
		return
	end

	local listener = DragEventListener.Get(self._uList.gameObject)

	if not listener or IsNil(listener) then
		return
	end

	self._dragListener = listener
	self._previousListenerDrag = listener.onDrag
	self._previousListenerEndDrag = listener.onEndDrag
	listener.onDrag = self._listenerDragCallback
	listener.onEndDrag = self._listenerEndDragCallback
	self._ownListenerDrag = listener.onDrag
	self._ownListenerEndDrag = listener.onEndDrag
end

function DiscreteBannerController:_unbindDragListener()
	local listener = self._dragListener

	if listener and not IsNil(listener) then
		if listener.onDrag == self._ownListenerDrag then
			listener.onDrag = self._previousListenerDrag
		end

		if listener.onEndDrag == self._ownListenerEndDrag then
			listener.onEndDrag = self._previousListenerEndDrag
		end
	end

	self._dragListener = nil
	self._previousListenerDrag = nil
	self._previousListenerEndDrag = nil
	self._ownListenerDrag = nil
	self._ownListenerEndDrag = nil
	self._currentDragEventData = nil
	self._dragForceEnded = false
end

function DiscreteBannerController:_onListenerDrag(eventData)
	if self._dragForceEnded then
		return
	end

	local callback = self._previousListenerDrag

	if not callback then
		return
	end

	self._currentDragEventData = eventData

	callback(eventData)

	self._currentDragEventData = nil
end

function DiscreteBannerController:_onListenerEndDrag(eventData)
	if self._dragForceEnded then
		self._dragForceEnded = false
		self._currentDragEventData = nil

		return
	end

	local callback = self._previousListenerEndDrag

	if callback then
		callback(eventData)
	end
end

function DiscreteBannerController:_forceEndDrag()
	if self._dragForceEnded or not self._currentDragEventData or not self._previousListenerEndDrag then
		return false
	end

	self._dragForceEnded = true

	self._previousListenerEndDrag(self._currentDragEventData)

	return true
end

function DiscreteBannerController:_initDrag(pointerPosition)
	if self._destroyed or not self._enabled then
		return
	end

	self:_resetDragState()

	self._dragStartPosition = pointerPosition
end

function DiscreteBannerController:_beginDrag(pointerPosition)
	if self._destroyed or not self._enabled then
		return
	end

	if not self._dragActive then
		self._dragActive = true
		self._dragDirection = nil
		self._dragSwitched = false

		if self._onDragBegin then
			self._onDragBegin()
		end
	end

	if pointerPosition and not self._dragStartPosition then
		self._dragStartPosition = pointerPosition
	end
end

function DiscreteBannerController:_updateDrag(pointerPosition)
	if self._destroyed or not self._enabled or not pointerPosition then
		return
	end

	if not self._dragActive or not self._dragStartPosition then
		self:_beginDrag(pointerPosition)

		return
	end

	if self._dragSwitched then
		return
	end

	local deltaX = pointerPosition.x - self._dragStartPosition.x
	local deltaY = pointerPosition.y - self._dragStartPosition.y
	local absX = math.abs(deltaX)
	local absY = math.abs(deltaY)

	if not self._dragDirection then
		if absX > absY + self._directionThreshold then
			self._dragDirection = "horizontal"
		elseif absY > absX + self._directionThreshold then
			self._dragDirection = "vertical"
		else
			return
		end
	end

	if self._dragDirection ~= "horizontal" or absX < self._swipeDistance then
		return
	end

	local count = math.max(0, tonumber(self._getItemCount()) or 0)
	local currentIndex = tonumber(self._getCurrentIndex())

	if count <= 1 or not currentIndex then
		return
	end

	self._dragSwitched = true

	local deltaIndex = deltaX < 0 and 1 or -1
	local targetIndex = (currentIndex + deltaIndex - 1) % count + 1

	self._uList:StopScroll()
	self._onSwitch(targetIndex)
	self:_forceEndDrag()
end

function DiscreteBannerController:_endDrag()
	if self._destroyed or not self._dragActive then
		return
	end

	self:_settleCurrentItem()
	self:_resetDragState()

	if self._onDragEnd then
		self._onDragEnd()
	end
end

function DiscreteBannerController:_settleCurrentItem()
	if self._destroyed or not self._enabled or not self._uList then
		return
	end

	local currentIndex = tonumber(self._getCurrentIndex())

	if currentIndex and currentIndex > 0 then
		self._uList:StopScroll()
		self._uList:GoToIndex(currentIndex - 1, false)
	end
end

function DiscreteBannerController:_resetDragState()
	self._dragActive = false
	self._dragStartPosition = nil
	self._dragDirection = nil
	self._dragSwitched = false
end

function DiscreteBannerController:destroy()
	if self._destroyed then
		return
	end

	if self._uList and not IsNil(self._uList) then
		self:setEnabled(false)
	else
		self:_resetDragState()
	end

	self._destroyed = true
	self._uList = nil
	self._getCurrentIndex = nil
	self._getItemCount = nil
	self._onSwitch = nil
	self._onDragBegin = nil
	self._onDragEnd = nil
end

return DiscreteBannerController
