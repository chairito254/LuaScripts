-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LeyLinesTreeActivity\\LeyLinesTreeActivityView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local LeyLinesTreeActivityView = Class.LightClass("LeyLinesTreeActivityView", UIView)

function LeyLinesTreeActivityView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.listUList = objectReference:GetRefValue("listUList")
	self.btnClose = objectReference:GetRefValue("btnClose")
	self.txtTips = objectReference:GetRefValue("txtTips")
end

return LeyLinesTreeActivityView
