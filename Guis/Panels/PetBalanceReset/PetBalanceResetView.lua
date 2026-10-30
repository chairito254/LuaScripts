-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetBalanceReset\\PetBalanceResetView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local PetBalanceResetView = Class.LightClass("PetBalanceResetView", UIView)

function PetBalanceResetView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	self.txtContentUSDFText = objectReference:GetRefValue("txtContentUSDFText")
	self.imgArrowUSDFText = objectReference:GetRefValue("imgArrowUSDFText")
	self.leftPetRemoveUComponent = objectReference:GetRefValue("leftPetRemoveUComponent")
	self.rightPetRemoveUComponent = objectReference:GetRefValue("rightPetRemoveUComponent")
	self.listUList = objectReference:GetRefValue("listUList")
	self.txtDrowUSDFText = objectReference:GetRefValue("txtDrowUSDFText")
	self.btnClockUButton = objectReference:GetRefValue("btnClockUButton")
	self.btnEnterUButton = objectReference:GetRefValue("btnEnterUButton")

	local btnClockObjectReference = self.btnClockUButton:GetComponent("ObjectReference")

	self.btnClockNameUText = btnClockObjectReference:GetRefValue("txtNameUText")

	local btnEnterObjectReference = self.btnEnterUButton:GetComponent("ObjectReference")

	self.btnEnterNameUText = btnEnterObjectReference:GetRefValue("txtNameUText")
end

function PetBalanceResetView:registerObjects()
	return
end

function PetBalanceResetView:initView()
	return
end

return PetBalanceResetView
