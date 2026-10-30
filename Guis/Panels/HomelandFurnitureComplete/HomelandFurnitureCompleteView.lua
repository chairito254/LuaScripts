-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandFurnitureComplete\\HomelandFurnitureCompleteView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local HomelandFurnitureCompleteView = Class.LightClass("HomelandFurnitureCompleteView", UIView)

function HomelandFurnitureCompleteView:findObjects()
	self.component = self.transform:GetComponent("UComponent")
end

function HomelandFurnitureCompleteView:registerObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")

	if not self.objectReference then
		return
	end

	self.btnBackUButton = self.objectReference:GetRefValue("btnBackUButton")
	self.btnSelectAllUButton = self.objectReference:GetRefValue("btnSelectAllUButton")
	self.btnCompleteUButton = self.objectReference:GetRefValue("btnCompleteUButton")
	self.txtCompleteUSDFText = self.btnCompleteUButton.title
	self.listGroupUList = self.objectReference:GetRefValue("listGroupUList")
	self.listConsumeUList = self.objectReference:GetRefValue("listConsumeUList")
	self.txtConsumeUSDFText = self.objectReference:GetRefValue("txtConsumeUSDFText")
	self.txtSelectedUSDFText = self.objectReference:GetRefValue("txtSelectedUSDFText")
	self.txtTitleUSDFText = self.objectReference:GetRefValue("txtTitleUSDFText")
	self.listCurrencyUList = self.objectReference:GetRefValue("listCurrencyUList")
	self.propInfoUContainer = self.objectReference:GetRefValue("propInfoUContainer")
	self.consume1UButton = self.objectReference:GetRefValue("consume1UButton")
	self.consume1ObjectReference = self.objectReference:GetRefValue("consume1ObjectReference")
	self.consume2UButton = self.objectReference:GetRefValue("consume2UButton")
	self.consume2ObjectReference = self.objectReference:GetRefValue("consume2ObjectReference")
	self.consume3UButton = self.objectReference:GetRefValue("consume3UButton")
	self.consume3ObjectReference = self.objectReference:GetRefValue("consume3ObjectReference")
end

function HomelandFurnitureCompleteView:initView()
	return
end

return HomelandFurnitureCompleteView
