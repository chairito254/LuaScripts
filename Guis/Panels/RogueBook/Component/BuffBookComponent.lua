-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueBook\\Component\\BuffBookComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local MessageName = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local RedDotConst = require("Const.RedDotConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local RandomBuffSeriesName = require("Data.random_buff_series_name")
local RogueConst = require("Const.RogueConst")
local BuffBookComponent = Class.LightClass("BuffBookComponent", UIComponent)

BuffBookComponent.messages = {
	[MessageName.ROGUE_BOOK_BUFF_STATE_UPDATE] = {
		"onRogueBookBuffStateUpdate",
		true
	}
}

function BuffBookComponent:onCtor(info)
	self.selectBuffMap = {}
end

function BuffBookComponent:markRewardRefresh()
	self.rewardRefreshMark = true

	if self.rewardRefreshExpireTimer then
		self.ctrl:killTimer(self.rewardRefreshExpireTimer)
	end

	self.rewardRefreshExpireTimer = self.ctrl:startTimer(function()
		self.rewardRefreshMark = false
		self.rewardRefreshExpireTimer = nil
	end, 1)
end

function BuffBookComponent:resetRewardRefreshMark()
	self.rewardRefreshMark = false

	if self.rewardRefreshExpireTimer then
		self.ctrl:killTimer(self.rewardRefreshExpireTimer)

		self.rewardRefreshExpireTimer = nil
	end
end

function BuffBookComponent:refreshGetRewardRedDot()
	if self.btnGetUButton then
		local canGet = self.ctrl:checkBookCanGetReward(RogueConst.BookTypeId.Buff)

		self.btnGetUButton.interactable = canGet

		self.btnGetUButton:TryChangePage("button", canGet and 0 or 4)

		local path = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GET_REWARD, RogueConst.BookTypeId.Buff)

		pg.global.setRedDot(path, self.btnGetUButton, canGet, RedDotConst.RedDotStyle.REWARD)

		local key = canGet and "ROGUE_BOOK_FAST_GET_REWARD" or "Rogue_Week_Get_Reward_Tips"

		ClientTextUtils.setText(self.btnUSDFText, pg.getGameString(key))
	end
end

function BuffBookComponent:refreshCurrentBookRedDot()
	self:refreshGetRewardRedDot()

	if self.buffSeries ~= nil then
		pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP, RogueConst.BookTypeId.Buff, self.buffSeries))
	end

	pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB, RogueConst.BookTypeId.Buff))
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.TOWER_BOOK)
end

function BuffBookComponent:refreshOtherBookRedDot()
	if self.rewardRefreshTimer then
		self.ctrl:killTimer(self.rewardRefreshTimer)
	end

	self.rewardRefreshTimer = self.ctrl:startTimer(function()
		for _, seriesData in ipairs(self.model:getBuffSeries()) do
			pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP, RogueConst.BookTypeId.Buff, seriesData.buffSeries))
		end

		pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB, RogueConst.BookTypeId.Buff))
		pg.global.refreshRedDotState(RedDotConst.RedDotPath.TOWER_BOOK)

		self.rewardRefreshTimer = nil
	end, 0.2)
end

function BuffBookComponent:findObjects()
	if IsNil(self.transform) then
		return
	end
end

function BuffBookComponent:registerObjects()
	if not self.isRightLoaded then
		return
	end

	local objectReference = self.view.panelRightUContainer.content:GetComponent("ObjectReference")

	self.rootComponent = objectReference:GetRefValue("rootComponent")
	self.skillIconUImage = objectReference:GetRefValue("skillIconUImage")
	self.buffIconUImage = objectReference:GetRefValue("buffIconUImage")
	self.levelRectTransform = objectReference:GetRefValue("levelRectTransform")
	self.textTtileUSDFText = objectReference:GetRefValue("textTtileUSDFText")
	self.textDetailLockUSDFText = objectReference:GetRefValue("textDetailLockUSDFText")
	self.txtTitleUBaseText = objectReference:GetRefValue("txtTitleUBaseText")
	self.btnGetUButton = objectReference:GetRefValue("btnGetUButton")
	self.btnUSDFText = objectReference:GetRefValue("btnUSDFText")
	self.listFirstPassUList = objectReference:GetRefValue("listFirstPassUList")
	self.scrollRectRectTransform = objectReference:GetRefValue("scrollRectRectTransform")
	self.buffBgUWidget = objectReference:GetRefValue("buffBgUWidget")
	self.detailDescUSDText = self.scrollRectRectTransform:Find("View/Content"):GetComponent("USDFText")

	self.rootComponent:TryChangePage("Tab", 0)
	ClientTextUtils.setText(self.txtTitleUBaseText, pg.getGameString("ROGUE_BOOK_FIRST_REWARD"))
	self:refreshGetRewardRedDot()
end

function BuffBookComponent:initView()
	local buffRarities = self.model:getBuffRarities()

	function self.view.listUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local rootComponent = objectReference:GetRefValue("rootComponent")
		local pointNumUSDFText = objectReference:GetRefValue("pointNumUSDFText")

		rootComponent:TryChangePage("Colour", data.buffRarity)

		local progress, total = self.model:getBuffProgressBySeriesAndColour(self.buffSeries or 0, data.buffRarity)

		ClientTextUtils.setText(pointNumUSDFText, string.format("%d/%d", progress, total))
	end

	self.view.listUList:SetList(buffRarities)

	function self.view.listPropUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local rootComponent = objectReference:GetRefValue("rootComponent")
		local skillIconUImage = objectReference:GetRefValue("skillIconUImage")
		local buffIconUImage = objectReference:GetRefValue("buffIconUImage")
		local levelRectTransform = objectReference:GetRefValue("levelRectTransform")
		local textLockUSDFText = objectReference:GetRefValue("textLockUSDFText")
		local textNameUBaseText = objectReference:GetRefValue("textNameUBaseText")
		local panelSelUContainer = objectReference:GetRefValue("panelSelUContainer")
		local buffBgUWidget = objectReference:GetRefValue("buffBgUWidget")

		if not panelSelUContainer:CheckURLLoaded() then
			panelSelUContainer:LoadDefaultUrlManually()
		end

		local showRedDot = pg.me:checkCanGetRewardBuff(data.buffId)
		local itemKey = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP_ITEM, RogueConst.BookTypeId.Buff, data.buffSeries, data.buffId)

		pg.global.setRedDot(itemKey, button, showRedDot, RedDotConst.RedDotStyle.REWARD)
		ClientTextUtils.setText(textNameUBaseText, pg.getLocalizationText(data.buffName))
		ClientTextUtils.setText(textLockUSDFText, pg.getGameString("ROGUE_BOOK_LOCK"))
		LuaUIUtils.setUIViewVisible(levelRectTransform, data.buffMaxLayer > 1)

		skillIconUImage.url = data.buffIcon or ""
		buffIconUImage.url = data.buffTagIcon or ""

		LuaUIUtils.setUIVisible(buffBgUWidget, not string.isNilOrEmpty(data.buffTagIcon))

		local isUnLock = pg.me:isBuffUnlock(data.buffId)

		rootComponent:TryChangePage("Level", data.buffLayer - 1)
		rootComponent:TryChangePage("Colour", self:getBuffColour(data.buffRarity, data.buffLayer))
		rootComponent:TryChangePage("cardStage", isUnLock and 0 or 1)
	end

	function self.view.listPropUList.luaClick(button, data, navItem)
		self:onClickBuff(data)
	end
end

function BuffBookComponent:initRightPanel()
	function self.btnGetUButton.luaClick()
		self:onClickGetReward()
	end
end

function BuffBookComponent:loadRightPanel()
	if not self.isRightLoaded then
		self.view.panelRightUContainer:LoadDefaultUrlManually(function()
			if self.isRightLoaded then
				return
			end

			self.isRightLoaded = true

			self:registerObjects()
			self:initRightPanel()
			self:showDetail(self.selectBuff)
		end)
	else
		self:showDetail(self.selectBuff)
	end
end

function BuffBookComponent:showBuffItem(objectRef, buffData)
	return
end

function BuffBookComponent:showDetail(buffData)
	self.selectBuff = buffData

	if not buffData or not self.isRightLoaded then
		return
	end

	if not self.rootComponent then
		return
	end

	local isUnLock = pg.me:isBuffUnlock(buffData.buffId)

	self.rootComponent:TryChangePage("Lock", isUnLock and 0 or 1)
	LuaUIUtils.setUIViewVisible(self.levelRectTransform, isUnLock and buffData.buffMaxLayer > 1)

	if isUnLock then
		self.skillIconUImage.url = buffData.buffIcon
		self.buffIconUImage.url = buffData.buffTagIcon

		LuaUIUtils.setUIViewVisible(self.buffBgUWidget, ToBool(buffData.buffTagIcon))

		local desc = string.gsub(pg.getLocalizationText(buffData.buffDescFinal), "Hint_BgL", "Hint_BgD")

		ClientTextUtils.setText(self.detailDescUSDText, desc)

		self.detailDescUSDText.enabledHyperlink = true

		function self.detailDescUSDText.luaOnHyperlinkClick(action, content, contentRect)
			if action == "" or action == nil then
				return
			end

			LuaUIUtils.clickHyperText(action, content, contentRect)
		end
	else
		ClientTextUtils.setText(self.textDetailLockUSDFText, "???\n")
	end

	ClientTextUtils.setText(self.textTtileUSDFText, pg.getLocalizationText(buffData.buffName))

	local hasGot = pg.me:isBuffRewardGot(buffData.buffId)

	LuaUIUtils.setRewardListByDropIdWithoutClick(self.listFirstPassUList, buffData.rewardId, 4, hasGot, nil, nil, nil, function(button, index, rewardData)
		self:setRewardItemRedDot(button, index, rewardData, buffData)
	end)

	function self.listFirstPassUList.luaClick(button, data, navItem)
		local canGet = pg.me:checkCanGetRewardBuff(buffData.buffId)

		if canGet then
			if navItem then
				return
			end

			self:onClickGetBuffReward(buffData)
		else
			if data.tIndex == 1 then
				return
			end

			LuaUIUtils.onRewardItemClick(button, data, nil, navItem)
		end
	end

	self.rootComponent:TryChangePage("Level", buffData.buffLayer - 1)
	self.rootComponent:TryChangePage("colour", self:getBuffColour(buffData.buffRarity, buffData.buffLayer))
end

function BuffBookComponent:setRewardItemRedDot(button, index, rewardData, buffData)
	button:ClearRedDot()

	if rewardData.tIndex == 1 then
		return
	end

	local itemPath = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP_ITEM, RogueConst.BookTypeId.Buff, buffData.buffSeries, buffData.buffId)

	pg.global.setRedDot(itemPath, button, pg.me:checkCanGetRewardBuff(buffData.buffId), RedDotConst.RedDotStyle.REWARD)
end

function BuffBookComponent:onRogueBookBuffStateUpdate(data)
	self:refreshGetRewardRedDot()

	if not data then
		return
	end

	if self.rewardRefreshMark then
		self:refreshCurrentBookRedDot()
		self:refreshOtherBookRedDot()
		self.view.listPropUList:RefreshList()

		if self.selectBuff then
			self:showDetail(self.selectBuff)
		end

		return
	end

	self:refreshCurrentBookRedDot()

	if not self.showBuffList then
		return
	end

	for index, buffData in ipairs(self.showBuffList) do
		if buffData.buffId == data.buffId then
			self.view.listPropUList:RefreshElement(index - 1)

			if self.selectBuff and self.selectBuff.buffId == data.buffId then
				self:showDetail(self.selectBuff)
			end

			return
		end
	end
end

function BuffBookComponent:onClickBuff(buffData)
	self.selectBuffMap[self.buffSeries] = buffData.buffId
	self.selectBuff = buffData

	self:showDetail(buffData)
end

function BuffBookComponent:onClickGetReward()
	if not pg.me:checkCanGetReward() then
		pg.global.ui.tips:showTextTip(pg.getGameString("ROGUE_BOOK_NO_REWARDS_TIPS"))

		return
	end

	self:markRewardRefresh()
	pg.me:getGroupAll(RogueConst.BookTypeId.Buff)
end

function BuffBookComponent:onClickGetBuffReward(buffData)
	if not pg.me:checkCanGetRewardBuff(buffData.buffId) then
		pg.global.ui.tips:showTextTip(pg.getGameString("ROGUE_BOOK_NO_REWARDS_TIPS"))

		return
	end

	pg.me:getBuffRewards(buffData.buffId)
end

function BuffBookComponent:getFirstRewardBuff(buffList)
	for _, buffData in ipairs(buffList or {}) do
		if pg.me and pg.me.checkCanGetRewardBuff and pg.me:checkCanGetRewardBuff(buffData.buffId) then
			return buffData
		end
	end

	return nil
end

function BuffBookComponent:getSelectedBuff(buffList)
	local buffId = self.selectBuffMap[self.buffSeries]

	if buffId then
		for _, buffData in ipairs(buffList or {}) do
			if buffData.buffId == buffId then
				return buffData
			end
		end
	end
end

function BuffBookComponent:selectBuffItem(buffData)
	if not buffData then
		return
	end

	for index, data in ipairs(self.showBuffList or {}) do
		if data.buffId == buffData.buffId then
			self.view.listPropUList:SelectItem(index - 1)

			return
		end
	end
end

function BuffBookComponent:changeSeries(buffSeries, defaultOpen)
	self:resetRewardRefreshMark()

	self.buffSeries = buffSeries

	local buffSeriesNameData = RandomBuffSeriesName[self.buffSeries]

	ClientTextUtils.setText(self.view.textTopTitleUSDFText, pg.getLocalizationText(buffSeriesNameData.buffSeriesName))
	self.view.listUList:SetList(self.model:getBuffRarities())

	self.buffMap = self.model:getBuffMap()
	self.showBuffList = self.buffMap[buffSeries] or {}

	self.view.listPropUList:SetList(self.showBuffList)

	if defaultOpen then
		self.selectBuff = self:getSelectedBuff(self.showBuffList) or self:getFirstRewardBuff(self.showBuffList) or self.showBuffList[1]
	else
		self.selectBuff = self.showBuffList[1]
	end

	self.view.tabSkillCardAnimation:Play("VX_Node_Tower_Collection_Panel_Skill_In")

	if self.selectBuff then
		self.selectBuffMap[buffSeries] = self.selectBuff.buffId
	end

	self:selectBuffItem(self.selectBuff)
	self:loadRightPanel()
	self:refreshGetRewardRedDot()
end

function BuffBookComponent:getBuffColour(buffRarity, buffLayer)
	return buffRarity == 2 and buffLayer == 3 and 3 or buffRarity
end

return BuffBookComponent
