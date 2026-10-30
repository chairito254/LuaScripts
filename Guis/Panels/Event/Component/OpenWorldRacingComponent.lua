-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Event\\Component\\OpenWorldRacingComponent.lua

local logger = require("Core.Log.LoggerManager").getLogger("OpenWorldRacingComponent")
local Class = require("Core.Framework.Class")
local EventContainerComponent = require("Guis.Panels.Event.Component.EventContainerComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local TimeUtils = require("Common.Utils.TimeUtils")
local Utils = require("Common.Utils.Utils")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local UIConst = require("Const.UIConst")
local EventWorldRacingData = require("Data.event_world_racing_data")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local NoticeDef = require("Common.NoticeDef")
local RedDotConst = require("Const.RedDotConst")
local OpenWorldRacingComponent = Class.LightClass("OpenWorldRacingComponent", EventContainerComponent)
local REWARD_PREVIEW_TEXT_KEY = "OPEN_WORLD_RACING_REWARD_PREVIEW"
local LIMITED_REWARD_TEXT_KEY = "OPEN_WORLD_RACING_LIMITED_REWARD"
local RANKING_TEXT_KEY = "OPEN_WORLD_RACING_RANKING"
local SINGLE_MODE_TEXT_KEY = "OPEN_WORLD_RACING_SINGLE_MODE"
local MULTI_MODE_TEXT_KEY = "OPEN_WORLD_RACING_MULTI_MODE"
local TRACK_ITEM_POOL_TEXT_KEY = "OPEN_WORLD_RACING_TRACK_ITEM_POOL"
local GOTO_TEXT_KEY = "OPEN_WORLD_RACING_GOTO"
local NOT_OPEN_TIME_TEXT_KEY = "MATCHING_OPENTIME"

function OpenWorldRacingComponent:findObjects()
	if not self:checkContentLoaded() then
		return
	end

	local content = self.refUContainer.content

	if IsNil(content) then
		logger:error("findObjects: container content is nil, url=%s", tostring(self.refUContainer.url))

		return
	end

	local objectReference = content:GetComponent("ObjectReference")

	if not objectReference and self.transform.childCount > 0 then
		objectReference = self.transform:GetChild(0):GetComponent("ObjectReference")
	end

	if not objectReference then
		logger:error("findObjects: ObjectReference not found, go=%s url=%s childCount=%s", content.gameObject.name, tostring(self.refUContainer.url), tostring(self.transform.childCount))

		self.refContainersLoaded = false
		self.listenerAdded = false

		return
	end

	self.backgroundUImage = objectReference:GetRefValue("backgroundUImage")
	self.btnSingleUButton = objectReference:GetRefValue("btnSingleUButton")
	self.btnMultipleUButton = objectReference:GetRefValue("btnMultipleUButton")
	self.btnJumpUButton = objectReference:GetRefValue("btnJumpUButton")
	self.btnGotoUButton = objectReference:GetRefValue("btnGotoUButton")
	self.eventTitleUContainer = objectReference:GetRefValue("eventTitleUContainer")
	self.btnRewardUButton = objectReference:GetRefValue("btnRewardUButton")
	self.btnRankingUButton = objectReference:GetRefValue("btnRankingUButton")
	self.singleModeText = objectReference:GetRefValue("btnSingleTxtNameUBaseText")
	self.multiModeText = objectReference:GetRefValue("btnMultipleTxtNameUBaseText")
	self.multiTimeText = objectReference:GetRefValue("btnMultipleTimeUBaseText")
	self.notOpenTimeText = objectReference:GetRefValue("notOpenTimeUBaseText")
	self.jumpText = objectReference:GetRefValue("btnJumpTxtNameUBaseText")
	self.gotoText = objectReference:GetRefValue("btnGotoTxtNameUBaseText")
	self.rewardButtonText = objectReference:GetRefValue("btnRewardTxtNameUBaseText")
	self.rankingButtonText = objectReference:GetRefValue("btnRankingTxtNameUBaseText")
	self.rewardPreviewText = objectReference:GetRefValue("txtRewardPreviewUBaseText")
	self.rewardListUList = objectReference:GetRefValue("listRewardUList")
	self.lockUWidget = objectReference:GetRefValue("lockUWidget")
	self.lockText = objectReference:GetRefValue("lockTxtLockUBaseText")
end

function OpenWorldRacingComponent:addListener()
	if self.btnSingleUButton then
		function self.btnSingleUButton.luaClick()
			self:setSelectedMode(WorldRaceDungeonConst.MODE.SINGLE)
		end
	end

	if self.btnMultipleUButton then
		function self.btnMultipleUButton.luaClick()
			self:setSelectedMode(WorldRaceDungeonConst.MODE.MULTI)
		end
	end

	if self.btnGotoUButton then
		function self.btnGotoUButton.luaClick()
			self:openTrackPanel()
		end
	end

	if self.btnJumpUButton then
		function self.btnJumpUButton.luaClick()
			pg.global.ui:open(UIConst.UI_ID_WORLD_RACING_PROP_DETAILS)
		end
	end

	if self.btnRewardUButton then
		function self.btnRewardUButton.luaClick()
			pg.global.ui:open(UIConst.UI_ID_WORLD_RACING_LIMITED_REWARD, {
				eventId = self.eventId
			})
		end
	end

	if self.btnRankingUButton then
		function self.btnRankingUButton.luaClick()
			pg.global.ui:open(UIConst.UI_ID_RANK_BASE, {
				rankId = WorldRaceDungeonConst.Rank.rankId
			})
		end
	end

	if self.rewardListUList then
		function self.rewardListUList.luaRenderItem(button, index, data)
			LuaUIUtils.renderRewards(button, index, data)
		end
	end
end

function OpenWorldRacingComponent:onBeforeRefreshPage()
	EventContainerComponent.onBeforeRefreshPage(self)

	self.is_rank_block = true
	self.activityConfig = EventWorldRacingData[self.eventPhase]
	self.selectedMode = self.selectedMode or WorldRaceDungeonConst.MODE.SINGLE
end

function OpenWorldRacingComponent:refreshPage()
	if not self.activityConfig then
		logger:error("refreshPage: config not found, phase=%s", tostring(self.eventPhase))

		return
	end

	if self.singleModeText then
		ClientTextUtils.setText(self.singleModeText, pg.getGameString(SINGLE_MODE_TEXT_KEY))
	end

	if self.multiModeText then
		ClientTextUtils.setText(self.multiModeText, pg.getGameString(MULTI_MODE_TEXT_KEY))
	end

	if self.multiTimeText and self.activityConfig.multiDailyStartTime then
		local startTime = self.activityConfig.multiDailyStartTime[1] or ""
		local endTime = self.activityConfig.multiDailyStartTime[2] or ""
		local endTimeText = endTime == "23:59:59" and "24:00" or endTime:sub(1, 5)

		ClientTextUtils.setText(self.multiTimeText, string.format("%s~%s", startTime:sub(1, 5), endTimeText))
	end

	if self.jumpText then
		ClientTextUtils.setText(self.jumpText, pg.getGameString(TRACK_ITEM_POOL_TEXT_KEY))
	end

	if self.gotoText then
		ClientTextUtils.setText(self.gotoText, pg.getGameString(GOTO_TEXT_KEY))
	end

	if self.rewardPreviewText then
		ClientTextUtils.setText(self.rewardPreviewText, pg.getGameString(REWARD_PREVIEW_TEXT_KEY))
	end

	if self.rewardButtonText then
		ClientTextUtils.setText(self.rewardButtonText, pg.getGameString(LIMITED_REWARD_TEXT_KEY))
	end

	if self.rankingButtonText then
		ClientTextUtils.setText(self.rankingButtonText, pg.getGameString(RANKING_TEXT_KEY))
	end

	self:setSelectedMode(self.selectedMode)
	self:refreshRedDotState()
end

function OpenWorldRacingComponent:refreshRedDotState()
	if not self:checkContentLoaded() then
		return
	end

	local treePath = string.format(RedDotConst.RedDotPath.EVENT_WORLD_RACING_REWARD, self.eventId)

	pg.global.setPreViewRedDot(treePath, self.btnRewardUButton, function()
		return ClientActivityUtils.getWorldRaceRewardRedDotStyle(self.eventId)
	end)
end

function OpenWorldRacingComponent:isSelectedModeOpen()
	if self.selectedMode ~= WorldRaceDungeonConst.MODE.MULTI then
		return true
	end

	local timeRange = self.activityConfig and self.activityConfig.multiDailyStartTime

	if not timeRange then
		logger:error("isSelectedModeOpen: invalid multi daily time range, phase=%s", tostring(self.eventPhase))

		return false
	end

	local openTime = timeRange[1]
	local closeTime = timeRange[2]

	if type(openTime) ~= "string" or openTime == "" or type(closeTime) ~= "string" or closeTime == "" then
		logger:error("isSelectedModeOpen: invalid multi daily time range, phase=%s", tostring(self.eventPhase))

		return false
	end

	local openTimestamp = TimeUtils.stringToAreaTimestamp(openTime)
	local closeTimestamp = TimeUtils.stringToAreaTimestamp(closeTime)

	if not openTimestamp or not closeTimestamp then
		logger:error("isSelectedModeOpen: failed to parse multi daily time range, phase=%s start=%s end=%s", tostring(self.eventPhase), openTime, closeTime)

		return false
	end

	return TimeUtils.isInRangeTimestamp(openTimestamp, closeTimestamp)
end

function OpenWorldRacingComponent:refreshModeOpenState()
	local conditionOpen, conditionId = ActivityUtils.getOprActivityOpenCond(self.eventId)

	if not conditionId then
		return false
	end

	if not conditionOpen then
		local conditionText = ClientActivityUtils.getWorldRaceOpenConditionText(conditionId)

		if not conditionText then
			return false
		end

		ClientTextUtils.setText(self.lockText, conditionText)
	end

	self.lockUWidget:SetActive(not conditionOpen)

	local activity = ClientActivityUtils.getWorldRaceActivity()
	local canBrowse = conditionOpen and ActivityUtils.activityBaseCheck(activity) == NoticeDef.SUCCESS and activity.activityBase.activityId == self.eventId
	local isOpen = self:isSelectedModeOpen()

	if self.btnGotoUButton then
		self.btnGotoUButton.interactable = canBrowse
		self.btnGotoUButton.visualInteractable = canBrowse

		self.btnGotoUButton:TryChangePage("button", canBrowse and 0 or 4)
		self.btnGotoUButton.gameObject:SetActiveEx(conditionOpen)
	end

	if self.notOpenTimeText then
		ClientTextUtils.setText(self.notOpenTimeText, pg.getGameString(NOT_OPEN_TIME_TEXT_KEY))
		self.notOpenTimeText.gameObject:SetActiveEx(self.selectedMode == WorldRaceDungeonConst.MODE.MULTI and not isOpen)
	end

	return canBrowse
end

function OpenWorldRacingComponent:onActivityDayUpdated()
	if self:checkContentLoaded() then
		self:refreshModeOpenState()
	end
end

function OpenWorldRacingComponent:refreshEventTitle()
	local eventTimeConfig = Utils.getEventTimeConfig(self.eventId)
	local isMulti = self.selectedMode == WorldRaceDungeonConst.MODE.MULTI
	local titleId = isMulti and self.activityConfig.multiTitle or self.activityConfig.singleTitle
	local descId = isMulti and self.activityConfig.multiDesc or self.activityConfig.singleDesc
	local raceRule = self.activityConfig.raceRule and pg.getLocalizationText(self.activityConfig.raceRule) or nil

	self:setEventTitle(self.eventTitleUContainer, eventTimeConfig and eventTimeConfig.tabEndDayTime, pg.getLocalizationText(titleId), nil, raceRule, descId and pg.getLocalizationText(descId) or nil)
end

function OpenWorldRacingComponent:setSelectedMode(mode)
	if mode ~= WorldRaceDungeonConst.MODE.SINGLE and mode ~= WorldRaceDungeonConst.MODE.MULTI then
		return
	end

	local backgroundField = mode == WorldRaceDungeonConst.MODE.MULTI and "multiIconResId" or "singleIconResId"
	local backgroundUrl = self.activityConfig and self.activityConfig[backgroundField]

	if not backgroundUrl or backgroundUrl == "" or backgroundUrl == 0 then
		logger:error("setSelectedMode: event_world_racing_data[%s].%s is missing or empty, eventId=%s", tostring(self.eventPhase), backgroundField, tostring(self.eventId))

		return
	end

	self.backgroundUImage.url = backgroundUrl
	self.selectedMode = mode

	if self.btnSingleUButton then
		self.btnSingleUButton:TryChangePage("State", mode == WorldRaceDungeonConst.MODE.SINGLE and 1 or 0)
	end

	if self.btnMultipleUButton then
		self.btnMultipleUButton:TryChangePage("State", mode == WorldRaceDungeonConst.MODE.MULTI and 1 or 0)
	end

	if self.btnJumpUButton then
		self.btnJumpUButton.gameObject:SetActiveEx(mode == WorldRaceDungeonConst.MODE.MULTI)
	end

	if self.btnRankingUButton then
		self.btnRankingUButton.gameObject:SetActiveEx(not self.is_rank_block and mode == WorldRaceDungeonConst.MODE.SINGLE)
	end

	self:refreshEventTitle()
	self:refreshRewardList()
	self:refreshModeOpenState()
end

function OpenWorldRacingComponent:refreshRewardList()
	if not self.rewardListUList or not self.activityConfig then
		return
	end

	local awardId = self.selectedMode == WorldRaceDungeonConst.MODE.MULTI and self.activityConfig.multiAwardId or self.activityConfig.singleAwardId

	self.rewardListUList:SetList(awardId and LuaUIUtils.getRewardItemByDropId(awardId) or {})
end

function OpenWorldRacingComponent:openTrackPanel()
	if not self:refreshModeOpenState() then
		return
	end

	pg.global.ui:open(UIConst.UI_ID_WORLD_RACING_MAP, {
		eventId = self.eventId,
		eventPhase = self.eventPhase,
		mode = self.selectedMode
	})
end

return OpenWorldRacingComponent
