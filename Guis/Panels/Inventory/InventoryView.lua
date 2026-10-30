-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Inventory\\InventoryView.lua

local UIView = require("Guis.UIView")
local Class = require("Core.Framework.Class")
local InventoryView = Class.LightClass("InventoryView", UIView)

function InventoryView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnBack = objectReference:GetRefValue("btnBack")
	self.txtTitle = objectReference:GetRefValue("txtTitle")
	self.txtCapacity = objectReference:GetRefValue("txtCapacity")
	self.listTabIconUList = objectReference:GetRefValue("listTabIconUList")
	self.listProp = objectReference:GetRefValue("listProp")
	self.listCurrency = objectReference:GetRefValue("listCurrency")
	self.btnUse1 = objectReference:GetRefValue("btnUse1")
	self.layoutBoxUse = objectReference:GetRefValue("layoutBoxUse")
	self.btnUse2 = objectReference:GetRefValue("btnUse2")
	self.btnCompound = objectReference:GetRefValue("btnCompound")
	self.sortSelector = objectReference:GetRefValue("sortSelector")
	self.btnSort = objectReference:GetRefValue("btnSort")
	self.btnRecycle = objectReference:GetRefValue("btnRecycle")
	self.recyclePanel = objectReference:GetRefValue("recyclePanel")
	self.ballPanel = objectReference:GetRefValue("ballPanel")
	self.rootComponent = objectReference:GetRefValue("rootComponent")
	self.propDetail = objectReference:GetRefValue("propDetail")
	self.listTabThird = objectReference:GetRefValue("listTabThird")
	self.btnShowUButton = objectReference:GetRefValue("btnShowUButton")
	self.consoleBarTransform = objectReference:GetRefValue("consoleBarTransform")
	self.ballDragUWidget = objectReference:GetRefValue("ballDragUWidget")
	self.textDragUBaseText = objectReference:GetRefValue("textDragUBaseText")
	self.propInfoUContainer = objectReference:GetRefValue("propInfoUContainer")
	self.numCost = objectReference:GetRefValue("numCost")
end

function InventoryView:registerObjects()
	return
end

return InventoryView
