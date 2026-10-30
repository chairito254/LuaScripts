-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\LuaCondition.lua

local Utils = require("Common.Utils.Utils")
local QuestCommonUtils = require("Common.Utils.QuestCommonUtils")
local LuaCondition = {}

function LuaCondition.checkCondition(entity, condition)
	if not condition then
		return true
	end

	local conditionName = condition[1]
	local func = LuaCondition[conditionName]

	if func then
		return func(entity, unpack(condition, 2))
	end
end

function LuaCondition.And(entity, ...)
	local nargs = select("#", ...)

	for i = 1, nargs do
		local condition = select(i, ...)

		if not LuaCondition.checkCondition(entity, condition) then
			return false
		end
	end

	return true
end

function LuaCondition.Or(entity, ...)
	local nargs = select("#", ...)

	for i = 1, nargs do
		local condition = select(i, ...)

		if LuaCondition.checkCondition(entity, condition) then
			return true
		end
	end

	return false
end

function LuaCondition.Not(entity, condition)
	return not LuaCondition.checkCondition(entity, condition)
end

function LuaCondition.CheckActorType(entity, actorType)
	return Utils.isActorType(entity, actorType)
end

function LuaCondition.CheckQuestState(entity, questId, questState)
	local player

	if pg and pg.me then
		if entity ~= pg.me then
			return false
		end

		player = pg.me
	else
		player = entity
	end

	if not player or player.acceptedQuestMap == nil or player.pendingQuestMap == nil or player.questAwardFlags == nil or player.questCloseFlags == nil then
		return false
	end

	local actualState = QuestCommonUtils.getQuestState(player, questId)

	return actualState == questState
end

function LuaCondition.CheckMultiActorType(entity, actorTypes)
	for _, actorType in ipairs(actorTypes) do
		if Utils.isActorType(entity, actorType) then
			return true
		end
	end

	return false
end

function LuaCondition.CheckTemplateId(entity, templateId)
	return entity.templateId == templateId
end

function LuaCondition.CheckPetPrototypeId(entity, petPrototypeId)
	if not entity or entity.templateId == nil then
		return false
	end

	return Utils.getPetPetPrototypeId(entity.templateId) == petPrototypeId
end

function LuaCondition.CheckEthnicGroup(entity, ethnicGroupId)
	if not entity then
		return false
	end

	local configData = entity:getConfigData()

	return configData and configData.ethnicGroup == ethnicGroupId
end

return LuaCondition
