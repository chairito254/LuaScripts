-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenCollection\\EventHalloweenCollectionModel.lua

local Class = require("Core.Framework.Class")
local ActivityConst = require("Common.Const.ActivityConst")
local RedDotConst = require("Const.RedDotConst")
local EventHalloweenModel = require("Guis.Panels.EventHalloween.EventHalloweenModel")
local LuaUIUtils = require("Utils.LuaUIUtils")
local EventHalloweenCollectionModel = Class.LightClass("EventHalloweenCollectionModel", EventHalloweenModel)

function EventHalloweenCollectionModel:getTitleText()
	return pg.getGameString("HALLOWEEN_BOOK_NAME")
end

function EventHalloweenCollectionModel:getRoomBadgeUnlockMap()
	local unlockMap = {}
	local stage = self:getCandyHouseLevel()

	for index = 1, self.ROOM_BADGE_COUNT do
		unlockMap[index] = index <= stage
	end

	return unlockMap
end

function EventHalloweenCollectionModel:getRewardList()
	local rewardList = self:getProgressRewardTaskList()
	local previousTarget = 0

	for _, taskData in ipairs(rewardList) do
		taskData.previousTarget = previousTarget
		previousTarget = tonumber(taskData.target) or previousTarget
	end

	return rewardList
end

function EventHalloweenCollectionModel:getViewData()
	local progress, total = self:getJournalProgress()

	return {
		titleText = self:getTitleText(),
		progressText = string.format("%s/%s", progress, total),
		progressTitleText = pg.getGameString("HALLOWEEN_PROGRESS_1"),
		roomUnlockMap = self:getRoomBadgeUnlockMap(),
		petCompleteMap = self:getCompletedPerfumePetMap(),
		rewardList = self:getRewardList()
	}
end

function EventHalloweenCollectionModel:getRewardRenderData(taskData)
	local target = tonumber(taskData.target) or 0
	local progress = tonumber(taskData.progress) or 0
	local previousTarget = tonumber(taskData.previousTarget) or 0
	local segmentMaxValue = math.max(target - previousTarget, 0)
	local segmentValue = math.max(math.min(progress, target) - previousTarget, 0)
	local canReceive = taskData.taskState == ActivityConst.TaskState.Finihed_CanRecv
	local hasReceived = taskData.taskState >= ActivityConst.TaskState.Received
	local buttonState = canReceive and 2 or hasReceived and 1 or 0
	local rewardList = LuaUIUtils.getRewardItemByDropId(taskData.taskAward, hasReceived, canReceive)
	local rewardData = rewardList[1]

	if rewardData then
		rewardData.state = buttonState
	end

	return {
		maxValue = math.max(segmentMaxValue, 1),
		value = math.min(segmentValue, segmentMaxValue),
		targetText = tostring(target),
		buttonState = buttonState,
		canReceive = canReceive,
		rewardData = rewardData,
		redDot = {
			path = self:getCollectionRewardRedDotPath(self:getEventId(), taskData.taskId),
			visible = canReceive,
			style = RedDotConst.RedDotStyle.REWARD
		}
	}
end

return EventHalloweenCollectionModel
