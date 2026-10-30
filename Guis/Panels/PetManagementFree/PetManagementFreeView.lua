-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManagementFree\\PetManagementFreeView.lua

local logger = require("Core.Log.LoggerManager").getLogger("PetManagementFreeView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local PetManagementFreeView = Class.LightClass("PetManagementFreeView", UIView)

function PetManagementFreeView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.titleNormalUSDFText = objectReference:GetRefValue("titleNormalUSDFText")
	self.petNormalUList = objectReference:GetRefValue("petNormalUList")
	self.titleRareUSDFText = objectReference:GetRefValue("titleRareUSDFText")
	self.petRareUList = objectReference:GetRefValue("petRareUList")
	self.titleTagUSDFText = objectReference:GetRefValue("titleTagUSDFText")
	self.listTagUList = objectReference:GetRefValue("listTagUList")
	self.titleNormal2USDFText = objectReference:GetRefValue("titleNormal2USDFText")
	self.petNormal2UList = objectReference:GetRefValue("petNormal2UList")
	self.titleRare2USDFText = objectReference:GetRefValue("titleRare2USDFText")
	self.titleTag2USDFText = objectReference:GetRefValue("titleTag2USDFText")
	self.petRare2UList = objectReference:GetRefValue("petRare2UList")
	self.listTag2UList = objectReference:GetRefValue("listTag2UList")
	self.txtFreeUSDFText = objectReference:GetRefValue("txtFreeUSDFText")
	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.btAaffirmUButton = objectReference:GetRefValue("btAaffirmUButton")
	self.tipsUWidget = objectReference:GetRefValue("tipsUWidget")
	self.txtTipsUSDFText = objectReference:GetRefValue("txtTipsUSDFText")
	self.bgBlurUIBlurEffect = objectReference:GetRefValue("bgBlurUIBlurEffect")
	self.consoleBarConsoleBar = objectReference:GetRefValue("consoleBarConsoleBar")

	local btnBackOC = self.btnBackUButton:GetComponent("ObjectReference")

	self.btnBackNameUText = btnBackOC:GetRefValue("txtNameUText")

	local btnConfirmOC = self.btAaffirmUButton:GetComponent("ObjectReference")

	self.btnConfirmNameUText = btnConfirmOC:GetRefValue("txtNameUText")
end

function PetManagementFreeView:registerObjects()
	return
end

function PetManagementFreeView:initView()
	return
end

return PetManagementFreeView
