-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\InfoPlayerMain\\InfoPlayerMainModel.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local UIModel = require("Guis.UIModel")
local Class = require("Core.Framework.Class")
local InfoPlayerMainModel = Class.LightClass("InfoPlayerMainModel", UIModel)
local PlayerHeadIconData = require("Data.player_head_icon_data")
local PlayerHeadFrameData = require("Data.player_head_frame_data")
local Const = require("Common.Const.Const")
local ShowTitleData = require("Data.show_title_data")
local FriendshipLevelFuncData = require("Data.friendship_level_func_data")
local CardBackgroundData = require("Data.card_background_data")
local ChatBubbleData = require("Data.chat_bubble_data")
local LotteryUtils = require("Utils.LotteryUtils")
local EditInfoUtils = require("Guis.Panels.InfoPlayerMain.Component.EditInfoUtils")

InfoPlayerMainModel.SHOW_STATUS_NORMAL = 1
InfoPlayerMainModel.SHOW_STATUS_HIDDEN = 2
InfoPlayerMainModel.SHOW_STATUS_UNLOCKED = 3

function InfoPlayerMainModel:ctor()
	self:init()
end

function InfoPlayerMainModel:init()
	return
end

function InfoPlayerMainModel:getUnlockDict(curUnlock, data, timedUnlock)
	local ret = {}

	for id, value in pairs(data or EMPTY_TABLE) do
		if value.defaultUnlock == 1 then
			ret[id] = true
		end
	end

	for id, value in pairs(curUnlock or EMPTY_TABLE) do
		ret[id] = value
	end

	for id, value in pairs(timedUnlock or EMPTY_TABLE) do
		if value and data and data[id] and not self:isTimedUnlockExpired(timedUnlock, id) then
			ret[id] = true
		end
	end

	return ret
end

function InfoPlayerMainModel:getAssetEndTime(timedUnlock, id)
	local timeInfo = timedUnlock and timedUnlock[id]

	return timeInfo and timeInfo.endTime
end

function InfoPlayerMainModel:isTimedUnlockExpired(timedUnlock, id)
	local timeInfo = timedUnlock and timedUnlock[id]

	if not timeInfo then
		return false
	end

	return EditInfoUtils.isExpired(timeInfo.endTime)
end

function InfoPlayerMainModel:getChatBubbleList()
	local list = {}
	local timedUnlock = pg.me.chatBubbleTimedDicts
	local curUnlock = self:getUnlockDict(pg.me.chatBubbleDicts, ChatBubbleData, timedUnlock)

	for id, data in next, ChatBubbleData do
		local isLock = not curUnlock[id]

		if self:isItemShow(data, not isLock) then
			list[#list + 1] = {
				id = id,
				name = data.cardName,
				res = data.res,
				source = data.source,
				isLock = isLock,
				endTime = self:getAssetEndTime(timedUnlock, id)
			}
		end
	end

	table.sort(list, function(a, b)
		if a.isLock ~= b.isLock then
			return not a.isLock
		end

		return a.id < b.id
	end)

	return list
end

function InfoPlayerMainModel:isChatBubbleLock(id)
	local data = ChatBubbleData[id]

	if data and data.defaultUnlock == 1 then
		return false
	end

	local unlockDict = pg.me.chatBubbleDicts
	local timedUnlock = pg.me.chatBubbleTimedDicts

	if unlockDict and unlockDict[id] == true then
		return false
	end

	if not timedUnlock or not timedUnlock[id] then
		return true
	end

	return self:isTimedUnlockExpired(timedUnlock, id)
end

function InfoPlayerMainModel:getHeadList()
	local ret = {}
	local data = PlayerHeadIconData
	local timedUnlock = pg.me.headIconTimedDicts
	local curUnlock = self:getUnlockDict(pg.me.headIconDicts, data, timedUnlock)

	for index, value in pairs(curUnlock) do
		if value and data[index] and self:isItemShow(data[index], true) then
			ret[#ret + 1] = {
				id = index,
				icon = data[index].res,
				item = data[index].item,
				endTime = self:getAssetEndTime(timedUnlock, index)
			}
		end
	end

	for id, value in pairs(data) do
		if not curUnlock[id] and self:isItemShow(value, false) then
			ret[#ret + 1] = {
				id = id,
				icon = value.res,
				item = value.item,
				endTime = self:getAssetEndTime(timedUnlock, id)
			}
		end
	end

	table.sort(ret, function(a, b)
		local aUnlocked = curUnlock[a.id] and true or false
		local bUnlocked = curUnlock[b.id] and true or false

		if aUnlocked ~= bUnlocked then
			return aUnlocked
		end

		local aSort = data[a.id].sort
		local bSort = data[b.id].sort

		return aSort == bSort and a.id < b.id or aSort < bSort
	end)

	return ret
end

function InfoPlayerMainModel:getFrameList()
	local ret = {}
	local data = PlayerHeadFrameData
	local timedUnlock = pg.me.headFrameTimedDicts
	local curUnlock = self:getUnlockDict(pg.me.headFrameDicts, data, timedUnlock)

	for index, value in pairs(curUnlock) do
		if value and data[index] and self:isItemShow(data[index], true) then
			ret[#ret + 1] = {
				id = index,
				icon = data[index].res,
				item = data[index].item,
				endTime = self:getAssetEndTime(timedUnlock, index)
			}
		end
	end

	for id, value in pairs(data) do
		if not curUnlock[id] and self:isItemShow(value, false) then
			ret[#ret + 1] = {
				id = id,
				icon = value.res,
				item = value.item,
				endTime = self:getAssetEndTime(timedUnlock, id)
			}
		end
	end

	return ret
end

function InfoPlayerMainModel:getShowTitleList(titleType)
	local ret = {}
	local timedUnlock = pg.me.showTitleTimedDicts
	local curUnlock = self:getUnlockDict(pg.me.showTitleDicts, ShowTitleData, timedUnlock)
	local tIndex = titleType == Const.SHOW_TITLE_TYPE.Background and 1 or 0

	for id, value in pairs(curUnlock) do
		local titleData = ShowTitleData[id]
		local isMatchingType = value and titleData ~= nil and (titleData.titleType == titleType or titleData.titleType == Const.SHOW_TITLE_TYPE.None)

		if isMatchingType and self:isItemShow(titleData, true) then
			ret[#ret + 1] = self:_createShowTitleListData(id, tIndex, false, timedUnlock)
		end
	end

	if titleType == Const.SHOW_TITLE_TYPE.Prefix then
		self:_appendFriendNamePrefixTitles(ret)
	end

	for id, titleData in pairs(ShowTitleData) do
		local isMatchingType = titleData.titleType == titleType or titleData.titleType == Const.SHOW_TITLE_TYPE.None

		if not curUnlock[id] and isMatchingType and self:isItemShow(titleData, false) then
			ret[#ret + 1] = self:_createShowTitleListData(id, tIndex, true, timedUnlock)
		end
	end

	return ret
end

function InfoPlayerMainModel:_createShowTitleListData(titleId, tIndex, isLock, timedUnlock)
	local titleData = ShowTitleData[titleId]

	return {
		titleId = titleId,
		titleText = titleData.titleText,
		bgRes = titleData.bgRes,
		tIndex = tIndex,
		isLock = isLock,
		sourceDec = titleData.sourceDec,
		titleType = titleData.titleType,
		item = titleData.item,
		endTime = self:getAssetEndTime(timedUnlock, titleId)
	}
end

function InfoPlayerMainModel:_appendFriendNamePrefixTitles(titleList)
	for _, friend in ipairs(pg.game.chat:getFriendList() or EMPTY_TABLE) do
		local friendUid = tostring(friend.playerId or "")
		local playerInfo = pg.game.chat:getPlayerInfo(friend.playerId)
		local friendName = playerInfo and playerInfo.playerName or ""
		local canAppend = not string.isNilOrEmpty(friendUid) and not string.isNilOrEmpty(friendName) and self:_hasUnlockedFriendNamePrefix(friend.playerId)

		if canAppend then
			titleList[#titleList + 1] = {
				isLock = false,
				isFriendTitle = true,
				tIndex = 0,
				titleId = "friend_" .. friendUid,
				titleText = friendName,
				titleType = Const.SHOW_TITLE_TYPE.Prefix,
				friendUid = friendUid,
				friendName = friendName
			}
		end
	end
end

function InfoPlayerMainModel:_hasUnlockedFriendNamePrefix(friendUid)
	local permissionId = self:_getFriendNamePrefixPermissionId()

	return pg.game.chat:isFriendshipPermissionUnlocked(friendUid, permissionId)
end

function InfoPlayerMainModel:_getFriendNamePrefixPermissionId()
	if self._friendNamePrefixPermissionId ~= nil then
		return self._friendNamePrefixPermissionId
	end

	for permissionId, permissionData in pairs(FriendshipLevelFuncData) do
		if permissionData.type == Const.FriendshipPermissionType.FriendNamePrefix then
			self._friendNamePrefixPermissionId = permissionId

			break
		end
	end

	return self._friendNamePrefixPermissionId
end

function InfoPlayerMainModel:getCardBackGroundList()
	local ret = {}
	local data = CardBackgroundData
	local timedUnlock = pg.me.cardBackgroundTimedDicts
	local curUnlock = self:getUnlockDict(pg.me.cardBackgroundDicts, data, timedUnlock)

	for index, value in pairs(curUnlock) do
		if value and data[index] and self:isItemShow(data[index], true) then
			ret[#ret + 1] = {
				isLock = false,
				id = index,
				cardName = data[index].cardName,
				sourceDec = data[index].sourceDec,
				res = data[index].res,
				item = data[index].item,
				endTime = self:getAssetEndTime(timedUnlock, index)
			}
		end
	end

	for id, value in pairs(data) do
		if not curUnlock[id] and self:isItemShow(value, false) then
			ret[#ret + 1] = {
				isLock = true,
				id = id,
				cardName = value.cardName,
				sourceDec = value.sourceDec,
				res = value.res,
				item = value.item,
				endTime = self:getAssetEndTime(timedUnlock, id)
			}
		end
	end

	return ret
end

function InfoPlayerMainModel:isHeadIconLock(id)
	local data = PlayerHeadIconData[id]
	local timedUnlock = pg.me.headIconTimedDicts

	return data ~= nil and data.defaultUnlock ~= 1 and (pg.me.headIconDicts[id] == nil or pg.me.headIconDicts[id] == false) and (not timedUnlock or not timedUnlock[id] or self:isTimedUnlockExpired(timedUnlock, id))
end

function InfoPlayerMainModel:isHeadFrameLock(id)
	local data = PlayerHeadFrameData[id]
	local timedUnlock = pg.me.headFrameTimedDicts

	return data ~= nil and data.defaultUnlock ~= 1 and (pg.me.headFrameDicts[id] == nil or pg.me.headFrameDicts[id] == false) and (not timedUnlock or not timedUnlock[id] or self:isTimedUnlockExpired(timedUnlock, id))
end

function InfoPlayerMainModel:isTitleLock(id)
	if id == Const.SHOW_TITLE_TYPE.None or not id then
		return false
	end

	local data = ShowTitleData[id]
	local timedUnlock = pg.me.showTitleTimedDicts

	return data ~= nil and data.defaultUnlock ~= 1 and (pg.me.showTitleDicts[id] == nil or pg.me.showTitleDicts[id] == false) and (not timedUnlock or not timedUnlock[id] or self:isTimedUnlockExpired(timedUnlock, id))
end

function InfoPlayerMainModel:isCardBackgroundLock(id)
	local data = CardBackgroundData[id]
	local timedUnlock = pg.me.cardBackgroundTimedDicts

	return data ~= nil and data.defaultUnlock ~= 1 and (pg.me.cardBackgroundDicts[id] == nil or pg.me.cardBackgroundDicts[id] == false) and (not timedUnlock or not timedUnlock[id] or self:isTimedUnlockExpired(timedUnlock, id))
end

function InfoPlayerMainModel:isItemShow(data, isUnlocked)
	local showStatus = data.showStatus or InfoPlayerMainModel.SHOW_STATUS_NORMAL

	if showStatus == InfoPlayerMainModel.SHOW_STATUS_HIDDEN then
		return false
	end

	if isUnlocked then
		return true
	end

	if self:isLotteryOpen(data) == false then
		return false
	end

	return showStatus ~= InfoPlayerMainModel.SHOW_STATUS_UNLOCKED or isUnlocked
end

function InfoPlayerMainModel:isLotteryOpen(data)
	if data.drawId then
		return LotteryUtils.isOpen(data.drawId)
	end

	return true
end

return InfoPlayerMainModel
