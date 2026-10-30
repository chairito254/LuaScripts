-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRacingMap\\WorldRacingMapView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local WorldRacingMapView = Class.LightClass("WorldRacingMapView", UIView)

function WorldRacingMapView:findObjects()
	UIView.findObjects(self)

	local objectReference = self.transform:GetComponent("ObjectReference")

	self.objectReference = objectReference
	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.titleUBaseText = objectReference:GetRefValue("titleUBaseText")
	self.btnDescriptionUButton = objectReference:GetRefValue("btnDescriptionUButton")
	self.btnDescriptionTxtNameUBaseText = objectReference:GetRefValue("btnDescriptionTxtNameUBaseText")
	self.btnRankUButton = objectReference:GetRefValue("btnRankUButton")
	self.btnRankTxtNameUBaseText = self.btnRankUButton.transform:GetComponent("ObjectReference"):GetRefValue("txtNameUBaseText")
	self.btnRewardUButton = objectReference:GetRefValue("btnRewardUButton")
	self.btnRewardTxtNameUBaseText = objectReference:GetRefValue("btnRewardTxtNameUBaseText")
	self.chooseMapUBaseText = objectReference:GetRefValue("chooseMapUBaseText")
	self.chooseMapListUList = objectReference:GetRefValue("chooseMapListUList")
	self.mapViewRectTransform = objectReference:GetRefValue("mapViewRectTransform")
	self.mapContentRectTransform = objectReference:GetRefValue("mapContentRectTransform")
	self.mapBgUImage = objectReference:GetRefValue("mapBgUImage")
	self.mapMarkRootRectTransform = objectReference:GetRefValue("mapMarkRootRectTransform")
	self.mapMarkTemplateUButton = objectReference:GetRefValue("mapMarkTemplateUButton")
	self.textMapNameUBaseText = objectReference:GetRefValue("textMapNameUBaseText")
	self.textNumUBaseText = objectReference:GetRefValue("textNumUBaseText")
	self.infoLayoutUWidget = objectReference:GetRefValue("infoLayoutUWidget")
	self.rankBarUComponent = objectReference:GetRefValue("rankBarUComponent")
	self.rankTopUBaseText = objectReference:GetRefValue("rankTopUBaseText")
	self.rankTextUBaseText = objectReference:GetRefValue("rankTextUBaseText")
	self.specialEventRootUWidget = objectReference:GetRefValue("specialEventRootUWidget")
	self.specialEventUBaseText = objectReference:GetRefValue("specialEventUBaseText")
	self.rankScheduleRectTransform = objectReference:GetRefValue("rankScheduleRectTransform")
	self.rankScheduleTextUBaseText = objectReference:GetRefValue("rankScheduleTextUBaseText")
	self.rankScheduleCountDownUCountDown = objectReference:GetRefValue("rankScheduleCountDownUCountDown")
	self.specialEventTextUBaseText = objectReference:GetRefValue("specialEventTextUBaseText")
	self.chatRootRectTransform = objectReference:GetRefValue("chatRootRectTransform")
	self.chatUContainer = objectReference:GetRefValue("chatUContainer")
	self.panelTeamUWidget = objectReference:GetRefValue("panelTeamUWidget")
	self.textTeamUBaseText = objectReference:GetRefValue("textTeamUBaseText")
	self.btnSwitchTeamUButton = objectReference:GetRefValue("btnSwitchTeamUButton")
	self.teamListUList = objectReference:GetRefValue("teamListUList")
	self.teamAbilityUList = objectReference:GetRefValue("teamAbilityUList")
	self.panelBuffUWidget = objectReference:GetRefValue("panelBuffUWidget")
	self.textBuffUBaseText = objectReference:GetRefValue("textBuffUBaseText")
	self.textBuffContentUBaseText = objectReference:GetRefValue("textBuffContentUBaseText")
	self.textEmptyUBaseText = objectReference:GetRefValue("textEmptyUBaseText")
	self.btnSwitchBuffUButton = objectReference:GetRefValue("btnSwitchBuffUButton")
	self.buffTemplateRectTransform = objectReference:GetRefValue("buffTemplateRectTransform")
	self.buffUButton = self.buffTemplateRectTransform:GetComponent("UButton")

	local buffReference = self.buffTemplateRectTransform:GetComponent("ObjectReference")

	self.buffIconUImage = buffReference:GetRefValue("iconUImage")
	self.btnStartUComponent = objectReference:GetRefValue("btnStartUComponent")
	self.btnStartTipsUBaseText = objectReference:GetRefValue("btnStartTxtNameUBaseText")

	local startObjectReference = self.btnStartUComponent.transform:GetComponent("ObjectReference")

	self.btnStartUButton = startObjectReference:GetRefValue("btnMatch")
	self.btnStartTxtNameUBaseText = startObjectReference:GetRefValue("txtEnter")
	self.btnStartDisabledTxtNameUBaseText = startObjectReference:GetRefValue("txtEnterDisabled")

	startObjectReference:GetRefValue("txtTips").gameObject:SetActiveEx(false)

	self.btnCancelUButton = startObjectReference:GetRefValue("btnCancel")
	self.matchCountDown = startObjectReference:GetRefValue("countDown")
	self.txtWaitingUSDFText = startObjectReference:GetRefValue("txtWaitingUSDFText")

	if NotNil(self.btnCancelUButton) then
		self.btnCancelTxtNameUText = self.btnCancelUButton.transform:GetComponent("ObjectReference"):GetRefValue("txtNameUText")
	end
end

return WorldRacingMapView
