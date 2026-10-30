-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRaceMultiSettlement\\WorldRaceMultiSettlementView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local WorldRaceMultiSettlementView = Class.LightClass("WorldRaceMultiSettlementView", UIView)

function WorldRaceMultiSettlementView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.renRawImagePro = objectReference:GetRefValue("renRawImagePro")
	self.rootUComponent = objectReference:GetRefValue("rootUComponent")
	self.rankingListUList = objectReference:GetRefValue("rankingListUList")
	self.playerNameUSDFText = objectReference:GetRefValue("playerNameUSDFText")
	self.playerHeadUWidget = objectReference:GetRefValue("playerHeadUWidget")
	self.lvTxt = objectReference:GetRefValue("lvTxt")
	self.playerRankingUSDFText = objectReference:GetRefValue("playerRankingUSDFText")
	self.playerTimeUSDFText = objectReference:GetRefValue("playerTimeUSDFText")
	self.playerSubUSDFText = objectReference:GetRefValue("playerSubUSDFText")
	self.addFriendUButton = objectReference:GetRefValue("addFriendUButton")
	self.likeUButton = objectReference:GetRefValue("likeUButton")
	self.likeCountUSDFText = objectReference:GetRefValue("textUSDFText")
	self.leaveUButton = objectReference:GetRefValue("leaveUButton")
	self.leaveTxtNameUText = self.leaveUButton:GetComponent("ObjectReference"):GetRefValue("txtNameUText")
	self.textRankingUBaseText = objectReference:GetRefValue("textRankingUBaseText")
	self.textNameUBaseText = objectReference:GetRefValue("textNameUBaseText")
	self.textTimeUBaseText = objectReference:GetRefValue("textTimeUBaseText")
	self.textInteractiveUBaseText = objectReference:GetRefValue("textInteractiveUBaseText")
	self.avatarUWidget = objectReference:GetRefValue("avatarUWidget")
	self.curPlayerUWidget = objectReference:GetRefValue("curPlayerUWidget")
end

return WorldRaceMultiSettlementView
