-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RankBase\\RankBaseCtrl.lua

local CallbackHandler = require("Core.Common.CallbackHandler")
local MessageName = require("Const.MessageName")
local UIConst = require("Const.UIConst")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local RankBaseInfoComponent = require("Guis.Panels.RankBase.Component.RankBaseInfoComponent")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local RankConst = require("Common.Const.RankConst")
local PlatformFriendListService = require("SDK.Platform.PlatformFriendListService")
local ClientTextUtils = require("Utils.ClientTextUtils")
local TimeUtils = require("Common.Utils.TimeUtils")
local LocalizedDateTimeUtils = require("Utils.LocalizedDateTimeUtils")
local LoggerManager = require("Core.Log.LoggerManager")
local TimerManager = require("Core.Timer.TimerManager")
local Time = require("Core.Common.Time")
local logger = LoggerManager.getLogger("RankBaseCtrl")
local RankBaseCtrl = Class.LightClass("RankBaseCtrl", UICtrl)

RankBaseCtrl.messages = {
	[MessageName.RANK_DATA_UPDATED] = {
		"onRankDataUpdated",
		true
	},
	[MessageName.RANK_TIME_DATA_UPDATED] = {
		"onRankTimeDataUpdated",
		true
	},
	[MessageName.SELF_RANK_DATA_UPDATED] = {
		"onSelfRankDataUpdated",
		true
	},
	[MessageName.RANK_TAB_MAPPING_UPDATED] = {
		"onRankTabMappingUpdated",
		true
	},
	[MessageName.LOGIC_TIME_UPDATE] = {
		"update",
		true
	}
}

local FILTER_TYPE_ALL = 1
local FILTER_TYPE_FRIEND_ONLY = 2
local RANK_STATE = {
	ENDED = "ENDED",
	ONGOING = "ONGOING",
	NOT_OPEN = "NOT_OPEN"
}
local WORLD_RACING_RANK_ID = WorldRaceDungeonConst.Rank.rankId
local RANKING_IN_PROGRESS_TEXT_KEY = "OPEN_WORLD_RACING_RANKING_IN_PROGRESS"
local RANKING_ENDED_TEXT_KEY = "FINISHED"
local RANKING_NOT_OPEN_TEXT_KEY = "RANK_NOT_OPEN"
local FILTER_OPTIONS = {
	{
		textKey = "ALL",
		tIndex = 0,
		filterType = FILTER_TYPE_ALL
	},
	{
		textKey = "RANK_FILTER_FRIEND_ONLY",
		tIndex = 0,
		filterType = FILTER_TYPE_FRIEND_ONLY
	}
}

local function getLeftTabGroupKey(data)
	return tostring(data.rankId) .. ":" .. tostring(data.tab1)
end

function RankBaseCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.rankInfoComponent = RankBaseInfoComponent.new(self)
end

function RankBaseCtrl:addListener()
	UICtrl.addListener(self)

	function self.view.btnBackUButton.luaClick()
		self:close()
	end

	function self.view.btnRewardUButton.luaClick()
		self:openRankReward()
	end

	function self.view.btnFilterUButton.luaClick()
		self:openRankFilter()
	end

	function self.view.btnInfoUButton.luaRenderTooltip(_, tooltip)
		self.rankInfoComponent:renderRankInfoTooltip(tooltip)
	end

	self:initGamepadNavigation()

	function self.view.listLeftTabUList.luaRenderItem(button, _, data)
		self:renderLeftTabItem(button, data)
	end

	function self.view.listRankingUList.luaRenderItem(button, index, data)
		self.rankInfoComponent:renderRankItem(button, index, data, self:isRankDataSelf(data))
	end
end

function RankBaseCtrl:initGamepadNavigation()
	TimerManager.addNextFrameCb(function()
		if not self.isDestroyed and self.view and not IsNil(self.view.btnInfoUButton) then
			self.view.btnInfoUButton:SetHotkeyConsoleBar("CONSOLE_BAR_RULES_DESCRIPTION", 0)
		end
	end)
	self:bindHotKeyPerform("Raw/GamepadButtonEast", function()
		return self:handleLeftTabBack()
	end, self.view.gameObject)
	self:addNavFocusListener(function()
		self:refreshConsoleBarState()
	end, "Ranking")
end

function RankBaseCtrl:refreshConsoleBarState()
	local navManager = CS.XGUI.Navigation.NavManager.Instance

	if not navManager then
		return
	end

	local focusedItem = navManager.CurrentFocusedUContent
	local focusedData = not IsNil(focusedItem) and focusedItem.dataFromUList
	local isInOptionGroup = navManager.CurrentFocusedGroupName == "ListLeftTab" and focusedData ~= nil and focusedItem.gameObject.name == "UI_Node_RankingTab_OptionGroup(Clone)" and #focusedData.secondTabList > 0

	CS.XGUI.Navigation.ConsoleBar.SetStateForAll("Ranking_isInOptionGroup", isInOptionGroup)
	CS.XGUI.Navigation.ConsoleBar.SetStateForAll("Ranking_isOutsideOptionGroup", not isInOptionGroup)
end

function RankBaseCtrl:focusLeftTabCell(groupButton, listUList, selectedTab2)
	local cellButtons = listUList:GetAllButtons()
	local navManager = CS.XGUI.Navigation.NavManager.Instance

	if not cellButtons or cellButtons.Length == 0 or not navManager then
		return false
	end

	local targetButton = cellButtons[0]

	for i = 0, cellButtons.Length - 1 do
		local button = cellButtons[i]
		local buttonData = button.dataFromUList

		if buttonData and buttonData.tab2 == selectedTab2 then
			targetButton = button

			break
		end
	end

	self:setLeftTabNavigationMode(groupButton)

	return navManager:FocusItem(targetButton)
end

function RankBaseCtrl:focusDefaultLeftTabCell()
	local groupButtons = self.view.listLeftTabUList:GetAllButtons()
	local navManager = CS.XGUI.Navigation.NavManager.Instance
	local firstGroupButton = groupButtons and groupButtons.Length > 0 and groupButtons[0]

	if IsNil(firstGroupButton) or not navManager then
		self:setLeftTabNavigationMode(nil)

		return
	end

	local listUList = firstGroupButton:GetComponent("ObjectReference"):GetRefValue("listUList")

	if not self:focusLeftTabCell(firstGroupButton, listUList) then
		self:setLeftTabNavigationMode(nil)
		navManager:FocusItem(firstGroupButton)
	end
end

function RankBaseCtrl:setLeftTabNavigationMode(activeParentButton)
	local navigateCells = not IsNil(activeParentButton)

	self.activeLeftTabOptionGroupButton = navigateCells and activeParentButton or nil

	local groupButtons = self.view.listLeftTabUList:GetAllButtons()

	local function updateOptionCells()
		for secondButton, parentButton in pairs(self.optionCellParentButtons) do
			if not IsNil(secondButton) then
				secondButton.navForceNonInteractable = not navigateCells or not IsNil(activeParentButton) and parentButton ~= activeParentButton
			end
		end
	end

	local function updateOptionGroups()
		if not groupButtons then
			return
		end

		for i = 0, groupButtons.Length - 1 do
			groupButtons[i].navForceNonInteractable = navigateCells
		end
	end

	if navigateCells then
		updateOptionCells()
		updateOptionGroups()
	else
		updateOptionGroups()
		updateOptionCells()
	end
end

function RankBaseCtrl:handleLeftTabBack()
	local navManager = CS.XGUI.Navigation.NavManager.Instance

	if not navManager or navManager.CurrentFocusedGroupName ~= "ListLeftTab" then
		return true
	end

	local focusedItem = navManager.CurrentFocusedUContent

	if IsNil(focusedItem) or focusedItem.gameObject.name ~= "UI_Node_RankingTab_OptionCell(Clone)" then
		return true
	end

	local parentButton = self.optionCellParentButtons[focusedItem]

	if IsNil(parentButton) then
		return false
	end

	self:setLeftTabNavigationMode(nil)

	if not navManager:FocusItem(parentButton) then
		self:setLeftTabNavigationMode(parentButton)
	end

	return false
end

function RankBaseCtrl:toggleLeftTabOptionGroup(button, data, listUList, selectedTab2)
	local groupKey = getLeftTabGroupKey(data)
	local shouldExpand = self.expandedLeftTabGroupKey ~= groupKey

	self.expandedLeftTabGroupKey = shouldExpand and groupKey or nil

	local groupButtons = self.view.listLeftTabUList:GetAllButtons()

	if groupButtons then
		for i = 0, groupButtons.Length - 1 do
			local groupButton = groupButtons[i]

			if groupButton ~= button then
				local objectReference = groupButton:GetComponent("ObjectReference")
				local groupListUList = objectReference:GetRefValue("listUList")

				groupListUList:SetActive(false)
			end
		end
	end

	listUList:SetActive(shouldExpand)

	if shouldExpand then
		self:focusLeftTabCell(button, listUList, selectedTab2)
	end

	return shouldExpand
end

function RankBaseCtrl:isWorldRacingRank(data)
	data = data or self.currentRankTabData

	return data ~= nil and data.rankId == WORLD_RACING_RANK_ID
end

function RankBaseCtrl:getRankTabStatus(data)
	if data == nil then
		logger:error("RankBaseCtrl.getRankTabStatus data is nil")

		return nil
	end

	if not self:isWorldRacingRank(data) then
		return {
			state = RANK_STATE.ONGOING
		}
	end

	local currentRankId = pg.game.rank:getCurrentRankId(data.rankId, data.tab1, data.tab2)
	local previousRankId = pg.game.rank:getPreviousRankId(data.rankId, data.tab1, data.tab2)
	local config = self.model:getRankConfig(data.rankId, data.tab1, data.tab2)
	local now = PlatformFriendListService.getNow()
	local openTime = currentRankId and pg.game.rank:getRankOpenTime(currentRankId)

	if openTime == nil and config.openTime ~= nil and pg.me ~= nil then
		local area = pg.me.serverArea

		openTime = config.openTime[area] or config.openTime[tostring(area)]
	end

	local closeTime = currentRankId and pg.game.rank:getRankCloseTime(currentRankId)
	local state = RANK_STATE.ONGOING

	if openTime ~= nil and now < openTime then
		state = RANK_STATE.NOT_OPEN
	elseif currentRankId == nil and previousRankId ~= nil then
		state = RANK_STATE.ENDED
	elseif closeTime ~= nil and closeTime > 0 and closeTime <= now then
		state = RANK_STATE.ENDED
	end

	return {
		state = state,
		currentRankId = currentRankId,
		previousRankId = previousRankId,
		openTime = openTime,
		closeTime = closeTime
	}
end

function RankBaseCtrl:getRankDateRangeText(data)
	local config = self.model:getRankConfig(data.rankId, data.tab1, data.tab2)
	local configPath = string.format("rank_base_data[%s][%s][%s]", data.rankId, data.tab1, data.tab2)

	if config == nil then
		logger:error("%s: missing rank config", configPath)

		return nil
	end

	if config.openType ~= RankConst.OpenType.FixedTime or config.closeType ~= RankConst.CloseType.FixedTime then
		logger:error("%s openType=%s closeType=%s: racing date range requires fixed opening and closing times", configPath, tostring(config.openType), tostring(config.closeType))

		return nil
	end

	local area = tostring(pg.me.serverArea)
	local openTime = config.openTime and config.openTime[area]

	if openTime == nil or openTime <= 0 then
		logger:error("%s openTime[%s]: missing or non-positive timestamp", configPath, area)

		return nil
	end

	local closeTime = config.closeTime and config.closeTime[area]

	if closeTime == nil or closeTime <= 0 then
		logger:error("%s closeTime[%s]: missing or non-positive timestamp", configPath, area)

		return nil
	end

	if closeTime <= openTime then
		logger:error("%s closeTime[%s]: closing time must be later than openTime[%s]", configPath, area, area)

		return nil
	end

	local openDate = LocalizedDateTimeUtils.format(TimeUtils.getAreaDateTable(openTime), "date", nil, ".")
	local closeDate = LocalizedDateTimeUtils.format(TimeUtils.getAreaDateTable(closeTime), "date", nil, ".")

	return openDate .. "-" .. closeDate
end

function RankBaseCtrl:refreshRankSchedule(status)
	if not self:isWorldRacingRank() then
		return false
	end

	local container = self.view.rankScheduleUContainer

	if IsNil(container) then
		logger:error("RankBaseCtrl.rankScheduleUContainer is missing from ObjectReference")

		return false
	end

	if status ~= nil and self.selectedPeriodRankId ~= nil and status.currentRankId ~= nil and self.selectedPeriodRankId ~= status.currentRankId then
		status = {
			state = RANK_STATE.ENDED,
			currentRankId = status.currentRankId,
			previousRankId = status.previousRankId,
			closeTime = pg.game.rank:getRankCloseTime(self.selectedPeriodRankId)
		}
	end

	local visible = status ~= nil and status.state ~= RANK_STATE.NOT_OPEN
	local stateKey = visible and table.concat({
		tostring(status.state),
		tostring(status.closeTime),
		tostring(self.selectedPeriodRankId)
	}, "|") or "HIDDEN"

	if self.rankScheduleStateKey == stateKey then
		return false
	end

	self.rankScheduleStateKey = stateKey

	container.gameObject:SetActiveEx(visible)

	if not visible then
		return true
	end

	if not container:CheckURLLoaded() then
		if self.rankScheduleLoading then
			return true
		end

		self.rankScheduleLoading = true

		container:LoadDefaultUrlManually(function()
			self.rankScheduleLoading = nil

			if not self.isDestroyed then
				self.rankScheduleStateKey = nil

				self:refreshRankSchedule(self:getRankTabStatus(self.currentRankTabData))
			end
		end)

		return true
	end

	local content = container.content
	local objectReference

	if not IsNil(content) then
		objectReference = content:GetComponent("ObjectReference")
	end

	if IsNil(objectReference) then
		logger:error("RankBaseCtrl racing rank schedule ObjectReference is missing")

		return true
	end

	local text = objectReference:GetRefValue(status.state == RANK_STATE.ENDED and "textUSDFText" or "txtTitleUSDFText")
	local countDown = objectReference:GetRefValue("countDownUCountDown")
	local widget = objectReference:GetRefValue("uINodeRankingWorldRacingUWidget")

	if IsNil(text) or IsNil(countDown) or IsNil(widget) then
		logger:error("RankBaseCtrl racing rank schedule ObjectReference is incomplete")

		return true
	end

	widget:TryChangePage("State", status.state == RANK_STATE.ENDED and "over" or "play")

	local textKey = status.state == RANK_STATE.ENDED and RANKING_ENDED_TEXT_KEY or RANKING_IN_PROGRESS_TEXT_KEY

	ClientTextUtils.setText(text, pg.getGameString(textKey))

	countDown.luaFinished = nil

	countDown:Stop()

	local dateText = objectReference:GetRefValue("txtTimeUSDFText")

	if IsNil(dateText) then
		countDown:SetActive(false)
		logger:error("RankBaseCtrl UI_Node_Ranking_WorldRacing.prefab ObjectReference key=txtTimeUSDFText is missing")

		return true
	end

	local dateRangeText = self:getRankDateRangeText(self.currentRankTabData)

	countDown:SetActive(dateRangeText ~= nil)
	dateText.gameObject:SetActiveEx(dateRangeText ~= nil)

	if dateRangeText ~= nil then
		ClientTextUtils.setText(dateText, dateRangeText)
	end

	return true
end

function RankBaseCtrl:refreshRankTabState(button, data, objectReference)
	if data.rankId ~= WORLD_RACING_RANK_ID then
		button.interactable = true
		button.visualInteractable = true

		return
	end

	local tag = objectReference:GetRefValue("racingTagUContainer")
	local lock = objectReference:GetRefValue("lockUContainer")

	if IsNil(tag) or IsNil(lock) then
		logger:error("RankBaseCtrl racing rank tab ObjectReference is incomplete")

		return
	end

	local statusData = data.secondTabList ~= nil and #data.secondTabList > 0 and self:getRestoredSecondTabData(data) or data
	local status = self:getRankTabStatus(statusData)

	if status == nil then
		return
	end

	local isLocked = status.state == RANK_STATE.NOT_OPEN

	button.interactable = true
	button.visualInteractable = not isLocked

	tag.gameObject:SetActiveEx(status.state == RANK_STATE.ONGOING)
	lock.gameObject:SetActiveEx(isLocked)

	if status.state == RANK_STATE.ONGOING and not tag:CheckURLLoaded() then
		tag:LoadDefaultUrlManually()
	elseif isLocked then
		lock:LoadDefaultUrlManually(function(content)
			if IsNil(content) then
				logger:error("RankBaseCtrl UI_Com_Lock.prefab failed to load, rankId=%s tab1=%s tab2=%s", data.rankId, data.tab1, data.tab2)

				return
			end

			content:TryChangePage("Lock", "lock", true)
		end)
	end
end

function RankBaseCtrl:openRankFilter()
	pg.global.ui:open(UIConst.UI_ID_RANK_FILTER, {
		filterOptions = FILTER_OPTIONS,
		allFilterType = FILTER_TYPE_ALL,
		selectedFilterTypes = self.selectedFilterTypes,
		onFiltersSelected = CallbackHandler(self, "onRankFiltersSelected")
	})
end

function RankBaseCtrl:onRankFiltersSelected(filterTypes)
	self.selectedFilterTypes = filterTypes

	self:refreshRankList()
end

function RankBaseCtrl:openRankReward()
	local data = self.currentRankTabData
	local config = self.model:getRankConfig(data.rankId, data.tab1, data.tab2)

	pg.global.ui:open(UIConst.UI_ID_RANK_REWARD, {
		rankId = data.rankId,
		tab1 = data.tab1,
		tab2 = data.tab2,
		rewardIds = config.rewardId
	})
end

function RankBaseCtrl:onRankTabSelected(data)
	local status = self:getRankTabStatus(data)

	if status ~= nil and status.state == RANK_STATE.NOT_OPEN then
		pg.global.showBubbleMessageRaw(pg.getGameString(RANKING_NOT_OPEN_TEXT_KEY))

		return
	end

	local currentData = self.currentRankTabData
	local isSameSelection = currentData ~= nil and currentData.rankId == data.rankId and currentData.tab1 == data.tab1 and currentData.tab2 == data.tab2

	if isSameSelection then
		return
	end

	if self.isRankListEmpty == false then
		self.view.widget:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
	end

	self:refreshSelectedRank(data)
	self.view.listLeftTabUList:RefreshList()
	self.view.listLeftTabUList:GoToIndex(0)
end

function RankBaseCtrl:refreshSelectedRank(data)
	local config = self.model:getRankConfig(data.rankId, data.tab1, data.tab2)

	self.selectedSecondTabDataByGroupKey[getLeftTabGroupKey(data)] = data
	self.currentRankTabData = data
	self.selectedPeriodRankId = pg.game.rank:getCurrentRankId(data.rankId, data.tab1, data.tab2)

	self.rankInfoComponent:refreshUI(config, data)

	self.rankRefreshPending = true
	self.rankScheduleStateKey = nil

	self:refreshRankSchedule(self:getRankTabStatus(data))
	self:refreshCountdownByRankId(self.selectedPeriodRankId)
	self:update()
end

function RankBaseCtrl:refreshCountdownByRankId(rankSetId)
	local countDown = self.view.countDownUCountDown

	countDown.luaFinished = nil

	countDown:Stop()
	countDown:SetActive(false)

	if self:isWorldRacingRank() then
		return
	end

	if rankSetId == nil or rankSetId == "" then
		return
	end

	local resetTime = pg.game.rank:getRankResetTime(rankSetId)
	local closeTime = pg.game.rank:getRankCloseTime(rankSetId)
	local isClose = resetTime == closeTime
	local endTime = isClose and closeTime or resetTime
	local now = PlatformFriendListService.getNow()
	local remainTime = endTime and endTime - now

	if not remainTime or remainTime <= 0 then
		return
	end

	local formatKey = isClose and "RANK_CLOSE_COUNTDOWN" or "RANK_RESET_COUNTDOWN"

	countDown.formatText = pg.getGameString(formatKey)

	function countDown.luaFinished()
		countDown:SetActive(false)
	end

	countDown:SetActive(true)
	countDown:Play(remainTime)
end

function RankBaseCtrl:onRankPeriodSelected(periodRankId)
	if self.selectedPeriodRankId == periodRankId then
		return
	end

	self.selectedPeriodRankId = periodRankId
	self.rankRefreshPending = true
	self.rankScheduleStateKey = nil

	self:refreshRankSchedule(self:getRankTabStatus(self.currentRankTabData))
	self:refreshCountdownByRankId(periodRankId)
	self:update()
end

function RankBaseCtrl:update()
	local tabData = self.currentRankTabData

	if tabData == nil then
		return
	end

	local status = self:getRankTabStatus(tabData)
	local scheduleChanged = self:refreshRankSchedule(status)

	if scheduleChanged and self:isWorldRacingRank() then
		self.view.listLeftTabUList:RefreshList()
	end

	if self:isWorldRacingRank() and status ~= nil and status.state == RANK_STATE.NOT_OPEN then
		if self.rankRefreshPending then
			self.rankRefreshPending = nil

			self:refreshRankList()
		end

		return
	end

	local config = self.model:getRankConfig(tabData.rankId, tabData.tab1, tabData.tab2)

	pg.game.rank:refreshRankDataIfNeeded(tabData.rankId, tabData.tab1, tabData.tab2, config, self.selectedPeriodRankId)

	if not self.rankRefreshPending then
		return
	end

	self.rankRefreshPending = nil

	self:refreshRankList()
end

function RankBaseCtrl:refreshRankList()
	local tabData = self.currentRankTabData
	local status = self:getRankTabStatus(tabData)
	local rankData = pg.game.rank:getCachedRankData(tabData.rankId, tabData.tab1, tabData.tab2, self.selectedPeriodRankId)
	local config = self.model:getRankConfig(tabData.rankId, tabData.tab1, tabData.tab2)

	if status ~= nil and status.state == RANK_STATE.NOT_OPEN then
		rankData = {}
	end

	local displayData = self:getFilteredRankData(rankData, config.displayList)

	self.isRankListEmpty = #displayData == 0

	self.view.listRankingUList:SetList(displayData)
	self.view.widget:TryChangePage("IsEmpty", self.isRankListEmpty and 1 or 0)
	self.rankInfoComponent:setSelfRankData(status ~= nil and status.state ~= RANK_STATE.NOT_OPEN and pg.game.rank:getCachedSelfRankData(tabData.rankId, tabData.tab1, tabData.tab2, self.selectedPeriodRankId) or nil)
end

function RankBaseCtrl:getFilteredRankData(rankData, displayList)
	local filteredData = {}
	local selfInList = false

	for _, data in ipairs(rankData) do
		local isSelf = self:isRankDataSelf(data)

		if self:isRankDataVisible(data, displayList) and (not isSelf or not selfInList) then
			filteredData[#filteredData + 1] = data
			selfInList = selfInList or isSelf
		end
	end

	return filteredData
end

function RankBaseCtrl:isRankDataSelf(rankData)
	return pg.me ~= nil and pg.game.rank:isMemberRankData(rankData, pg.me.uid)
end

function RankBaseCtrl:isRankDataVisible(rankData, displayList)
	if rankData.Rank < 1 or displayList < rankData.Rank then
		return false
	end

	if self.selectedFilterTypes[FILTER_TYPE_ALL] == true then
		return true
	end

	return self.selectedFilterTypes[FILTER_TYPE_FRIEND_ONLY] == true and self.rankInfoComponent:isFriendRankData(rankData)
end

function RankBaseCtrl:onRankDataUpdated(rankId)
	if self.currentRankTabData.rankId ~= rankId then
		return
	end

	self.rankRefreshPending = true

	self:update()
end

function RankBaseCtrl:onRankTimeDataUpdated(data)
	local tabData = self.currentRankTabData
	local isCurrentTab = tabData ~= nil and tabData.rankId == data.rankId and tabData.tab1 == data.tab1 and tabData.tab2 == data.tab2

	if not isCurrentTab then
		return
	end

	if self.selectedPeriodRankId ~= data.periodRankId then
		return
	end

	self.rankScheduleStateKey = nil

	local scheduleChanged = self:refreshRankSchedule(self:getRankTabStatus(tabData))

	if scheduleChanged and self:isWorldRacingRank() then
		self.view.listLeftTabUList:RefreshList()
	end

	self:refreshCountdownByRankId(data.periodRankId)
end

function RankBaseCtrl:onRankTabMappingUpdated(mappingData)
	local tabData = self.currentRankTabData
	local currentTabMappingUpdated = tabData ~= nil and tabData.rankId == mappingData.rankId and tabData.tab1 == mappingData.tab1 and tabData.tab2 == mappingData.tab2

	if not currentTabMappingUpdated then
		return
	end

	self:refreshSelectedRank(tabData)
	self.view.listLeftTabUList:RefreshList()
end

function RankBaseCtrl:onSelfRankDataUpdated(rankId)
	local tabData = self.currentRankTabData

	if tabData ~= nil and tabData.rankId == rankId then
		self:refreshRankList()
	end
end

function RankBaseCtrl:renderLeftTabItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local listUList = objectReference:GetRefValue("listUList")
	local hasSecondTab = #data.secondTabList > 0
	local isSelected = self:isLeftTabSelected(data)
	local groupKey = getLeftTabGroupKey(data)
	local isExpanded = hasSecondTab and self.expandedLeftTabGroupKey == groupKey

	for secondButton, parentButton in pairs(self.optionCellParentButtons) do
		if parentButton == button then
			self.optionCellParentButtons[secondButton] = nil
		end
	end

	ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(data.textKey))

	button.interactable = true
	button.luaClick = nil
	button.isSelected = isSelected
	button.navForceNonInteractable = not IsNil(self.activeLeftTabOptionGroupButton)

	self:refreshRankTabState(button, data, objectReference)

	if hasSecondTab then
		function button.luaClick()
			if not button.visualInteractable then
				self:onRankTabSelected(self:getRestoredSecondTabData(data))

				return
			end

			local selectedSecondTabData = self:getRestoredSecondTabData(data)
			local shouldExpand = self:toggleLeftTabOptionGroup(button, data, listUList, selectedSecondTabData.tab2)

			if shouldExpand then
				self:onRankTabSelected(selectedSecondTabData)
			end
		end
	else
		function button.luaClick()
			self:onRankTabSelected(data)
		end
	end

	function listUList.luaRenderItem(secondButton, _, secondData)
		self.optionCellParentButtons[secondButton] = button

		self:renderSecondTabItem(secondButton, secondData)

		local activeParentButton = self.activeLeftTabOptionGroupButton

		secondButton.navForceNonInteractable = IsNil(activeParentButton) or button ~= activeParentButton
	end

	listUList.luaSelectedChanged = nil

	listUList:SetList(data.secondTabList)
	listUList:SetActive(isExpanded)
end

function RankBaseCtrl:getRestoredSecondTabData(data)
	return self.selectedSecondTabDataByGroupKey[getLeftTabGroupKey(data)] or data.secondTabList[1]
end

function RankBaseCtrl:isLeftTabSelected(data)
	local selectedData = self.currentRankTabData
	local isSelected = selectedData.rankId == data.rankId and selectedData.tab1 == data.tab1

	if #data.secondTabList == 0 then
		return isSelected and selectedData.tab2 == data.tab2
	end

	return isSelected
end

function RankBaseCtrl:renderSecondTabItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local iconRankingUImage = objectReference:GetRefValue("iconRankingUImage")
	local rankConfig = self.model:getRankConfig(data.rankId, data.tab1, data.tab2)
	local isSelected = self:isSecondTabSelected(data)

	ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(data.textKey))

	iconRankingUImage.url = rankConfig.tabIcon2
	button.interactable = true

	function button.luaClick()
		if button.interactable then
			self:onRankTabSelected(data)
		end
	end

	button.isSelected = isSelected
end

function RankBaseCtrl:isSecondTabSelected(data)
	local selectedData = self.currentRankTabData

	return selectedData.rankId == data.rankId and selectedData.tab1 == data.tab1 and selectedData.tab2 == data.tab2
end

function RankBaseCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.selectedFilterTypes = {
		[FILTER_TYPE_ALL] = true
	}
	self.selectedSecondTabDataByGroupKey = {}
	self.expandedLeftTabGroupKey = nil
	self.rankScheduleStateKey = nil
	self.rankScheduleLoading = nil
	self.isRankListEmpty = nil
	self.optionCellParentButtons = {}
	self.activeLeftTabOptionGroupButton = nil

	self:refreshRankView(info.rankId)
	self:refreshConsoleBarState()
end

function RankBaseCtrl:onDestroy()
	self.view.countDownUCountDown.luaFinished = nil

	self.view.countDownUCountDown:Stop()

	if not IsNil(self.view.rankScheduleUContainer) then
		local content = self.view.rankScheduleUContainer.content
		local objectReference

		if not IsNil(content) then
			objectReference = content:GetComponent("ObjectReference")
		end

		local countDown

		if not IsNil(objectReference) then
			countDown = objectReference:GetRefValue("countDownUCountDown")
		end

		if not IsNil(countDown) then
			countDown.luaFinished = nil

			countDown:Stop()
		end
	end

	UICtrl.onDestroy(self)
end

function RankBaseCtrl:refreshRankView(rankId)
	local leftTabList, selectedData, tabCount = self.model:getRankTabData(rankId)
	local noTab = tabCount == 1

	self.expandedLeftTabGroupKey = getLeftTabGroupKey(selectedData)

	self.view.widget:TryChangePage("NoTab", noTab and 1 or 0)
	self:refreshSelectedRank(selectedData)
	self.view.listLeftTabUList:SetList(leftTabList)
	self:focusDefaultLeftTabCell()
end

return RankBaseCtrl
