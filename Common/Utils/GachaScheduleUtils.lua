-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\GachaScheduleUtils.lua

local GachaEntryData = require("Data.gacha_entry_data")
local Utils = require("Common.Utils.Utils")
local GachaScheduleUtils = {}
local overrides = {}
local ready = false
local revision = 0
local scope

function GachaScheduleUtils.normalizeOverrides(data)
	if type(data) ~= "table" then
		return nil, "overrides must be a table"
	end

	local normalized = {}

	for key, value in pairs(data) do
		if type(key) ~= "number" and type(key) ~= "string" then
			return nil, "invalid gachaId key type"
		end

		local id = tonumber(key)

		if not id or id <= 0 or id % 1 ~= 0 or type(GachaEntryData[id]) ~= "table" then
			return nil, "invalid gachaId: " .. tostring(key)
		end

		if type(value) ~= "table" or normalized[id] ~= nil then
			return nil, "invalid or duplicate schedule: " .. tostring(key)
		end

		local openTime, closeTime = value.openTime, value.closeTime

		if type(openTime) ~= "number" or openTime <= 0 or openTime % 1 ~= 0 or type(closeTime) ~= "number" or closeTime <= 0 or closeTime % 1 ~= 0 or closeTime < openTime then
			return nil, "invalid schedule times: " .. tostring(key)
		end

		normalized[id] = {
			openTime = openTime,
			closeTime = closeTime
		}
	end

	return normalized
end

function GachaScheduleUtils.normalizeSnapshot(data)
	if type(data) ~= "table" or type(data.scope) ~= "string" or data.scope == "" or data.scope ~= GachaScheduleUtils.getScope() then
		return nil, "invalid cluster scope"
	end

	local schedules, err = GachaScheduleUtils.normalizeOverrides(data.schedules)

	if not schedules then
		return nil, err
	end

	return {
		scope = data.scope,
		schedules = schedules
	}
end

function GachaScheduleUtils.getScope()
	if scope ~= nil then
		return scope
	end

	if pg.component == "game" then
		local repo = require("Core.Server.GameServerRepo")

		if repo.gameServerClusterId ~= nil then
			return tostring(repo.gameServerClusterId)
		end
	end

	return nil
end

function GachaScheduleUtils.replaceOverrides(data, newScope)
	local normalized, err = GachaScheduleUtils.normalizeOverrides(data)

	if not normalized then
		return false, err
	end

	newScope = newScope or GachaScheduleUtils.getScope()

	if type(newScope) ~= "string" or newScope == "" then
		return false, "missing cluster scope"
	end

	local changed = not ready or scope ~= newScope

	for id, value in pairs(normalized) do
		local previous = overrides[id]

		changed = changed or previous == nil or previous.openTime ~= value.openTime or previous.closeTime ~= value.closeTime
	end

	for id in pairs(overrides) do
		changed = changed or normalized[id] == nil
	end

	overrides, scope, ready = normalized, newScope, true

	if changed then
		revision = revision + 1
	end

	return true, changed
end

function GachaScheduleUtils.isReady()
	return ready
end

function GachaScheduleUtils.getRevision()
	return revision
end

function GachaScheduleUtils.getOverrides()
	local copy = {}

	for id, value in pairs(overrides) do
		copy[id] = {
			openTime = value.openTime,
			closeTime = value.closeTime
		}
	end

	return copy
end

function GachaScheduleUtils.getTimes(gachaId)
	local entry = GachaEntryData[gachaId]

	if type(entry) ~= "table" then
		return nil, nil
	end

	local override = overrides[gachaId]

	if override then
		return override.openTime, override.closeTime
	end

	local openTime = Utils.getConfigTimeOfArea(entry, "openTime")
	local closeTime = Utils.getConfigTimeOfArea(entry, "closeTime")

	if type(openTime) ~= "number" or type(closeTime) ~= "number" or closeTime < openTime then
		return nil, nil
	end

	return openTime, closeTime
end

return GachaScheduleUtils
