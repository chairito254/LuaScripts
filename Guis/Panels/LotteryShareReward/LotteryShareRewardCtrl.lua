-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LotteryShareReward\\LotteryShareRewardCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local Utils = require("Common.Utils.Utils")
local Time = require("Core.Common.Time")
local UIConst = require("Const.UIConst")
local GachaEntryData = require("Data.gacha_entry_data")
local DropUtils = require("Common.Utils.DropUtils")
local ItemUtils = require("Common.Utils.ItemUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local EMPTY_TABLE = require("Core.Common.EmptyTable")
local LotteryShareRewardCtrl = Class.LightClass("LotteryShareRewardCtrl", UICtrl)

LotteryShareRewardCtrl.messages = {}

function LotteryShareRewardCtrl:buildViewData(info)
	local dropId = tonumber(info.dropId)
	local itemDict, petRewards = DropUtils.genDropDisplayInfo(dropId)
	local itemCounts = ItemUtils.getItemCountTable(itemDict)
	local itemId, itemNum = next(itemCounts)

	assert(itemId ~= nil and next(itemCounts, itemId) == nil and #petRewards == 0, "LotteryShareReward requires one item reward, dropId=" .. tostring(dropId))

	local shareData = info.shareData
	local totalCount = assert(tonumber(shareData.totalCount), "Missing shareData.totalCount")
	local claimedPlayers = shareData.claimedPlayers or EMPTY_TABLE

	return {
		items = self:buildClaimedItems(claimedPlayers, itemId, itemNum),
		senderInfo = self:getPlayerInfo(tostring(info.senderId)),
		itemId = itemId,
		itemNum = itemNum,
		claimedCount = #claimedPlayers,
		totalCount = totalCount,
		totalNum = totalCount * itemNum,
		statusKey = self:getShareStatusKey(shareData, info.gachaId, info.isClaim)
	}
end

function LotteryShareRewardCtrl:getShareStatusKey(shareData, gachaId, isClaim)
	if isClaim == true then
		return nil
	end

	local blockReason = pg.game.chat:getShareRewardBlockReason(shareData, gachaId)
	local blockReasonEnum = pg.game.chat.SHARE_REWARD_BLOCK_REASON

	if blockReason == blockReasonEnum.EXPIRED then
		return "GACHA_SHARE_EXPIRED"
	end

	if blockReason == blockReasonEnum.FINISHED then
		return "GACHA_SHARE_REWARD_FINISHED"
	end

	if blockReason == blockReasonEnum.DAILY_LIMIT then
		return "GACHA_SHARE_DAILY_CLAIM_LIMIT"
	end

	return nil
end

function LotteryShareRewardCtrl:buildClaimedItems(claimedPlayers, itemId, itemNum)
	local items = {}

	for _, claimInfo in ipairs(claimedPlayers) do
		local uid = claimInfo.Uid
		local playerInfo = self:getPlayerInfo(uid)

		items[#items + 1] = {
			tIndex = 0,
			playerId = uid,
			playerName = playerInfo.playerName or "",
			itemId = itemId,
			itemNum = itemNum
		}
	end

	return items
end

function LotteryShareRewardCtrl:getPlayerInfo(playerId)
	if playerId == tostring(pg.me.uid) then
		return pg.me
	end

	return pg.game.chat:getPlayerInfo(playerId) or {}
end

function LotteryShareRewardCtrl:getMissingPlayerIds(info)
	local playerIds = {
		tostring(info.senderId)
	}
	local seen = {
		[playerIds[1]] = true
	}
	local claimedPlayers = info.shareData.claimedPlayers or EMPTY_TABLE

	for _, claimInfo in ipairs(claimedPlayers) do
		local uid = claimInfo.Uid

		if not seen[uid] then
			playerIds[#playerIds + 1] = uid
			seen[uid] = true
		end
	end

	local missingIds = {}

	for _, playerId in ipairs(playerIds) do
		local playerInfo = self:getPlayerInfo(playerId)
		local isMissing = playerInfo.playerName == nil or playerInfo.level == nil or playerInfo.headIcon == nil or playerInfo.headFrame == nil

		if isMissing then
			missingIds[#missingIds + 1] = playerId
		end
	end

	return missingIds
end

function LotteryShareRewardCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function LotteryShareRewardCtrl:addListener()
	function self.view.exitBtn.luaClick()
		self:dismiss()
	end

	function self.view.btnCloseUButton.luaClick()
		self:dismiss()
	end

	function self.view.tryButton.luaClick()
		self:openLottery()
	end

	function self.view.thanksButton.luaClick()
		self:sendThanks()
	end

	function self.view.choseList.luaRenderItem(button, index, data)
		self:renderClaimedItem(button, index, data)
	end
end

function LotteryShareRewardCtrl:renderClaimedItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local numUSDFText = objectReference:GetRefValue("numUSDFText")
	local playerName = LuaUIUtils.getPlayerDisplayName(data.playerId, data.playerName)

	ClientTextUtils.setText(txtNameUSDFText, playerName)

	iconUImage.url = LuaUIUtils.getIconByItemId(data.itemId)

	ClientTextUtils.setText(numUSDFText, data.itemNum)
end

function LotteryShareRewardCtrl:openLottery()
	local drawId = tonumber(self._openInfo.gachaId)
	local entry = GachaEntryData[drawId]
	local openTime = entry and Utils.getConfigTimeOfAreaByData(entry.openTime)
	local closeTime = entry and Utils.getConfigTimeOfAreaByData(entry.closeTime)
	local now = Time.getSecond()
	local isAvailable = pg.me:checkFunctionUnlockByUIId(UIConst.UI_ID_LOTTERY) and openTime ~= nil and openTime <= now and (closeTime == nil or now < closeTime)

	if not isAvailable then
		pg.global.showBubbleMessageRaw(pg.getGameString("GACHA_SHARE_SYSTEM_LOCKED"))

		return
	end

	if pg.global.ui:checkUIVisible(UIConst.UI_ID_CHAT) then
		pg.global.ui:close(UIConst.UI_ID_CHAT)
	end

	local openInfo = self._openInfo

	pg.global.ui:open(UIConst.UI_ID_LOTTERY, {
		drawId = drawId
	}, function()
		if self._openInfo == openInfo then
			self:dismiss()
		end
	end)
end

function LotteryShareRewardCtrl:sendThanks()
	self:sendThanksMessage()
end

function LotteryShareRewardCtrl:sendThanksMessage()
	local chat = pg.game.chat
	local shareData = self._openInfo.shareData
	local shareKey = shareData.shareId or shareData

	if chat:hasSentThanks(shareKey) then
		pg.global.showBubbleMessageRaw(pg.getGameString("APPLY_FRIEND_TOO_FREQUENTLY"))

		return
	end

	local sent = chat:sendMessage(pg.getGameString("GACHA_SHARE_THANKS_MESSAGE"), chat.subMessageType.Text, chat.channelType.Friend, chat.channelType.Friend, nil, false)

	if sent == true then
		chat:markThanksSent(shareKey)
	end
end

function LotteryShareRewardCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self._openInfo = Utils.isTable(info) and info or {}

	self.view:setInfo(self:buildViewData(self._openInfo))
	self:queryMissingPlayerInfo()

	if info.isClaim then
		self.view.component:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
	end
end

function LotteryShareRewardCtrl:queryMissingPlayerInfo()
	local openInfo = self._openInfo
	local playerIds = self:getMissingPlayerIds(openInfo)

	if #playerIds == 0 then
		return
	end

	pg.game.chat:getBasicPlayerInfoListFromServer(playerIds, function(isSuccess)
		if isSuccess and self._openInfo == openInfo and self:checkUIOpen() then
			self.view:setInfo(self:buildViewData(openInfo))
		end
	end)
end

function LotteryShareRewardCtrl:onDestroy()
	self._openInfo = nil

	UICtrl.onDestroy(self)
end

function LotteryShareRewardCtrl:close()
	self.view.component:InvokeCallback(CS.XGUI.EInvokeTime.Hide)
	UICtrl.close(self)
end

return LotteryShareRewardCtrl
