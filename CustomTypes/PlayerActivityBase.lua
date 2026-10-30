-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\PlayerActivityBase.lua

local CustomDict = require("Core.PropertySync.CustomDict")
local class = require("Core.Framework.Class")
local Time = require("Core.Common.Time")
local TimeUtils = require("Common.Utils.TimeUtils")
local GameEventData = require("Data.game_event_data")
local Utils = require("Common.Utils.Utils")
local PlayerActivityBase = class.LiteClass("PlayerActivityBase", CustomDict)

function PlayerActivityBase:isGoing()
	return self.activityId > 0
end

function PlayerActivityBase:getTaskInfoById(taskId)
	return self.activityTasks[taskId]
end

function PlayerActivityBase:foreachTask(cb)
	if not cb then
		return
	end

	for taskId, task in pairs(self.activityTasks) do
		cb(task)
	end
end

function PlayerActivityBase:canTabOpen(startTime, endTime)
	local recvedAllRewardTm = self.recvedAllRewardTm

	if recvedAllRewardTm > 0 and startTime and startTime > 0 and endTime and endTime > 0 and startTime <= recvedAllRewardTm and recvedAllRewardTm < endTime then
		local now = Time.secondCache

		if startTime <= now and now < endTime and TimeUtils.getServerDayDiff(recvedAllRewardTm, now) >= 1 then
			return false
		end
	end

	return true
end

function PlayerActivityBase:canOpen(startTime, endTime)
	local recvedAllRewardTm = self.recvedAllRewardTm

	if recvedAllRewardTm > 0 and startTime and startTime > 0 and endTime and endTime > 0 and startTime <= recvedAllRewardTm and recvedAllRewardTm < endTime then
		local now = Time.secondCache

		if startTime <= now and now < endTime and TimeUtils.getServerDayDiff(recvedAllRewardTm, now) >= 1 then
			return false
		end
	end

	return true
end

return PlayerActivityBase
