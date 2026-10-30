-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\ParallelBatchRequestTaskTest.lua

local ParallelBatchRequestTaskTest = {}

local function assertEqual(actual, expected, message)
	if actual ~= expected then
		error(string.format("%s: expected %s, got %s", message, tostring(expected), tostring(actual)))
	end
end

local function assertTrue(value, message)
	if not value then
		error(message)
	end
end

function ParallelBatchRequestTaskTest.run()
	local ParallelBatchRequestTask = require("GameApp.BatchRequest.ParallelBatchRequestTask")
	local now = 0
	local nextBatchId = 0
	local sends = {}
	local finishedSummary
	local completed = {}
	local failed = {}
	local task = ParallelBatchRequestTask({
		maxRetries = 2,
		batchTimeout = 1,
		sendInterval = 0.1,
		items = {
			{
				id = 1
			},
			{
				id = 2
			},
			{
				id = 3
			}
		},
		getTime = function()
			return now
		end,
		nextBatchId = function()
			nextBatchId = nextBatchId + 1

			return nextBatchId
		end,
		sendBatch = function(item, clientBatch, request)
			sends[#sends + 1] = {
				item = item,
				clientBatch = clientBatch,
				request = request
			}

			return true
		end,
		onBatchCompleted = function(result, request)
			completed[#completed + 1] = request.index
		end,
		onBatchFailed = function(reason, request)
			failed[#failed + 1] = {
				reason = reason,
				index = request.index
			}
		end,
		onFinished = function(summary)
			finishedSummary = summary
		end
	})

	task:start(now)
	assertEqual(#sends, 1, "first request sends immediately")

	now = 0.09

	task:tick(now)
	assertEqual(#sends, 1, "requests stay throttled before 0.1 seconds")

	now = 0.1

	task:tick(now)
	assertEqual(#sends, 2, "second request sends at 0.1 seconds")
	assertTrue(task:complete(sends[2].clientBatch, true, {}, now), "second request completes")

	now = 0.2

	task:tick(now)
	assertEqual(#sends, 3, "third request sends while first request is pending")
	assertTrue(task:complete(sends[3].clientBatch, true, {}, now), "third request completes out of order")
	assertTrue(task:complete(sends[1].clientBatch, true, {}, now), "first request completes")
	assertEqual(finishedSummary.reason, "success", "all parallel requests finish successfully")
	assertEqual(#completed, 3, "all successful requests are reported")

	local retryNow = 0
	local retrySends = {}
	local retryTask = ParallelBatchRequestTask({
		maxRetries = 2,
		batchTimeout = 1,
		sendInterval = 0.1,
		items = {
			{
				id = 10
			}
		},
		getTime = function()
			return retryNow
		end,
		nextBatchId = function()
			return 99
		end,
		sendBatch = function(item, clientBatch, request)
			retrySends[#retrySends + 1] = request.attemptIndex

			return true
		end,
		onFinished = function(summary)
			finishedSummary = summary
		end
	})

	retryTask:start(retryNow)

	retryNow = 1

	retryTask:tick(retryNow)
	assertEqual(#retrySends, 1, "first timeout schedules a retry")

	retryNow = 1.1

	retryTask:tick(retryNow)
	assertEqual(#retrySends, 2, "retry uses the initial backoff")

	retryNow = 2.1

	retryTask:tick(retryNow)

	retryNow = 2.3

	retryTask:tick(retryNow)
	assertEqual(#retrySends, 3, "second retry uses exponential backoff")

	local failedFinished
	local failedTask = ParallelBatchRequestTask({
		maxRetries = 0,
		batchTimeout = 1,
		sendInterval = 0.1,
		items = {
			{
				id = 20
			},
			{
				id = 21
			}
		},
		getTime = function()
			return 0
		end,
		nextBatchId = function()
			nextBatchId = nextBatchId + 1

			return nextBatchId
		end,
		sendBatch = function()
			return true
		end,
		onFinished = function(summary)
			failedFinished = summary
		end
	})

	failedTask:start(0)
	failedTask:fail(failedTask.requests[1].clientBatch, "timeout")
	assertEqual(failedFinished, nil, "one failed parallel request does not abort others")
	failedTask:tick(0.1)
	assertEqual(#failedTask.requests, 2, "remaining parallel request stays addressable")
	failedTask:complete(failedTask.requests[2].clientBatch, true, {}, 0)
	assertEqual(failedFinished.reason, "partialFailed", "parallel task reports partial failure")

	return true
end

return ParallelBatchRequestTaskTest
