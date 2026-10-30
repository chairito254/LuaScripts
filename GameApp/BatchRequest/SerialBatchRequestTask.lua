-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\SerialBatchRequestTask.lua

local Class = require("Core.Framework.Class")
local Const = require("Common.Const.Const")
local BatchRequestShared = require("GameApp.BatchRequest.BatchRequestShared")
local SerialBatchRequestTask = Class.LiteClass("SerialBatchRequestTask")

function SerialBatchRequestTask:ctor(options)
	self.options = options
	self.batches = {}
	self.results = {}
	self.state = "ready"
	self.batchIndex = 0
	self.maxRetries = options.maxRetries

	if self.maxRetries == nil then
		self.maxRetries = Const.BATCH_REQUEST_DEFAULT_RETRY_COUNT
	end

	for index, item in ipairs(options.items) do
		local batchIndex = math.floor((index - 1) / options.batchSize) + 1
		local batch = self.batches[batchIndex]

		if not batch then
			batch = {}
			self.batches[batchIndex] = batch
		end

		batch[#batch + 1] = item
	end
end

function SerialBatchRequestTask:start(now)
	if self.state ~= "ready" then
		return
	end

	self.state = "running"

	self:sendNext(now)
end

function SerialBatchRequestTask:sendNext(now)
	if self.state ~= "running" then
		return
	end

	self.batchIndex = self.batchIndex + 1

	local items = self.batches[self.batchIndex]

	if not items then
		self:finish("success")

		return
	end

	if self.options.getTime then
		now = self.options.getTime()
	end

	local batch = {
		attemptIndex = 0,
		retryCount = 0,
		items = items,
		index = self.batchIndex,
		clientBatch = self.options.nextBatchId()
	}

	self.pendingBatch = batch

	self:sendAttempt(batch, now)
end

function SerialBatchRequestTask:getNow(now)
	if self.options.getTime then
		return self.options.getTime()
	end

	return now
end

function SerialBatchRequestTask:getRetryDelay(retryCount)
	return Const.BATCH_REQUEST_RETRY_INITIAL_DELAY_SECONDS * 2^(retryCount - 1)
end

function SerialBatchRequestTask:sendAttempt(batch, now)
	if self.state ~= "running" or self.pendingBatch ~= batch then
		return
	end

	now = self:getNow(now)
	batch.attemptIndex = batch.attemptIndex + 1
	batch.state = "pending"
	batch.retryAt = nil
	batch.deadline = now + self.options.batchTimeout

	local ok, result = pcall(self.options.sendBatch, batch.items, batch.clientBatch, batch)

	if self.state ~= "running" or self.pendingBatch ~= batch then
		return
	end

	if not ok then
		self:handleAttemptFailure(batch, "sendFailed", now, result)
	elseif result == false then
		self:handleAttemptFailure(batch, "sendFailed", now)
	end
end

function SerialBatchRequestTask:complete(clientBatch, result, rewards, now)
	local batch = self.pendingBatch

	if self.state ~= "running" or not batch or batch.clientBatch ~= clientBatch then
		return false
	end

	if batch.state == "completed" or batch.state == "failed" then
		return false
	end

	batch.state = "completed"
	batch.completedAt = now
	self.pendingBatch = nil
	self.results[#self.results + 1] = {
		clientBatch = clientBatch,
		result = result,
		rewards = rewards or {}
	}

	if self.options.onBatchCompleted then
		local ok, err = pcall(self.options.onBatchCompleted, result, batch)

		if not ok then
			self.error = err

			self:finish("callbackError")

			return true
		end
	end

	self:sendNext(now)

	return true
end

function SerialBatchRequestTask:fail(clientBatch, reason)
	if self.state ~= "running" or not self.pendingBatch or self.pendingBatch.clientBatch ~= clientBatch then
		return false
	end

	self.pendingBatch.state = "failed"

	self:finish(reason or "failed")

	return true
end

function SerialBatchRequestTask:attemptFailed(clientBatch, reason, now)
	if self.state ~= "running" or not self.pendingBatch or self.pendingBatch.clientBatch ~= clientBatch then
		return false
	end

	if self.pendingBatch.state ~= "pending" then
		return false
	end

	return self:handleAttemptFailure(self.pendingBatch, reason or "failed", now or self:getNow())
end

function SerialBatchRequestTask:tick(now)
	if self.state ~= "running" or not self.pendingBatch then
		return
	end

	local batch = self.pendingBatch

	if batch.state == "retryWaiting" then
		if now >= batch.retryAt then
			self:sendAttempt(batch, now)
		end
	elseif batch.state == "pending" and now >= batch.deadline then
		self:handleAttemptFailure(batch, "timeout", now)
	end
end

function SerialBatchRequestTask:handleAttemptFailure(batch, reason, now, error)
	if self.state ~= "running" or self.pendingBatch ~= batch then
		return false
	end

	if error then
		batch.lastError = error
	end

	local errorCode = type(reason) == "table" and reason.errorCode or reason
	local shouldRetry = self.options.shouldRetryError

	if shouldRetry == nil then
		shouldRetry = BatchRequestShared.shouldRetryError
	end

	if batch.retryCount < self.maxRetries and shouldRetry(errorCode) then
		batch.retryCount = batch.retryCount + 1
		batch.state = "retryWaiting"
		batch.retryAt = now + self:getRetryDelay(batch.retryCount)
		batch.lastFailureReason = reason

		return true
	end

	batch.state = "failed"
	self.error = error or batch.lastError

	self:finish(reason)

	return false
end

function SerialBatchRequestTask:finish(reason)
	if self.state == "finished" then
		return
	end

	self.state = "finished"

	local summary = {
		reason = reason,
		results = self.results,
		completedBatchCount = #self.results,
		totalBatchCount = #self.batches,
		pendingBatch = self.pendingBatch,
		error = self.error
	}

	self.pendingBatch = nil
	self.summary = summary

	if self.options.onFinished then
		self.options.onFinished(summary)
	end
end

return SerialBatchRequestTask
