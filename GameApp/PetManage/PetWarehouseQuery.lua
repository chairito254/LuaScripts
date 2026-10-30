-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\PetManage\\PetWarehouseQuery.lua

local Class = require("Core.Framework.Class")
local Utils = require("Common.Utils.Utils")
local PetCommonUtils = require("Common.Utils.PetCommonUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local UIConst = require("Const.UIConst")
local PetData = require("Data.pet_data")
local PetCharacterData = require("Data.pet_character_data")
local PetResearchIdToNumber = require("Data.pet_research_id_to_number")
local PetFormTypeData = require("Data.pet_form_type_data")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local PetConfigData = require("Data.pet_config_data")
local PetWarehouseQuery = Class.LightClass("PetWarehouseQuery")

PetWarehouseQuery.SUPPORTED_SORT_IDS = {
	[0] = true,
	true,
	true,
	true,
	true,
	true,
	true,
	nil,
	nil,
	nil,
	true
}

local SORT_KEYS = {
	{
		"reverseTime",
		"cp",
		"labelScore",
		"rating",
		"level",
		"hasRareFeature"
	},
	{
		"bookNum",
		"cp",
		"labelScore",
		"rating",
		"level",
		"hasRareFeature",
		"reverseTime"
	},
	{
		"labelScore",
		"cp",
		"rating",
		"level",
		"hasRareFeature",
		"reverseTime"
	},
	{
		"cp",
		"labelScore",
		"rating",
		"level",
		"hasRareFeature",
		"reverseTime"
	},
	{
		"level",
		"cp",
		"labelScore",
		"rating",
		"hasRareFeature",
		"reverseTime"
	},
	{
		"rating",
		"cp",
		"labelScore",
		"level",
		"hasRareFeature",
		"reverseTime"
	},
	[10] = {
		"functionIdScore",
		"cp",
		"labelScore",
		"rating",
		"level",
		"hasRareFeature",
		"reverseTime"
	}
}

local function matchesGroup(filter, values)
	local selected = false
	local count = 0

	for key, matches in pairs(values) do
		if filter[key] then
			selected = true

			if matches then
				count = count + 1
			end
		end
	end

	return not selected or count > 0, count
end

function PetWarehouseQuery:buildCard(summary, petId, location)
	local card = {}

	for key, value in pairs(summary) do
		card[key] = value
	end

	local config = PetData[summary.templateId] or {}

	card.id = petId
	card.boxId = location.boxId
	card.slot = location.slot
	card.sourceDomain = PetWarehouseConst.DOMAIN.WAREHOUSE
	card.isEmpty = false
	card._warehouseSlot = true
	card.tIndex = 0
	card.label = summary.label or 0
	card.gender = summary.gender or 0
	card.cp = summary.cp or 0
	card.level = summary.level or 0
	card.hpRatio = summary.hpRatio or 1
	card.iconName = config.iconName
	card.name = summary.customName

	if not card.name or card.name == "" then
		card.name = pg.getLocalizationText(config.name or "")
	end

	card.elementIds, card.elementNames = LuaUIUtils.getElementInfo(config.elementType)
	card.isBoss = Utils.isLabelElite(card.label)
	card.isShiny = Utils.isLabelShiny(card.label)
	card.isDark = Utils.isLabelDark(card.label)
	card.isRainbow = Utils.isRainbowTypeByTemplateId(card.templateId)
	card.labelScore = PetCommonUtils.getLabelScore(card.label, card.templateId)
	card.rating = (summary.propertyScoreStage or 1) - 1
	card.favoriteType = summary.favoriteType or 0
	card.isFavorite = card.favoriteType > 0
	card.petType = config.functionId
	card.petTypeUrl = PetConfigData.petFunctionIcon and PetConfigData.petFunctionIcon[card.petType]
	card.functionIdScore = PetCommonUtils.FUNCTION_ID_ORDER[card.petType] or 99
	card.reverseTime = -(summary.time or 0)
	card.bookNum = PetResearchIdToNumber[card.templateId] or 999

	local feature = PetCharacterData[summary.curCharacter]

	card.hasRareFeature = feature and feature.rare == 1 and 1 or 0
	card.inBattle = false
	card.inExplore = false
	card.isPutInHomeland = false

	return card
end

function PetWarehouseQuery:matches(card, filter, forms, hasForms)
	if filter.keyword and filter.keyword ~= "" then
		local name = string.match(card.name or "", "^[^<]*") or ""

		if not string.find(name, filter.keyword, 1, true) then
			return false
		end
	end

	if hasForms and not forms[Utils.getPetFormIdByTemplateId(card.templateId)] then
		return false
	end

	local rarityValid, rarityCount = matchesGroup(filter, {
		isNormal = not card.isBoss and not card.isShiny and not card.isDark and not card.isRainbow,
		isBoss = card.isBoss,
		isShiny = card.isShiny,
		isDark = card.isDark,
		isRainbow = card.isRainbow
	})

	if not rarityValid then
		return false
	end

	local elementCount = 0

	if filter.elements and next(filter.elements) then
		for _, element in ipairs(card.elementNames or {}) do
			if filter.elements[element.element] then
				elementCount = elementCount + 1
			end
		end

		if elementCount == 0 then
			return false
		end
	end

	local roles = UIConst.NEW_PET_BATTLE_TYPE
	local roleValid = matchesGroup(filter, {
		isDPS = Utils.isMatchPetFuncType(card.petType, roles.DPS),
		isSup = Utils.isMatchPetFuncType(card.petType, roles.SUP),
		isHeal = Utils.isMatchPetFuncType(card.petType, roles.HEAL),
		isBreak = Utils.isMatchPetFuncType(card.petType, roles.BREAK),
		isEnergy = Utils.isMatchPetFuncType(card.petType, roles.ENERGY)
	})

	if not roleValid then
		return false
	end

	local favorites = {}

	for key, selected in pairs(filter) do
		if selected and type(key) == "string" then
			local favoriteType = tonumber(string.match(key, "^isFavoriteType(%d+)$"))

			if favoriteType then
				favorites[key] = card.favoriteType == favoriteType
			end
		end
	end

	if not matchesGroup(filter, favorites) then
		return false
	end

	if card.rating >= 0 and not matchesGroup(filter, {
		isRating1 = card.rating == 0,
		isRating2 = card.rating == 1,
		isRating3 = card.rating == 2,
		isRating4 = card.rating == 3
	}) then
		return false
	end

	local statusValid, statusCount = matchesGroup(filter, {
		isInExplore = false,
		isNotInBattle = true,
		isInBattle = false,
		isInHomeland = false
	})

	if not statusValid then
		return false
	end

	local config = PetData[card.templateId] or {}

	if not matchesGroup(filter, {
		isClimb = config.canClimb ~= nil and config.canClimb ~= false,
		isGlide = config.canFly ~= nil and config.canFly ~= false,
		isSwim = config.canSwim ~= nil and config.canSwim ~= false,
		isNone = not config.canClimb and not config.canFly and not config.canSwim
	}) then
		return false
	end

	card._queryMatchRank = 0

	if rarityCount >= 2 then
		card._queryMatchRank = rarityCount + 2
	elseif elementCount >= 2 then
		card._queryMatchRank = 2
	elseif statusCount >= 2 then
		card._queryMatchRank = 1
	end

	return true
end

function PetWarehouseQuery:build(snapshot, query)
	snapshot = snapshot or {}
	query = query or {}

	local filter = query.filter or {}
	local forms = {}
	local hasForms = false

	for key, value in pairs(filter) do
		if value == true and type(key) == "string" then
			local formId = tonumber(string.match(key, "^isForm(%d+)$"))

			if formId then
				forms[formId] = true
				hasForms = true

				for childId, config in pairs(PetFormTypeData) do
					if config.belong == formId then
						forms[childId] = true
					end
				end
			end
		end
	end

	local boxOrders = {}

	for index, box in ipairs(snapshot.boxes or {}) do
		if box.domain == PetWarehouseConst.DOMAIN.WAREHOUSE then
			boxOrders[box.id] = index
		end
	end

	local rows = {}

	for petId, location in pairs(snapshot.locations or {}) do
		local summary = (snapshot.summaries or {})[petId]

		if location.domain == PetWarehouseConst.DOMAIN.WAREHOUSE and not location.conflict and summary then
			local card = self:buildCard(summary, petId, location)

			if self:matches(card, filter, forms, hasForms) then
				rows[#rows + 1] = card
			end
		end
	end

	local keys = SORT_KEYS[query.sortId] or {}
	local descending = query.isDescending ~= false

	table.sort(rows, function(left, right)
		if left._queryMatchRank ~= right._queryMatchRank then
			return left._queryMatchRank > right._queryMatchRank
		end

		for _, key in ipairs(keys) do
			if left[key] ~= right[key] then
				if descending then
					return left[key] > right[key]
				end

				return left[key] < right[key]
			end
		end

		local leftBox = boxOrders[left.boxId] or math.huge
		local rightBox = boxOrders[right.boxId] or math.huge

		if leftBox ~= rightBox then
			return leftBox < rightBox
		end

		if left.boxId ~= right.boxId then
			return tostring(left.boxId) < tostring(right.boxId)
		end

		if left.slot ~= right.slot then
			return (left.slot or 0) < (right.slot or 0)
		end

		return tostring(left.id) < tostring(right.id)
	end)

	return rows
end

return PetWarehouseQuery
