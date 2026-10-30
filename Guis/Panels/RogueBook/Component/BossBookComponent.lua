-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueBook\\Component\\BossBookComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local MessageName = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local RedDotConst = require("Const.RedDotConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local RandomBuffSeriesName = require("Data.random_buff_series_name")
local RogueConst = require("Const.RogueConst")
local BossBookComponent = Class.LightClass("BossBookComponent", UIComponent)

BossBookComponent.messages = {
	[MessageName.ROGUE_BOOK_BOSS_STATE_UPDATE] = {
		"onRogueBookBossStateUpdate",
		true
	}
}

function BossBookComponent:onCtor(info)
	self.selectBossMap = {}
end

function BossBookComponent:markRewardRefresh()
	self.rewardRefreshMark = true

	if self.rewardRefreshExpireTimer then
		self.ctrl:killTimer(self.rewardRefreshExpireTimer)
	end

	self.rewardRefreshExpireTimer = self.ctrl:startTimer(function()
		self.rewardRefreshMark = false
		self.rewardRefreshExpireTimer = nil
	end, 1)
end

function BossBookComponent:resetRewardRefreshMark()
	self.rewardRefreshMark = false

	if self.rewardRefreshExpireTimer then
		self.ctrl:killTimer(self.rewardRefreshExpireTimer)

		self.rewardRefreshExpireTimer = nil
	end
end

function BossBookComponent:refreshGetRewardRedDot()
	if self.btnGetUButton then
		local canGet = self.ctrl:checkBookCanGetReward(RogueConst.BookTypeId.Boss)

		self.btnGetUButton.interactable = canGet

		self.btnGetUButton:TryChangePage("button", canGet and 0 or 4)

		local path = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GET_REWARD, RogueConst.BookTypeId.Boss)

		pg.global.setRedDot(path, self.btnGetUButton, canGet, RedDotConst.RedDotStyle.REWARD)

		local key = canGet and "ROGUE_BOOK_FAST_GET_REWARD" or "Rogue_Week_Get_Reward_Tips"

		ClientTextUtils.setText(self.btnUSDFText, pg.getGameString(key))
	end
end

function BossBookComponent:refreshCurrentBookRedDot()
	self:refreshGetRewardRedDot()

	if self.buffSeries ~= nil then
		pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP, RogueConst.BookTypeId.Boss, self.buffSeries))
	end

	pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB, RogueConst.BookTypeId.Boss))
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.TOWER_BOOK)
end

function BossBookComponent:refreshOtherBookRedDot()
	if self.rewardRefreshTimer then
		self.ctrl:killTimer(self.rewardRefreshTimer)
	end

	self.rewardRefreshTimer = self.ctrl:startTimer(function()
		for _, seriesData in ipairs(self.model:getBuffSeries()) do
			pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP, RogueConst.BookTypeId.Boss, seriesData.buffSeries))
		end

		pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB, RogueConst.BookTypeId.Boss))
		pg.global.refreshRedDotState(RedDotConst.RedDotPath.TOWER_BOOK)

		self.rewardRefreshTimer = nil
	end, 0.2)
end

function BossBookComponent:findObjects()
	if IsNil(self.transform) then
		return
	end
end

function BossBookComponent:registerObjects()
	if IsNil(self.transform) then
		return
	end

	if not self.bossPanelLoad then
		return
	end

	local objectReference = self.uWidget.content:GetComponent("ObjectReference")

	self.rootComponent = objectReference:GetRefValue("rootComponent")
	self.lockBossUImage = objectReference:GetRefValue("lockBossUImage")
	self.picBossUImage = objectReference:GetRefValue("picBossUImage")
	self.btnLevel1UButton = objectReference:GetRefValue("btnLevel1UButton")
	self.btnLevel2UButton = objectReference:GetRefValue("btnLevel2UButton")
	self.btnLevel3UButton = objectReference:GetRefValue("btnLevel3UButton")
	self.btnLevel4UButton = objectReference:GetRefValue("btnLevel4UButton")
	self.bossUWidget = self.btnLevel1UButton.transform.parent:GetComponent("UWidget")
	self.vXMaskUImage = objectReference:GetRefValue("vXMaskUImage")
	self.vXLineInUImage = objectReference:GetRefValue("vXLineInUImage")
	self.vXBlueInUImage = objectReference:GetRefValue("vXBlueInUImage")
	self.panelRightUContainer = objectReference:GetRefValue("panelRightUContainer")

	self.panelRightUContainer:LoadDefaultUrlManually(function()
		self.isPanelRightLoaded = true

		self:registerRightObjects()
		self:initRightView()

		if self.transformData then
			self:showDetail(self.transformData)
		end
	end)

	self.slotList = {
		self.btnLevel1UButton,
		self.btnLevel2UButton,
		self.btnLevel3UButton,
		self.btnLevel4UButton
	}
end

function BossBookComponent:registerRightObjects()
	local objectReference = self.panelRightUContainer.content:GetComponent("ObjectReference")

	self.rightRootComponent = objectReference:GetRefValue("rootComponent")
	self.textTagUSDFText = objectReference:GetRefValue("textTagUSDFText")
	self.eventUSDFText = objectReference:GetRefValue("eventUSDFText")
	self.textBossUSDFText = objectReference:GetRefValue("textBossUSDFText")
	self.txtTitleUBaseText = objectReference:GetRefValue("txtTitleUBaseText")
	self.btnGetUButton = objectReference:GetRefValue("btnGetUButton")
	self.btnUSDFText = objectReference:GetRefValue("btnUSDFText")
	self.listFirstPassUList = objectReference:GetRefValue("listFirstPassUList")
	self.scrollRectRectTransform = objectReference:GetRefValue("scrollRect2RectTransform")
	self.detailUsdText = self.scrollRectRectTransform:Find("View/Content"):GetComponent("USDFText")

	self.rightRootComponent:TryChangePage("Tab", 2)
	ClientTextUtils.setText(self.txtTitleUBaseText, pg.getGameString("ROGUE_BOOK_FIRST_REWARD"))
	self:refreshGetRewardRedDot()

	self.detailUsdText.supportRichText = true
end

function BossBookComponent:initView()
	if not self.bossPanelLoad then
		return
	end

	self.bossMap = self.model:GetBossMap()
end

function BossBookComponent:initRightView()
	function self.listFirstPassUList.luaClick(button, data, navItem)
		local canGet = pg.me:checkCanGetRewardBoss(self.transformData.buffSeries, self.transformData.bossIndex)

		if canGet then
			if navItem then
				return
			end

			self:onClickBossReward(self.transformData)
		else
			if data.tIndex == 1 then
				return
			end

			LuaUIUtils.onRewardItemClick(button, data, nil, navItem)
		end
	end

	function self.btnGetUButton.luaClick()
		self:onClickGetReward()
	end
end

function BossBookComponent:loadContainer(bigTabDefaultOpen)
	if self.uWidget:CheckURLLoaded() then
		self:openDefaultSeries(bigTabDefaultOpen)
	else
		self.uWidget:LoadDefaultUrlManually(function()
			self.bossPanelLoad = true

			self:findObjects()
			self:registerObjects()
			self:initView()
			self:openDefaultSeries(bigTabDefaultOpen)
		end)
	end
end

function BossBookComponent:openPanel(bigTabDefaultOpen)
	self:resetRewardRefreshMark()
	self:loadContainer(bigTabDefaultOpen)
end

function BossBookComponent:onClickIndex(button, data)
	if self.preSelectButton then
		self.preSelectButton:TryChangePage("sel", 0)
	end

	button:TryChangePage("sel", 1)

	self.preSelectButton = button
	self.selectBossMap[self.buffSeries] = data.bossIndex

	self:showDetail(data)
end

function BossBookComponent:onClickGetReward()
	if not pg.me:checkBossBookCanGetReward() then
		pg.global.ui.tips:showTextTip(pg.getGameString("ROGUE_BOOK_NO_REWARDS_TIPS"))

		return
	end

	self:markRewardRefresh()
	pg.me:getGroupAll(RogueConst.BookTypeId.Boss)
end

function BossBookComponent:onClickBossReward(transformData)
	if not pg.me:checkCanGetRewardBoss(transformData.buffSeries, transformData.bossIndex) then
		pg.global.ui.tips:showTextTip(pg.getGameString("ROGUE_BOOK_NO_REWARDS_TIPS"))

		return
	end

	pg.me:getBossRewards(transformData.buffSeries, transformData.bossIndex)
end

function BossBookComponent:renderIndexItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local rootUComponent = objectReference:GetRefValue("rootUComponent")
	local textLockUSDFText = objectReference:GetRefValue("textLockUSDFText")
	local isUnlock = self:isBossIndexUnlock(data.buffSeries, data.bossIndex)

	rootUComponent:TryChangePage("Level", index - 1)
	rootUComponent:TryChangePage("Lock", isUnlock and 1 or 0)

	local itemPath = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP_ITEM, RogueConst.BookTypeId.Boss, data.buffSeries, data.bossIndex)

	pg.global.setRedDot(itemPath, button, pg.me and pg.me.checkCanGetRewardBoss and pg.me:checkCanGetRewardBoss(data.buffSeries, data.bossIndex), RedDotConst.RedDotStyle.REWARD)
	ClientTextUtils.setText(textLockUSDFText, pg.getGameString("ROGUE_BOOK_LOCK"))

	function button.luaClick(navItem)
		self:onClickIndex(button, data)
	end
end

function BossBookComponent:showDetail(transformData)
	self.transformData = transformData

	if not self.isPanelRightLoaded then
		return
	end

	local isBaseUnlock = self:isBossBaseUnlock(transformData.buffSeries)
	local isUnlock = self:isBossIndexUnlock(transformData.buffSeries, transformData.bossIndex)
	local tag = pg.getLocalizationText(RandomBuffSeriesName[transformData.buffSeries].buffSeriesName)

	ClientTextUtils.setText(self.textTagUSDFText, tag)

	if isBaseUnlock then
		ClientTextUtils.setText(self.textBossUSDFText, pg.getLocalizationText(transformData.transformCfg.transformName))

		if isUnlock then
			if transformData.bossIndex == 0 then
				ClientTextUtils.setText(self.eventUSDFText, pg.getGameString("ROGUE_BOOK_BOSS"))
				ClientTextUtils.setText(self.detailUsdText, pg.getLocalizationText(transformData.transformCfg.transformDesc))
			else
				ClientTextUtils.setText(self.eventUSDFText, pg.getLocalizationText(transformData.extraBuffCfg.buffName))

				local desc = string.gsub(pg.getLocalizationText(transformData.extraBuffCfg.buffDescFinal), "Hint_BgL", "Hint_BgD")

				ClientTextUtils.setText(self.detailUsdText, desc)
			end
		else
			ClientTextUtils.setText(self.eventUSDFText, pg.getGameString("ROGUE_BOOK_BOSS_TRANSFORM_UNKNOW"))
			ClientTextUtils.setText(self.detailUsdText, "???")
		end
	else
		ClientTextUtils.setText(self.textBossUSDFText, "")
		ClientTextUtils.setText(self.eventUSDFText, pg.getGameString("ROGUE_BOOK_BOSS_UNKNOW"))

		local countStr = string.format("<style=Hint_BgL>%d</style>", 3)
		local tagStr = string.format("<style=Hint_BgL>%s</style>", tag)

		ClientTextUtils.setText(self.detailUsdText, pg.getFormatText(pg.getGameString("ROGUE_BOOK_BOSS_UNLOCK_TIPS"), countStr, tagStr))
	end

	local hasGot = pg.me:isBossRewardGot(transformData.buffSeries, transformData.bossIndex)

	LuaUIUtils.setRewardListByDropIdWithoutClick(self.listFirstPassUList, transformData.rewardId, 4, hasGot, nil, nil, nil, function(button, index, rewardData)
		self:setRewardItemRedDot(button, index, rewardData, transformData)
	end)
end

function BossBookComponent:setRewardItemRedDot(button, index, rewardData, transformData)
	button:ClearRedDot()

	if rewardData.tIndex == 1 then
		return
	end

	local itemPath = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP_ITEM, RogueConst.BookTypeId.Boss, transformData.buffSeries, transformData.bossIndex)

	pg.global.setRedDot(itemPath, button, pg.me:checkCanGetRewardBoss(transformData.buffSeries, transformData.bossIndex), RedDotConst.RedDotStyle.REWARD)
end

function BossBookComponent:onRogueBookBossStateUpdate(data)
	self:refreshGetRewardRedDot()

	if not data then
		return
	end

	if self.rewardRefreshMark then
		self:refreshCurrentBookRedDot()
		self:refreshOtherBookRedDot()
	end

	if data.buffSeries ~= self.buffSeries or not self.transformList then
		return
	end

	for index, transformData in ipairs(self.transformList) do
		local button = self.slotList[index]

		if button then
			self:renderIndexItem(button, index, transformData)
		end
	end

	if self.transformData then
		self:showDetail(self.transformData)
	end
end

function BossBookComponent:changeSeries(buffSeries, defaultOpen)
	self:resetRewardRefreshMark()

	if self.rootComponent then
		self.rootComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
	end

	self.buffSeries = buffSeries
	self.bossMap = self.model:GetBossMap()
	self.transformList = self.bossMap[buffSeries].bossList

	for i, button in ipairs(self.slotList) do
		local data = self.transformList[i]

		self:renderIndexItem(button, i, data)
	end

	local isBaseUnlock = self:isBossBaseUnlock(buffSeries)

	self.rootComponent:TryChangePage("Lock", isBaseUnlock and 1 or 0)

	local bookCfg = self.transformList[1].bookCfg

	self.picBossUImage.url = bookCfg.icon
	self.vXMaskUImage.url = bookCfg.icon
	self.vXLineInUImage.url = bookCfg.icon
	self.vXBlueInUImage.url = bookCfg.icon
	self.lockBossUImage.url = bookCfg.icon

	local selectBossIndex = self.selectBossMap[buffSeries]
	local index = 1

	if defaultOpen then
		for i, transformData in ipairs(self.transformList) do
			if pg.me and pg.me.checkCanGetRewardBoss and pg.me:checkCanGetRewardBoss(transformData.buffSeries, transformData.bossIndex) then
				selectBossIndex = transformData.bossIndex
				index = i

				break
			end
		end
	end

	local selectData = self.transformList[1]

	for i, transformData in ipairs(self.transformList) do
		if transformData.bossIndex == selectBossIndex then
			selectData = transformData
			index = i

			break
		end
	end

	self.selectBossMap[buffSeries] = selectData.bossIndex

	local selectButton = self.slotList[index]

	self.bossUWidget:SetNavGroupDefaultItem(selectButton)

	if self._defaultBossFocusTimerId then
		self:killTimer(self._defaultBossFocusTimerId)

		self._defaultBossFocusTimerId = nil
	end

	if pg.game.input:isUsingGamepad() and pg.global.navMgr then
		self._defaultBossFocusTimerId = self:startTimer(function()
			self._defaultBossFocusTimerId = nil

			local focusSuccess = pg.global.navMgr:FocusItem(selectButton)

			if not focusSuccess then
				self:onClickIndex(selectButton, selectData)
			end
		end, 0.1)
	else
		self:onClickIndex(selectButton, selectData)
	end

	self:refreshGetRewardRedDot()
end

function BossBookComponent:getFirstRewardBossSeries()
	local bossMap = self.model:GetBossMap()

	for _, seriesData in ipairs(self.model:getBuffSeries()) do
		local seriesBossData = bossMap[seriesData.buffSeries]

		for _, transformData in ipairs(seriesBossData and seriesBossData.bossList or {}) do
			if pg.me and pg.me.checkCanGetRewardBoss and pg.me:checkCanGetRewardBoss(transformData.buffSeries, transformData.bossIndex) then
				return seriesData.buffSeries
			end
		end
	end

	return 0
end

function BossBookComponent:openDefaultSeries(bigTabDefaultOpen)
	local buffSeries = 0

	if bigTabDefaultOpen then
		buffSeries = self:getFirstRewardBossSeries()
	end

	self.ctrl.selectBuffSeries = buffSeries

	self.view.listBuffTypeUList:SelectItem(buffSeries)
	self:changeSeries(buffSeries, bigTabDefaultOpen)
end

function BossBookComponent:isBossBaseUnlock(buffSeries)
	return pg.me:isBossUnlock(buffSeries, 0)
end

function BossBookComponent:isBossIndexUnlock(buffSeries, index)
	return pg.me:isBossUnlock(buffSeries, index)
end

function BossBookComponent:onDestroy()
	if self._defaultBossFocusTimerId then
		self:killTimer(self._defaultBossFocusTimerId)

		self._defaultBossFocusTimerId = nil
	end
end

return BossBookComponent
