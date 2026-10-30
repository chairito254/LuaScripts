-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetShinyHistory\\PetShinyHistoryView.lua

local logger = require("Core.Log.LoggerManager").getLogger("PetShinyHistoryView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local PetShinyHistoryView = Class.LightClass("PetShinyHistoryView", UIView)

function PetShinyHistoryView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnCloseUButton = objectReference:GetRefValue("btnCloseUButton")
	self.txtTitleUBaseText = objectReference:GetRefValue("txtTitleUBaseText")
	self.btnCornerCloseUButton = objectReference:GetRefValue("btnCornerCloseUButton")
	self.textUBaseText = objectReference:GetRefValue("textUBaseText")
	self.txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
	self.txtCostUBaseText = objectReference:GetRefValue("txtCostUBaseText")
	self.txtTimeUBaseText = objectReference:GetRefValue("txtTimeUBaseText")
	self.listUList = objectReference:GetRefValue("listUList")
	self.numSelectorUNumSelector = objectReference:GetRefValue("numSelectorUNumSelector")
end

function PetShinyHistoryView:registerObjects()
	return
end

function PetShinyHistoryView:initView()
	return
end

return PetShinyHistoryView
