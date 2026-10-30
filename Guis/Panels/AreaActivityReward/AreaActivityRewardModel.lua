-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AreaActivityReward\\AreaActivityRewardModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local EventAreaActivityData = require("Data.event_area_activity_data")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local ActivityConst = require("Common.Const.ActivityConst")
local AreaActivityRewardModel = Class.LightClass("AreaActivityRewardModel", UIModel)

function AreaActivityRewardModel:getRewardTasks(eventPhase)
	local data = EventAreaActivityData[eventPhase]
	local tasks = ClientActivityUtils.getTaskInfoList(data.relatedTaskGroupId, true)
	local progress = 0

	for _, task in ipairs(tasks) do
		progress = math.max(progress, pg.me.triggerMap:getConditionFinishCount(task.taskCondition, 1))
		task.target = pg.me.triggerMap:getConditionTargetCount(task.taskCondition, 1)

		if task.taskState ~= ActivityConst.TaskState.UnFinished then
			progress = math.max(progress, task.target)
		end
	end

	for _, task in ipairs(tasks) do
		task.progress = progress
	end

	return tasks
end

return AreaActivityRewardModel
