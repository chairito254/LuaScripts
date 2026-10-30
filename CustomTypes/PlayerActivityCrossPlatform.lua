-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\PlayerActivityCrossPlatform.lua

local CustomDict = require("Core.PropertySync.CustomDict")
local class = require("Core.Framework.Class")
local Time = require("Core.Common.Time")
local TimeUtils = require("Common.Utils.TimeUtils")
local PlayerActivityCrossPlatform = class.LiteClass("PlayerActivityCrossPlatform", CustomDict)

function PlayerActivityCrossPlatform:canTabOpen(startTime, endTime)
	local rewardAllRecvedTm = self.rewardAllRecvedTm

	if rewardAllRecvedTm > 0 and startTime and startTime > 0 and endTime and endTime > 0 and startTime <= rewardAllRecvedTm and rewardAllRecvedTm < endTime then
		local now = Time.secondCache

		if startTime <= now and now < endTime and TimeUtils.getServerDayDiff(rewardAllRecvedTm, now) >= 1 then
			return false
		end
	end

	return true
end

function PlayerActivityCrossPlatform:canOpen(startTime, endTime)
	local rewardAllRecvedTm = self.rewardAllRecvedTm

	if rewardAllRecvedTm > 0 and startTime and startTime > 0 and endTime and endTime > 0 and startTime <= rewardAllRecvedTm and rewardAllRecvedTm < endTime then
		local now = Time.secondCache

		if startTime <= now and now < endTime and TimeUtils.getServerDayDiff(rewardAllRecvedTm, now) >= 1 then
			return false
		end
	end

	return true
end

return PlayerActivityCrossPlatform
