-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\PetBalanceResetUtils.lua

local Utils = require("Common.Utils.Utils")
local PetLevelData = require("Data.pet_level_data")
local PetBalanceResetUtils = {}

local function nonnegativeInteger(value)
	return math.max(math.floor(tonumber(value) or 0), 0)
end

function PetBalanceResetUtils.getState(player, petInfo, now)
	local state = {
		usedTimes = 0,
		remainingTimes = 0,
		reason = "noPet",
		available = false
	}

	if not player or not petInfo then
		return state
	end

	local config, startTime, endTime = Utils.getPetBalanceResetConfig(petInfo)

	state.config = config
	state.startTime = startTime
	state.endTime = endTime
	state.reason = "invalidConfig"

	if not config or not player.officialStringKeyValue then
		return state
	end

	local identity = petInfo.uuid

	if type(identity) ~= "string" or identity == "" then
		identity = petInfo.id
	end

	state.recordKey = "balance_reset:" .. tostring(identity)

	local records = player.officialStringKeyValue

	state.usedTimes = math.max(nonnegativeInteger(records[state.recordKey]), nonnegativeInteger(records["balance_reset:" .. tostring(petInfo.id)]))
	state.remainingTimes = math.max(nonnegativeInteger(config.canRevertTimes) - state.usedTimes, 0)

	local acquiredTime = (tonumber(petInfo.time) or 0) / 1000

	now = tonumber(now) or 0

	if startTime <= acquiredTime then
		state.reason = "notAcquired"
	elseif now < startTime then
		state.reason = "notStarted"
	elseif endTime <= now then
		state.reason = "expired"
	elseif state.remainingTimes <= 0 then
		state.reason = "exhausted"
	else
		state.available = true
		state.reason = nil
	end

	return state
end

function PetBalanceResetUtils.isInheritBlocked(player, petInfo, now)
	if not player or not petInfo then
		return false
	end

	local state = PetBalanceResetUtils.getState(player, petInfo, now)

	if state.available then
		return true
	end

	return false
end

function PetBalanceResetUtils.getCountdownPart(seconds)
	seconds = math.max(seconds or 0, 0)

	if seconds >= 86400 then
		return math.ceil(seconds / 86400), "day"
	elseif seconds >= 3600 then
		return math.ceil(seconds / 3600), "hour"
	elseif seconds >= 60 then
		return math.ceil(seconds / 60), "minute"
	end

	return math.ceil(seconds), "second"
end

local COUNTDOWN_UNIT_KEY = {
	minute = "MINUTE",
	hour = "HOUR",
	day = "DAY",
	second = "SECOND"
}

function PetBalanceResetUtils.getCountdownUnitKey(seconds)
	local count, unit = PetBalanceResetUtils.getCountdownPart(seconds)

	return count, COUNTDOWN_UNIT_KEY[unit]
end

function PetBalanceResetUtils._copyPreviewValue(value, seen)
	if not Utils.isTable(value) then
		return value
	end

	if seen[value] then
		return seen[value]
	end

	local result = {}

	seen[value] = result

	local source = value

	if type(value.getRawTable) == "function" then
		source = value:getRawTable()
	end

	for key, child in pairs(source) do
		if type(child) ~= "function" then
			result[key] = PetBalanceResetUtils._copyPreviewValue(child, seen)
		end
	end

	return result
end

function PetBalanceResetUtils.buildPreview(petInfo, resetData)
	local preview = PetBalanceResetUtils._copyPreviewValue(petInfo, {})

	for _, name in ipairs({
		"id",
		"templateId",
		"basePetPrototypeId",
		"petPrototypeId"
	}) do
		preview[name] = petInfo[name]
	end

	preview.calculatedAttributeMap = nil
	preview.extraSrcMap = nil
	resetData = resetData or {}

	local remaining = math.min(nonnegativeInteger(resetData.expToRollback), nonnegativeInteger(preview.expFromItem))
	local rollback = remaining
	local level = math.max(nonnegativeInteger(preview.level), 1)
	local minLevel = math.min(level, math.max(nonnegativeInteger(preview.levelOnCreate), 1))
	local exp = nonnegativeInteger(preview.exp)

	while remaining > 0 do
		if remaining <= exp then
			exp = exp - remaining
			remaining = 0

			break
		end

		remaining = remaining - exp
		exp = 0

		if level <= minLevel then
			break
		end

		local levelData = PetLevelData[level]

		if not levelData then
			break
		end

		level = level - 1
		exp = nonnegativeInteger(levelData.needExp)
	end

	preview.level = level
	preview.exp = exp
	preview.expFromItem = nonnegativeInteger(preview.expFromItem) - (rollback - remaining)

	if resetData.breakthroughTargetLevel ~= nil then
		preview.breakthroughPassedLevel = math.min(nonnegativeInteger(preview.breakthroughPassedLevel), nonnegativeInteger(resetData.breakthroughTargetLevel))
	end

	local enhancedRollback = nonnegativeInteger(resetData.propertyEnhancedCountToRollback)

	if enhancedRollback > 0 then
		local targetCount = math.max(Utils.getPetPropertyEnhancedCount(preview) - enhancedRollback, 0)

		for _, prop in pairs(preview.basePropertyList or {}) do
			local count = Utils.getBasePropertyEnhancedCount(prop)
			local target = math.min(count, targetCount)

			prop.indLv = prop.indLv - (count - target)
			prop.enhancedCount = target
		end

		preview.propertyEnhancedCount = targetCount
	end

	local propertyList = preview.basePropertyList

	for index, target in pairs(resetData.individualLearnTargetMap or {}) do
		local prop = propertyList and propertyList[index]

		if prop then
			local learned = nonnegativeInteger(prop.iLvLn)

			target = math.min(nonnegativeInteger(target), learned)
			prop.indLv = prop.indLv - (learned - target)
			prop.iLvLn = target
		end
	end

	if resetData.resonanceTargetStage ~= nil and preview.resonanceInfo then
		preview.resonanceInfo.resonanceStage = resetData.resonanceTargetStage
		preview.resonanceInfo.resonanceLevel = resetData.resonanceTargetLevel or 0
	end

	preview.propertyScoreStage = Utils.getIndividualInitStageNew(preview.basePropertyList, preview.templateId, 0)

	return preview
end

return PetBalanceResetUtils
