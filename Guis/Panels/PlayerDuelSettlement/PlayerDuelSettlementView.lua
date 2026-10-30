-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PlayerDuelSettlement\\PlayerDuelSettlementView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local PlayerDuelSettlementView = Class.LightClass("PlayerDuelSettlementView", UIView)

function PlayerDuelSettlementView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnSwitchUButton = objectReference:GetRefValue("btnSwitchUButton")
	self.btnEndUButton = objectReference:GetRefValue("btnEndUButton")
	self.btnMoreRoundUButton = objectReference:GetRefValue("btnMoreRoundUButton")
	self.avatarLeftUComponent = objectReference:GetRefValue("avatarLeftUComponent")
	self.textLeftUSDFText = objectReference:GetRefValue("textLeftUSDFText")
	self.avatarRightUComponent = objectReference:GetRefValue("avatarRightUComponent")
	self.textRightUSDFText = objectReference:GetRefValue("textRightUSDFText")
	self.titleDownUSDFText = objectReference:GetRefValue("titleDownUSDFText")
	self.titleUpUSDFText = objectReference:GetRefValue("titleUpUSDFText")
	self.tipTextUSDFText = objectReference:GetRefValue("tipTextUSDFText")
	self.leftListUList = objectReference:GetRefValue("leftListUList")
	self.rightListUList = objectReference:GetRefValue("rightListUList")
	self.buttonSwitchUSDFText = objectReference:GetRefValue("buttonSwitchUSDFText")
	self.choiceMoreRoundUList = objectReference:GetRefValue("choiceMoreRoundUList")
	self.choiceEndRoundUList = objectReference:GetRefValue("choiceEndRoundUList")
	self.countDownUSDFText = objectReference:GetRefValue("countDownUSDFText")
end

function PlayerDuelSettlementView:registerObjects()
	return
end

function PlayerDuelSettlementView:initView()
	return
end

return PlayerDuelSettlementView
