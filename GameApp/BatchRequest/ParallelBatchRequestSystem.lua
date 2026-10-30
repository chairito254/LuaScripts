-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\ParallelBatchRequestSystem.lua

local Class = require("Core.Framework.Class")
local SystemBase = require("GameApp.Core.SystemBase")
local ParallelBatchRequestTask = require("GameApp.BatchRequest.ParallelBatchRequestTask")
local BatchRequestShared = require("GameApp.BatchRequest.BatchRequestShared")
local BatchRequestWaiting = require("GameApp.BatchRequest.BatchRequestWaiting")
local Time = require("Core.Common.Time")
local Utils = require("Common.Utils.Utils")
local Const = require("Common.Const.Const")
local ClientUtils = require("Utils.ClientUtils")
local UIConst = require("Const.UIConst")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("ParallelBatchRequestSystem")
local ParallelBatchRequestSystem = Class.LightClass("ParallelBatchRequestSystem", SystemBase)
local lateBatchReasons = {
	totalTimeout = true,
	disconnected = true,
	sendFailed = true,
	timeout = true,
	waitingClosed = true,
	callbackError = true,
	playerDestroyed = true,
	cancelled = true
}
local weakValueMeta = {
	__mode = "v"
}

function ParallelBatchRequestSystem:onCtor()
	self._disconnected = false
	self._epoch = 0
	self._lateBatches = {}
end

function ParallelBatchRequestSystem:start(options)
	if self._active or self._settling then
		return nil, "busy"
	end

	if Utils.isNilOrEmptyTable(options) or Utils.isNilOrEmptyTable(options.items) then
		return nil, "empty"
	end

	local itemCount = #options.items
	local timeout = math.clamp(tonumber(options.batchTimeout) or Const.BATCH_REQUEST_DEFAULT_TIMEOUT_SECONDS, Const.BATCH_REQUEST_PARALLEL_TICK_INTERVAL_SECONDS, Const.BATCH_REQUEST_MAX_TIMEOUT_SECONDS)
	local maxRetries = math.floor(math.clamp(tonumber(options.maxRetries) or Const.BATCH_REQUEST_DEFAULT_RETRY_COUNT, 0, Const.BATCH_REQUEST_MAX_RETRY_COUNT))
	local sendInterval = math.clamp(tonumber(options.sendInterval) or Const.BATCH_REQUEST_PARALLEL_SEND_INTERVAL_SECONDS, Const.BATCH_REQUEST_PARALLEL_TICK_INTERVAL_SECONDS, Const.BATCH_REQUEST_TOTAL_TIMEOUT_SECONDS)

	if timeout ~= timeout or maxRetries ~= maxRetries or sendInterval ~= sendInterval or type(options.sendBatch) ~= "function" then
		return nil, "invalidOptions"
	end

	if not BatchRequestShared.canReserveClientBatch(itemCount) then
		return nil, "batchIdExhausted"
	end

	local ui = pg.global and pg.global.ui

	if not ui or ui:checkUIOpen(UIConst.UI_ID_NET_LOADING) then
		return nil, "unavailable_netLoading"
	end

	if not BatchRequestWaiting.canOpen(ui) then
		return nil, "busy"
	end

	local player = options.player or pg.me

	if not player or player.destroyed or player ~= pg.me then
		return nil, "unavailable_player"
	end

	if self._disconnected then
		return nil, "unavailable_disconnected"
	end

	local now = Time.getTickSecond()
	local record = {
		id = BatchRequestShared.nextTaskId(),
		operationId = BatchRequestShared.nextOperationId(),
		epoch = self._epoch,
		playerRef = setmetatable({
			player
		}, weakValueMeta),
		uid = player.uid,
		onFinished = options.onFinished,
		onLateBatchCompleted = options.onLateBatchCompleted,
		onLateBatchFailed = options.onLateBatchFailed,
		roundDeadline = now + Const.BATCH_REQUEST_TOTAL_TIMEOUT_SECONDS
	}

	record.task = ParallelBatchRequestTask({
		items = Utils.deepCopyTable(options.items),
		batchTimeout = timeout,
		maxRetries = maxRetries,
		sendInterval = sendInterval,
		operationId = record.operationId,
		getTime = Time.getTickSecond,
		nextBatchId = BatchRequestShared.nextClientBatch,
		sendBatch = options.sendBatch,
		shouldRetryError = options.shouldRetryError,
		onBatchCompleted = options.onBatchCompleted,
		onBatchFailed = options.onBatchFailed,
		onFinished = function(summary)
			self:finishTask(record, summary)
		end
	})
	self._active = record

	BatchRequestWaiting.open(self, record, ui, options.waitingText)

	return record.id
end

function ParallelBatchRequestSystem:onBatchCompleted(clientBatch, result)
	local lateBatch = self._lateBatches[clientBatch]

	if lateBatch then
		return self:completeLateBatch(lateBatch, result)
	end

	local record = self._active

	if not record then
		return false
	end

	local now = Time.getTickSecond()

	if now >= record.roundDeadline then
		record.task:finish("totalTimeout")

		lateBatch = self._lateBatches[clientBatch]

		if lateBatch then
			return self:completeLateBatch(lateBatch, result)
		end

		return false
	end

	if not record.task:getPendingBatch(clientBatch) then
		return false
	end

	local player = record.playerRef[1]

	if not player or player.destroyed or player ~= pg.me then
		record.task:finish("playerDestroyed")

		return false
	end

	return record.task:complete(clientBatch, result, nil, now)
end

function ParallelBatchRequestSystem:completeLateBatch(lateBatch, result)
	self._lateBatches[lateBatch.clientBatch] = nil

	if lateBatch.onCompleted then
		ClientUtils.tryWithLogErrorEx(lateBatch.onCompleted, result, lateBatch.request)
	end

	return false
end

function ParallelBatchRequestSystem:onBatchFailed(clientBatch, reason)
	local lateBatch = self._lateBatches[clientBatch]

	if lateBatch then
		self._lateBatches[clientBatch] = nil

		if lateBatch.onFailed then
			ClientUtils.tryWithLogErrorEx(lateBatch.onFailed, reason, lateBatch.request)
		end

		return false
	end

	local record = self._active

	if record then
		return record.task:fail(clientBatch, reason)
	end

	return false
end

function ParallelBatchRequestSystem:onBatchAttemptFailed(clientBatch, reason)
	local record = self._active

	if record then
		return record.task:attemptFailed(clientBatch, reason, Time.getTickSecond())
	end

	return false
end

function ParallelBatchRequestSystem:cancel(taskId, reason)
	local record = self._active

	if record and record.id == taskId then
		record.task:finish(reason or "cancelled")
	end
end

function ParallelBatchRequestSystem:finishTask(record, summary)
	if self._active ~= record then
		return
	end

	self._active = nil
	self._settling = true
	summary.taskId = record.id

	if lateBatchReasons[summary.reason] and summary.pendingRequests then
		local now = Time.getTickSecond()

		for _, request in ipairs(summary.pendingRequests) do
			if request.clientBatch and not request.noLateTracking then
				self._lateBatches[request.clientBatch] = {
					clientBatch = request.clientBatch,
					epoch = record.epoch,
					reason = summary.reason,
					request = request,
					onCompleted = record.onLateBatchCompleted,
					onFailed = record.onLateBatchFailed,
					expireAt = now + Const.BATCH_REQUEST_LATE_EXPIRE_SECONDS
				}
			end
		end
	end

	if summary.error and LoggerManager.checkLogger(LoggerConst.ERROR) then
		logger:error("parallel batch request ended: %s, %s", summary.reason, tostring(summary.error))
	end

	local onFinished = record.onFinished

	record.onFinished = nil

	if onFinished then
		ClientUtils.tryWithLogErrorEx(onFinished, summary)
	end

	BatchRequestWaiting.close(record)

	self._settling = false
end

function ParallelBatchRequestSystem:clearExpiredLateBatches(now)
	for clientBatch, lateBatch in pairs(self._lateBatches) do
		if lateBatch.expireAt and now >= lateBatch.expireAt then
			self._lateBatches[clientBatch] = nil
		end
	end
end

function ParallelBatchRequestSystem:onTick()
	local record = self._active
	local now = Time.getTickSecond()

	if record then
		local player = record.playerRef[1]

		if now >= record.roundDeadline then
			if LoggerManager.checkLogger(LoggerConst.ERROR) then
				logger:error("parallel batch request total timeout, taskId=%s, completed=%s, failed=%s, total=%s", tostring(record.id), tostring(#record.task.results), tostring(#record.task.failures), tostring(#record.task.requests))
			end

			record.task:finish("totalTimeout")
		elseif not player or player.destroyed or player ~= pg.me then
			record.task:finish("playerDestroyed")
		else
			local ready, reason = BatchRequestWaiting.checkReady(record, now)

			if ready == false then
				record.task:finish(reason)
			elseif ready then
				if record.task.state == "ready" then
					record.task:start(now)
				else
					record.task:tick(now)
				end
			end
		end
	end

	self:clearExpiredLateBatches(now)
end

function ParallelBatchRequestSystem:onDisconnected()
	self._disconnected = true

	if self._active then
		self._active.task:finish("disconnected")
	end
end

function ParallelBatchRequestSystem:onConnected()
	self._disconnected = false
end

function ParallelBatchRequestSystem:onPlayerDestroy(player)
	if self._active and self._active.playerRef[1] == player then
		self._active.task:finish("playerDestroyed")
	end
end

function ParallelBatchRequestSystem:clearRequests(reason)
	self._epoch = self._epoch + 1

	if self._active then
		self._active.task:finish(reason)
	end

	self._lateBatches = {}
end

function ParallelBatchRequestSystem:onBackToLogin()
	self:clearRequests("logout")
end

function ParallelBatchRequestSystem:onClear()
	self:clearRequests("cleared")
end

function ParallelBatchRequestSystem:onDestroy()
	self:clearRequests("destroyed")
end

return ParallelBatchRequestSystem
