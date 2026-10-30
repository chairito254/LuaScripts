-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CashShop\\CashShopStainPreviewService.lua

local json = require("json")
local AppearanceData = require("Data.appearance_data")
local AppearancePointEnum = require("Data.appearance_point_enum")
local CashShopStainPreviewService = {}

local function isPlanName(name)
	if type(name) ~= "string" or #name == 0 or name:find("^%s") or name:find("[%c/\\:*?\"<>|]") or name:find("[%.%s]$") or name:lower():sub(-5) == ".json" then
		return false
	end

	local stem = (name:match("^([^%.]+)") or ""):upper()

	return stem ~= "CON" and stem ~= "PRN" and stem ~= "AUX" and stem ~= "NUL" and not stem:match("^COM[1-9]$") and not stem:match("^LPT[1-9]$")
end

local function isInteger(value)
	return type(value) == "number" and value > 0 and value < math.huge and value == math.floor(value)
end

function CashShopStainPreviewService.getBodyType(entity)
	local preset = entity and pg.game.avatar:getAvatarPresetData(entity.avatarPresetKey)

	return preset and preset.body
end

function CashShopStainPreviewService.getPlans(commodityData, bodyType)
	local result = {}
	local allPlans = commodityData and commodityData.avatarStain
	local plans = type(allPlans) == "table" and (allPlans[bodyType] or allPlans[tostring(bodyType)])

	if type(plans) ~= "table" then
		return result
	end

	for key, name in pairs(plans) do
		local index = tonumber(key)

		if isInteger(index) and isPlanName(name) then
			result[#result + 1] = {
				index = index,
				name = name,
				bodyType = bodyType
			}
		end
	end

	table.sort(result, function(a, b)
		return a.index < b.index
	end)

	return result
end

local function restoreIndices(value, depth)
	if type(value) ~= "table" then
		assert(type(value) ~= "number" or value == value and math.abs(value) < math.huge, "invalid number")

		return value
	end

	assert(depth < 32, "stain data nested too deeply")

	local result = {}

	for key, child in pairs(value) do
		local index = type(key) == "string" and key:match("^%d+$") and tonumber(key)

		if index then
			assert(index <= 1024, "stain index too large")

			key = index
		end

		assert(result[key] == nil, "duplicate stain index")

		result[key] = restoreIndices(child, depth + 1)
	end

	return result
end

local function restoreMaterialMap(map, areaKey)
	assert(type(map) == "table", "missing material map")

	local result = {}

	for name, material in pairs(map) do
		assert(type(name) == "string" and type(material) == "table", "invalid material")

		result[name] = restoreIndices(material, 0)
		result[name][areaKey] = result[name][areaKey] or {}

		assert(type(result[name][areaKey]) == "table", "invalid material areas")
	end

	return result
end

local function compilePlan(data, bodyType, name)
	assert(type(data) == "table" and data.schemaVersion == 1, "invalid schema version")
	assert(data.bodyType == bodyType and data.name == name, "plan name/body mismatch")
	assert(type(data.clothes) == "table" and #data.clothes > 0, "empty clothes")

	local plan = {
		name = name,
		bodyType = bodyType,
		clothesBySlot = {}
	}
	local seenClothes, occupied = {}, {}
	local ClientModelUtils = require("Utils.ClientModelUtils")

	for index, item in pairs(data.clothes) do
		assert(isInteger(index) and index <= #data.clothes and type(item) == "table", "invalid clothes list")

		local clothId, slotId = item.clothId, item.slotId
		local cloth = isInteger(clothId) and AppearanceData[clothId]

		assert(cloth and cloth.type == 2 and cloth.points and (cloth.partId or cloth.points[1]) == slotId, "invalid clothes slot")
		assert(slotId >= AppearancePointEnum.Coat and slotId <= AppearancePointEnum.Shoes, "invalid clothes slot")

		local supportsBody = false

		for _, body in ipairs(cloth.body or {}) do
			supportsBody = supportsBody or body == bodyType
		end

		assert(supportsBody and not seenClothes[clothId], "duplicate clothes or body mismatch")

		seenClothes[clothId] = true

		for _, point in ipairs(cloth.points) do
			assert(not occupied[point], "overlapping clothes")

			occupied[point] = true
		end

		assert(type(item.stainUnit) == "table", "invalid stain unit")

		local stainMap = restoreMaterialMap(item.stainUnit.stainMatMap, "matAreas")
		local decalMap = restoreMaterialMap(item.stainUnit.decalMatMap, "matDecals")
		local raw = {
			stainMatMap = compressToStr(table.tostring(stainMap)),
			decalMatMap = compressToStr(table.tostring(decalMap))
		}
		local stainSlotId = cloth.points[1]

		plan.clothesBySlot[stainSlotId] = {
			matInfo = false,
			clothId = clothId
		}

		if next(stainMap) or next(decalMap) then
			plan.clothesBySlot[stainSlotId].matInfo = ClientModelUtils.parseStainMatInfo(raw)
		end
	end

	return plan
end

function CashShopStainPreviewService.loadPlan(bodyType, name)
	if not isInteger(bodyType) or not isPlanName(name) then
		return nil, "invalid_plan"
	end

	local ok, result = pcall(function()
		local text = CS.FunPlus.WorldX.Avatar.ShopAvatarStainExports.LoadPlanJson(bodyType, name)

		assert(type(text) == "string" and text ~= "", "plan resource missing")

		return compilePlan(json.decode(text), bodyType, name)
	end)

	if not ok then
		return nil, tostring(result)
	end

	return result
end

local function forEachShaderView(entity, callback)
	local eModel = entity.eModel
	local modelView = eModel and eModel.modelModelView

	if not modelView or not modelView.partModel then
		return
	end

	local visited = {}

	local function visit(shaderView)
		if shaderView and not visited[shaderView] then
			visited[shaderView] = true

			callback(shaderView, modelView)
		end
	end

	visit(modelView.shaderView)
	visit(eModel.modelShaderView)
	visit(eModel.shaderView)
end

function CashShopStainPreviewService.applyPart(entity, slotId)
	if not entity or not entity._cashShopStainPreview then
		return false
	end

	local plan = entity._cashShopStainPreview
	local appearanceEntity = entity._cashShopStainPreviewSource or entity
	local clothId = appearanceEntity.getAppearanceConfigId and appearanceEntity:getAppearanceConfigId(slotId, true, true)
	local cloth = AppearanceData[clothId]
	local stainSlotId = cloth and cloth.points and cloth.points[1] or slotId
	local entry = plan.clothesBySlot[stainSlotId]

	if not entry or clothId ~= entry.clothId then
		entry = nil
	end

	forEachShaderView(entity, function(shaderView, modelView)
		if modelView.partModel:IsPartModelLoaded(slotId) then
			shaderView:ApplyPreset(slotId, "Default1")

			if entry and entry.matInfo then
				shaderView:ApplyServerMatInfo(slotId, entry.matInfo)
			end
		end
	end)

	return true
end

function CashShopStainPreviewService.apply(entity)
	if not entity or not entity._cashShopStainPreview then
		return false
	end

	for slotId = AppearancePointEnum.Coat, AppearancePointEnum.Shoes do
		CashShopStainPreviewService.applyPart(entity, slotId)
	end

	return true
end

function CashShopStainPreviewService.setPlan(entity, plan)
	if not entity or not entity.eModel or type(plan) ~= "table" or type(plan.clothesBySlot) ~= "table" then
		return false, "preview_not_ready"
	end

	if CashShopStainPreviewService.getBodyType(entity) ~= plan.bodyType then
		return false, "body_mismatch"
	end

	for slotId, entry in pairs(plan.clothesBySlot) do
		if not entity.getAppearanceConfigId or entity:getAppearanceConfigId(slotId, true, true) ~= entry.clothId then
			return false, "clothes_mismatch"
		end
	end

	entity._cashShopStainPreview = plan

	CashShopStainPreviewService.apply(entity)

	return true
end

function CashShopStainPreviewService.reset(entity)
	if not entity or not entity.eModel then
		return false, "preview_not_ready"
	end

	entity._cashShopStainPreview = {
		clothesBySlot = {}
	}

	CashShopStainPreviewService.apply(entity)

	return true
end

function CashShopStainPreviewService.clear(entity)
	if not entity or not entity._cashShopStainPreview then
		return
	end

	CashShopStainPreviewService.reset(entity)

	entity._cashShopStainPreview = nil
end

return CashShopStainPreviewService
