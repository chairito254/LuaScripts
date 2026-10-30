-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\ShopAvatarStainExport.lua

local json = require("json")
local AppearanceData = require("Data.appearance_data")
local AvatarPresetData = require("Data.avatar_preset_data")
local AppearancePointEnum = require("Data.appearance_point_enum")
local ShopAvatarStainExport = {}

local function isPlanName(name)
	if type(name) ~= "string" or #name == 0 or name:find("^%s") or name:find("[%c/\\:*?\"<>|]") or name:find("[%.%s]$") or name:lower():sub(-5) == ".json" then
		return false
	end

	local stem = (name:match("^([^%.]+)") or ""):upper()

	return stem ~= "CON" and stem ~= "PRN" and stem ~= "AUX" and stem ~= "NUL" and not stem:match("^COM[1-9]$") and not stem:match("^LPT[1-9]$")
end

local function copyWithStringKeys(value)
	if type(value) ~= "table" then
		return value
	end

	local result = {}

	for key, child in pairs(value) do
		result[tostring(key)] = copyWithStringKeys(child)
	end

	return result
end

function ShopAvatarStainExport.buildPartData(model)
	local scene = model and model.avatarScene
	local entity = scene and scene:getCurEntity()
	local modelView = entity and entity.eModel and entity.eModel.modelModelView
	local modelInfo = modelView and modelView.modelInfo

	if not modelInfo or scene.waitLoadEntity then
		return nil, "请等待染色界面的服装模型加载完成"
	end

	local clothId, slotId = model.clothId, model.slotId
	local config = AppearanceData[clothId]
	local primarySlot = config and (config.partId or (config.points or {})[1])

	if not config or not slotId or slotId ~= primarySlot or slotId < AppearancePointEnum.Coat or slotId > AppearancePointEnum.Shoes then
		return nil, "当前染色对象不是有效的服装部件"
	end

	if config.dyeingStatus ~= 1 then
		return nil, "当前服装未开放染色"
	end

	if scene:getCurClothesId(scene:getCurEntityId(), slotId) ~= clothId then
		return nil, "当前模型服装与染色界面不一致，请重新打开染色界面"
	end

	local preset = AvatarPresetData[modelInfo:GetPresetKey()]
	local bodyType = preset and preset.body
	local matchesBody = false

	for _, body in ipairs(config.body or {}) do
		if body == bodyType then
			matchesBody = true

			break
		end
	end

	if not bodyType or not matchesBody then
		return nil, "无法确认当前服装的适用体型"
	end

	local unit = model.curUnit

	if type(unit) ~= "table" or type(unit.stainMatMap) ~= "table" or type(unit.decalMatMap) ~= "table" then
		return nil, "当前染色编辑数据尚未初始化"
	end

	return {
		schemaVersion = 1,
		bodyType = bodyType,
		clothId = clothId,
		slotId = slotId,
		stainUnit = {
			stainMatMap = copyWithStringKeys(unit.stainMatMap),
			decalMatMap = copyWithStringKeys(unit.decalMatMap)
		}
	}
end

function ShopAvatarStainExport.getExportDirectory(bodyType, name)
	if not isPlanName(name) then
		return nil, "请输入有效的搭配名称"
	end

	local application = CS.UnityEngine.Application
	local root = application.persistentDataPath

	if UNITY_EDITOR then
		root = application.dataPath .. "/Res_Temp"
	end

	return string.format("%s/AvatarStainExports/%d/%s", root, bodyType, name)
end

function ShopAvatarStainExport.exportCurrentPart(name)
	if not isPlanName(name) then
		return false, "请填写有效的搭配名称（不能包含路径、首尾空格或 .json 后缀）"
	end

	local ctrl = pg.global.ui and pg.global.ui.workShopCostumeStain

	if not ctrl or not ctrl.view or not ctrl:checkUIOpen() then
		return false, "请先打开服装染色界面，再导出当前部件"
	end

	local data, errorMessage = ShopAvatarStainExport.buildPartData(ctrl.model)

	if not data then
		return false, errorMessage
	end

	data.name = name

	local ok, encoded = pcall(json.encode, data)

	if not ok then
		return false, "染色数据无法导出：" .. tostring(encoded)
	end

	local filePath = string.format("%s/%d_%d.json", ShopAvatarStainExport.getExportDirectory(data.bodyType, name), data.clothId, data.slotId)
	local writeOk, written = pcall(CS.FunPlus.WorldX.Utils.FileUtil.WriteFile, filePath, encoded)

	if not writeOk or not written then
		return false, "染色数据写入失败，请检查目录权限：" .. filePath
	end

	return true, filePath
end

return ShopAvatarStainExport
