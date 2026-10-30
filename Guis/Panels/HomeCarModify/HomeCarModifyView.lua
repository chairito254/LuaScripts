-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomeCarModify\\HomeCarModifyView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local HomeCarModifyView = Class.LightClass("HomeCarModifyView", UIView)

function HomeCarModifyView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.itemList = objectReference:GetRefValue("itemList")
	self.itemTitle = objectReference:GetRefValue("itemTitle")

	local confirmObjectReference = objectReference:GetRefValue("confirmObjectReference")

	self.confirmBtn = confirmObjectReference:GetRefValue("uIBtn1stConfirmUButton")
	self.btnBack = objectReference:GetRefValue("btnBack")
	self.planTabList = objectReference:GetRefValue("planTabList")
	self.tabList = objectReference:GetRefValue("tabList")
	self.listPointUList = objectReference:GetRefValue("listPointUList")
	self.skinList = objectReference:GetRefValue("skinList")

	local skinCompleteObjectReference = objectReference:GetRefValue("skinCompleteObjectReference")

	self.skinCompleteBtn = skinCompleteObjectReference:GetRefValue("uIBtn1stConfirmUButton")

	local skinGetObjectReference = objectReference:GetRefValue("skinGetObjectReference")

	self.skinGetBtn = skinGetObjectReference:GetRefValue("uIBtn1stConfirmUButton")
	self.skinGetBtnText = skinGetObjectReference:GetRefValue("txtNameUText")
	self.skinGetDescUBaseText = objectReference:GetRefValue("skinGetDescUBaseText")
	self.skinLockDescUBaseText = objectReference:GetRefValue("skinLockDescUBaseText")
end

return HomeCarModifyView
