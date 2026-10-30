-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueBook\\RogueBookView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local ClientTextUtils = require("Utils.ClientTextUtils")
local RogueBookView = Class.LightClass("RogueBookView", UIView)

function RogueBookView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.rootComponent = objectReference:GetRefValue("rootComponent")
	self.listTabUList = objectReference:GetRefValue("listTabUList")
	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.tMPUBaseText = objectReference:GetRefValue("tMPUBaseText")
	self.listBuffTypeUList = objectReference:GetRefValue("listBuffTypeUList")
	self.tabSkillCardObjectReference = objectReference:GetRefValue("tabSkillCardObjectReference")
	self.tabEventUContainer = objectReference:GetRefValue("tabEventUContainer")
	self.tabBossUContainer = objectReference:GetRefValue("tabBossUContainer")
	self.tabSkillCardAnimation = objectReference:GetRefValue("tabSkillCardAnimation")
end

function RogueBookView:registerObjects()
	local objectReference = self.tabSkillCardObjectReference

	self.textTopTitleUSDFText = objectReference:GetRefValue("textTopTitleUSDFText")
	self.listUList = objectReference:GetRefValue("listUList")
	self.listPropUList = objectReference:GetRefValue("listPropUList")
	self.panelRightUContainer = objectReference:GetRefValue("panelRightUContainer")
end

function RogueBookView:initView()
	ClientTextUtils.setText(self.tMPUBaseText, pg.getGameString("ROGUE_BOOK_TITLE"))
end

return RogueBookView
