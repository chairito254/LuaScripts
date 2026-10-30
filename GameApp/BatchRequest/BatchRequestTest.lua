-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\BatchRequestTest.lua

local TimerManager = require("Core.Timer.TimerManager")
local ItemEffectData = require("Data.item_effect_data")
local ItemConst = require("Common.Const.ItemConst")
local DropData = require("Data.drop_data")
local DropGroupData = require("Data.drop_group_data")
local CoreConst = require("Core.Common.Const")
local Const = require("Common.Const.Const")
local Time = require("Core.Common.Time")
local LoggerManager = require("Core.Log.LoggerManager")
local logger = LoggerManager.getLogger("BatchRequestTest")
local BatchRequestTest = {}

BatchRequestTest.__index = BatchRequestTest

local armedCase, recoveryOwner, serverBatchRecoveryOwner
local modes = {
	failure = true,
	disconnect = true,
	timeout = true
}
local DISCONNECT_SECONDS = 3
local weakValueMeta = {
	__mode = "v"
}

local function canRunItemUseTest()
	if not UNITY_EDITOR then
		return false
	end

	if not Const.OpenBatchRequestDebug then
		return false
	end

	if not pg.me or pg.me.destroyed or not pg.me.server then
		return false
	end

	return true
end

function BatchRequestTest.useItemById(itemId, itemNum, customData)
	if not canRunItemUseTest() then
		return false, "debugDisabled"
	end

	local LuaMsgUtils = require("Utils.LuaMsgUtils")

	LuaMsgUtils.useItemById(itemId, itemNum, customData or {}, function()
		return
	end, function()
		return
	end)

	return true
end

function BatchRequestTest.useItemBatch(itemMap)
	if not canRunItemUseTest() then
		return false, "debugDisabled"
	end

	local LuaMsgUtils = require("Utils.LuaMsgUtils")

	LuaMsgUtils.useItemBatch(itemMap or {}, {}, function()
		return
	end)

	return true
end

function BatchRequestTest.useItemBatchArgs(itemId1, num1, itemId2, num2, itemId3, num3)
	local itemMap = {}

	if itemId1 ~= nil then
		itemMap[itemId1] = num1
	end

	if itemId2 ~= nil then
		itemMap[itemId2] = num2
	end

	if itemId3 ~= nil then
		itemMap[itemId3] = num3
	end

	return BatchRequestTest.useItemBatch(itemMap)
end

function BatchRequestTest.useItemBatchRepeat(itemId1, num1, itemId2, num2)
	if not canRunItemUseTest() then
		return false, "debugDisabled"
	end

	local itemMap = {
		[itemId1] = num1,
		[itemId2] = num2
	}
	local first = BatchRequestTest.useItemBatch(itemMap)
	local second = BatchRequestTest.useItemBatch(itemMap)

	return first, second
end

function BatchRequestTest.useItemBatchLarge(itemId1, num1, itemId2, num2, itemId3, num3)
	return BatchRequestTest.useItemBatchArgs(itemId1, num1, itemId2, num2, itemId3, num3)
end

function BatchRequestTest.arm(mode, batchIndex, retryCount)
	if not UNITY_EDITOR then
		return false, "异常测试仅支持 Unity Editor"
	end

	if not Const.OpenBatchRequestDebug then
		armedCase = nil

		return false, "批量请求 Debug 测试已关闭"
	end

	if not pg.me or pg.me.destroyed or not pg.me.server then
		return false, "请进入游戏后设置异常测试"
	end

	batchIndex = batchIndex or 0

	if not modes[mode] or type(batchIndex) ~= "number" or batchIndex ~= batchIndex or batchIndex < 0 or batchIndex == math.huge or batchIndex ~= math.floor(batchIndex) then
		return false, "模式为 failure/timeout/disconnect；批次为 0（随机）或正整数"
	end

	if retryCount ~= nil and (type(retryCount) ~= "number" or retryCount ~= retryCount or retryCount < 0 or retryCount > Const.BATCH_REQUEST_MAX_RETRY_COUNT or retryCount == math.huge or retryCount ~= math.floor(retryCount)) then
		return false, "重试次数必须为 nil 或 0 到最大重试次数之间的整数"
	end

	armedCase = {
		mode = mode,
		batchIndex = batchIndex,
		retryCount = retryCount,
		playerRef = setmetatable({
			pg.me
		}, weakValueMeta)
	}

	return true, "已设置下一轮回收异常测试（仅生效一次）"
end

function BatchRequestTest.clear()
	armedCase = nil
	serverBatchRecoveryOwner = nil
end

local function getServerBatchSystem()
	return pg.game and pg.game.serverBatchRequest
end

local function buildRandomMultiChooseArgs(itemId)
	local itemEffect = ItemEffectData[itemId]

	if not itemEffect or itemEffect.sType ~= ItemConst.USEITEM_TYPE_MULTI_CHOOSE_CHEST or not itemEffect.params or #itemEffect.params < 2 then
		return nil
	end

	local dropData = DropData[itemEffect.params[1]]

	if not dropData then
		return nil
	end

	local rewardCount = 0

	if dropData.dropType == ItemConst.DROP_TYPE_FIXED then
		rewardCount = dropData.fixedDrop and #dropData.fixedDrop or 0
	elseif dropData.dropType == ItemConst.DROP_TYPE_GROUP then
		for _, groupId in ipairs(dropData.dropParam or {}) do
			local groupData = DropGroupData[groupId]

			if groupData then
				rewardCount = rewardCount + #groupData
			end
		end
	end

	local chooseCount = itemEffect.params[2]

	if rewardCount <= 0 or not chooseCount or chooseCount <= 0 or rewardCount < chooseCount then
		return nil
	end

	local firstIndex = math.random(1, rewardCount - chooseCount + 1)
	local selects = {}

	for index = firstIndex, firstIndex + chooseCount - 1 do
		selects[index] = true
	end

	return {
		selects = selects
	}
end

function BatchRequestTest.useServerBatchItem(itemId, itemNum)
	if not canRunItemUseTest() then
		return false, "debugDisabled"
	end

	itemId = tonumber(itemId)
	itemNum = tonumber(itemNum)

	if not itemId or not itemNum or itemId <= 0 or itemNum <= 0 or itemId ~= math.floor(itemId) or itemNum ~= math.floor(itemNum) then
		return false, "itemId/itemNum must be positive integers"
	end

	local LuaMsgUtils = require("Utils.LuaMsgUtils")
	local itemEffect = ItemEffectData[itemId]
	local clientArgs = buildRandomMultiChooseArgs(itemId)

	if itemEffect and itemEffect.sType == ItemConst.USEITEM_TYPE_MULTI_CHOOSE_CHEST and not clientArgs then
		return false, "choiceArgsUnavailable"
	end

	clientArgs = clientArgs or {
		gmBatchRequestTest = true
	}
	clientArgs.gmBatchRequestTest = true

	LuaMsgUtils.useItemById(itemId, itemNum, clientArgs, function()
		return
	end, function()
		return
	end)

	return true
end

function BatchRequestTest.serverBatchFault(mode, reconnectSeconds)
	if not canRunItemUseTest() then
		return false, "debugDisabled"
	end

	local system = getServerBatchSystem()

	if not system then
		return false, "serverBatchRequestUnavailable"
	end

	mode = tonumber(mode)
	reconnectSeconds = tonumber(reconnectSeconds) or 3

	if mode == 0 then
		serverBatchRecoveryOwner = nil

		system:clearRequests("gmCleared")

		return true, "server batch requests cleared"
	end

	if mode == 1 then
		system:onDisconnected()

		local token = {}

		serverBatchRecoveryOwner = token

		TimerManager.addTimer(reconnectSeconds, function()
			if serverBatchRecoveryOwner ~= token then
				return
			end

			serverBatchRecoveryOwner = nil

			local currentSystem = getServerBatchSystem()

			if currentSystem then
				currentSystem:onConnected()
			end
		end)

		return true, "simulated disconnect; requests and waiting UI are retained"
	end

	if mode == 2 then
		local now = Time.getTickSecond()

		for _, record in pairs(system._pending or {}) do
			record.deadline = now - 1
		end

		system:onTick()

		return true, "server batch requests expired and cleared"
	end

	if mode == 3 then
		system:clearRequests("waitingClosed")

		return true, "server batch waiting requests closed"
	end

	return false, "mode must be 0 clear, 1 disconnect, 2 timeout, or 3 waitingClosed"
end

function BatchRequestTest.serverBatchStats()
	if not canRunItemUseTest() then
		return false, "debugDisabled"
	end

	local system = getServerBatchSystem()

	if not system then
		return false, "serverBatchRequestUnavailable"
	end

	return true, system:getPendingStats()
end

function BatchRequestTest.take(player, totalBatchCount, maxRetries)
	if not Const.OpenBatchRequestDebug then
		armedCase = nil

		return nil
	end

	local config = armedCase

	if not config then
		return nil
	end

	armedCase = nil

	if not UNITY_EDITOR or not player or player.destroyed or config.playerRef[1] ~= player then
		return nil
	end

	if totalBatchCount < config.batchIndex then
		logger:error("target out of range, target=%s, total=%s", tostring(config.batchIndex), tostring(totalBatchCount))

		return nil, "指定的测试批次超出本轮批次数，请重新设置"
	end

	if config.retryCount ~= nil and maxRetries ~= nil and maxRetries < config.retryCount then
		return nil, "测试目标重试次数超过本轮允许的最大重试次数"
	end

	local index = config.batchIndex

	if index == 0 then
		index = math.random(1, totalBatchCount)
	end

	local self = setmetatable({
		batchIndex = 0,
		mode = config.mode,
		targetIndex = index,
		targetRetryCount = config.retryCount
	}, BatchRequestTest)

	return self
end

local function canDisconnect(player)
	local repo = require("Core.Client.ClientRepo")
	local net = repo.netHandler
	local session = net and net.gateClientSoul and net.gateClientSoul.session

	return player == pg.me and not player.isInLoseConnectTest and not repo.isLoseConnectTestNetworkBlocked and player.RPC_SC_LoseConnectTest and net and net.soulInfo and net:isSoulConnected() and session and not session.destroyed
end

function BatchRequestTest:beforeSend(clientBatch, player, onFailed, batch, onAttemptFailed)
	local batchIndex = batch and batch.index or self.batchIndex + 1
	local retryCount = batch and batch.retryCount or 0

	self.batchIndex = batchIndex

	if self.finished or batchIndex ~= self.targetIndex then
		return true
	end

	self.targetClientBatch = clientBatch

	local targetRetryReached = self.targetRetryCount ~= nil and retryCount >= self.targetRetryCount

	if targetRetryReached and self.mode ~= "disconnect" then
		return true
	end

	if self.mode == "disconnect" and (self.targetRetryCount == nil or targetRetryReached) and canDisconnect(player) then
		return true
	end

	self.skippedClientBatch = clientBatch

	if self.mode == "failure" then
		local failureCallback = onFailed

		if self.targetRetryCount ~= nil and retryCount < self.targetRetryCount then
			failureCallback = onAttemptFailed or onFailed
		end

		self.failureTimer = TimerManager.addTimer(1, function()
			self.failureTimer = nil

			if not self.finished then
				failureCallback("testFailure")
			end
		end)
	elseif self.mode == "disconnect" then
		local failureCallback = onFailed

		if self.targetRetryCount ~= nil and retryCount < self.targetRetryCount then
			failureCallback = onAttemptFailed or onFailed
		end

		failureCallback("testUnavailable")
	end

	return false
end

function BatchRequestTest:onRealSend(clientBatch)
	if self.targetClientBatch == clientBatch then
		self.realSendClientBatch = clientBatch
	end
end

function BatchRequestTest:afterSend(clientBatch, player)
	if self.finished or self.mode ~= "disconnect" or self.targetClientBatch ~= clientBatch then
		return
	end

	local repo = require("Core.Client.ClientRepo")
	local token = {}

	recoveryOwner = token

	local playerRef = setmetatable({
		player
	}, weakValueMeta)

	TimerManager.addTimer(DISCONNECT_SECONDS + 0.1, function()
		if recoveryOwner ~= token then
			return
		end

		recoveryOwner = nil
		repo.isLoseConnectTestNetworkBlocked = false

		local recoveringPlayer = playerRef[1]

		if recoveringPlayer and not recoveringPlayer.destroyed then
			recoveringPlayer.isInLoseConnectTest = false
		end
	end)
	player.RPC_SC_LoseConnectTest(CoreConst.ACCESSOR_SERVER, player, DISCONNECT_SECONDS, false)
end

function BatchRequestTest:onCompleted(clientBatch)
	return
end

function BatchRequestTest:finish(summary)
	self.finished = true

	if self.failureTimer then
		TimerManager.removeTimer(self.failureTimer)

		self.failureTimer = nil
	end

	if self.realSendClientBatch then
		return nil
	end

	return self.skippedClientBatch
end

return BatchRequestTest
