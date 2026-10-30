-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\LotteryUtils.lua

local CommonSwitch = require("Common.CommonSwitch")
local Utils = require("Common.Utils.Utils")
local TimeUtils = require("Common.Utils.TimeUtils")
local GachaEntryData = require("Data.gacha_entry_data")
local GachaTimesData = require("Data.gacha_times_data")
local Time = require("Core.Common.Time")
local ItemEffectData = require("Data.item_effect_data")
local SysEventData = require("Data.sys_event_data")
local PlayerHeadIconData = require("Data.player_head_icon_data")
local PlayerHeadFrameData = require("Data.player_head_frame_data")
local LotteryUtils = {}

function LotteryUtils.isEnabled()
	return CommonSwitch.EnableGacha == true
end

function LotteryUtils.isOpen(drawId)
	if not LotteryUtils.isEnabled() then
		return false
	end

	drawId = tonumber(drawId)

	if not drawId or drawId <= 0 then
		return false
	end

	local entryConfig = GachaEntryData[drawId]

	if not Utils.isTable(entryConfig) then
		return false
	end

	local openTime = Utils.getConfigTimeOfArea(entryConfig, "openTime")
	local closeTime = Utils.getConfigTimeOfArea(entryConfig, "closeTime")

	if type(openTime) ~= "number" or type(closeTime) ~= "number" or closeTime < openTime then
		return false
	end

	return TimeUtils.isInRangeTimestamp(openTime, closeTime)
end

function LotteryUtils.getCurCanShareCount(drawId)
	drawId = tonumber(drawId)

	local gachaMap = pg.me and pg.me.gachaMap or nil
	local gachaBase = drawId and Utils.isTable(gachaMap) and gachaMap[drawId] or nil

	if not Utils.isTable(gachaBase) or type(gachaBase.getCurCanShareCount) ~= "function" then
		return 0
	end

	local count = tonumber(gachaBase:getCurCanShareCount()) or 0

	return math.max(math.floor(count), 0)
end

function LotteryUtils.hasClaimableTimesReward(drawId)
	drawId = tonumber(drawId)

	if not LotteryUtils.isOpen(drawId) then
		return false
	end

	local gachaMap = pg.me and pg.me.gachaMap or nil
	local gachaBase = drawId and Utils.isTable(gachaMap) and gachaMap[drawId] or nil
	local rewardConfigs = drawId and GachaTimesData[drawId] or nil

	if not Utils.isTable(gachaBase) or not Utils.isTable(rewardConfigs) then
		return false
	end

	local drawCount = tonumber(gachaBase.drawCount) or 0
	local claimedTimesRewardNums = gachaBase.claimedTimesRewardNums

	for _, rewardConfig in ipairs(rewardConfigs) do
		local requiredNum = tonumber(rewardConfig.num)
		local claimed = Utils.isTable(claimedTimesRewardNums) and claimedTimesRewardNums[requiredNum] == true or false

		if requiredNum and requiredNum <= drawCount and not claimed then
			return true
		end
	end

	return false
end

function LotteryUtils.getHeadRewardOwned(player, itemId)
	local effectConfig = ItemEffectData[itemId]

	if not effectConfig or not Utils.isTable(effectConfig.eventId) or #effectConfig.eventId == 0 then
		return nil
	end

	local owned = true

	for _, eventId in ipairs(effectConfig.eventId) do
		local eventConfig = SysEventData[eventId]
		local configData, unlockDict, timedDict

		if eventConfig and eventConfig.eventType == "addHeadIcon" then
			configData = PlayerHeadIconData
			unlockDict = player and player.headIconDicts
			timedDict = player and player.headIconTimedDicts
		elseif eventConfig and eventConfig.eventType == "addHeadFrame" then
			configData = PlayerHeadFrameData
			unlockDict = player and player.headFrameDicts
			timedDict = player and player.headFrameTimedDicts
		else
			return nil
		end

		local unlockId = eventConfig.eventParam and eventConfig.eventParam[1]
		local config = unlockId and configData[unlockId]
		local unlocked = player ~= nil and config ~= nil and (config.defaultUnlock == 1 or unlockDict and unlockDict[unlockId] == true)

		if not unlocked and player and config then
			local timeInfo = timedDict and timedDict[unlockId]

			if timeInfo then
				local endTime = tonumber(timeInfo.endTime) or 0

				unlocked = endTime <= 0 or endTime - Time.getSecond() >= 1
			end
		end

		if not unlocked then
			owned = false
		end
	end

	return owned
end

return LotteryUtils
