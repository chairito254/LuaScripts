-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PaymentDeduct\\PaymentDeductShopsComponent.lua

local Class = require("Core.Framework.Class")
local PaymentShopsComponent = require("Guis.Panels.CashShop.Component.PaymentShopsComponent")
local PaymentDeductShopsComponent = Class.LightClass("PaymentDeductShopsComponent", PaymentShopsComponent)

function PaymentDeductShopsComponent:findObjects()
	if not self:checkContentLoaded() then
		return
	end

	PaymentShopsComponent.findObjects(self)

	local objectReference = self.transform:GetChild(0):GetComponent("ObjectReference")

	self.adaptationBackground = objectReference:GetRefValue("adaptationBackground")

	self.adaptationBackground.gameObject:SetActiveEx(true)
end

function PaymentDeductShopsComponent:_setupGroupTabs()
	self._pageApplied = false

	self:refreshPage()

	self._appliedGroupId = nil
	self._pageApplied = true
end

return PaymentDeductShopsComponent
