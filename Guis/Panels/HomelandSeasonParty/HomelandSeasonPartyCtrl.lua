-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandSeasonParty\\HomelandSeasonPartyCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local EventConst = require("Const.EventConst")
local CallbackHandler = require("Core.Common.CallbackHandler")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ItemSourceData = require("Data.item_source_data")
local HomeSeasonModuleData = require("Data.home_season_module_data")
local HomelandSeasonPartyCtrl = Class.LightClass("HomelandSeasonPartyCtrl", UICtrl)

HomelandSeasonPartyCtrl.messages = {
	[MessageName.HOME_SEASON_CHANGE] = {
		"onSeasonContextChanged",
		true
	},
	[MessageName.HOME_SEASON_STAGE_CHANGE] = {
		"onSeasonContextChanged",
		true
	}
}

function HomelandSeasonPartyCtrl:onCreate(info)
	self.moduleId = info and info.moduleId or nil
	self.closeUI = info == nil or info.closeUI == nil or info.closeUI

	UICtrl.onCreate(self, info)

	self.languageChangedCallback = CallbackHandler(self, "onLanguageChanged")

	pg.global.eventEmitter:addEventListener(EventConst.ON_LANGUAGE_CHANGED, self.languageChangedCallback)
end

function HomelandSeasonPartyCtrl:addListener()
	function self.view.listRewardUList.luaRenderItem(button, index, data)
		LuaUIUtils.renderRewardItem(button, data)
	end

	function self.view.btnConfirmUButton.luaClick()
		self:onGoButtonClick()
	end

	function self.view.btnCloseUButton.luaClick()
		self:close()
	end
end

function HomelandSeasonPartyCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.moduleId = info and info.moduleId or self.moduleId

	if info ~= nil and info.closeUI ~= nil then
		self.closeUI = info.closeUI
	end

	self:refreshUI()
end

function HomelandSeasonPartyCtrl:onDestroy()
	pg.global.eventEmitter:removeEventListener(EventConst.ON_LANGUAGE_CHANGED, self.languageChangedCallback)

	self.languageChangedCallback = nil
	self.view.listRewardUList.luaRenderItem = nil
	self.view.btnConfirmUButton.luaClick = nil

	UICtrl.onDestroy(self)
end

function HomelandSeasonPartyCtrl:onSeasonContextChanged()
	self:refreshUI()
end

function HomelandSeasonPartyCtrl:onLanguageChanged()
	if self._isOpen and self.view then
		self:refreshUI()
	end
end

function HomelandSeasonPartyCtrl:refreshUI()
	local viewData = self.model:refreshData(self.moduleId)

	if not viewData then
		self:dismiss()

		return false
	end

	ClientTextUtils.setText(self.view.txtTitleUSDFText, viewData.title)
	ClientTextUtils.setText(self.view.scrollRectUScrollRect.content, viewData.details)
	self.view.scrollRectUScrollRect.content.gameObject:SetActiveEx(viewData.details ~= "")
	self.view.scrollRectUScrollRect:GoToPos(Vector2.zero, true)

	local timeRange = LuaUIUtils.formatTimeRange(viewData.startTime, viewData.endTime)

	ClientTextUtils.setText(self.view.txtTipsTextPlus, pg.getGameString("ACTIVITY_TIME") .. timeRange)
	self.view.txtTipsTextPlus.gameObject:SetActiveEx(timeRange ~= "")
	ClientTextUtils.setText(self.view.txtTitleRewardUSDFText, pg.getGameString("LEYLINETREE_REWARD"))
	ClientTextUtils.setText(self.view.txtConfirmUText, pg.getGameString("BUTTON_NAME_1"))

	local hasRewards = #viewData.rewards > 0

	if hasRewards then
		self.view.listRewardUList:SetList(viewData.rewards)
	else
		self.view.listRewardUList:SetList({})
	end

	return true
end

function HomelandSeasonPartyCtrl:getNormalFormSourceId()
	local moduleConfig = HomeSeasonModuleData[self.moduleId]
	local sourceId = moduleConfig and moduleConfig.normalFormSourceId

	if type(sourceId) ~= "number" or sourceId <= 0 then
		return nil
	end

	return sourceId
end

function HomelandSeasonPartyCtrl:onGoButtonClick()
	local sourceId = self:getNormalFormSourceId()

	if not sourceId then
		return
	end

	local sourceData = ItemSourceData[sourceId]

	if not sourceData then
		return
	end

	if self.closeUI then
		pg.global.ui:closeAllNormalPanel()
	end

	LuaUIUtils.clueSeek(sourceData, nil, nil, sourceId)
end

return HomelandSeasonPartyCtrl
