-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenTask\\EventHalloweenTaskModel.lua

local Class = require("Core.Framework.Class")
local ActivityConst = require("Common.Const.ActivityConst")
local RedDotConst = require("Const.RedDotConst")
local EventHalloweenModel = require("Guis.Panels.EventHalloween.EventHalloweenModel")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ItemSourceData = require("Data.item_source_data")
local EventHalloweenTaskModel = Class.LightClass("EventHalloweenTaskModel", EventHalloweenModel)

function EventHalloweenTaskModel:getTaskStatePage(taskState)
	if taskState == ActivityConst.TaskState.Finihed_CanRecv then
		return 1
	elseif taskState >= ActivityConst.TaskState.Received then
		return 2
	end

	return 0
end

function EventHalloweenTaskModel:getDailyTaskList()
	local taskList = self:getDailyTaskDataList()
	local orderedTaskList = {}
	local receivedTaskList = {}
	local showRewardRedDot = not self:isCandyHouseMaxLevel()

	for _, taskData in ipairs(taskList) do
		local description = pg.getLocalizationText(taskData.taskDes)
		local statePage = self:getTaskStatePage(taskData.taskState)
		local sourceData = taskData.sourceId and ItemSourceData[taskData.sourceId]
		local canReceive = statePage == 1
		local hasReceived = statePage == 2

		taskData.descriptionText = pg.getFormatText(description, taskData.progress or 0, taskData.target or 0)
		taskData.progressText = string.format("%s/%s", taskData.progress or 0, taskData.target or 0)
		taskData.statePage = statePage
		taskData.sourceData = sourceData
		taskData.canGo = statePage == 0 and sourceData ~= nil
		taskData.canReceive = canReceive
		taskData.rewardList = LuaUIUtils.getRewardItemByDropId(taskData.taskAward, hasReceived, canReceive) or {}
		taskData.redDot = {
			path = self:getDailyTaskRewardRedDotPath(self:getEventId(), taskData.taskId),
			visible = showRewardRedDot and taskData.canReceive,
			style = RedDotConst.RedDotStyle.POINT
		}

		local targetList = hasReceived and receivedTaskList or orderedTaskList

		targetList[#targetList + 1] = taskData
	end

	for _, taskData in ipairs(receivedTaskList) do
		orderedTaskList[#orderedTaskList + 1] = taskData
	end

	return orderedTaskList
end

return EventHalloweenTaskModel
