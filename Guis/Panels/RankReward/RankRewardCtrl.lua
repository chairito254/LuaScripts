-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RankReward\\RankRewardCtrl.lua

local Class = require("Core.Framework.Class")
local CallbackHandler = require("Core.Common.CallbackHandler")
local MessageName = require("Const.MessageName")
local UICtrl = require("Guis.UICtrl")
local RankRewardData = require("Data.rank_reward_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Time = require("Core.Common.Time")
local RankRewardCtrl = Class.LightClass("RankRewardCtrl", UICtrl)

RankRewardCtrl.messages = {
	[MessageName.RANK_DATA_UPDATED] = {
		"onRankDataUpdated",
		true
	},
	[MessageName.RANK_TIME_DATA_UPDATED] = {
		"onRankTimeDataUpdated",
		true
	}
}

local BUTTON_STATE_NORMAL = 0
local BUTTON_STATE_SELECTED = 5

function RankRewardCtrl:refreshCountdownByRankId(rankSetId, rewardIndex)
	local countDown = self.view.countDownUCountDown

	countDown.luaFinished = nil

	countDown:Stop()
	countDown:SetActive(false)

	if rankSetId == nil or rankSetId == "" then
		return
	end

	local settleTime = pg.game.rank:getRankSettleTime(rankSetId, rewardIndex)
	local remainTime = settleTime and settleTime - Time.secondCache

	if not remainTime or remainTime <= 0 then
		return
	end

	countDown.formatText = pg.getGameString("RANK_SETTLE_COUNTDOWN")

	function countDown.luaFinished()
		countDown:SetActive(false)
	end

	countDown:SetActive(true)
	countDown:Play(remainTime)
end

function RankRewardCtrl:onDestroy()
	self.view.countDownUCountDown.luaFinished = nil

	self.view.countDownUCountDown:Stop()
	UICtrl.onDestroy(self)
end

function RankRewardCtrl:addListener()
	UICtrl.addListener(self)

	function self.view.btnCloseUButton.luaClick()
		self:close()
	end

	function self.view.listTab3thUList.luaRenderItem(button, _, data)
		self:renderTabItem(button, data)
	end

	function self.view.listTab3thUList.luaSelectedChanged(uList, selected)
		if selected then
			self.currentRewardIndex = uList.selectedItem.rewardIndex

			self:refreshRewardList(uList.selectedItem)
			self:refreshCountdownByRankId(self.currentRankSetId, self.currentRewardIndex)
			uList:RefreshList()
		end
	end

	function self.view.listUList.luaRenderItem(button, _, data)
		self:renderRewardGroup(button, data)
	end
end

function RankRewardCtrl:renderTabItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
	local isSelected = data == self.view.listTab3thUList.selectedItem

	ClientTextUtils.setText(txtNameUBaseText, pg.getLocalizationText(data.tabName))
	button:TryChangePage("button", isSelected and BUTTON_STATE_SELECTED or BUTTON_STATE_NORMAL)
end

function RankRewardCtrl:refreshRewardList(data)
	self.view.listUList:SetList(self.model:getRewardList(data.rewardId, self.currentRank))

	local rewardData = RankRewardData[data.rewardId]

	ClientTextUtils.setText(self.view.txtDetailsUSDFText, pg.getLocalizationText(rewardData.rewardDes))
end

function RankRewardCtrl:renderRewardGroup(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	local txtNowUSDFText = objectReference:GetRefValue("txtNowUSDFText")
	local listRewardUList = objectReference:GetRefValue("listRewardUList")
	local tagNowUWidget = objectReference:GetRefValue("tagNowUWidget")

	ClientTextUtils.setText(txtTitleUSDFText, data.title)
	ClientTextUtils.setText(txtNowUSDFText, pg.getGameString("CURRENT"))
	tagNowUWidget:SetActive(data.isCurrent)

	function listRewardUList.luaRenderItem(rewardButton, _, rewardData)
		self:renderRewardItem(rewardButton, rewardData)
	end

	listRewardUList:SetList(data.rewards)
end

function RankRewardCtrl:renderRewardItem(button, data)
	LuaUIUtils.renderRewardItem(button, data, nil, nil, nil, nil, CallbackHandler(self, "close"))
end

function RankRewardCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.rankId = info.rankId
	self.tab1 = info.tab1
	self.tab2 = info.tab2
	self.currentRewardIndex = 1
	self.currentRankSetId = pg.game.rank:getCurrentRankId(self.rankId, self.tab1, self.tab2)

	self:refreshCurrentRank()
	self:refreshCountdownByRankId(self.currentRankSetId, self.currentRewardIndex)

	local tabList = self:getRewardTabList(info.rewardIds)

	ClientTextUtils.setText(self.view.titleUSDFText, pg.getGameString("RANK_REWARD_TITLE"))
	self.view.listTab3thUList:SetList(tabList)
	self.view.listTab3thUList:DeselectAll()
	self.view.listTab3thUList:SelectItem(0)
	self.view.tabUWidget:SetActive(#tabList > 1)
end

function RankRewardCtrl:refreshCurrentRank()
	local selfRankData = pg.game.rank:getCachedSelfRankData(self.rankId, self.tab1, self.tab2)

	self.currentRank = selfRankData and selfRankData.Rank or 0
end

function RankRewardCtrl:getRewardTabList(rewardIds)
	local tabList = {}
	local lastIndex = #rewardIds

	for index, rewardId in ipairs(rewardIds) do
		local rewardData = RankRewardData[rewardId]

		tabList[index] = {
			tIndex = index == 1 and 0 or index == lastIndex and 2 or 1,
			tabName = rewardData.tabName,
			rewardId = rewardId,
			rewardIndex = index
		}
	end

	return tabList
end

function RankRewardCtrl:onRankDataUpdated(rankId)
	if self.rankId ~= rankId then
		return
	end

	self:refreshCurrentRank()
	self:refreshRewardList(self.view.listTab3thUList.selectedItem)
end

function RankRewardCtrl:onRankTimeDataUpdated(data)
	local isCurrentTab = self.rankId == data.rankId and self.tab1 == data.tab1 and self.tab2 == data.tab2

	if not isCurrentTab then
		return
	end

	local rankSetId = pg.game.rank:getCurrentRankId(self.rankId, self.tab1, self.tab2)

	if rankSetId ~= data.periodRankId then
		return
	end

	self:refreshCountdownByRankId(rankSetId, self.currentRewardIndex)
end

return RankRewardCtrl
