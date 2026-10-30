-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\AttributeInheritUtils.lua

local AttributeConst = require("Common.Const.AttributeConst")
local AbilityConst = require("Common.Const.AbilityConst")
local AttributeData = require("Data.attribute_id_data")
local AttributeInheritUtils = {}

function AttributeInheritUtils.isAdvancedAttribute(attributeId)
	return attributeId >= AttributeConst.GROUP_BASE_SINGLE_BEGIN and attributeId < AttributeConst.GROUP_BASE_SINGLE_PROCESS_BEGIN
end

function AttributeInheritUtils.getInheritType(attributeId)
	local name = AttributeConst.ID2NAME[attributeId]
	local data = name and AttributeData[name]
	local value = data and data.attrInheritType

	if value == nil then
		return AbilityConst.ATTRIBUTE_INHERIT_TYPE_REALTIME
	end

	return value
end

local realtimeAttributeMap = {}

function AttributeInheritUtils.refreshRealtimeAttributeMap()
	table.clear(realtimeAttributeMap)

	for attributeId = AttributeConst.GROUP_BASE_SINGLE_BEGIN, AttributeConst.GROUP_BASE_SINGLE_PROCESS_BEGIN - 1 do
		if AttributeInheritUtils.isAdvancedAttribute(attributeId) and AttributeInheritUtils.getInheritType(attributeId) == AbilityConst.ATTRIBUTE_INHERIT_TYPE_REALTIME then
			realtimeAttributeMap[attributeId] = true
		end
	end
end

AttributeInheritUtils.refreshRealtimeAttributeMap()

function AttributeInheritUtils.getRealtimeAttributeMap()
	return realtimeAttributeMap
end

function AttributeInheritUtils.getInheritSrcEntity(entity)
	if not entity or not entity.inheritSourceActorId then
		return nil
	end

	local source = pg.getEntityByActorId(entity.inheritSourceActorId)

	if source == entity then
		return nil
	end

	return source
end

return AttributeInheritUtils
