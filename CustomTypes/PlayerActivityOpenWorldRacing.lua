-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\PlayerActivityOpenWorldRacing.lua

local CustomDict = require("Core.PropertySync.CustomDict")
local class = require("Core.Framework.Class")
local WorldRacingTrackData = require("Data.world_racing_track_data")
local Utils = require("Common.Utils.Utils")
local Time = require("Core.Common.Time")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local NoticeDef = require("Common.NoticeDef")
local PlayerActivityOpenWorldRacing = class.LiteClass("PlayerActivityOpenWorldRacing", CustomDict)

function PlayerActivityOpenWorldRacing:checkTrackOpen(trackId)
	local checkRet = ActivityUtils.activityBaseCheck(self)

	if checkRet ~= NoticeDef.SUCCESS then
		return checkRet
	end

	return self:checkTrackOpenTime(trackId)
end

function PlayerActivityOpenWorldRacing:checkTrackOpenTime(trackId)
	local rackCfg = WorldRacingTrackData[trackId]

	if not rackCfg then
		return NoticeDef.ERROR_CONFIG_HAS_ERROR
	end

	local openTime = Utils.getConfigTimeOfArea(rackCfg, "trackStartTime")
	local now = Time.secondCache

	if not openTime or openTime <= now then
		return NoticeDef.SUCCESS
	end

	return NoticeDef.ERROR_ACTIVITY_NOT_OPEN
end

return PlayerActivityOpenWorldRacing
