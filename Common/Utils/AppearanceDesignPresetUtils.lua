-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\AppearanceDesignPresetUtils.lua

local json = require("json")
local AppearancePointEnum = require("Data.appearance_point_enum")
local AppearanceDesignPresetUtils = {}
local COMPARE_EPSILON = 0.0001

local function sameData(left, right)
	if type(left) ~= type(right) then
		return false
	end

	if type(left) == "number" then
		return left == right or math.abs(left - right) <= COMPARE_EPSILON
	end

	if type(left) ~= "table" then
		return left == right
	end

	for key, value in pairs(left) do
		if not sameData(value, right[key]) then
			return false
		end
	end

	for key in pairs(right) do
		if left[key] == nil then
			return false
		end
	end

	return true
end

local function decodeMap(value, needDecompress, decoder)
	if value == nil or value == "" then
		return {}
	end

	if not needDecompress then
		return type(value) == "table" and value or nil
	end

	if type(value) ~= "string" then
		return nil
	end

	local ok, data = pcall(function()
		return decoder(decompressFromStr(value))
	end)

	if ok and type(data) == "table" then
		return data
	end

	return nil
end

local function withoutEmptyMaterials(map, collectionName)
	local result = {}

	for name, material in pairs(map) do
		if type(material) == "table" then
			local normalized = {}

			for key, value in pairs(material) do
				if key == collectionName and type(value) == "table" then
					local entries = {}

					for index, entry in pairs(value) do
						if type(entry) ~= "table" or next(entry) ~= nil then
							entries[index] = entry
						end
					end

					if next(entries) ~= nil then
						normalized[key] = entries
					end
				else
					normalized[key] = value
				end
			end

			for key in pairs(normalized) do
				if key ~= "layerCount" then
					result[name] = normalized

					break
				end
			end
		else
			result[name] = material
		end
	end

	return result
end

local function clothesData(unit, needDecompress)
	if not unit then
		return nil
	end

	local stain = decodeMap(unit.stainMatMap, needDecompress, string.toTable)
	local decal = decodeMap(unit.decalMatMap, needDecompress, string.toTable)

	if not stain or not decal then
		return nil
	end

	return {
		stainMatMap = withoutEmptyMaterials(stain, "matAreas"),
		decalMatMap = withoutEmptyMaterials(decal, "matDecals")
	}
end

function AppearanceDesignPresetUtils.findClothesPreset(unit, designList, needDecompress)
	if not designList then
		return nil
	end

	local current = clothesData(unit, needDecompress)

	if not current then
		return nil
	end

	for index, preset in pairs(designList) do
		if type(index) == "number" and index > 0 and type(preset) == "table" and preset.isChange then
			local saved = clothesData(preset, true)

			if saved and sameData(current, saved) then
				return index
			end
		end
	end
end

local function indexRecords(records, keyName)
	if type(records) ~= "table" then
		return nil
	end

	local indexed = {}

	for _, record in pairs(records) do
		if type(record) ~= "table" then
			return nil
		end

		local key = record[keyName]

		if type(key) ~= "number" and type(key) ~= "string" or indexed[key] then
			return nil
		end

		indexed[key] = record
	end

	return indexed
end

local function hairPartData(packed)
	local data = decodeMap(packed, true, function(value)
		if value == "" then
			return {}
		end

		return json.decode(value)
	end)

	if not data then
		return nil
	end

	if data._modifiedList ~= nil then
		local reactions = indexRecords(data._modifiedList, "id")

		if not reactions then
			return nil
		end

		for _, reaction in pairs(reactions) do
			if reaction.reactionBoneData ~= nil then
				local bones = indexRecords(reaction.reactionBoneData, "bone")

				if not bones then
					return nil
				end

				reaction.reactionBoneData = bones
			end
		end

		data._modifiedList = reactions
	end

	return data
end

local function hairData(customInfo, preset)
	local result = {}

	for point = AppearancePointEnum.Fringe, AppearancePointEnum.Plait do
		local part = customInfo and customInfo[point]
		local configId = preset and preset.customShow[point] or part and part.configId or 0
		local data

		if configId > 0 then
			data = hairPartData(preset and preset.hairInfo[point] or part and part.hairInfo)

			if not data then
				return nil
			end
		end

		result[point] = {
			configId = configId,
			hairInfo = data
		}
	end

	return result
end

local function matchesDefaultHair(current, original)
	for point = AppearancePointEnum.Fringe, AppearancePointEnum.Plait do
		local part, defaultPart = current[point], original[point]

		if part.configId ~= defaultPart.configId then
			return false
		end

		if part.configId > 0 then
			local data, defaults = part.hairInfo, defaultPart.hairInfo

			if not defaults or not defaults.assetId or defaults.assetId <= 0 or defaults.partId ~= point or type(defaults._modifiedList) ~= "table" or next(defaults._modifiedList) == nil then
				return false
			end

			if next(data) ~= nil then
				if data.assetId ~= defaults.assetId or data.partId ~= defaults.partId then
					return false
				end

				for key, value in pairs(data) do
					if key == "_modifiedList" then
						for id, reaction in pairs(value) do
							if not sameData(reaction, defaults._modifiedList[id]) then
								return false
							end
						end
					elseif not sameData(value, defaults[key]) then
						return false
					end
				end
			end
		end
	end

	return true
end

function AppearanceDesignPresetUtils.findHairPreset(hairCustomInfo, hairCustom, defaultPreset)
	if type(hairCustomInfo) ~= "table" then
		return nil
	end

	for point = AppearancePointEnum.Fringe, AppearancePointEnum.Plait do
		if type(hairCustomInfo[point]) ~= "table" then
			return nil
		end
	end

	local current = hairData(hairCustomInfo)

	if not current then
		return nil
	end

	for index, preset in pairs(hairCustom or {}) do
		if type(index) == "number" and index > 0 and type(preset) == "table" and preset.customShow and preset.hairInfo then
			local hasSavedData = false

			for _ in pairs(preset.hairInfo) do
				hasSavedData = true

				break
			end

			if hasSavedData then
				local saved = hairData(nil, preset)

				if saved and sameData(current, saved) then
					return index
				end
			end
		end
	end

	if defaultPreset then
		local original = hairData(nil, defaultPreset)

		if original and matchesDefaultHair(current, original) then
			return 0
		end
	end
end

return AppearanceDesignPresetUtils
