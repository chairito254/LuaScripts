-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\MobileVehicleInteration\\MobileVehicleInterationView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local MobileVehicleInterationView = Class.LightClass("MobileVehicleInterationView", UIView)

function MobileVehicleInterationView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.mainButton = objectReference:GetRefValue("skill3UButton")
	self.unusedSkill1Button = objectReference:GetRefValue("skill1UButton")
	self.unusedSkill2Button = objectReference:GetRefValue("skill2UButton")
	self.closeButton = objectReference:GetRefValue("btnCloseUButton")
end

function MobileVehicleInterationView:initView()
	self.mainButton:SetActive(false)
	self.unusedSkill1Button:SetActive(false)
	self.unusedSkill2Button:SetActive(false)
	self.closeButton:SetActive(false)
end

return MobileVehicleInterationView
