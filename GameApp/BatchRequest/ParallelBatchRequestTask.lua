-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\ParallelBatchRequestTask.lua

local Class = require("Core.Framework.Class")
local Const = require("Common.Const.Const")
local BatchRequestShared = require("GameApp.BatchRequest.BatchRequestShared")
local ParallelBatchRequestTask = Class.LiteClass("ParallelBatchRequestTask")
local STATE_PENDING = "pending"
local STATE_RETRY_WAITING = "retryWaiting"
local STATE_COMPLETED = "completed"
local STATE_FAILED = "failed"

function ParallelBatchRequestTask:ctor(options)
	self.options = options
	self.requests = {}
	self.results = {}
	self.failures = {}
	self.pendingRequests = {}
	self.state = "ready"
	self.settledCount = 0
	self.nextSendIndex = 1
	self.nextSendTime = 0
	self.operationId = options.operationId
	self.sendInterval = options.sendInterval

	if self.sendInterval == nil then
		self.sendInterval = Const.BATCH_REQUEST_PARALLEL_SEND_INTERVAL_SECONDS
	end

	self.maxRetries = options.maxRetries

	if self.maxRetries == nil then
		self.maxRetries = Const.BATCH_REQUEST_DEFAULT_RETRY_COUNT
	end

	for index, item in ipairs(options.items) do
		self.requests[index] = {
			attemptIndex = 0,
			retryCount = 0,
			index = index,
			item = item,
			operationId = self.operationId
		}
	end
end

function ParallelBatchRequestTask:getNow(now)
	if now ~= nil then
		return now
	end

	if self.options.getTime then
		return self.options.getTime()
	end

	return 0
end

function ParallelBatchRequestTask:start(now)
	if self.state ~= "ready" then
		return
	end

	self.state = "running"
	self.nextSendTime = now

	self:tick(now)
end

function ParallelBatchRequestTask:getPendingBatch(clientBatch)
	return self.pendingRequests[clientBatch]
end

function ParallelBatchRequestTask:getRetryDelay(retryCount)
	return Const.BATCH_REQUEST_RETRY_INITIAL_DELAY_SECONDS * 2^(retryCount - 1)
end

function ParallelBatchRequestTask:takeSendableRequest(now)
	for index = 1, #self.requests do
		local request = self.requests[index]

		if request.state == STATE_RETRY_WAITING and request.retryAt and now >= request.retryAt then
			return request
		end
	end

	if self.nextSendIndex <= #self.requests then
		local request = self.requests[self.nextSendIndex]

		self.nextSendIndex = self.nextSendIndex + 1

		return request
	end

	return nil
end

function ParallelBatchRequestTask:sendAttempt(request, now)
	if self.state ~= "running" or request.state == STATE_COMPLETED or request.state == STATE_FAILED then
		return
	end

	if not request.clientBatch then
		request.clientBatch = self.options.nextBatchId()
	end

	request.attemptIndex = request.attemptIndex + 1
	request.state = STATE_PENDING
	request.retryAt = nil
	request.deadline = now + self.options.batchTimeout
	self.pendingRequests[request.clientBatch] = request

	local ok, result = pcall(self.options.sendBatch, request.item, request.clientBatch, request)

	if self.state ~= "running" or request.state ~= STATE_PENDING then
		return
	end

	if not ok then
		self:handleAttemptFailure(request, "sendFailed", now, result)
	elseif result == false then
		self:handleAttemptFailure(request, "sendFailed", now)
	end
end

function ParallelBatchRequestTask:complete(clientBatch, result, rewards, now)
	local request = self.pendingRequests[clientBatch]

	if self.state ~= "running" or not request then
		return false
	end

	if request.state == STATE_COMPLETED or request.state == STATE_FAILED then
		return false
	end

	request.state = STATE_COMPLETED
	request.completedAt = now
	self.pendingRequests[clientBatch] = nil
	self.settledCount = self.settledCount + 1
	self.results[#self.results + 1] = {
		clientBatch = clientBatch,
		index = request.index,
		result = result,
		rewards = rewards or {}
	}

	if self.options.onBatchCompleted then
		local ok, err = pcall(self.options.onBatchCompleted, result, request)

		if not ok then
			self.error = err

			self:finish("callbackError")

			return true
		end
	end

	self:checkFinished()

	return true
end

function ParallelBatchRequestTask:fail(clientBatch, reason)
	local request = self.pendingRequests[clientBatch]

	if self.state ~= "running" or not request then
		return false
	end

	if request.state == STATE_COMPLETED or request.state == STATE_FAILED then
		return false
	end

	self:settleFailed(request, reason or "failed")
	self:checkFinished()

	return true
end

function ParallelBatchRequestTask:attemptFailed(clientBatch, reason, now)
	local request = self.pendingRequests[clientBatch]

	if self.state ~= "running" or not request or request.state ~= STATE_PENDING then
		return false
	end

	local retrying = self:handleAttemptFailure(request, reason or "failed", self:getNow(now))

	self:checkFinished()

	return retrying
end

function ParallelBatchRequestTask:settleFailed(request, reason)
	request.state = STATE_FAILED
	request.failureReason = reason

	if request.clientBatch then
		self.pendingRequests[request.clientBatch] = nil
	end

	self.settledCount = self.settledCount + 1
	self.failures[#self.failures + 1] = {
		clientBatch = request.clientBatch,
		index = request.index,
		item = request.item,
		reason = reason,
		error = request.lastError
	}

	if self.options.onBatchFailed then
		pcall(self.options.onBatchFailed, reason, request)
	end
end

function ParallelBatchRequestTask:handleAttemptFailure(request, reason, now, error)
	if self.state ~= "running" or request.state == STATE_COMPLETED or request.state == STATE_FAILED then
		return false
	end

	if error then
		request.lastError = error
	end

	local errorCode = type(reason) == "table" and reason.errorCode or reason
	local shouldRetry = self.options.shouldRetryError

	if shouldRetry == nil then
		shouldRetry = BatchRequestShared.shouldRetryError
	end

	if request.retryCount < self.maxRetries and shouldRetry(errorCode) then
		request.retryCount = request.retryCount + 1
		request.state = STATE_RETRY_WAITING
		request.lastFailureReason = reason
		request.retryAt = now + self:getRetryDelay(request.retryCount)

		return true
	end

	self.error = self.error or error or request.lastError

	self:settleFailed(request, reason)

	return false
end

function ParallelBatchRequestTask:tick(now)
	if self.state ~= "running" then
		return
	end

	for index = 1, #self.requests do
		local request = self.requests[index]

		if request.state == STATE_PENDING and request.deadline and now >= request.deadline then
			self:handleAttemptFailure(request, "timeout", now)
		end
	end

	if self.state ~= "running" then
		return
	end

	if now >= self.nextSendTime then
		local request = self:takeSendableRequest(now)

		if request then
			self.nextSendTime = now + self.sendInterval

			self:sendAttempt(request, now)
		end
	end

	self:checkFinished()
end

function ParallelBatchRequestTask:checkFinished()
	if self.state ~= "running" or self.settledCount < #self.requests then
		return
	end

	self:finish(#self.failures == 0 and "success" or "partialFailed")
end

function ParallelBatchRequestTask:finish(reason)
	if self.state == "finished" then
		return
	end

	self.state = "finished"

	local pendingRequests = {}

	for _, request in pairs(self.pendingRequests) do
		pendingRequests[#pendingRequests + 1] = request
	end

	local summary = {
		reason = reason,
		results = self.results,
		failures = self.failures,
		completedCount = #self.results,
		failedCount = #self.failures,
		totalCount = #self.requests,
		pendingRequests = pendingRequests,
		operationId = self.operationId,
		error = self.error
	}

	self.pendingRequests = {}
	self.summary = summary

	if self.options.onFinished then
		self.options.onFinished(summary)
	end
end

return ParallelBatchRequestTask
