-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Event\\Component\\HalloweenComponent.lua

local Class = require("Core.Framework.Class")
local UIConst = require("Const.UIConst")
local EventContainerComponent = require("Guis.Panels.Event.Component.EventContainerComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local HalloweenComponent = Class.LightClass("HalloweenComponent", EventContainerComponent)

function HalloweenComponent:ctor(ctrl, refUContainer, id)
	EventContainerComponent.ctor(self, ctrl, refUContainer, id)

	self.rewardListenerAdded = false
end

function HalloweenComponent:findObjects()
	if not self:checkContentLoaded() then
		return
	end

	self.objectReference = self.transform:GetChild(0):GetComponent("ObjectReference")
	self.dailyProgressUSDFText = self.objectReference:GetRefValue("dailyProgressUSDFText")
	self.dailyTitleUSDFText = self.objectReference:GetRefValue("dailyTitleUSDFText")
	self.journalProgressUSDFText = self.objectReference:GetRefValue("journalProgressUSDFText")
	self.journalTitleUSDFText = self.objectReference:GetRefValue("journalTitleUSDFText")
	self.eventRewardUContainer = self.objectReference:GetRefValue("eventRewardUContainer")
	self.dailyItemIconUButton = self.objectReference:GetRefValue("dailyItemIconUButton")
end

function HalloweenComponent:addListener()
	function self.dailyItemIconUButton.luaClick(navConfirm)
		if not self.dailyItemData then
			return
		end

		LuaUIUtils.onRewardItemClick(self.dailyItemIconUButton, self.dailyItemData, nil, navConfirm)
	end
end

function HalloweenComponent:refreshPage()
	if not self:checkContentLoaded() then
		return
	end

	local overviewData = self.model:getHalloweenOverviewData(self.eventId)

	self:setEventTitle(nil, overviewData.endTime)
	ClientTextUtils.setText(self.dailyProgressUSDFText, overviewData.dailyProgressText)
	ClientTextUtils.setText(self.dailyTitleUSDFText, overviewData.dailyTitleText)
	ClientTextUtils.setText(self.journalProgressUSDFText, overviewData.journalProgressText)
	ClientTextUtils.setText(self.journalTitleUSDFText, overviewData.journalTitleText)

	self.dailyItemData = overviewData.dailyItemData

	self:refreshRewardPreview(overviewData)
end

function HalloweenComponent:refreshRewardPreview(overviewData)
	if not self.eventRewardUContainer or not self.eventRewardUContainer.content then
		return
	end

	local objectReference = self.eventRewardUContainer.content:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	self.eventRewardUContainer.content:TryChangePage("Title", 1)

	self.listRewardUList = self.listRewardUList or objectReference:GetRefValue("listRewardUList")
	self.btnGotoUButton = self.btnGotoUButton or objectReference:GetRefValue("btnGotoUButton")
	self.listTitleUSDFText = self.listTitleUSDFText or objectReference:GetRefValue("listTitleUSDFText")

	ClientTextUtils.setText(self.listTitleUSDFText, overviewData.rewardPreviewTitleText)

	if not self.rewardListenerAdded and self.btnGotoUButton then
		local btnObjRef = self.btnGotoUButton:GetComponent("ObjectReference")
		local txtNameUText = btnObjRef:GetRefValue("txtNameUText")

		ClientTextUtils.setText(txtNameUText, overviewData.gotoButtonText)

		self.rewardListenerAdded = true

		function self.btnGotoUButton.luaClick()
			pg.global.ui:open(UIConst.UI_ID_EVENT_HALLLOWEEN, {
				eventId = self.eventId
			})
		end
	end

	if self.listRewardUList and overviewData.rewardDropId then
		LuaUIUtils.setRewardListByDropId(self.listRewardUList, overviewData.rewardDropId)
	end

	self:refreshRedDotState(overviewData.pageRedDot)
end

function HalloweenComponent:refreshRedDotState(redDotData)
	if not self.btnGotoUButton then
		return
	end

	redDotData = redDotData or self.model:getHalloweenPageRedDotData(self.eventId)

	if not redDotData or not redDotData.path then
		self.btnGotoUButton:ClearRedDot()

		return
	end

	pg.global.setPreViewRedDot(redDotData.path, self.btnGotoUButton, function()
		return self.model:getHalloweenPageRedDotStyle(self.eventId)
	end)
end

function HalloweenComponent:collectShowReadyContainers()
	if self.eventRewardUContainer then
		return {
			self.eventRewardUContainer
		}
	end

	return nil
end

function HalloweenComponent:onBeforeExitPage()
	EventContainerComponent.onBeforeExitPage(self)
	self.ctrl:setCommonTitle(false)
end

function HalloweenComponent:onDestroy()
	EventContainerComponent.onDestroy(self)
end

return HalloweenComponent
