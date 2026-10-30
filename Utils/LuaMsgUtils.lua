-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\LuaMsgUtils.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("LuaUIUtils")
local CallbackHandler = require("Core.Common.CallbackHandler")
local NoticeDef = require("Common.NoticeDef")
local ClientUtils = require("Utils.ClientUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ItemEffectData = require("Data.item_effect_data")
local ItemConst = require("Common.Const.ItemConst")
local ItemUtils = require("Common.Utils.ItemUtils")
local LimitData = require("Data.limit_data")
local Const = require("Common.Const.Const")
local LuaMsgUtils = {}

LuaMsgUtils.__useItemOpNUIDSeed = 0

function LuaMsgUtils.newUseItemOpNUID()
	LuaMsgUtils.__useItemOpNUIDSeed = LuaMsgUtils.__useItemOpNUIDSeed + 1

	return "use_item_" .. tostring(LuaMsgUtils.__useItemOpNUIDSeed)
end

function LuaMsgUtils.copyClientArgs(args)
	local result = {}

	for key, value in pairs(args or {}) do
		result[key] = value
	end

	return result
end

LuaMsgUtils.USE_ITEM_ERROR_CODE2FUNC_MAP = {
	[NoticeDef.ERROR_LIMIT_EXCEED] = "showBubbleLimitExceed"
}

function LuaMsgUtils.getFirstLackUseItemCost(itemId, itemNum)
	local itemEffect = ItemEffectData[itemId]

	if not itemEffect or not itemEffect.needItem then
		return
	end

	local needCountById = {}

	for _, needItem in ipairs(itemEffect.needItem) do
		local costItemId, costItemNum = needItem[1], needItem[2]

		needCountById[costItemId] = (needCountById[costItemId] or 0) + costItemNum * (itemNum or 1)
	end

	for _, needItem in ipairs(itemEffect.needItem) do
		local costItemId = needItem[1]

		if ItemUtils.getItemCountById(pg.me, costItemId) < needCountById[costItemId] then
			return costItemId
		end
	end
end

function LuaMsgUtils.showUseItemCostLackTip(costItemId)
	pg.global.showBubbleMessageRaw(string.format(pg.getGameString("INVENTORY_ITEM_USE_COST_LACK"), ItemUtils.getItemFinalNameStrByItemId(costItemId)))
end

function LuaMsgUtils.showUseItemError(errorCode, errorArgs, itemId, itemNum)
	if errorCode == NoticeDef.ITEM_COUNT_LACK then
		local lackCostItemId = LuaMsgUtils.getFirstLackUseItemCost(itemId, itemNum)

		if lackCostItemId then
			LuaMsgUtils.showUseItemCostLackTip(lackCostItemId)

			return
		end
	end

	if errorArgs then
		pg.global.showBubbleMessage(errorCode, unpack(errorArgs))
	else
		pg.global.showBubbleMessage(errorCode)
	end
end

function LuaMsgUtils.getUnlockedItemForUse(itemList, invId)
	local hasItem = false

	for _, item in ipairs(itemList) do
		hasItem = true

		if not ClientUtils.isItemInstanceLockedForUse(invId, item.genID) then
			return item, true
		end
	end

	return nil, hasItem
end

function LuaMsgUtils.buildUseItemRequests(canUseMap, me)
	local requests = {}

	for itemId, num in pairs(canUseMap) do
		local cData = ItemEffectData[itemId]

		if cData and cData.reuseTimes ~= nil and cData.reuseTimes ~= 1 then
			local invId = ItemUtils.getInvIdByItemId(itemId)
			local itemList = ItemUtils.getItemsById(me, itemId)

			if ToBool(itemList) then
				local item, hasItem = LuaMsgUtils.getUnlockedItemForUse(itemList, invId)

				if hasItem and item == nil then
					return nil, NoticeDef.ITEM_LOCKED
				end

				if item then
					requests[#requests + 1] = {
						rpcName = "RPC_CS_UseItem",
						itemId = itemId,
						num = num,
						invId = invId,
						genId = item.genID
					}
				elseif LoggerManager.checkLogger(LoggerConst.ERROR) then
					logger:error("[LuaMsgUtils.useItemBatch] items is nil.")
				end
			end
		elseif ClientUtils.isItemLockedForConsume(itemId, num) then
			return nil, NoticeDef.ITEM_LOCKED
		else
			requests[#requests + 1] = {
				rpcName = "RPC_CS_UseItemById",
				itemId = itemId,
				num = num
			}
		end
	end

	return requests
end

function LuaMsgUtils.sendOneUseItemRequest(request, args, callback)
	local me = pg.me

	if not me or me.destroyed or not me.server then
		return nil
	end

	if request.rpcName == "RPC_CS_UseItem" then
		return me:serverMsg("RPC_CS_UseItem", request.invId, request.genId, request.num, args, callback)
	end

	return me:serverMsg("RPC_CS_UseItemById", request.itemId, request.num, args, callback)
end

function LuaMsgUtils.useItemImmediately(requests, clientArgs, callback)
	local remainingCount = #requests
	local sending = true
	local finished = false

	local function tryFinish()
		if not sending and remainingCount == 0 and not finished then
			finished = true

			if callback then
				callback()
			end
		end
	end

	for _, request in ipairs(requests) do
		local settled = false

		local function onCompleted(res, errorCode, errorArgs)
			if settled then
				return
			end

			settled = true
			remainingCount = remainingCount - 1

			if not res and errorCode then
				LuaMsgUtils.showUseItemError(errorCode, errorArgs, request.itemId, request.num)
			end

			tryFinish()
		end

		local callbackId = LuaMsgUtils.sendOneUseItemRequest(request, request.clientArgs or clientArgs, onCompleted)

		if not callbackId then
			onCompleted(false)
		end
	end

	sending = false

	tryFinish()
end

function LuaMsgUtils.useItemBatch(itemMap, clientArgs, callback)
	if table.nums(itemMap) == 0 then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("[LuaMsgUtils.useItemBatch] itemMap is empty.")
		end

		return
	end

	local hasProp = false
	local canUseMap = {}

	for id, num in pairs(itemMap) do
		if num > 0 then
			canUseMap[id] = num
			hasProp = true
		end
	end

	if not hasProp then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("[LuaMsgUtils.useItemBatch] itemMap`s items is zero.")
		end

		return
	end

	local me = pg.me

	if not me or me.destroyed then
		return
	end

	local requests, errorCode = LuaMsgUtils.buildUseItemRequests(canUseMap, me)

	if not requests then
		LuaMsgUtils.showUseItemError(errorCode)

		return
	end

	if #requests == 0 then
		return
	end

	local batchArgs = LuaMsgUtils.copyClientArgs(clientArgs)

	batchArgs.clientBatch = true

	LuaMsgUtils.useItemImmediately(requests, batchArgs, callback)
end

function LuaMsgUtils.tryUseServerBatch(itemId, itemNum, request, clientArgs, callback, failureCallback)
	local itemEffect = ItemEffectData[itemId]

	if itemEffect == nil or ItemUtils.canBatchUseById(itemEffect, itemNum, clientArgs) ~= true then
		return false
	end

	local system = pg.game and pg.game.serverBatchRequest

	if not system then
		return false, "unavailable"
	end

	local operationKey = LuaMsgUtils.newUseItemOpNUID()

	clientArgs.opNUID = operationKey

	local batchCount = math.ceil(itemNum / ItemConst.USE_ITEM_BATCH_SIZE)
	local batchTimeoutSeconds = batchCount * Const.BATCH_REQUEST_ITEM_BATCH_SECONDS
	local trackKey, trackReason = system:track(operationKey, pg.me, function(result, errorCode, errorArgs, reason)
		if result and result.noticeId == NoticeDef.SUCCESS then
			if callback then
				callback()
			end
		elseif reason == "rejected" and errorCode then
			LuaMsgUtils.useItemCallBack(nil, itemId, itemNum, callback, failureCallback, false, errorCode, errorArgs)
		elseif failureCallback then
			failureCallback(result and result.noticeId or nil, errorArgs, reason)
		end
	end, function()
		return LuaMsgUtils.sendOneUseItemRequest(request, clientArgs, function(res, errorCode, errorArgs)
			if not res then
				system:finish(operationKey, nil, errorCode, errorArgs, "rejected")
			end
		end)
	end, batchTimeoutSeconds)

	if not trackKey then
		if trackReason == "unavailable" then
			if failureCallback then
				failureCallback(nil, nil, trackReason)
			end

			return true
		end

		return false, trackReason
	end

	return true
end

function LuaMsgUtils.useItemById(itemId, itemNum, customData, callback, failureCallback)
	if itemId == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("[LuaMsgUtils.useItemById] itemId is nil.")
		end

		if failureCallback then
			failureCallback()
		end

		return
	end

	local me = pg.me
	local iedd = ItemEffectData[itemId]

	if iedd ~= nil and iedd.reuseTimes ~= nil and iedd.reuseTimes ~= 1 then
		local itemList = ItemUtils.getItemsById(me, itemId)

		if ToBool(itemList) then
			local invId = ItemUtils.getInvIdByItemId(itemId)
			local item, hasItem = LuaMsgUtils.getUnlockedItemForUse(itemList, invId)

			if hasItem and item == nil then
				LuaMsgUtils.showUseItemError(NoticeDef.ITEM_LOCKED)

				if failureCallback then
					failureCallback(NoticeDef.ITEM_LOCKED)
				end

				return
			end

			if item then
				local itemArgs = LuaMsgUtils.copyClientArgs(customData)
				local handled = LuaMsgUtils.tryUseServerBatch(itemId, itemNum, {
					rpcName = "RPC_CS_UseItem",
					itemId = itemId,
					num = itemNum,
					invId = invId,
					genId = item.genID
				}, itemArgs, callback, failureCallback)

				if not handled then
					me:serverMsg("RPC_CS_UseItem", invId, item.genID, itemNum, customData, CallbackHandler(LuaMsgUtils, "useItemCallBack", itemId, itemNum, callback, failureCallback))
				end
			end
		else
			if LoggerManager.checkLogger(LoggerConst.ERROR) then
				logger:error("[LuaMsgUtils.useItemById] items is nil.")
			end

			if failureCallback then
				failureCallback()
			end
		end

		return
	end

	if ClientUtils.isItemLockedForConsume(itemId, itemNum) then
		LuaMsgUtils.showUseItemError(NoticeDef.ITEM_LOCKED)

		if failureCallback then
			failureCallback(NoticeDef.ITEM_LOCKED)
		end

		return
	end

	local itemArgs = LuaMsgUtils.copyClientArgs(customData)
	local handled = LuaMsgUtils.tryUseServerBatch(itemId, itemNum, {
		rpcName = "RPC_CS_UseItemById",
		itemId = itemId,
		num = itemNum
	}, itemArgs, callback, failureCallback)

	if not handled then
		me:serverMsg("RPC_CS_UseItemById", itemId, itemNum, customData, CallbackHandler(LuaMsgUtils, "useItemCallBack", itemId, itemNum, callback, failureCallback))
	end
end

function LuaMsgUtils.useItem(itemId, invId, genId, itemNum, clientArgs, callback)
	if invId == nil or genId == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("[LuaMsgUtils.useItem] args is nil.")
		end

		return
	end

	local me = pg.me

	if ClientUtils.isItemInstanceLockedForUse(invId, genId) then
		LuaMsgUtils.showUseItemError(NoticeDef.ITEM_LOCKED)

		return
	end

	local itemArgs = LuaMsgUtils.copyClientArgs(clientArgs)
	local handled = LuaMsgUtils.tryUseServerBatch(itemId, itemNum, {
		rpcName = "RPC_CS_UseItem",
		itemId = itemId,
		num = itemNum,
		invId = invId,
		genId = genId
	}, itemArgs, callback, nil)

	if not handled then
		me:serverMsg("RPC_CS_UseItem", invId, genId, itemNum, clientArgs, CallbackHandler(LuaMsgUtils, "useItemCallBack", itemId, itemNum, callback, nil))
	end
end

function LuaMsgUtils.useItemCallBack(_, itemId, itemNum, callback, failureCallback, res, errorCode, errorArgs)
	if errorCode ~= nil and LoggerManager.checkLogger(LoggerConst.ERROR) then
		logger:error("[LuaMsgUtils.useItemCallBack] errorCode = ", errorCode)
	end

	if not res then
		if failureCallback then
			failureCallback(errorCode, errorArgs)
		end

		local ied = ItemEffectData[itemId] or {}

		if ied.sType == ItemConst.USEITEM_TYPE_PET_UNLOCK_ABILITY then
			LuaMsgUtils.showUseItemError(errorCode, errorArgs, itemId, itemNum)

			return
		end

		if ied.sType == ItemConst.USEITEM_TYPE_SPAWN_ENVOBJ then
			LuaMsgUtils.showUseItemError(errorCode, errorArgs, itemId, itemNum)

			return
		end

		local fun = LuaMsgUtils[LuaMsgUtils.USE_ITEM_ERROR_CODE2FUNC_MAP[errorCode]]

		if fun then
			fun(itemId)
		else
			LuaMsgUtils.showUseItemError(errorCode, errorArgs, itemId, itemNum)
		end

		return
	end

	local iedd = ItemEffectData[itemId]

	if iedd ~= nil and iedd.sType ~= nil and iedd.sType == ItemConst.USEITEM_TYPE_CAST_ABILITY then
		pg.me:postComponentMethod("OnPetEat")
	end

	if res == true and not ItemUtils.isOpenUIType(itemId) then
		if iedd and iedd.useSuccessToast then
			pg.global.showBubbleMessageRaw(pg.getLocalizationText(iedd.useSuccessToast))
		else
			pg.global.showBubbleMessage(NoticeDef.ITEM_USE_SUCCEED)
		end
	end

	if callback then
		callback()
	end
end

function LuaMsgUtils.showBubbleLimitExceed(itemId)
	local iedd = ItemEffectData[itemId]
	local limitConfigId = iedd.countLimit
	local cycleType = LimitData[limitConfigId].type

	pg.global.showBubbleMessageRaw(pg.getFormatText(pg.getGameString("CYCLE_REMAIN_TIMES_OUT"), pg.getGameString(Const.LimitType2TextKeyMap[cycleType])))
end

return LuaMsgUtils
