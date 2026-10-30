-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenPerfumeBlending\\EventHalloweenPerfumeBlendingView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local EventHalloweenPerfumeBlendingView = Class.LightClass("EventHalloweenPerfumeBlendingView", UIView)

function EventHalloweenPerfumeBlendingView:findObjects()
	UIView.findObjects(self)

	local objectReference = self.transform:GetComponent("ObjectReference")

	self.rootUComponent = self.transform:GetComponent("UComponent")
	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.titleUSDFText = objectReference:GetRefValue("titleUSDFText")
	self.materialNumUSDFText = objectReference:GetRefValue("materialNumUSDFText")
	self.submitUButton = objectReference:GetRefValue("submitUButton")

	local submitObjectReference = self.submitUButton:GetComponent("ObjectReference")

	self.submitBtnUSDFText = submitObjectReference:GetRefValue("txtNameUText")
	self.materialOptionUList = objectReference:GetRefValue("materialOptionUList")
	self.conditionUList = objectReference:GetRefValue("conditionUList")
	self.taskTitleUSDFText = objectReference:GetRefValue("taskTitleUSDFText")
	self.currTipsUSDFText = objectReference:GetRefValue("currTipsUSDFText")
	self.currentFlavorUList = objectReference:GetRefValue("currentFlavorUList")
	self.pop1UComponent = objectReference:GetRefValue("pop1UComponent")
	self.pop2UComponent = objectReference:GetRefValue("pop2UComponent")
	self.pop3UComponent = objectReference:GetRefValue("pop3UComponent")
	self.currentPetUImage = objectReference:GetRefValue("currentPetUImage")
	self.currentMaterialUComponents = {
		self.pop1UComponent,
		self.pop2UComponent,
		self.pop3UComponent
	}
	self.currentMaterialIconUImages = {}

	for slotIndex, component in ipairs(self.currentMaterialUComponents) do
		local componentReference = component:GetComponent("ObjectReference")

		self.currentMaterialIconUImages[slotIndex] = componentReference:GetRefValue("iconUImage")
	end
end

return EventHalloweenPerfumeBlendingView
