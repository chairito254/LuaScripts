-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\BatchRequestShared.lua

local Const = require("Common.Const.Const")
local BatchRequestShared = {}
local retryableErrorCodes = {
	NETWORK_ERROR = true,
	RATE_LIMITED = true,
	SERVER_BUSY = true,
	TIMEOUT = true,
	testFailure = true,
	sendFailed = true,
	timeout = true,
	[1027] = true,
	TEMPORARY_UNAVAILABLE = true,
	UNAVAILABLE = true,
	DISCONNECTED = true
}

function BatchRequestShared.shouldRetryError(errorCode)
	if errorCode == nil then
		return false
	end

	return retryableErrorCodes[errorCode] == true
end

local nextClientBatch = 0
local nextTaskId = 0
local nextOperationId = 0

function BatchRequestShared.canReserveClientBatch(count)
	return nextClientBatch + count <= Const.BATCH_REQUEST_MAX_CLIENT_BATCH
end

function BatchRequestShared.nextClientBatch()
	nextClientBatch = nextClientBatch + 1

	return nextClientBatch
end

function BatchRequestShared.nextTaskId()
	nextTaskId = nextTaskId + 1

	return nextTaskId
end

function BatchRequestShared.nextOperationId()
	if nextOperationId >= Const.BATCH_REQUEST_MAX_CLIENT_BATCH then
		nextOperationId = 0
	end

	nextOperationId = nextOperationId + 1

	return nextOperationId
end

return BatchRequestShared
