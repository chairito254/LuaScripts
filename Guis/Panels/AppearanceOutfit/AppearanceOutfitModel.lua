-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceOutfit\\AppearanceOutfitModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local Utils = require("Common.Utils.Utils")
local UISceneConst = require("GameApp.UIScene.UISceneConst")
local AppearanceCustomData = require("Data.appearance_custom_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local AppearanceOutfitPresetService = require("Guis.Panels.AppearanceOutfit.AppearanceOutfitPresetService")
local AppearanceOutfitModel = Class.LightClass("AppearanceOutfitModel", UIModel)

AppearanceOutfitModel.OUTFIT_TAB = {
	LOCKED = "Locked",
	PREVIEW = "Preview",
	NORMAL = "Normal",
	EMPTY = "Empty",
	NOW = "Now"
}
AppearanceOutfitModel.CONTENT_TAB = {
	EMPTY = "Empty",
	HAVE = "Have",
	LOCKED = "Locked",
	EMPTY_NO_WORD = "EmptyNoWord"
}
AppearanceOutfitModel.OP_TYPE = {
	USE_FROM_OUTFIT = 0,
	SAVE_TO_EMPTY = 2,
	SAVE_TO_OUTFIT = 1
}

function AppearanceOutfitModel:getOutfitList(entity)
	local res = {}

	table.insert(res, {
		state = self.OUTFIT_TAB.NOW,
		name = pg.getGameString("APPEARANCE_CURRENT_SUIT")
	})

	for id, data in ipairs(AppearanceCustomData) do
		local custom = entity.appearanceCustom[id]
		local state = self.OUTFIT_TAB.EMPTY

		if custom then
			for _, configId in pairs(custom.customShow) do
				if configId ~= 0 then
					state = self.OUTFIT_TAB.NORMAL

					break
				end
			end
		else
			state = self.OUTFIT_TAB.LOCKED
		end

		local outfitName = custom and custom.customName or ""

		table.insert(res, {
			state = state,
			name = outfitName == "" and ClientTextUtils.concatByLanguage(pg.getGameString("APPEARANCE_OUTFIT"), id) or outfitName,
			slotId = id,
			costNum = data.costNum,
			costType = data.costType,
			photoId = Utils.getAppearanceCustomPhotoId(pg.me.uid, "appearanceCustom", id)
		})

		if state == self.OUTFIT_TAB.LOCKED then
			break
		end
	end

	return res
end

function AppearanceOutfitModel:getContentList(outfitId)
	local avatarScene = pg.game.uiScene:getScene(UISceneConst.AVATAR_SCENE)
	local entity = avatarScene:getCurEntity()

	return AppearanceOutfitPresetService.getContentList(entity, outfitId)
end

return AppearanceOutfitModel
