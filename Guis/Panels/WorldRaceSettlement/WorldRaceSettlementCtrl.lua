-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRaceSettlement\\WorldRaceSettlementCtrl.lua

local Class = require("Core.Framework.Class")
local ClientTextUtils = require("Utils.ClientTextUtils")
local MessageName = require("Const.MessageName")
local UICtrl = require("Guis.UICtrl")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local ClientUtils = require("Utils.ClientUtils")
local Utils = require("Common.Utils.Utils")
local WorldRaceSettlementCtrl = Class.LightClass("WorldRaceSettlementCtrl", UICtrl)

WorldRaceSettlementCtrl.messages = {
	[MessageName.WORLD_RACE_SINGLE_SETTLEMENT_CHANGED] = {
		"onSettlementChanged",
		true
	}
}

function WorldRaceSettlementCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
	self.model:setSettlementInfo(info)
end

function WorldRaceSettlementCtrl:addListener()
	function self.view.btnRetryUButton.luaClick()
		self:onBtnRetry()
	end

	function self.view.btnLeaveUButton.luaClick()
		self:onBtnLeave()
	end
end

function WorldRaceSettlementCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:onSettlementChanged(info)
end

function WorldRaceSettlementCtrl:onBtnRetry()
	if not pg.me or not Utils.isWorldRacingDungeonSpaceType(pg.me.space.spaceType) then
		return
	end

	pg.me:requestWorldRaceSingleTryAgain()
end

function WorldRaceSettlementCtrl:onBtnLeave()
	ClientUtils.exitDungeon()
	self:dismiss()
end

function WorldRaceSettlementCtrl:onSettlementChanged(info)
	if not info then
		return
	end

	self.model:setSettlementInfo(info)

	local result = ClientActivityUtils.getWorldRaceResultPage(info.result)

	self.view.rootUComponent:TryChangePage("Type", result)

	if self.view.resultTxt then
		local key

		if result == ClientActivityUtils.WORLD_RACE_RESULT_PAGE.Win then
			key = "RACING_CHALLENGE_SUCCESS"
		elseif result == ClientActivityUtils.WORLD_RACE_RESULT_PAGE.Fail then
			key = "RACING_CHALLENGE_FAILED"
		elseif result == ClientActivityUtils.WORLD_RACE_RESULT_PAGE.End then
			key = "RACING_CHALLENGE_TERMINATED"
		end

		if key then
			ClientTextUtils.setText(self.view.resultTxt, pg.getGameString(key))
		end
	end

	self.view.rootUComponent:TryChangePage("Ranking", ClientActivityUtils.getWorldRaceRatingPageByValue(info.raceRating))
	ClientTextUtils.setText(self.view.timeUSDFText, ClientActivityUtils.formatWorldRaceTime(info.raceTime))
	self.view.newRecordUWidget:SetActive(info.isNewRecord == true)

	if self.view.textTitleUBaseText then
		ClientTextUtils.setText(self.view.textTitleUBaseText, pg.getGameString("RACING_CHALLENGE_TIME"))
	end

	if self.view.newRecordTxt then
		ClientTextUtils.setText(self.view.newRecordTxt, pg.getGameString("RACING_NEW_RECORD"))
	end

	if self.view.btnRetryTxt then
		ClientTextUtils.setText(self.view.btnRetryTxt, pg.getGameString("RACING_RETRY_CHALLENGE"))
	end

	if self.view.btnLeaveTxt then
		ClientTextUtils.setText(self.view.btnLeaveTxt, pg.getGameString("RACING_EXIT"))
	end
end

return WorldRaceSettlementCtrl
