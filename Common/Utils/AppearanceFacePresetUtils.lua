-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\AppearanceFacePresetUtils.lua

local json = require("json")
local AppearanceFacePresetUtils = {}

AppearanceFacePresetUtils.SCHEMA_VERSION = 2
AppearanceFacePresetUtils.MAX_COMPRESSED_BYTES = 262144
AppearanceFacePresetUtils.MAX_JSON_BYTES = 1048576

local LEGACY_DEFAULT_PRESETS = {
	[3] = {
		body = 11,
		presetKey = 110001
	},
	[4] = {
		body = 21,
		presetKey = 210001
	}
}

function AppearanceFacePresetUtils.getLegacyDefaultPreset(templateId)
	local preset = LEGACY_DEFAULT_PRESETS[templateId]

	if preset then
		return preset.presetKey, preset.body
	end
end

local MAKEUP_FIELDS = {
	fixedDecals = {
		"color",
		"metallic",
		"roughness"
	},
	decals = {
		"position",
		"scale",
		"euler",
		"color",
		"emissiveColor",
		"metallic",
		"roughness"
	},
	textures = {
		"color"
	},
	skins = {
		"color",
		"metallic",
		"roughness",
		"emissiveIntensity"
	},
	eyes = {
		"iris",
		"sclera",
		"irisSize",
		"pupilZoom",
		"irisFocus",
		"irisRotSpeed"
	},
	dynamicEyes = {
		"emissive",
		"seqSpeed",
		"seqRotSpeed",
		"emissiveIntensity"
	}
}
local VECTOR_FIELDS = {
	position = true,
	euler = true,
	scale = true
}
local LEGACY_FIELDS = {
	irisRotSpeed = "sliderIrisRotSpeed",
	seqSpeed = "sliderSeqSpeed",
	euler = "sliderEuler",
	scale = "sliderScale",
	position = "sliderPosition",
	seqRotSpeed = "sliderSeqRotSpeed",
	roughness = "sliderRoughness",
	metallic = "sliderMetallic",
	irisFocus = "sliderIrisFocus",
	pupilZoom = "sliderPupilZoom",
	irisSize = "sliderIrisSize"
}
local COLOR_FIELDS = {
	color = true,
	emissiveColor = true,
	sclera = true,
	iris = true,
	emissive = true
}
local FACE_MODEL_PARTS = {
	true,
	true,
	nil,
	nil,
	true,
	[100] = true
}

local function isNumber(value)
	return type(value) == "number" and value == value and value > -math.huge and value < math.huge
end

local function isInteger(value, min)
	return isNumber(value) and value == math.floor(value) and min <= value and value <= 2147483647
end

local function isArray(value, limit)
	if type(value) ~= "table" or limit < #value then
		return false
	end

	for key in pairs(value) do
		if not isInteger(key, 1) or key > #value then
			return false
		end
	end

	return true
end

function AppearanceFacePresetUtils.decodeConfig(value)
	if type(value) ~= "string" or #value == 0 or #value > AppearanceFacePresetUtils.MAX_COMPRESSED_BYTES then
		return nil, "invalid compressed size"
	end

	local ok, raw = pcall(decompressFromStr, value)

	if not ok or type(raw) ~= "string" or #raw == 0 or #raw > AppearanceFacePresetUtils.MAX_JSON_BYTES then
		return nil, "invalid decompressed data"
	end

	local decodeOk, config = pcall(json.decode, raw)

	if not decodeOk or type(config) ~= "table" then
		return nil, "invalid json"
	end

	return config
end

local function encodeConfig(config)
	local ok, raw = pcall(json.encode, config)

	if not ok or type(raw) ~= "string" or #raw > AppearanceFacePresetUtils.MAX_JSON_BYTES then
		return nil, "invalid json size"
	end

	local compressOk, compressed = pcall(compressToStr, raw)

	if not compressOk or type(compressed) ~= "string" or #compressed == 0 or #compressed > AppearanceFacePresetUtils.MAX_COMPRESSED_BYTES then
		return nil, "invalid compressed data"
	end

	return compressed
end

local function copyChannels(value, channels)
	if type(value) ~= "table" then
		return nil
	end

	local result = {}

	for _, channel in ipairs(channels) do
		if not isNumber(value[channel]) then
			return nil
		end

		result[channel] = value[channel]
	end

	return result
end

local function copyMakeup(config)
	if type(config.makeupCustomData) ~= "table" then
		return nil, "invalid makeup data"
	end

	local result = {
		makeupCustomData = {},
		makeupSuitId = config.makeupSuitId
	}

	if result.makeupSuitId == nil then
		result.makeupSuitId = -1
	end

	if not isInteger(result.makeupSuitId, -1) then
		return nil, "invalid makeup suit"
	end

	for _, field in ipairs({
		"templateId",
		"presetKey",
		"makeupPartAssetId"
	}) do
		if config[field] ~= nil then
			if not isInteger(config[field], -1) then
				return nil, "invalid " .. field
			end

			result[field] = config[field]
		end
	end

	for bucket, fields in pairs(MAKEUP_FIELDS) do
		local source = config.makeupCustomData[bucket]

		if source == nil then
			source = {}
		end

		if not isArray(source, 512) then
			return nil, "invalid makeup bucket"
		end

		local target = {}

		for _, reaction in ipairs(source) do
			if type(reaction) ~= "table" or not isInteger(reaction.id, 0) then
				return nil, "invalid makeup reaction"
			end

			local entry = {
				id = reaction.id
			}

			for _, field in ipairs(fields) do
				local value = reaction[field]

				if value == nil and LEGACY_FIELDS[field] then
					value = reaction[LEGACY_FIELDS[field]]
				end

				if value ~= nil then
					if COLOR_FIELDS[field] then
						value = copyChannels(value, {
							"r",
							"g",
							"b",
							"a"
						})
					elseif VECTOR_FIELDS[field] then
						value = copyChannels(value, {
							"x",
							"y",
							"z"
						})
					elseif not isNumber(value) then
						value = nil
					end

					if value == nil then
						return nil, "invalid makeup parameter"
					end

					entry[field] = value
				end
			end

			target[#target + 1] = entry
		end

		result.makeupCustomData[bucket] = target
	end

	return result
end

function AppearanceFacePresetUtils.buildMakeupSnapshot(avatarConfig)
	local config, err = AppearanceFacePresetUtils.decodeConfig(avatarConfig)

	if not config then
		return nil, err
	end

	local makeup, makeupErr = copyMakeup(config)

	if not makeup then
		return nil, makeupErr
	end

	return encodeConfig(makeup)
end

function AppearanceFacePresetUtils.buildFaceConfig(avatarConfig)
	local config, err = AppearanceFacePresetUtils.decodeConfig(avatarConfig)

	if not config then
		return nil, err
	end

	local result, makeupErr = copyMakeup(config)

	if not result then
		return nil, makeupErr
	end

	if not isInteger(config.templateId, 1) or not isInteger(config.presetKey, 1) or type(config.bodyCustomData) ~= "table" or type(config.faceCustomData) ~= "table" then
		return nil, "invalid face identity or bone data"
	end

	if config.basePresetKey ~= nil then
		if not isInteger(config.basePresetKey, -1) then
			return nil, "invalid base preset key"
		end

		result.basePresetKey = config.basePresetKey
	end

	result.bodySize = config.bodySize

	if result.bodySize == nil then
		result.bodySize = 1
	end

	if not isNumber(result.bodySize) or result.bodySize <= 0 then
		return nil, "invalid body size"
	end

	for _, field in ipairs({
		"facePartAssetId",
		"bodyPartAssetId"
	}) do
		if config[field] ~= nil then
			if not isInteger(config[field], -1) then
				return nil, "invalid " .. field
			end

			result[field] = config[field]
		end
	end

	local bodyList = config.bodyCustomData._modifiedList
	local faceArray = config.faceCustomData._modifiedArray

	if bodyList == nil then
		bodyList = {}
	end

	if faceArray == nil then
		faceArray = {}
	end

	if not isArray(bodyList, 512) or not isArray(faceArray, 1024) then
		return nil, "invalid bone arrays"
	end

	result.bodyCustomData = {
		_modifiedList = {}
	}

	for _, reaction in ipairs(bodyList) do
		if type(reaction) ~= "table" or not isInteger(reaction.id, 0) or not isNumber(reaction.value) then
			return nil, "invalid body reaction"
		end

		table.insert(result.bodyCustomData._modifiedList, {
			id = reaction.id,
			value = reaction.value
		})
	end

	result.faceCustomData = {
		_modifiedArray = {}
	}

	for _, value in ipairs(faceArray) do
		if not isNumber(value) then
			return nil, "invalid face reaction"
		end

		table.insert(result.faceCustomData._modifiedArray, value)
	end

	local modelResParts = config.modelResParts

	if modelResParts == nil then
		modelResParts = {}
	end

	if not isArray(modelResParts, 64) then
		return nil, "invalid model parts"
	end

	result.modelResParts = {}

	for _, part in ipairs(modelResParts) do
		if type(part) ~= "table" then
			return nil, "invalid model part"
		end

		if FACE_MODEL_PARTS[part.partId] then
			if type(part.resId) ~= "string" or #part.resId > 512 then
				return nil, "invalid model resource"
			end

			table.insert(result.modelResParts, {
				partId = part.partId,
				resId = part.resId
			})
		end
	end

	return encodeConfig(result)
end

function AppearanceFacePresetUtils.mergeMakeupConfig(avatarConfig, makeupSnapshot)
	local config, err = AppearanceFacePresetUtils.decodeConfig(avatarConfig)

	if not config then
		return nil, err
	end

	local source, snapshotErr = AppearanceFacePresetUtils.decodeConfig(makeupSnapshot)

	if not source then
		return nil, snapshotErr
	end

	local makeup, makeupErr = copyMakeup(source)

	if not makeup then
		return nil, makeupErr
	end

	config.makeupCustomData = makeup.makeupCustomData
	config.makeupSuitId = makeup.makeupSuitId

	if makeup.makeupPartAssetId and makeup.makeupPartAssetId > 0 then
		config.makeupPartAssetId = makeup.makeupPartAssetId
	end

	return encodeConfig(config)
end

function AppearanceFacePresetUtils.hasMakeupPreset(preset)
	if not preset then
		return false
	end

	if type(preset.makeupSnapshot) == "string" and #preset.makeupSnapshot > 0 then
		return true
	end

	for _, configId in pairs(preset.customShow or {}) do
		if type(configId) == "number" and configId > 0 then
			return true
		end
	end

	for _, info in pairs(preset.makeUpInfo or {}) do
		if type(info) == "string" and #info > 0 then
			return true
		end
	end

	return false
end

local BONE_COMPARE_EPSILON = 0.0001

local function sameNumber(left, right)
	return math.abs(left - right) <= BONE_COMPARE_EPSILON
end

local function readBoneConfig(avatarConfig)
	local config = AppearanceFacePresetUtils.decodeConfig(avatarConfig)

	if not config or not isInteger(config.templateId, 1) or not isInteger(config.presetKey, 1) or type(config.bodyCustomData) ~= "table" or type(config.faceCustomData) ~= "table" then
		return nil
	end

	if config.basePresetKey ~= nil and not isInteger(config.basePresetKey, -1) then
		return nil
	end

	local bodyList = config.bodyCustomData._modifiedList
	local faceArray = config.faceCustomData._modifiedArray

	if bodyList == nil then
		bodyList = {}
	end

	if faceArray == nil then
		faceArray = {}
	end

	if not isArray(bodyList, 512) or not isArray(faceArray, 1024) then
		return nil
	end

	local bodySize = config.bodySize

	if bodySize == nil then
		bodySize = 1
	end

	if not isNumber(bodySize) then
		return nil
	end

	if bodySize <= 0 then
		bodySize = 1
	end

	local result = {
		templateId = config.templateId,
		presetKey = config.presetKey,
		bodySize = bodySize,
		basePresetKey = isInteger(config.basePresetKey, 1) and config.basePresetKey or nil,
		bodyPartAssetId = config.bodyPartAssetId,
		facePartAssetId = config.facePartAssetId,
		body = {},
		face = {}
	}
	local seen = {}

	for _, reaction in ipairs(bodyList) do
		if type(reaction) ~= "table" or not isInteger(reaction.id, 0) or not isNumber(reaction.value) or seen[reaction.id] then
			return nil
		end

		seen[reaction.id] = true

		if not sameNumber(reaction.value, 1) then
			result.body[reaction.id] = reaction.value
		end
	end

	for index, value in ipairs(faceArray) do
		if not isNumber(value) then
			return nil
		end

		if value ~= -1 and not sameNumber(value, 0) then
			result.face[index] = value
		end
	end

	return result
end

local function sameBoneMap(left, right)
	for id, value in pairs(left) do
		if right[id] == nil or not sameNumber(value, right[id]) then
			return false
		end
	end

	for id in pairs(right) do
		if left[id] == nil then
			return false
		end
	end

	return true
end

local function sameBones(left, right, legacyBasePresetKey)
	if not right or left.templateId ~= right.templateId then
		return false
	end

	local leftPresetKey, rightPresetKey = left.presetKey, right.presetKey

	if left.basePresetKey or right.basePresetKey then
		local fallback = isInteger(legacyBasePresetKey, 1) and legacyBasePresetKey or nil

		leftPresetKey = left.basePresetKey or fallback or leftPresetKey
		rightPresetKey = right.basePresetKey or fallback or rightPresetKey
	end

	if leftPresetKey ~= rightPresetKey or not sameNumber(left.bodySize, right.bodySize) then
		return false
	end

	for _, field in ipairs({
		"bodyPartAssetId",
		"facePartAssetId"
	}) do
		local current, original = left[field], right[field]

		if isInteger(current, 1) and isInteger(original, 1) and current ~= original then
			return false
		end
	end

	return sameBoneMap(left.body, right.body) and sameBoneMap(left.face, right.face)
end

function AppearanceFacePresetUtils.isSameBoneConfig(leftConfig, rightConfig)
	local left = readBoneConfig(leftConfig)

	return left ~= nil and sameBones(left, readBoneConfig(rightConfig))
end

local function sameSnapshotValue(left, right)
	if type(left) ~= type(right) then
		return false
	end

	if type(left) == "number" then
		return sameNumber(left, right)
	end

	if type(left) ~= "table" then
		return left == right
	end

	for key, value in pairs(left) do
		if not sameSnapshotValue(value, right[key]) then
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

function AppearanceFacePresetUtils.isSameMakeupConfig(leftConfig, rightConfig)
	local left = AppearanceFacePresetUtils.decodeConfig(leftConfig)
	local right = AppearanceFacePresetUtils.decodeConfig(rightConfig)

	if not left or not right then
		return false
	end

	left, right = copyMakeup(left), copyMakeup(right)

	if not left or not right then
		return false
	end

	for bucket in pairs(MAKEUP_FIELDS) do
		table.sort(left.makeupCustomData[bucket], function(a, b)
			return a.id < b.id
		end)
		table.sort(right.makeupCustomData[bucket], function(a, b)
			return a.id < b.id
		end)
	end

	return left.makeupPartAssetId == right.makeupPartAssetId and left.makeupSuitId == right.makeupSuitId and sameSnapshotValue(left.makeupCustomData, right.makeupCustomData)
end

function AppearanceFacePresetUtils.getChangedParts(initialAvatarConfig, avatarConfig)
	local initialBones, currentBones = readBoneConfig(initialAvatarConfig), readBoneConfig(avatarConfig)

	if not initialBones or not currentBones then
		return nil, "invalid_bone_baseline"
	end

	local initialConfig = AppearanceFacePresetUtils.decodeConfig(initialAvatarConfig)
	local currentConfig = AppearanceFacePresetUtils.decodeConfig(avatarConfig)
	local initialMakeup, currentMakeup = copyMakeup(initialConfig), copyMakeup(currentConfig)

	if not initialMakeup or not currentMakeup then
		return nil, "invalid_makeup_baseline"
	end

	for bucket in pairs(MAKEUP_FIELDS) do
		table.sort(initialMakeup.makeupCustomData[bucket], function(a, b)
			return a.id < b.id
		end)
		table.sort(currentMakeup.makeupCustomData[bucket], function(a, b)
			return a.id < b.id
		end)
	end

	local sameMakeup = initialMakeup.makeupPartAssetId == currentMakeup.makeupPartAssetId and initialMakeup.makeupSuitId == currentMakeup.makeupSuitId and sameSnapshotValue(initialMakeup.makeupCustomData, currentMakeup.makeupCustomData)

	return {
		bones = not sameBones(currentBones, initialBones),
		makeup = not sameMakeup
	}
end

function AppearanceFacePresetUtils.needsBonePayment(player, avatarConfig, targetIndex)
	local current = readBoneConfig(avatarConfig)

	if not current then
		return nil, "invalid bone data"
	end

	local legacyBasePresetKey = player and player.avatarPresetKey

	if player and not isInteger(legacyBasePresetKey, 1) then
		legacyBasePresetKey = AppearanceFacePresetUtils.getLegacyDefaultPreset(player.templateId)
	end

	if player and sameBones(current, readBoneConfig(player.avatarConfig), legacyBasePresetKey) then
		return false
	end

	local target = player and player.avatarConfigCustom and player.avatarConfigCustom[targetIndex]

	if target and sameBones(current, readBoneConfig(target.avatarConfig), legacyBasePresetKey) then
		return false
	end

	return true
end

function AppearanceFacePresetUtils.mergeFaceConfig(avatarConfig, faceSnapshot)
	local config, err = AppearanceFacePresetUtils.decodeConfig(avatarConfig)

	if not config then
		return nil, err
	end

	local snapshot = AppearanceFacePresetUtils.buildFaceConfig(faceSnapshot)
	local face = snapshot and AppearanceFacePresetUtils.decodeConfig(snapshot)

	if not face then
		return nil, "invalid face snapshot"
	end

	for _, field in ipairs({
		"templateId",
		"presetKey",
		"bodyCustomData",
		"faceCustomData",
		"bodySize",
		"makeupCustomData",
		"makeupSuitId",
		"basePresetKey"
	}) do
		config[field] = face[field]
	end

	for _, field in ipairs({
		"facePartAssetId",
		"bodyPartAssetId",
		"makeupPartAssetId"
	}) do
		config[field] = face[field] or -1
	end

	local parts = {}

	for _, part in ipairs(config.modelResParts or {}) do
		if not FACE_MODEL_PARTS[part.partId] then
			parts[#parts + 1] = part
		end
	end

	for _, part in ipairs(face.modelResParts) do
		parts[#parts + 1] = part
	end

	config.modelResParts = parts

	return encodeConfig(config)
end

return AppearanceFacePresetUtils
