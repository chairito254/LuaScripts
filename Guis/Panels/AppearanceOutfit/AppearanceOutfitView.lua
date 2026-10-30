-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceOutfit\\AppearanceOutfitView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")
local AppearanceOutfitView = Class.LightClass("AppearanceOutfitView", UIView)

function AppearanceOutfitView:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.rootUComponent = self.objectReference:GetRefValue("rootUComponent")
	self.backUButton = self.objectReference:GetRefValue("backUButton")
	self.outfitUList = self.objectReference:GetRefValue("outfitUList")
	self.nameUInputField = self.objectReference:GetRefValue("nameUInputField")
	self.editUButton = self.objectReference:GetRefValue("editUButton")
	self.contentUList = self.objectReference:GetRefValue("contentUList")
	self.saveSuitUButton = self.objectReference:GetRefValue("saveSuitUButton")
	self.useSuitUWidget = self.objectReference:GetRefValue("useSuitUWidget")
	self.previousUList = self.objectReference:GetRefValue("previousUList")
	self.nextUList = self.objectReference:GetRefValue("nextUList")
	self.cancelUButton = self.objectReference:GetRefValue("cancelUButton")
	self.saveUButton = self.objectReference:GetRefValue("saveUButton")
	self.arrowUImage = self.objectReference:GetRefValue("arrowUImage")
	self.previousUText = self.objectReference:GetRefValue("previousUText")
	self.nextUText = self.objectReference:GetRefValue("nextUText")
	self.maskRayBoxTrans = self.objectReference:GetRefValue("maskRayBoxTrans")
	self.infoText = self.objectReference:GetRefValue("infoText")
	self.btnSetUButton = self.objectReference:GetRefValue("btnSetUButton")
	self.btnCenterUButton = self.objectReference:GetRefValue("btnCenterUButton")
	self.presetSaveUComponent = self.objectReference:GetRefValue("presetSaveUComponent")
end

function AppearanceOutfitView:registerObjects()
	return
end

function AppearanceOutfitView:initView()
	local objectReference = self.btnCenterUButton:GetComponent("ObjectReference")
	local txtNameUText = objectReference:GetRefValue("txtNameUText")

	ClientTextUtils.setText(txtNameUText, pg.getGameString("APPEARANCE_OUTFIT_IMPORT"))

	objectReference = self.btnSetUButton:GetComponent("ObjectReference")

	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")

	ClientTextUtils.setText(txtNameUSDFText, pg.getGameString("APPEARANCE_OUTFIT_SETTING_TITLE"))
end

function AppearanceOutfitView:renderContentList(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local rootUComponent = objectReference:GetRefValue("rootUComponent")
	local slotUImage = objectReference:GetRefValue("slotUImage")
	local emptySlotUImage = objectReference:GetRefValue("emptySlotUImage")

	rootUComponent:TryChangePage("state", data.state)
	rootUComponent:TryChangePage("Quality", data.quality)

	iconUImage.url = data.icon

	if slotUImage then
		slotUImage:SetActiveFastest(false)
	end

	if emptySlotUImage then
		emptySlotUImage:SetActiveFastest(false)
	end

	if data.id then
		function button.luaClick()
			pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
				id = data.id,
				targetRect = button
			})
		end
	else
		button.luaClick = nil
	end
end

return AppearanceOutfitView
