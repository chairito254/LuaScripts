-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManualShare\\PetManualShareView.lua

local logger = require("Core.Log.LoggerManager").getLogger("PetManualShareView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local PetManualShareView = Class.LightClass("PetManualShareView", UIView)

function PetManualShareView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.listPetUList = objectReference:GetRefValue("listPetUList")
	self.txtCatalogUSDFText = objectReference:GetRefValue("txtCatalogUSDFText")
	self.txtFormUSDFText = objectReference:GetRefValue("txtFormUSDFText")
	self.txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	self.txtUIDUSDFText = objectReference:GetRefValue("txtUIDUSDFText")
	self.playerHeadUContainer = objectReference:GetRefValue("playerHeadUContainer")
	self.itemObjectReference = objectReference:GetRefValue("itemObjectReference")
	self.item2ObjectReference = objectReference:GetRefValue("item2ObjectReference")
	self.item3ObjectReference = objectReference:GetRefValue("item3ObjectReference")
end

function PetManualShareView:registerObjects()
	return
end

function PetManualShareView:initView()
	return
end

function PetManualShareView:delayDestroyUIView()
	UIView.delayDestroyUIView(self)

	if self.captureCanvas then
		pg.global.mobileCameraMgr:ReleaseLongUICaptureCanvas(self.captureCanvas)

		self.captureCanvas = nil
	end
end

return PetManualShareView
