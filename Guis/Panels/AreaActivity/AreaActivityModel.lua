-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AreaActivity\\AreaActivityModel.lua

local logger = require("Core.Log.LoggerManager").getLogger("AreaActivityModel")
local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local EventAreaActivityData = require("Data.event_area_activity_data")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local ActivityConst = require("Common.Const.ActivityConst")
local EventTaskData = require("Data.event_task_data")
local AreaActivityModel = Class.LightClass("AreaActivityModel", UIModel)

function AreaActivityModel:checkSubTaskAvailable(eventPhase, curSubTaskIndex)
	if not eventPhase or not curSubTaskIndex then
		return false
	end

	local areaTaskData = EventAreaActivityData[eventPhase]

	if not areaTaskData then
		return false
	end

	local targetIndex = curSubTaskIndex % (#areaTaskData.petResearchTaskGroupId + 1)

	return true, targetIndex
end

function AreaActivityModel:getNextSubTaskIndex(eventPhase, currentIndex, direction)
	local areaTaskData = EventAreaActivityData[eventPhase]

	for offset = 1, #areaTaskData.petResearchTaskGroupId do
		local available, targetIndex = self:checkSubTaskAvailable(eventPhase, currentIndex + direction * offset)

		if available then
			return true, targetIndex
		end
	end

	return false, currentIndex
end

return AreaActivityModel
