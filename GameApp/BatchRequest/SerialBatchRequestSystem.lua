-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\SerialBatchRequestSystem.lua

local Class = require("Core.Framework.Class")
local SystemBase = require("GameApp.Core.SystemBase")
local SerialBatchRequestTask = require("GameApp.BatchRequest.SerialBatchRequestTask")
local BatchRequestShared = require("GameApp.BatchRequest.BatchRequestShared")
local BatchRequestWaiting = require("GameApp.BatchRequest.BatchRequestWaiting")
local Time = require("Core.Common.Time")
local Utils = require("Common.Utils.Utils")
local ItemUtils = require("Common.Utils.ItemUtils")
local Const = require("Common.Const.Const")
local ClientUtils = require("Utils.ClientUtils")
local UIConst = require("Const.UIConst")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("SerialBatchRequestSystem")
local SerialBatchRequestSystem = Class.LightClass("SerialBatchRequestSystem", SystemBase)
local discardRewardReasons = {
	cleared = true,
	logout = true,
	destroyed = true
}
local lateBatchReasons = {
	sendFailed = true,
	timeout = true,
	waitingClosed = true,
	totalTimeout = true,
	disconnected = true
}
local weakValueMeta = {
	__mode = "v"
}

function SerialBatchRequestSystem:onCtor()
	self._pendingRewards = {}
	self._disconnected = false
	self._epoch = 0
	self._lateBatches = {}
end

function SerialBatchRequestSystem:isBusy()
	return self._active ~= nil or self._settling == true
end

function SerialBatchRequestSystem:start(options)
	if self._active or self._settling then
		return nil, "busy"
	end

	if Utils.isNilOrEmptyTable(options) or Utils.isNilOrEmptyTable(options.items) then
		return nil, "empty"
	end

	local optionsLen = #options.items
	local size = math.floor(math.clamp(tonumber(options.batchSize) or 1, 1, optionsLen))
	local timeout = math.clamp(tonumber(options.batchTimeout) or Const.BATCH_REQUEST_DEFAULT_TIMEOUT_SECONDS, Const.BATCH_REQUEST_TICK_INTERVAL_SECONDS, Const.BATCH_REQUEST_MAX_TIMEOUT_SECONDS)
	local maxRetries = math.floor(math.clamp(tonumber(options.maxRetries) or Const.BATCH_REQUEST_DEFAULT_RETRY_COUNT, 0, Const.BATCH_REQUEST_MAX_RETRY_COUNT))

	if size ~= size or timeout ~= timeout or maxRetries ~= maxRetries or type(options.sendBatch) ~= "function" then
		return nil, "invalidOptions"
	end

	if not BatchRequestShared.canReserveClientBatch(math.ceil(optionsLen / size)) then
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

	local record = {
		id = BatchRequestShared.nextTaskId(),
		epoch = self._epoch,
		playerRef = setmetatable({
			player
		}, weakValueMeta),
		uid = player.uid,
		rewardSource = options.rewardSource,
		onFinished = options.onFinished,
		onLateBatchCompleted = options.onLateBatchCompleted,
		onLateBatchFailed = options.onLateBatchFailed,
		roundDeadline = Time.getTickSecond() + Const.BATCH_REQUEST_TOTAL_TIMEOUT_SECONDS
	}

	record.task = SerialBatchRequestTask({
		items = Utils.deepCopyTable(options.items),
		batchSize = size,
		batchTimeout = timeout,
		maxRetries = maxRetries,
		getTime = Time.getTickSecond,
		nextBatchId = BatchRequestShared.nextClientBatch,
		sendBatch = options.sendBatch,
		shouldRetryError = options.shouldRetryError,
		onBatchCompleted = options.onBatchCompleted,
		onFinished = function(summary)
			self:finishTask(record, summary)
		end
	})
	self._active = record

	BatchRequestWaiting.open(self, record, ui, options.waitingText)

	return record.id
end

function SerialBatchRequestSystem:onBatchCompleted(clientBatch, result, completedItemDict)
	local lateBatch = self._lateBatches[clientBatch]

	if lateBatch then
		return self:completeLateBatch(lateBatch, result, completedItemDict)
	end

	local record = self._active
	local now = Time.getTickSecond()

	if record and now >= record.roundDeadline then
		record.task:finish("totalTimeout")

		local lateBatch = self._lateBatches[clientBatch]

		if lateBatch then
			return self:completeLateBatch(lateBatch, result, completedItemDict)
		end

		return false
	end

	local batch = record and record.task.pendingBatch

	if not batch or batch.clientBatch ~= clientBatch then
		return false
	end

	local player = record.playerRef[1]

	if not player or player.destroyed or player ~= pg.me then
		record.task:finish("playerDestroyed")

		return false
	end

	local rewards
	local ok = ClientUtils.tryWithLogError(function()
		rewards = ItemUtils.formatIdNumBoundDict(completedItemDict or {}, true)
	end)

	if not ok then
		record.task:fail(clientBatch, "invalidResponse")

		return false
	end

	return record.task:complete(clientBatch, result, rewards, now)
end

function SerialBatchRequestSystem:onBatchFailed(clientBatch, reason)
	local lateBatch = self._lateBatches[clientBatch]

	if lateBatch then
		self._lateBatches[clientBatch] = nil

		if lateBatch.onFailed then
			ClientUtils.tryWithLogErrorEx(lateBatch.onFailed, reason, lateBatch.batch)
		end

		return false
	end

	local record = self._active

	if record then
		return record.task:fail(clientBatch, reason)
	end

	return false
end

function SerialBatchRequestSystem:enqueuePendingRewards(rewards, source, playerRef, uid)
	if not Utils.isTable(rewards) or not next(rewards) then
		return
	end

	for _, pending in ipairs(self._pendingRewards) do
		if pending.uid == uid and pending.source == source then
			ClientUtils.tryWithLogError(function()
				ItemUtils.mergeItemInfoResult(pending.rewards, rewards)
			end)

			return
		end
	end

	self._pendingRewards[#self._pendingRewards + 1] = {
		rewards = rewards,
		source = source,
		playerRef = playerRef,
		uid = uid
	}
end

function SerialBatchRequestSystem:clearExpiredLateBatches(now)
	for clientBatch, lateBatch in pairs(self._lateBatches) do
		if lateBatch.expireAt and now >= lateBatch.expireAt then
			self._lateBatches[clientBatch] = nil
		end
	end
end

function SerialBatchRequestSystem:completeLateBatch(lateBatch, result, completedItemDict)
	self._lateBatches[lateBatch.clientBatch] = nil

	local rewards
	local ok = ClientUtils.tryWithLogError(function()
		rewards = ItemUtils.formatIdNumBoundDict(completedItemDict or {}, true)
	end)

	if not ok then
		return false
	end

	if lateBatch.onCompleted then
		ClientUtils.tryWithLogErrorEx(lateBatch.onCompleted, result, lateBatch.batch, rewards)
	end

	if lateBatch.epoch == self._epoch and not discardRewardReasons[lateBatch.reason] then
		self:enqueuePendingRewards(rewards, lateBatch.rewardSource, lateBatch.playerRef, lateBatch.uid)
	end

	return false
end

function SerialBatchRequestSystem:onBatchAttemptFailed(clientBatch, reason)
	local record = self._active

	if record then
		return record.task:attemptFailed(clientBatch, reason, Time.getTickSecond())
	end

	return false
end

function SerialBatchRequestSystem:cancel(taskId, reason)
	local record = self._active

	if record and record.id == taskId then
		record.task:finish(reason or "cancelled")
	end
end

function SerialBatchRequestSystem:finishTask(record, summary)
	if self._active ~= record then
		return
	end

	self._active = nil
	self._settling = true
	summary.taskId = record.id

	if summary.pendingBatch and lateBatchReasons[summary.reason] and not summary.pendingBatch.noLateTracking then
		self._lateBatches[summary.pendingBatch.clientBatch] = {
			clientBatch = summary.pendingBatch.clientBatch,
			epoch = record.epoch,
			reason = summary.reason,
			rewardSource = record.rewardSource,
			playerRef = record.playerRef,
			uid = record.uid,
			batch = summary.pendingBatch,
			onCompleted = record.onLateBatchCompleted,
			onFailed = record.onLateBatchFailed,
			expireAt = Time.getTickSecond() + Const.BATCH_REQUEST_LATE_EXPIRE_SECONDS
		}
	end

	local rewards = {}

	ClientUtils.tryWithLogError(function()
		for _, result in ipairs(summary.results) do
			ItemUtils.mergeItemInfoResult(rewards, result.rewards)
		end
	end)

	for itemId, numInfo in pairs(rewards) do
		if ItemUtils.getItemCountFromNumInfo(numInfo) <= 0 then
			rewards[itemId] = nil
		end
	end

	summary.completedItemDict = rewards

	if summary.error and LoggerManager.checkLogger(LoggerConst.ERROR) then
		logger:error("batch request ended: %s, %s", summary.reason, tostring(summary.error))
	end

	local onFinished = record.onFinished

	record.onFinished = nil

	if onFinished then
		ClientUtils.tryWithLogErrorEx(onFinished, summary)
	end

	BatchRequestWaiting.close(record)

	if record.epoch == self._epoch and not discardRewardReasons[summary.reason] then
		self:enqueuePendingRewards(rewards, record.rewardSource, record.playerRef, record.uid)
	end

	self._settling = false
end

function SerialBatchRequestSystem:tryShowRewards()
	if self._active or self._settling or self._disconnected or self._playerUnavailable then
		return
	end

	if next(self._lateBatches) then
		return
	end

	local pending = self._pendingRewards[1]
	local player = pg.me
	local ui = pg.global and pg.global.ui

	if not pending or not player or player.destroyed or not ui then
		return
	end

	if pending.playerRef[1] ~= player and (not pending.uid or pending.uid ~= player.uid) then
		table.remove(self._pendingRewards, 1)

		return
	end

	if ui:checkUIOpen(UIConst.UI_ID_NET_LOADING) or ui:checkUIOpen(UIConst.UI_ID_COMMON_WAITING) then
		return
	end

	local tips = ui.tips

	if tips then
		local ok, shown = ClientUtils.tryWithLogErrorEx(tips.showBatchRequestRewards, tips, pending.rewards, pending.source)

		if ok and shown then
			table.remove(self._pendingRewards, 1)
		end
	end
end

function SerialBatchRequestSystem:onTick()
	local now = Time.getTickSecond()

	self:clearExpiredLateBatches(now)

	local record = self._active

	if record then
		local player = record.playerRef[1]

		if now >= record.roundDeadline then
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

	self:tryShowRewards()
end

function SerialBatchRequestSystem:onDisconnected()
	self._disconnected = true

	if self._active then
		self._active.task:finish("disconnected")
	end
end

function SerialBatchRequestSystem:onConnected()
	self._disconnected = false
end

function SerialBatchRequestSystem:onPlayerDestroy(player)
	if player == pg.me then
		self._playerUnavailable = true
	end

	if self._active and self._active.playerRef[1] == player then
		self._active.task:finish("playerDestroyed")
	end
end

function SerialBatchRequestSystem:onPlayerInit(player)
	if player == pg.me then
		self._playerUnavailable = false
	end
end

function SerialBatchRequestSystem:clearRequests(reason)
	self._epoch = self._epoch + 1

	if self._active then
		self._active.task:finish(reason)
	end

	self._pendingRewards = {}
	self._lateBatches = {}
end

function SerialBatchRequestSystem:onBackToLogin()
	self:clearRequests("logout")
end

function SerialBatchRequestSystem:onClear()
	self:clearRequests("cleared")
end

function SerialBatchRequestSystem:onDestroy()
	self:clearRequests("destroyed")
end

return SerialBatchRequestSystem
