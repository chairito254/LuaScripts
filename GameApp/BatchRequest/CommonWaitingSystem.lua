-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\CommonWaitingSystem.lua

local Class = require("Core.Framework.Class")
local SystemBase = require("GameApp.Core.SystemBase")
local BatchRequestWaiting = require("GameApp.BatchRequest.BatchRequestWaiting")
local Time = require("Core.Common.Time")
local ClientUtils = require("Utils.ClientUtils")
local CommonWaitingSystem = Class.LightClass("CommonWaitingSystem", SystemBase)

function CommonWaitingSystem:onCtor()
	self._active = nil
end

function CommonWaitingSystem:showForSeconds(seconds, text, callback)
	if self._active then
		return nil, "busy"
	end

	local ui = pg.global and pg.global.ui

	if not ui or not BatchRequestWaiting.canOpen(ui) then
		return nil, "busy"
	end

	local duration = tonumber(seconds) or 0

	if duration <= 0 then
		return nil, "invalidDuration"
	end

	local record = {
		system = self,
		deadline = Time.getTickSecond() + duration,
		callback = callback
	}

	self._active = record

	BatchRequestWaiting.open(self, record, ui, text, function()
		self:_finish("waitingClosed", record)
	end)

	return record
end

function CommonWaitingSystem:openUntilClosed(text, onReady, onClosed)
	if self._active then
		return nil, "busy"
	end

	local ui = pg.global and pg.global.ui

	if not ui or not BatchRequestWaiting.canOpen(ui) then
		return nil, "waitingUnavailable"
	end

	local record = {
		system = self,
		task = {
			state = "ready"
		},
		onReady = onReady,
		callback = onClosed
	}

	self._active = record

	BatchRequestWaiting.open(self, record, ui, text, function()
		self:_finish("waitingClosed", record)
	end)

	return record
end

function CommonWaitingSystem:isReady(handle)
	if handle == nil or self._active ~= handle or handle.ready ~= true or not BatchRequestWaiting.isOwned(handle) then
		return false
	end

	return handle.waitingUI.commonWaiting:isWaitingReady() == true
end

function CommonWaitingSystem:_finish(reason, record)
	record = record or self._active

	if not record or self._active ~= record then
		return false
	end

	self._active = nil

	BatchRequestWaiting.close(record)

	if record.callback then
		ClientUtils.tryWithLogErrorEx(record.callback, reason, record)
	end

	return true
end

function CommonWaitingSystem:close(handle, reason)
	if handle and self._active ~= handle then
		return false
	end

	return self:_finish(reason or "closed")
end

function CommonWaitingSystem:onTick()
	local record = self._active

	if not record then
		return
	end

	if record.task then
		if record.ready and not self:isReady(record) then
			self:_finish("waitingClosed", record)

			return
		end

		local ready, reason = BatchRequestWaiting.checkReady(record, Time.getTickSecond())

		if ready == false then
			self:_finish(reason, record)
		elseif ready and not record.ready then
			record.ready = true
			record.task.state = "running"

			if record.onReady then
				record.onReady(record)
			end
		end

		return
	end

	if Time.getTickSecond() >= record.deadline then
		self:_finish("timeout")

		return
	end

	if (record.openFailed or record.openCallbackReceived) and not BatchRequestWaiting.isOwned(record) then
		self:_finish("waitingClosed")
	end
end

function CommonWaitingSystem:onClear()
	self:_finish("cleared")
end

function CommonWaitingSystem:onDestroy()
	self:_finish("destroyed")
end

return CommonWaitingSystem
