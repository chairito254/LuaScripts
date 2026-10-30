-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\EntityMixin\\ImpPlatformImpChatMessage.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local M = {}
local MessageName = require("Const.MessageName")
local PlatformChatFilterService = require("SDK.Platform.PlatformChatFilterService")
local PlatformIdentityUtils = require("SDK.Platform.PlatformIdentityUtils")
local PlatformNameMaskService = require("SDK.Platform.PlatformNameMaskService")
local logger = require("SDK.Platform.PlatformLogger")

function M:shouldFilterInboundMessage(messageData)
	if pg.global.platform:isPS() then
		local shouldFilter = messageData and (messageData.tIndex == self.messageType.OtherPlayer or messageData.tIndex == self.messageType.SelfPlayer) and not string.isNilOrEmpty(messageData.playerId)

		return shouldFilter
	end

	return messageData and messageData.tIndex == self.messageType.OtherPlayer and not string.isNilOrEmpty(messageData.playerId)
end

function M:getChatGroupDisplayName(groupId, masterUid, masterInfo, rawName)
	if string.isNilOrEmpty(rawName) then
		return rawName
	end

	local _, isVisible = PlatformNameMaskService:checkNameVisibilityNow(masterUid, masterInfo, PlatformNameMaskService.Action.ChatGroupChannelName)

	if isVisible == false then
		return " "
	end

	return rawName
end

function M:getChatNoticePlayerName(uid, playerInfo, rawName)
	return M.renderChatGroupMemberNoticePlayerName(self, uid, playerInfo, rawName)
end

function M.areMessageListsEqual(left, right)
	local leftCount = type(left) == "table" and #left or 0
	local rightCount = type(right) == "table" and #right or 0

	if leftCount ~= rightCount then
		return false
	end

	for index = 1, leftCount do
		if left[index] ~= right[index] then
			return false
		end
	end

	return true
end

function M:buildVisibleChannelMessageListData(messages)
	local visibleMessages = {}
	local pendingTimeStamp

	for _, messageData in ipairs(messages or EMPTY_TABLE) do
		if messageData.tIndex == self.messageType.TimeStamp then
			pendingTimeStamp = messageData
		else
			local playerInfo = messageData.playerId and self:getPlayerInfo(messageData.playerId) or nil

			if M.shouldShowPlatformMessage(self, messageData, playerInfo) then
				if pendingTimeStamp ~= nil then
					visibleMessages[#visibleMessages + 1] = pendingTimeStamp
					pendingTimeStamp = nil
				end

				visibleMessages[#visibleMessages + 1] = messageData
			end
		end
	end

	return visibleMessages
end

function M:getVisibleChannelMessageListData(messages, channelId)
	local visibleMessages = M.buildVisibleChannelMessageListData(self, messages)

	self.platformVisibleChatMessageListData = self.platformVisibleChatMessageListData or {}
	self.platformVisibleChatMessageListData[channelId] = visibleMessages

	return visibleMessages
end

function M.notifyChannelUpdates(channelIds)
	local count = 0

	for channelId in pairs(channelIds or EMPTY_TABLE) do
		count = count + 1

		facade:SendMessageCommand(MessageName.CHAT_MESSAGE_UPDATE, {
			channelId = channelId
		})
	end

	facade:SendMessageCommand(MessageName.CHAT_RED_DOT_UPDATE)

	return count
end

function M:shouldShowPlatformMessage(messageData, playerInfo)
	if not M.shouldFilterInboundMessage(self, messageData) then
		return true
	end

	local resolvedPlayerInfo = playerInfo or self:getPlayerInfo(messageData.playerId)

	if type(resolvedPlayerInfo) ~= "table" then
		return true
	end

	local shouldFilter = PlatformChatFilterService:shouldFilterMessage(messageData, resolvedPlayerInfo)

	return shouldFilter ~= true
end

function M:refreshPlatformFilteredChatMessages(reason)
	local oldVisibleByChannel = self.platformVisibleChatMessageListData or {}
	local newVisibleByChannel = {}
	local changedChannelIds = {}

	for channelId, mainMessages in pairs(self.chatMessageListData or EMPTY_TABLE) do
		local visibleMessages = M.buildVisibleChannelMessageListData(self, mainMessages)

		newVisibleByChannel[channelId] = visibleMessages

		local oldVisibleMessages = oldVisibleByChannel[channelId]

		if oldVisibleMessages ~= nil and not M.areMessageListsEqual(oldVisibleMessages, visibleMessages) then
			changedChannelIds[channelId] = true
		end
	end

	self.platformVisibleChatMessageListData = newVisibleByChannel

	if next(changedChannelIds) == nil then
		logger:info("platform_chat_filter_refreshed reason=%s channels=0", tostring(reason or ""))

		return
	end

	local changedCount = M.notifyChannelUpdates(changedChannelIds)

	logger:info("platform_chat_filter_refreshed reason=%s channels=%s", tostring(reason or ""), tostring(changedCount))
end

function M:filterChatHistoryMessages(chatMessageDatas)
	if type(chatMessageDatas) ~= "table" then
		return chatMessageDatas
	end

	local batchIds = {}
	local seenBatchIds = {}

	for _, messageData in ipairs(chatMessageDatas) do
		if M.shouldFilterInboundMessage(self, messageData) then
			local playerInfo = self:getPlayerInfo(messageData.playerId)

			if type(playerInfo) == "table" and PlatformChatFilterService.shouldCheckBlockedBySender(messageData) then
				local family = type(PlatformIdentityUtils.resolvePlayerInfoFamily) == "function" and PlatformIdentityUtils.resolvePlayerInfoFamily(playerInfo)
				local platformUserId = family == "playstation" and type(PlatformIdentityUtils.resolvePlatformUserId) == "function" and PlatformIdentityUtils.resolvePlatformUserId(playerInfo)

				if not string.isNilOrEmpty(platformUserId) and not seenBatchIds[platformUserId] then
					seenBatchIds[platformUserId] = true
					batchIds[#batchIds + 1] = platformUserId
				end
			end
		end
	end

	if #batchIds > 0 and pg and pg.me and type(pg.me.requestPsnBlockStates) == "function" then
		pg.me:requestPsnBlockStates(batchIds)
	end

	return chatMessageDatas
end

function M:renderChatGroupMemberNoticePlayerName(uid, playerInfo, rawName)
	if string.isNilOrEmpty(uid) or string.isNilOrEmpty(rawName) then
		return rawName
	end

	return PlatformNameMaskService.getMaskedDisplayName({
		action = PlatformNameMaskService.Action.ChatMessagePlayerName,
		uid = uid,
		playerInfo = playerInfo,
		rawText = rawName
	})
end

return M
