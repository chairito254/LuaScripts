-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Container\\EventsV2.lua

local Class = require("Core.Framework.Class")
local EventEmitterV2 = Class.LightClass("EventEmitterV2")

EventEmitterV2.maxWaveDepth = 10

local SafeCallback = require("Core.Framework.SafeCallback")
local TimerManager = require("Core.Timer.TimerManager")
local CallbackHandlerNoGC = require("Core.Common.CallbackHandlerNoGC")
local lume = require("Core.Common.lume")
local ListPool = require("Common.Container.ListPool")
local next = raw_next
local unpack = unpack
local listpool_getList = ListPool.getList
local listpool_returnList = ListPool.returnList
local lume_removeAllListItemWithDispose = lume.removeAllListItemWithDispose
local lume_removeListItemWithDispose = lume.removeListItemWithDispose

function EventEmitterV2:ctor()
	self.listeners = {}
	self._emitting = false
end

function EventEmitterV2:emit(event, ...)
	if self._destroyed then
		return
	end

	if not self.listeners[event] then
		return
	end

	return self:_emitWave(event, ...)
end

function EventEmitterV2:_queueWaveEvent(event, ...)
	if not self._waveChildren then
		self._waveChildren = {
			tail = 0,
			head = 1
		}
	end

	local params = listpool_getList(3)

	params[1] = event
	params.n = select("#", ...)

	for i = 1, params.n do
		params[i + 1] = select(i, ...)
	end

	self._waveChildren.tail = self._waveChildren.tail + 1
	self._waveChildren[self._waveChildren.tail] = params
end

function EventEmitterV2:_releaseWaveParams(params)
	for i = 1, params.n + 1 do
		params[i] = nil
	end

	params.n = nil

	listpool_returnList(params, 3)
end

function EventEmitterV2:_clearWaveFrame(frame)
	if not frame then
		return
	end

	for i = frame.head, frame.tail do
		local params = frame[i]

		if params then
			frame[i] = nil

			self:_releaseWaveParams(params)
		end
	end
end

function EventEmitterV2:_clearWaveState()
	if self._waveStack then
		for i = 1, #self._waveStack do
			self:_clearWaveFrame(self._waveStack[i])
		end
	end

	self:_clearWaveFrame(self._waveChildren)

	self._waveStack = nil
	self._waveChildren = nil
	self._emitting = false
end

function EventEmitterV2:_drainWaves()
	while #self._waveStack > 0 and not self._destroyed do
		local depth = #self._waveStack
		local frame = self._waveStack[depth]

		if frame.head > frame.tail then
			self._waveStack[depth] = nil
		else
			local params = frame[frame.head]
			local event = params[1]

			if self.listeners[event] then
				if depth > self.maxWaveDepth then
					error(string.format("Event wave depth exceeded: limit=%d depth=%d event=%s", self.maxWaveDepth, depth, tostring(event)))
				end

				self:_do_emit(event, unpack(params, 2, params.n + 1))
			end

			frame[frame.head] = nil
			frame.head = frame.head + 1

			self:_releaseWaveParams(params)

			if self._waveChildren then
				self._waveStack[depth + 1] = self._waveChildren
				self._waveChildren = nil
			end
		end
	end
end

function EventEmitterV2:_emitWave(event, ...)
	self:_queueWaveEvent(event, ...)

	if self._emitting then
		return
	end

	self._emitting = true
	self._waveStack = {
		self._waveChildren
	}
	self._waveChildren = nil

	local ok, err = pcall(self._drainWaves, self)

	self:_clearWaveState()

	if not ok then
		error(err, 0)
	end
end

function EventEmitterV2:destroy()
	self._destroyed = true

	self:removeAllListeners()

	if not self._emitting then
		self:_clearWaveState()
	end
end

function EventEmitterV2:emitNextFrame(event, ...)
	TimerManager.addNextFrameCb(CallbackHandlerNoGC.new(self, self.emit, event, ...))
end

function EventEmitterV2:_do_emit(event, ...)
	local listeners = self.listeners[event]

	if listeners then
		local snapshot = listpool_getList(3)
		local n = #listeners

		for i = 1, n do
			snapshot[i] = listeners[i]
		end

		for i = 1, n do
			if self._destroyed then
				break
			end

			SafeCallback(snapshot[i], ...)
		end

		listpool_returnList(snapshot, 3)
	end
end

function EventEmitterV2:addEventListener(event, listener)
	local list = self.listeners[event]

	if not list then
		list = listpool_getList(3)
		self.listeners[event] = list
	end

	list[#list + 1] = listener
end

function EventEmitterV2:removeAllListeners(event)
	if event ~= nil then
		local listeners = self.listeners[event]

		if listeners then
			lume_removeAllListItemWithDispose(listeners)

			self.listeners[event] = nil

			listpool_returnList(listeners, 3)
		end
	else
		local k, listener = next(self.listeners)

		while k do
			lume_removeAllListItemWithDispose(listener)

			self.listeners[k] = nil

			listpool_returnList(listener, 3)

			k, listener = next(self.listeners)
		end
	end
end

function EventEmitterV2:removeEventListener(event, listener)
	local listeners = self.listeners[event]

	if listeners then
		lume_removeListItemWithDispose(listeners, listener, true)

		if #listeners == 0 then
			self.listeners[event] = nil

			listpool_returnList(listeners, 3)
		end
	end
end

return EventEmitterV2
