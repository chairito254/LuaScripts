-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceOutfitSetting\\AppearanceOutfitSettingModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local AppearanceOutfitPresetService = require("Guis.Panels.AppearanceOutfit.AppearanceOutfitPresetService")
local AppearanceOutfitSettingModel = Class.LightClass("AppearanceOutfitSettingModel", UIModel)

function AppearanceOutfitSettingModel:getSettings()
	local t = {}

	t[1] = {
		name = pg.getGameString("APPLY_MAKEUP"),
		switchStatus = AppearanceOutfitPresetService.getApplyMakeupState(),
		func = function(switchStatus)
			AppearanceOutfitPresetService.setApplyMakeupState(switchStatus)
		end
	}

	return t
end

return AppearanceOutfitSettingModel
