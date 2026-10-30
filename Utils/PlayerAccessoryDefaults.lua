-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PlayerAccessoryDefaults.lua

local json = require("json")
local AvatarPresetData = require("Data.avatar_preset_data")
local Bridge = CS.FunPlus.WorldX.Avatar.PlayerAccessoryDefaults
local PlayerAccessoryDefaults = {}
local initialized = false

local function initialize()
	if initialized then
		return
	end

	local presets = {}

	for presetKey, preset in pairs(AvatarPresetData) do
		if type(presetKey) == "number" and type(preset) == "table" and preset.body then
			presets[#presets + 1] = {
				presetKey = presetKey,
				bodyType = preset.body
			}
		end
	end

	Bridge.Initialize(json.encode({
		presets = presets
	}))

	initialized = true
end

function PlayerAccessoryDefaults.bind(modelInfo, reactionKey, accessoryId)
	if not modelInfo or not reactionKey or not accessoryId or accessoryId <= 0 then
		return
	end

	initialize()
	Bridge.Bind(modelInfo, reactionKey, accessoryId)
end

function PlayerAccessoryDefaults.export(modelInfo, reactionKey, accessoryId)
	if not modelInfo or not reactionKey or not accessoryId or accessoryId <= 0 then
		return "请先选中正在调节的饰品"
	end

	PlayerAccessoryDefaults.bind(modelInfo, reactionKey, accessoryId)

	return Bridge.Export(modelInfo, reactionKey, accessoryId)
end

return PlayerAccessoryDefaults
