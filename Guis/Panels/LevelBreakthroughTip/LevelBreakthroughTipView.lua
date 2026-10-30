-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LevelBreakthroughTip\\LevelBreakthroughTipView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local LuaUIUtils = require("Utils.LuaUIUtils")
local LevelBreakthroughTipView = Class.LightClass("LevelBreakthroughTipView", UIView)

function LevelBreakthroughTipView:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.btnCancelUButton = self.objectReference:GetRefValue("btnCancelUButton")
	self.btnConfirmUButton = self.objectReference:GetRefValue("btnConfirmUButton")
	self.btnCloseUButton = self.objectReference:GetRefValue("btnCloseUButton")
	self.listUList = self.objectReference:GetRefValue("listUList")
	self.btnAllSelectedUButton = LuaUIUtils.safeGetRefValue(self.objectReference, "btnAllSelectedUButton")
end

function LevelBreakthroughTipView:initView()
	return
end

return LevelBreakthroughTipView
