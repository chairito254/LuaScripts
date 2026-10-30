-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Ability\\AttributeSnapshot.lua

local Class = require("Core.Framework.Class")
local AttributeConst = require("Common.Const.AttributeConst")
local AttributeSnapshot = Class.LiteClass("AttributeSnapshot")

function AttributeSnapshot:ctor()
	self.attrs = {}
end

function AttributeSnapshot:init(owner, combatAttribute)
	combatAttribute = combatAttribute or owner and owner.actorCombatAttribute

	for i = 1, AttributeConst.GROUP_BASE_SINGLE_PROCESS_BEGIN - 1 do
		self.attrs[i] = combatAttribute and combatAttribute:getAttribValue(i) or 0
	end

	self.lvModifyCache = nil

	local ownerLvModifyCache = combatAttribute and combatAttribute.lvModifyCache

	if ownerLvModifyCache then
		self.lvModifyCache = {}

		for level, cache in pairs(ownerLvModifyCache) do
			self.lvModifyCache[level] = {}

			for key, value in pairs(cache) do
				self.lvModifyCache[level][key] = value
			end
		end
	end
end

function AttributeSnapshot:getAttribValue(id)
	return self.attrs[id]
end

function AttributeSnapshot:getRawAttribValue(id)
	return self.attrs[id]
end

return AttributeSnapshot
