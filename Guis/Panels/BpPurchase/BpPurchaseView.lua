-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\BpPurchase\\BpPurchaseView.lua

local logger = require("Core.Log.LoggerManager").getLogger("BpPurchaseView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local LuaUIUtils = require("Utils.LuaUIUtils")
local BpPurchaseView = Class.LightClass("BpPurchaseView", UIView)

function BpPurchaseView:findObjects()
	self.battlePassTransform = LuaUIUtils.getBattlePassSeasonTransform(self.transform)

	if not self.battlePassTransform then
		return
	end

	local objectReference = self.battlePassTransform:GetComponent("ObjectReference")

	self.rootUComponent = objectReference:GetRefValue("rootUComponent")
	self.btnBack = objectReference:GetRefValue("btnBack")
	self.txtBackName = objectReference:GetRefValue("txtBackName")
	self.maskRayBoxTrans = objectReference:GetRefValue("maskRayBoxTrans")
	self.moneyListUButton = objectReference:GetRefValue("moneyListUButton")
end

function BpPurchaseView:registerObjects()
	return
end

function BpPurchaseView:initView()
	return
end

return BpPurchaseView
