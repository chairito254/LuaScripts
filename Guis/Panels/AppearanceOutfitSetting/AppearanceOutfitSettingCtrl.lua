-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceOutfitSetting\\AppearanceOutfitSettingCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")
local AppearanceOutfitSettingCtrl = Class.LightClass("AppearanceOutfitSettingCtrl", UICtrl)

AppearanceOutfitSettingCtrl.messages = {}

function AppearanceOutfitSettingCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function AppearanceOutfitSettingCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		self:closePanel()
	end

	function self.view.btnClosePanalUButton.luaClick()
		self:closePanel()
	end

	function self.view.listUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local txtTipsUSDFText = objectReference:GetRefValue("txtTipsUSDFText")
		local btnSwitchUButton = objectReference:GetRefValue("btnSwitchUButton")
		local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")

		ClientTextUtils.setText(txtTipsUSDFText, data.name)
		ClientTextUtils.setText(txtNameUSDFText, "")

		btnSwitchUButton.luaClick = nil
		btnSwitchUButton.luaSelectChanged = nil
		btnSwitchUButton.isSelected = data.switchStatus == true

		function btnSwitchUButton.luaSelectChanged(switchStatus)
			data.switchStatus = switchStatus

			data.func(switchStatus)

			if self.applyMakeupChanged then
				self.applyMakeupChanged(switchStatus)
			end
		end
	end
end

function AppearanceOutfitSettingCtrl:onDestroy()
	UICtrl.onDestroy(self)
end

function AppearanceOutfitSettingCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.applyMakeupChanged = info and info.applyMakeupChanged

	ClientTextUtils.setText(self.view.textUSDFText, pg.getGameString("APPEARANCE_OUTFIT_SETTING_TITLE"))
	ClientTextUtils.setText(self.view.txtDescriptionUSDFText, pg.getGameString("APPEARANCE_OUTFIT_SETTING_DESC"))

	local data = self.model:getSettings()

	self.view.listUList:SetList(data)
end

function AppearanceOutfitSettingCtrl:closePanel()
	pg.global.ui:close(UIConst.UI_ID_APPEARANCE_OUTFIT_SETTING)
end

function AppearanceOutfitSettingCtrl:onShow()
	return
end

function AppearanceOutfitSettingCtrl:onHide()
	return
end

function AppearanceOutfitSettingCtrl:onVisibleChange(visible)
	return
end

return AppearanceOutfitSettingCtrl
