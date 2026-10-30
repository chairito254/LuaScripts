-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\ServerBatchRequestSystem.lua

local Class = require("Core.Framework.Class")
local SystemBase = require("GameApp.Core.SystemBase")
local BatchRequestWaiting = require("GameApp.BatchRequest.BatchRequestWaiting")
local Const = require("Common.Const.Const")
local Time = require("Core.Common.Time")
local ClientUtils = require("Utils.ClientUtils")
local ItemConst = require("Common.Const.ItemConst")
local ServerBatchRequestSystem = Class.LightClass("ServerBatchRequestSystem", SystemBase)
local weakValueMeta = {
	__mode = "v"
}

function ServerBatchRequestSystem:onCtor()
	self._pending = {}
	self._active = nil
	self._disconnected = false
	self._stats = {
		cleanupRuns = 0,
		maxPending = 0,
		timeouts = 0,
		cleaned = 0,
		finished = 0,
		tracked = 0,
		cleanupRemoved = 0
	}
end

function ServerBatchRequestSystem:finishCallback(record, result, errorCode, errorArgs, reason)
	if record.finished then
		return
	end

	record.finished = true

	if record.callback then
		ClientUtils.tryWithLogErrorEx(record.callback, result, errorCode, errorArgs, reason)
	end
end

function ServerBatchRequestSystem:openWaiting()
	if self._active or not next(self._pending) then
		return true
	end

	local ui = pg.global and pg.global.ui

	if not ui or not BatchRequestWaiting.canOpen(ui) then
		return false
	end

	local record = {
		system = self
	}

	self._active = record

	BatchRequestWaiting.open(self, record, ui, nil, function()
		if self._disconnected then
			BatchRequestWaiting.close(record)

			return
		end

		self:clearRequests("waitingClosed")
	end)

	return true
end

function ServerBatchRequestSystem:closeWaiting()
	local record = self._active

	self._active = nil

	if record then
		BatchRequestWaiting.close(record)
	end
end

function ServerBatchRequestSystem:track(operationKey, player, callback, sendRequest, timeoutSeconds)
	if operationKey == nil or not player or player.destroyed or player ~= pg.me or self._disconnected then
		return nil, "unavailable"
	end

	if self._pending[operationKey] then
		return nil, "duplicate"
	end

	self._pending[operationKey] = {
		operationKey = operationKey,
		playerRef = setmetatable({
			player
		}, weakValueMeta),
		deadline = Time.getTickSecond() + (sendRequest and Const.BATCH_REQUEST_UI_OPEN_TIMEOUT_SECONDS or (timeoutSeconds or ItemConst.USE_ITEM_BATCH_EXPIRE_SECONDS) + Const.BATCH_REQUEST_SERVER_RESULT_GRACE_SECONDS),
		timeoutSeconds = timeoutSeconds,
		callback = callback,
		sendRequest = sendRequest
	}
	self._stats.tracked = self._stats.tracked + 1

	local pendingCount = 0

	for _ in pairs(self._pending) do
		pendingCount = pendingCount + 1
	end

	if pendingCount > self._stats.maxPending then
		self._stats.maxPending = pendingCount
	end

	if not self:openWaiting() then
		self._pending[operationKey] = nil

		return nil, "busy"
	end

	return operationKey
end

function ServerBatchRequestSystem:sendReadyRequests(now)
	if self._disconnected then
		return
	end

	local active = self._active

	if not active or not active.openCallbackReceived or not BatchRequestWaiting.isOwned(active) or not active.waitingUI.commonWaiting:isWaitingReady() then
		return
	end

	if not active.readyObserved then
		active.readyObserved = true

		return
	end

	local ready = {}

	for _, record in pairs(self._pending) do
		if record.sendRequest then
			ready[#ready + 1] = record
		end
	end

	for _, record in ipairs(ready) do
		if self._disconnected then
			return
		end

		if self._pending[record.operationKey] == record then
			local sendRequest = record.sendRequest

			record.sendRequest = nil
			record.deadline = now + (record.timeoutSeconds or ItemConst.USE_ITEM_BATCH_EXPIRE_SECONDS) + Const.BATCH_REQUEST_SERVER_RESULT_GRACE_SECONDS

			local ok, callbackId = ClientUtils.tryWithLogError(sendRequest)

			if not ok or not callbackId then
				self:finish(record.operationKey, nil, nil, nil, "sendFailed")
			end
		end
	end
end

function ServerBatchRequestSystem:finish(operationKey, result, errorCode, errorArgs, reason)
	local record = self._pending[operationKey]

	if not record then
		return false
	end

	self._pending[operationKey] = nil
	self._stats.finished = self._stats.finished + 1

	if reason == "timeout" then
		self._stats.timeouts = self._stats.timeouts + 1
	end

	self:finishCallback(record, result, errorCode, errorArgs, reason)

	if not next(self._pending) then
		self:closeWaiting()
	end

	return true
end

function ServerBatchRequestSystem:onUseItemBatchFinished(result, player)
	if not result or result.opNUID == nil then
		return false
	end

	local record = self._pending[result.opNUID]

	if not record then
		return false
	end

	if record.sendRequest then
		return false
	end

	local currentPlayer = record.playerRef[1]

	if player and currentPlayer ~= player then
		return false
	end

	if not currentPlayer or currentPlayer.destroyed or currentPlayer ~= pg.me then
		self:finish(result.opNUID, nil, nil, nil, "playerDestroyed")

		return false
	end

	if Time.getTickSecond() >= record.deadline then
		self:finish(result.opNUID, nil, nil, nil, "timeout")

		return false
	end

	return self:finish(result.opNUID, result, nil, nil, "completed")
end

function ServerBatchRequestSystem:onTick()
	local now = Time.getTickSecond()

	self._stats.cleanupRuns = self._stats.cleanupRuns + 1

	local expired = {}

	for operationKey, record in pairs(self._pending) do
		local player = record.playerRef[1]

		if now >= record.deadline then
			expired[#expired + 1] = {
				operationKey,
				record.sendRequest and "waitingUnavailable" or "timeout"
			}
		elseif not player or player.destroyed or player ~= pg.me then
			expired[#expired + 1] = {
				operationKey,
				"playerDestroyed"
			}
		end
	end

	for _, item in ipairs(expired) do
		self:finish(item[1], nil, nil, nil, item[2])
	end

	self._stats.cleanupRemoved = self._stats.cleanupRemoved + #expired

	if not self._disconnected and self._active and (self._active.openFailed or self._active.openCallbackReceived) and not BatchRequestWaiting.isOwned(self._active) then
		self:clearRequests("waitingClosed")
	elseif not self._active and next(self._pending) then
		self:openWaiting()
	end

	self:sendReadyRequests(now)

	local player = pg.me

	if player and not player.destroyed and player.tryShowUseItemBatchRewards then
		player:tryShowUseItemBatchRewards()
	end
end

function ServerBatchRequestSystem:clearRequests(reason)
	local pending = self._pending

	self._pending = {}

	self:closeWaiting()

	local cleaned = 0

	for _, record in pairs(pending) do
		cleaned = cleaned + 1

		self:finishCallback(record, nil, nil, nil, reason)
	end

	self._stats.cleaned = self._stats.cleaned + cleaned
end

function ServerBatchRequestSystem:getPendingStats()
	local pendingCount = 0

	for _ in pairs(self._pending) do
		pendingCount = pendingCount + 1
	end

	return {
		pending = pendingCount,
		tracked = self._stats.tracked,
		finished = self._stats.finished,
		cleaned = self._stats.cleaned,
		timeouts = self._stats.timeouts,
		maxPending = self._stats.maxPending,
		cleanupRuns = self._stats.cleanupRuns,
		cleanupRemoved = self._stats.cleanupRemoved
	}
end

function ServerBatchRequestSystem:onDisconnected()
	self._disconnected = true
end

function ServerBatchRequestSystem:onConnected()
	self._disconnected = false

	if self._active and not BatchRequestWaiting.isOwned(self._active) then
		local record = self._active

		self._active = nil

		BatchRequestWaiting.close(record)
	end

	if next(self._pending) then
		self:openWaiting()
	end
end

function ServerBatchRequestSystem:onPlayerDestroy(player)
	local pending = {}

	for operationKey, record in pairs(self._pending) do
		if record.playerRef[1] == player then
			pending[#pending + 1] = operationKey
		end
	end

	for _, operationKey in ipairs(pending) do
		self:finish(operationKey, nil, nil, nil, "playerDestroyed")
	end
end

function ServerBatchRequestSystem:onBackToLogin()
	self:clearRequests("logout")
end

function ServerBatchRequestSystem:onPlayerInit(player)
	if player == pg.me then
		self._disconnected = false
	end
end

function ServerBatchRequestSystem:onClear()
	self:clearRequests("cleared")
end

function ServerBatchRequestSystem:onDestroy()
	self:clearRequests("destroyed")
end

return ServerBatchRequestSystem
