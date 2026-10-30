-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\PetCommonUtils.lua

local Utils = require("Common.Utils.Utils")
local PetCommonUtils = {}
local LABEL_VALUE = {
	256,
	32,
	nil,
	16,
	nil,
	nil,
	nil,
	64,
	[99] = 128
}

PetCommonUtils.FUNCTION_ID_ORDER = {
	ENERGY = 1,
	HEAL = 2,
	SUP = 3,
	BREAK = 4,
	DPS = 5
}

function PetCommonUtils.getLabelScore(label, templateId)
	local isShiny = Utils.isLabelShiny(label) and LABEL_VALUE[1] or 0
	local isBoss = Utils.isLabelElite(label) and LABEL_VALUE[4] or 0
	local isRainbow = Utils.isAnyRainbowTypeByTemplateId(templateId) and LABEL_VALUE[99] or 0
	local isVariant = Utils.isLabelVariant(label) and LABEL_VALUE[8] or 0

	return isShiny + isBoss + isRainbow + isVariant
end

return PetCommonUtils
