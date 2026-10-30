-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\BpGet\\BpGetView.lua

local logger = require("Core.Log.LoggerManager").getLogger("BpGetView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local LuaUIUtils = require("Utils.LuaUIUtils")
local BpGetView = Class.LightClass("BpGetView", UIView)

function BpGetView:findObjects()
	self.battlePassTransform = LuaUIUtils.getBattlePassSeasonTransform(self.transform)

	if not self.battlePassTransform then
		return
	end

	local objectReference = self.battlePassTransform:GetComponent("ObjectReference")

	self.nameTxt = objectReference:GetRefValue("nameTxt")
	self.InfoText = objectReference:GetRefValue("InfoText")
	self.rootUComponent = objectReference:GetRefValue("rootUComponent")
	self.btnClose = objectReference:GetRefValue("btnClose")
	self.btnNext = objectReference:GetRefValue("btnNext")
end

function BpGetView:registerObjects()
	return
end

function BpGetView:initView()
	return
end

return BpGetView
