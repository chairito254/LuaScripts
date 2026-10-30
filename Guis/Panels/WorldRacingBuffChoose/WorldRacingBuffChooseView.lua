-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRacingBuffChoose\\WorldRacingBuffChooseView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local WorldRacingBuffChooseView = Class.LightClass("WorldRacingBuffChooseView", UIView)

function WorldRacingBuffChooseView:findObjects()
	UIView.findObjects(self)

	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.titleUBaseText = objectReference:GetRefValue("titleUBaseText")
	self.selectTitleUBaseText = objectReference:GetRefValue("selectTitleUBaseText")
	self.listTabUList = objectReference:GetRefValue("listTabUList")
	self.listBuffUList = objectReference:GetRefValue("listBuffUList")
	self.btnConfirmUButton = objectReference:GetRefValue("btnConfirmUButton")
	self.btnInfoUButton = objectReference:GetRefValue("btnInfoUButton")

	local confirmReference = self.btnConfirmUButton:GetComponent("ObjectReference")

	self.confirmNameUBaseText = confirmReference:GetRefValue("txtNameUText")
	self.tMPUSDFText = objectReference:GetRefValue("tMPUSDFText")
end

return WorldRacingBuffChooseView
