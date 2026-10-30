-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueAutoUnlockPopup\\RogueAutoUnlockPopupView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local ClientTextUtils = require("Utils.ClientTextUtils")
local RogueAutoUnlockPopupView = Class.LightClass("RogueAutoUnlockPopupView", UIView)

function RogueAutoUnlockPopupView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.confirmBtn = objectReference:GetRefValue("confirmBtn")
	self.textTitleUSDFText = objectReference:GetRefValue("textTitleUSDFText")
	self.textContentUSDFText = objectReference:GetRefValue("textContentUSDFText")
	self.textUSDFText = objectReference:GetRefValue("textUSDFText")
	self.listUList = objectReference:GetRefValue("listUList")
	self.uIPopTowerAutomaticUnlockUWidget = objectReference:GetRefValue("uIPopTowerAutomaticUnlockUWidget")
end

function RogueAutoUnlockPopupView:registerObjects()
	local objectReference = self.confirmBtn:GetComponent("ObjectReference")

	self.btnText = objectReference:GetRefValue("txtNameUText")
end

function RogueAutoUnlockPopupView:initView()
	ClientTextUtils.setText(self.textTitleUSDFText, pg.getGameString("Rogue_Train_Difficulty"))
	ClientTextUtils.setText(self.textUSDFText, pg.getGameString("Rogue_Auto_Unlock"))
	ClientTextUtils.setText(self.btnText, pg.getGameString("Rogue_Auto_Unlock_Sure"))
end

return RogueAutoUnlockPopupView
