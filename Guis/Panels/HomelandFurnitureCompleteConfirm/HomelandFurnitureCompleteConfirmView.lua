-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandFurnitureCompleteConfirm\\HomelandFurnitureCompleteConfirmView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local HomelandFurnitureCompleteConfirmView = Class.LightClass("HomelandFurnitureCompleteConfirmView", UIView)

function HomelandFurnitureCompleteConfirmView:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
end

function HomelandFurnitureCompleteConfirmView:registerObjects()
	self.listConsumeUList = self.objectReference:GetRefValue("listConsumeUList")

	local panelReference = self.objectReference:GetRefValue("confirmPanelObjectReference")

	self.txtTitleUSDFText = panelReference:GetRefValue("titleText")
	self.txtDescUSDFText = panelReference:GetRefValue("contextText")
	self.btnCancelUButton = panelReference:GetRefValue("cancelBtn")
	self.btnConfirmUButton = panelReference:GetRefValue("confirmBtn")
	self.txtCancelUSDFText = self.btnCancelUButton:GetComponent("ObjectReference"):GetRefValue("txtNameUText")
	self.txtConfirmUSDFText = self.btnConfirmUButton:GetComponent("ObjectReference"):GetRefValue("txtNameUText")
end

return HomelandFurnitureCompleteConfirmView
