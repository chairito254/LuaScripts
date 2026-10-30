-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRacingMap\\WorldRacingMapCtrl.lua

local TimeUtils = require("Common.Utils.TimeUtils")
local logger = require("Core.Log.LoggerManager").getLogger("WorldRacingMapCtrl")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local Time = require("Core.Common.Time")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientUtils = require("Utils.ClientUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local Utils = require("Common.Utils.Utils")
local WorldRacingMapPointUtils = require("Common.Utils.WorldRacingMapPointUtils")
local MatchConst = require("Common.Const.MatchConst")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local RankConst = require("Common.Const.RankConst")
local AbilityConst = require("Common.Const.AbilityConst")
local Const = require("Common.Const.Const")
local NoticeDef = require("Common.NoticeDef")
local UIConst = require("Const.UIConst")
local ClientConst = require("Const.ClientConst")
local MessageName = require("Const.MessageName")
local RedDotConst = require("Const.RedDotConst")
local AddressDataConst = require("Const.AddressDataConst")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local EventWorldRacingData = require("Data.event_world_racing_data")
local PetData = require("Data.pet_data")
local LevelData = require("Data.level_data")
local WorldRacingTrackData = require("Data.world_racing_track_data")
local RankBaseData = require("Data.rank_base_data")
local CustomTriggerData = require("Data.custom_trigger_data")
local WorldRacingTeamComponent = require("Guis.Panels.WorldRacingMap.Component.WorldRacingTeamComponent")
local DoTweenAnimMgr = DoTweenAnimMgr
local WorldRacingMapCtrl = Class.LightClass("WorldRacingMapCtrl", UICtrl)
local SINGLE_MODE_TEXT_KEY = "OPEN_WORLD_RACING_SINGLE_MODE"
local MULTI_MODE_TEXT_KEY = "OPEN_WORLD_RACING_MULTI_MODE"
local RANKING_TEXT_KEY = "OPEN_WORLD_RACING_RANKING"
local RANKING_IN_PROGRESS_TEXT_KEY = "OPEN_WORLD_RACING_RANKING_IN_PROGRESS"
local BEST_SCORE_TEXT_KEY = "OPEN_WORLD_RACING_BEST_SCORE"
local HIGHEST_RANK_TEXT_KEY = "OPEN_WORLD_RACING_HIGHEST_RANK"
local NO_RANK_TEXT_KEY = "OPEN_WORLD_RACING_NO_RANK"
local PLAYER_COUNT_TEXT_KEY = "OPEN_WORLD_RACING_PLAYER_COUNT"
local SPECIAL_EVENT_TEXT_KEY = "OPEN_WORLD_RACING_SPECIAL_EVENT"
local ITEM_DESCRIPTION_TEXT_KEY = "OPEN_WORLD_RACING_ITEM_DESCRIPTION"
local LIMITED_REWARD_TEXT_KEY = "OPEN_WORLD_RACING_LIMITED_REWARD"
local CHOOSE_TRACK_TEXT_KEY = "OPEN_WORLD_RACING_CHOOSE_TRACK"
local TRACK_COMPETING_TEXT_KEY = "OPEN_WORLD_RACING_TRACK_COMPETING"
local TRACK_OPEN_TIME_TEXT_KEY = "OPEN_WORLD_RACING_TRACK_OPEN_TIME"
local TEAM_TEXT_KEY = "TEAM_PANEL_TITLE"
local BUFF_TEXT_KEY = "OPEN_WORLD_RACING_BUFF"
local BUFF_EMPTY_TIP_TEXT_KEY = "OPEN_WORLD_RACING_BUFF_SELECT"
local START_CHALLENGE_TEXT_KEY = "TEAM_START_CHALLENGE"
local START_MATCH_TEXT_KEY = "START_MATCH"
local MEMBER_DISABLE_TIP_TEXT_KEY = "TEAM_ROOM_MEMBER_DISABLE_TIP"
local NUMBER_NOT_READY_TEXT_KEY = "NUMBER_NOT_READY"
local OTHER_MATCHING_TIP_TEXT_KEY = "OPEN_WORLD_RACING_OTHER_MATCHING_TIP"
local MATCHING_TEXT_KEY = "MATCHING"
local CANCEL_MATCHING_TEXT_KEY = "CANCEL_MATCHING"
local SINGLE_RATING_NODE_PAGE = 4
local MATCH_COUNT_DOWN_TOTAL_SECOND = 3600
local MARK_SCALE_DURATION = 0.2
local MAP_PAN_DURATION = 0.32
local DOT_STATE_PAGE = {
	UNREVEALED_EVENT = 0,
	SUPER = 1
}
local SPECIAL_EVENT_REQUIRED_FIELDS = {
	"eventCondition",
	"eventDefaultDesc",
	"eventCompleteDesc",
	"eventCompleteIcon"
}
local TRACK_STATE = {
	COMPETING = 1,
	NOT_OPEN = 2
}

WorldRacingMapCtrl.messages = {
	[MessageName.FIGHT_GROUP_CHANGE] = {
		"refreshTeamPanel",
		true
	},
	[MessageName.MODIFY_PET_FORMATION] = {
		"refreshTeamPanel",
		true
	},
	[MessageName.MODIFY_PET_EXPLORE_FORMATION] = {
		"refreshTeamPanel",
		true
	},
	[MessageName.WORLD_RACE_TRACK_PET_LIST_CHANGED] = {
		"onTrackPetListChanged",
		true
	},
	[MessageName.WORLD_RACE_SELECTED_BUFF_CHANGED] = {
		"onSelectedBuffChanged",
		true
	},
	[MessageName.SYNC_TEAM_INFO] = {
		"onTeamInfoChanged",
		true
	},
	[MessageName.TEAM_MATCHED_STATUS_CHANGE] = {
		"onTeamMatchedStatusChange",
		true
	},
	[MessageName.TEAM_MATCH_START_TIME_CHANGE] = {
		"onTeamMatchedStatusChange",
		true
	},
	[MessageName.TEAM_MATCH_ENTRY_INTERACTABLE_CHANGE] = {
		"onMatchEntryInteractableChange",
		true
	},
	[MessageName.NOTIFY_ACTIVITY_DAY_UPDATED] = {
		"onActivityDayUpdated",
		true
	},
	[MessageName.EVENT_CUR_PAGE_REFRESH] = {
		"onActivityStateChanged",
		true
	},
	[MessageName.EVENT_TASK_STATE_CHANGE] = {
		"refreshSpecialEvents",
		true
	},
	[MessageName.EVENT_REFRESH_REDDOT] = {
		"refreshRedDotState",
		true
	}
}

function WorldRacingMapCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.is_rank_block = true
	self.eventId = info and info.eventId
	self.eventPhase = info and info.eventPhase
	self.mode = info and info.mode

	if not self.eventId or not self.eventPhase or self.mode ~= WorldRaceDungeonConst.MODE.SINGLE and self.mode ~= WorldRaceDungeonConst.MODE.MULTI then
		logger:error("onOpen: invalid open info, eventId=%s, eventPhase=%s, mode=%s", tostring(self.eventId), tostring(self.eventPhase), tostring(self.mode))
		self:dismiss()

		return
	end

	self.activityConfig = EventWorldRacingData[self.eventPhase]

	if not self.activityConfig then
		logger:error("onOpen: activity config not found, phase=%s", tostring(self.eventPhase))
		self:dismiss()

		return
	end

	self:refreshStaticText()
	self:refreshRedDotState()

	if not self:refreshTrackList(info and info.trackId) then
		self:dismiss()

		return
	end

	self:initMap()
	self:refreshMapMarks(false)
	self:refreshBuffPanel()
	self:initTeamComponent()

	if self.trackOpenStateTimerId then
		self:killTimer(self.trackOpenStateTimerId)
	end

	self.trackOpenStateTimerId = self:startTimer(function()
		self:refreshTrackOpenState()
	end, 1, true)
end

function WorldRacingMapCtrl:onShow()
	UICtrl.onShow(self)
	self:refreshMapLayout()
	self:refreshTrackOpenState()
	self:refreshTeamPanel()
	self:refreshBuffPanel()
	self:refreshSpecialEvents()
	self:refreshRedDotState()
end

function WorldRacingMapCtrl:onVisibleChange(visible)
	UICtrl.onVisibleChange(self, visible)

	if visible then
		self:refreshMapMarks(false)
	end
end

function WorldRacingMapCtrl:refreshRedDotState()
	if not self.eventId then
		return
	end

	local treePath = string.format(RedDotConst.RedDotPath.EVENT_WORLD_RACING_REWARD, self.eventId)

	pg.global.setPreViewRedDot(treePath, self.view.btnRewardUButton, function()
		return ClientActivityUtils.getWorldRaceRewardRedDotStyle(self.eventId)
	end)
end

function WorldRacingMapCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:dismiss()
	end

	function self.view.btnRewardUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_WORLD_RACING_LIMITED_REWARD, {
			eventId = self.eventId
		})
	end

	function self.view.btnDescriptionUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_WORLD_RACING_PROP_DETAILS)
	end

	function self.view.btnRankUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_RANK_BASE, {
			rankId = WorldRaceDungeonConst.Rank.rankId
		})
	end

	self.view.chooseMapListUList.groupType = CS.XGUI.EGroupType.Radio

	function self.view.chooseMapListUList.luaRenderItem(button, index, data)
		self:renderTrackItem(button, data)
	end

	function self.view.teamListUList.luaRenderItem(button, index, data)
		self:renderTeamPetItem(button, data)
	end

	function self.view.teamAbilityUList.luaRenderItem(button, index, data)
		self:renderAbilityItem(button, data)
	end

	function self.view.btnSwitchTeamUButton.luaClick()
		self:switchTeamFormation()
	end

	function self.view.btnSwitchBuffUButton.luaClick()
		self:openBuffChoose()
	end

	self.view.buffUButton.luaClick = self.view.btnSwitchBuffUButton.luaClick

	function self.view.btnStartUButton.luaClick()
		self:startSelectedTrack()
	end

	if NotNil(self.view.btnCancelUButton) then
		function self.view.btnCancelUButton.luaClick()
			self:cancelMatch()
		end
	end
end

function WorldRacingMapCtrl:refreshStaticText()
	local isMulti = self.mode == WorldRaceDungeonConst.MODE.MULTI

	ClientTextUtils.setText(self.view.titleUBaseText, pg.getGameString(isMulti and MULTI_MODE_TEXT_KEY or SINGLE_MODE_TEXT_KEY))
	ClientTextUtils.setText(self.view.btnDescriptionTxtNameUBaseText, pg.getGameString(ITEM_DESCRIPTION_TEXT_KEY))
	ClientTextUtils.setText(self.view.btnRankTxtNameUBaseText, pg.getGameString(RANKING_TEXT_KEY))
	ClientTextUtils.setText(self.view.btnRewardTxtNameUBaseText, pg.getGameString(LIMITED_REWARD_TEXT_KEY))
	self.view.btnDescriptionUButton.gameObject:SetActiveEx(isMulti)
	self.view.btnRankUButton.gameObject:SetActiveEx(not self.is_rank_block and not isMulti)
	ClientTextUtils.setText(self.view.chooseMapUBaseText, pg.getGameString(CHOOSE_TRACK_TEXT_KEY))
	ClientTextUtils.setText(self.view.textTeamUBaseText, pg.getGameString(TEAM_TEXT_KEY))
	ClientTextUtils.setText(self.view.textBuffUBaseText, pg.getGameString(BUFF_TEXT_KEY))
	ClientTextUtils.setText(self.view.textEmptyUBaseText, pg.getGameString(BUFF_EMPTY_TIP_TEXT_KEY))
	self:refreshStartButtonText()
	ClientTextUtils.setText(self.view.txtWaitingUSDFText, pg.getGameString(MATCHING_TEXT_KEY))
	ClientTextUtils.setText(self.view.btnCancelTxtNameUText, pg.getGameString(CANCEL_MATCHING_TEXT_KEY))
	self.view.textNumUBaseText.gameObject:SetActiveEx(true)
	self.view.infoLayoutUWidget.gameObject:SetActiveEx(true)
	self.view.chatRootRectTransform.gameObject:SetActiveEx(isMulti)
end

function WorldRacingMapCtrl:getTrackPlayerCountText(trackId)
	local trackConfig = WorldRacingTrackData[trackId]

	if not trackConfig then
		logger:error("getTrackPlayerCountText: table=world_racing_track_data, id=%s, field=participantCount, config not found", tostring(trackId))

		return nil
	end

	local participantCount = trackConfig.participantCount

	if not participantCount or not participantCount[1] or #participantCount > 2 then
		logger:error("getTrackPlayerCountText: table=world_racing_track_data, id=%s, field=participantCount, " .. "expected one fixed count or two range bounds", tostring(trackId))

		return nil
	end

	local minCount = participantCount[1]
	local maxCount = participantCount[2] or minCount

	if minCount < 1 or minCount % 1 ~= 0 or maxCount < minCount or maxCount % 1 ~= 0 then
		logger:error("getTrackPlayerCountText: table=world_racing_track_data, id=%s, field=participantCount, " .. "expected positive integers with min <= max, min=%s, max=%s", tostring(trackId), tostring(minCount), tostring(maxCount))

		return nil
	end

	return minCount == maxCount and tostring(minCount) or string.format("%d-%d", minCount, maxCount)
end

function WorldRacingMapCtrl:refreshSingleInfo()
	local isMulti = self.mode == WorldRaceDungeonConst.MODE.MULTI

	if self.mode ~= WorldRaceDungeonConst.MODE.SINGLE and not isMulti then
		return
	end

	if IsNil(self.view.rankBarUComponent) or IsNil(self.view.rankTopUBaseText) or IsNil(self.view.rankTextUBaseText) or IsNil(self.view.specialEventUBaseText) or IsNil(self.view.rankScheduleRectTransform) or IsNil(self.view.rankScheduleTextUBaseText) or IsNil(self.view.rankScheduleCountDownUCountDown) or IsNil(self.view.specialEventTextUBaseText) then
		logger:error("refreshSingleInfo: single mode info references are missing, check UI_Pb_Map_Multiplayer_Racing")

		return
	end

	local playerCountText = self.selectedTrackId and self:getTrackPlayerCountText(self.selectedTrackId)

	ClientTextUtils.setText(self.view.textNumUBaseText, playerCountText and pg.getFormatText(pg.getGameString(PLAYER_COUNT_TEXT_KEY), playerCountText) or "")

	local showRank = not self.is_rank_block and not isMulti

	self.view.rankScheduleRectTransform.gameObject:SetActiveEx(showRank)
	ClientTextUtils.setText(self.view.rankScheduleTextUBaseText, pg.getGameString(RANKING_IN_PROGRESS_TEXT_KEY))
	self.view.rankScheduleCountDownUCountDown:Stop()

	local eventTimeConfig = Utils.getEventTimeConfig(self.eventId)
	local eventEndTime = eventTimeConfig and eventTimeConfig.tabEndDayTime

	if showRank and eventEndTime and eventEndTime > Time.secondCache then
		LuaUIUtils.setCountDownTime(self.view.rankScheduleCountDownUCountDown, eventEndTime, UIConst.TimeType.OneTime)
	end

	if not isMulti then
		ClientTextUtils.setText(self.view.rankTopUBaseText, pg.getGameString(BEST_SCORE_TEXT_KEY))

		local bestTimes = pg.me and pg.me.racingSingleBestTimes
		local bestTime = bestTimes and self.selectedTrackId and bestTimes[self.selectedTrackId] or 0
		local bestRatings = pg.me and pg.me.racingSingleBestRatings
		local bestRating = bestRatings and self.selectedTrackId and bestRatings[self.selectedTrackId]
		local ratingPage = bestTime > 0 and ClientActivityUtils.getWorldRaceRatingPageByValue(bestRating) or SINGLE_RATING_NODE_PAGE

		if ratingPage == ClientActivityUtils.WORLD_RACE_RATING_PAGE.Node then
			ratingPage = SINGLE_RATING_NODE_PAGE
		end

		self.view.rankBarUComponent:TryChangePage("State", 0)
		self.view.rankBarUComponent:TryChangePage("Rating", ratingPage)
		ClientTextUtils.setText(self.view.rankTextUBaseText, bestTime > 0 and ClientActivityUtils.formatWorldRaceTime(bestTime) or pg.getGameString(NO_RANK_TEXT_KEY))
	else
		self.view.rankBarUComponent:TryChangePage("State", 1)
		self.view.rankBarUComponent:TryChangePage("Rating", SINGLE_RATING_NODE_PAGE)
		ClientTextUtils.setText(self.view.rankTopUBaseText, pg.getGameString(HIGHEST_RANK_TEXT_KEY))
		ClientTextUtils.setText(self.view.rankTextUBaseText, pg.getGameString(NO_RANK_TEXT_KEY))
	end

	self:refreshSpecialEventInfo()
	ClientTextUtils.setText(self.view.specialEventTextUBaseText, pg.getGameString(SPECIAL_EVENT_TEXT_KEY))
end

function WorldRacingMapCtrl:getSpecialEventState(trackId)
	local trackConfig = WorldRacingTrackData[trackId]

	if not trackConfig then
		logger:error("getSpecialEventState: table=world_racing_track_data, id=%s, config not found", tostring(trackId))

		return nil
	end

	if trackConfig.isHaceSpecialEvent ~= 1 then
		return nil
	end

	for _, field in ipairs(SPECIAL_EVENT_REQUIRED_FIELDS) do
		local value = trackConfig[field]

		if value == nil or value == false or value == 0 or value == "" then
			logger:error("getSpecialEventState: table=world_racing_track_data, id=%s, field=%s, " .. "required value is missing", tostring(trackId), field)

			return nil
		end
	end

	local conditionId = trackConfig.eventCondition

	if not CustomTriggerData[conditionId] then
		logger:error("getSpecialEventState: table=world_racing_track_data, id=%s, field=eventCondition, " .. "custom_trigger_data id=%s not found or invalid", tostring(trackId), tostring(conditionId))

		return nil
	end

	return ClientUtils.checkCondition(conditionId), trackConfig
end

function WorldRacingMapCtrl:refreshSpecialEventInfo()
	local specialEventRoot = self.view.specialEventRootUWidget

	if IsNil(specialEventRoot) then
		logger:error("refreshSpecialEventInfo: ObjectReference key=specialEventRootUWidget is missing, " .. "check UI_Pb_Map_Multiplayer_Racing")

		return
	end

	specialEventRoot.gameObject:SetActiveEx(false)
end

function WorldRacingMapCtrl:refreshSpecialEvents()
	self:refreshMapMarks(false)
	self:refreshSpecialEventInfo()
end

function WorldRacingMapCtrl:initTeamComponent()
	if self.mode ~= WorldRaceDungeonConst.MODE.MULTI then
		return
	end

	local trackConfig = self.selectedTrackId and WorldRacingTrackData[self.selectedTrackId]
	local extInfo = {
		dungeonSceneId = trackConfig and trackConfig.sceneId,
		hardLv = self.selectedTrackId,
		panelObjectReference = self.view.objectReference
	}
	local container = self.view.chatUContainer

	if NotNil(container) then
		container:LoadDefaultUrlManually(function(content)
			if not content or IsNil(content) or not self.view then
				return
			end

			self.teamCom = WorldRacingTeamComponent.new(self, content, extInfo)
		end)

		return
	end

	local root = self.view.chatRootRectTransform

	if IsNil(root) then
		logger:error("initTeamComponent: team info bar node is missing, add ObjectReference key " .. "chatRootRectTransform(或 chatUContainer) to UI_Pb_Map_Multiplayer_Racing")

		return
	end

	self.teamCom = WorldRacingTeamComponent.new(self, root, extInfo)
end

function WorldRacingMapCtrl:getTrackRankTimeRange(trackId)
	if self.mode ~= WorldRaceDungeonConst.MODE.SINGLE then
		return nil, nil
	end

	local rankId = WorldRaceDungeonConst.Rank.rankId
	local rankData = RankBaseData[rankId]
	local tabData = rankData and rankData[trackId]
	local config = tabData and tabData[0]
	local configPath = string.format("rank_base_data[%s][%s][0]", rankId, trackId)

	if config == nil then
		logger:error("%s: missing track rank config", configPath)

		return nil, nil
	end

	if config.openType ~= RankConst.OpenType.FixedTime or config.closeType ~= RankConst.CloseType.FixedTime then
		logger:error("%s openType=%s closeType=%s: track rank marker requires fixed opening and closing times", configPath, tostring(config.openType), tostring(config.closeType))

		return nil, nil
	end

	local area = tostring(pg.me.serverArea)
	local openTime = config.openTime and config.openTime[area]

	if openTime == nil or openTime <= 0 then
		logger:error("%s openTime[%s]: missing or non-positive timestamp", configPath, area)

		return nil, nil
	end

	local closeTime = config.closeTime and config.closeTime[area]

	if closeTime == nil or closeTime <= openTime then
		logger:error("%s closeTime[%s]: missing or closing time is not later than openTime[%s]", configPath, area, area)

		return nil, nil
	end

	return openTime, closeTime
end

function WorldRacingMapCtrl:isTrackRankOpen(trackEntry)
	return trackEntry.rankOpenTime ~= nil and Time.secondCache >= trackEntry.rankOpenTime and Time.secondCache < trackEntry.rankCloseTime
end

function WorldRacingMapCtrl:refreshTrackList(requestedTrackId)
	local trackIds = self.activityConfig.TrackIds and self.activityConfig.TrackIds[self.mode]
	local activity = pg.me and pg.me.activityOpenWorldRacing

	if not trackIds or not activity then
		logger:error("refreshTrackList: track data is unavailable, phase=%s, mode=%s", tostring(self.eventPhase), tostring(self.mode))

		self.trackEntries = {}
		self.selectedTrackId = nil
		self.mapId = nil

		self:refreshTrackTabs()
		self:refreshSelectedTrack()

		return false
	end

	local latestOpenTrackId
	local trackOpened = {}
	local requestedTrackFound = requestedTrackId == nil

	for _, trackId in ipairs(trackIds) do
		local trackConfig = WorldRacingTrackData[trackId]

		if not trackConfig or trackConfig.trackType ~= self.mode then
			logger:error("refreshTrackList: invalid track config, trackId=%s, mode=%s", tostring(trackId), tostring(self.mode))
		else
			if trackId == requestedTrackId then
				requestedTrackFound = true
			end

			if activity:checkTrackOpenTime(trackId) == NoticeDef.SUCCESS then
				trackOpened[trackId] = true
				latestOpenTrackId = trackId
			end
		end
	end

	if not requestedTrackFound then
		logger:error("refreshTrackList: table=event_world_racing_data, id=%s, field=TrackIds[%s], " .. "requested trackId=%s is not a valid track for this mode", tostring(self.eventPhase), tostring(self.mode), tostring(requestedTrackId))

		return false
	end

	if requestedTrackId ~= nil and not trackOpened[requestedTrackId] then
		pg.global.showBubbleMessage(NoticeDef.ERROR_ACTIVITY_NOT_OPEN)

		return false
	end

	self.trackEntries = {}

	for _, trackId in ipairs(trackIds) do
		local trackConfig = WorldRacingTrackData[trackId]

		if trackConfig and trackConfig.trackType == self.mode then
			local rankOpenTime, rankCloseTime = self:getTrackRankTimeRange(trackId)
			local trackEntry = {
				trackId = trackId,
				config = trackConfig,
				state = trackOpened[trackId] and TRACK_STATE.COMPETING or TRACK_STATE.NOT_OPEN,
				rankOpenTime = rankOpenTime,
				rankCloseTime = rankCloseTime
			}

			trackEntry.isRankOpen = self:isTrackRankOpen(trackEntry)
			self.trackEntries[#self.trackEntries + 1] = trackEntry
		end
	end

	self.selectedTrackPrefsKey = string.format(ClientConst.PrefKey.WorldRacingSelectedTrack, self.eventPhase, self.mode)

	local lastTrackId = pg.global.prefsCacheUtils:getInt(self.selectedTrackPrefsKey, 0, ClientConst.CACHE_TYPE_FLAG.USER)

	self.selectedTrackId = requestedTrackId or trackOpened[lastTrackId] and lastTrackId or latestOpenTrackId
	self.mapId = self:resolveMapId()

	self:refreshTrackTabs()
	self:refreshSelectedTrack()

	return true
end

function WorldRacingMapCtrl:refreshTrackTabs()
	for _, trackEntry in ipairs(self.trackEntries) do
		trackEntry.selected = trackEntry.trackId == self.selectedTrackId
	end

	self.view.chooseMapListUList:SetList(self.trackEntries)
end

function WorldRacingMapCtrl:refreshTrackOpenState()
	local activity = pg.me and pg.me.activityOpenWorldRacing

	if not activity or not self.trackEntries then
		return
	end

	local changed = false
	local latestOpenTrackId
	local selectedTrackOpen = false

	for _, trackEntry in ipairs(self.trackEntries) do
		local state = activity:checkTrackOpenTime(trackEntry.trackId) == NoticeDef.SUCCESS and TRACK_STATE.COMPETING or TRACK_STATE.NOT_OPEN

		if trackEntry.state ~= state then
			trackEntry.state = state
			changed = true
		end

		local isRankOpen = self:isTrackRankOpen(trackEntry)

		if trackEntry.isRankOpen ~= isRankOpen then
			trackEntry.isRankOpen = isRankOpen
			changed = true
		end

		if state == TRACK_STATE.COMPETING then
			latestOpenTrackId = trackEntry.trackId

			if trackEntry.trackId == self.selectedTrackId then
				selectedTrackOpen = true
			end
		end
	end

	if not changed then
		return
	end

	if not selectedTrackOpen then
		self.selectedTrackId = latestOpenTrackId
	end

	self:refreshTrackTabs()

	if selectedTrackOpen then
		self:refreshMapMarks(false)
		self:refreshStartEntry()
	else
		self:refreshSelectedTrack()
	end
end

function WorldRacingMapCtrl:onActivityStateChanged()
	self:refreshTrackOpenState()
	self:refreshStartEntry()
	self:refreshSpecialEvents()
end

function WorldRacingMapCtrl:onActivityDayUpdated()
	self:refreshTrackOpenState()
	self:refreshSingleInfo()
end

function WorldRacingMapCtrl:resolveMapId()
	local mapId

	for _, trackEntry in ipairs(self.trackEntries or {}) do
		local trackMapId = WorldRacingMapPointUtils.getMapIdByTrack(trackEntry.trackId)

		if trackMapId then
			if not mapId then
				mapId = trackMapId
			elseif mapId ~= trackMapId then
				logger:error("resolveMapId: tracks of one panel are on different maps, phase=%s, mode=%s, " .. "mapId=%s, trackId=%s, trackMapId=%s", tostring(self.eventPhase), tostring(self.mode), tostring(mapId), tostring(trackEntry.trackId), tostring(trackMapId))
			end
		end
	end

	if not mapId then
		logger:error("resolveMapId: no map found for the track list, phase=%s, mode=%s, trackCount=%s", tostring(self.eventPhase), tostring(self.mode), tostring(#(self.trackEntries or {})))
	end

	return mapId
end

function WorldRacingMapCtrl:getTrackStateText(trackEntry)
	if trackEntry.state == TRACK_STATE.COMPETING then
		return pg.getGameString(TRACK_COMPETING_TEXT_KEY)
	end

	local openTime = Utils.getConfigTimeOfArea(trackEntry.config, "trackStartTime")

	if not openTime then
		logger:error("getTrackStateText: trackStartTime not found, trackId=%s", tostring(trackEntry.trackId))

		return ""
	end

	local date = TimeUtils.getAreaDateTable(openTime)

	return pg.getFormatText(pg.getGameString(TRACK_OPEN_TIME_TEXT_KEY), date.month, date.day)
end

function WorldRacingMapCtrl:renderTrackItem(button, trackEntry)
	local objectReference = button:GetComponent("ObjectReference")
	local nameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
	local timeUBaseText = objectReference:GetRefValue("textTimeUBaseText")
	local iconUImage = objectReference:GetRefValue("iconUImage")

	ClientTextUtils.setText(nameUBaseText, pg.getLocalizationText(trackEntry.config.name))
	ClientTextUtils.setText(timeUBaseText, self:getTrackStateText(trackEntry))

	iconUImage.url = trackEntry.config.trackIconResId

	button:TryChangePage("State", trackEntry.state == TRACK_STATE.COMPETING and 0 or 1)
	timeUBaseText.gameObject:SetActiveEx(trackEntry.state ~= TRACK_STATE.COMPETING)

	button.interactable = self:isTrackSelectable(trackEntry)

	function button.luaClick()
		self:setSelectedTrack(trackEntry.trackId)
	end

	local rankTag = objectReference:GetRefValue("rankTagRectTransform")

	if IsNil(rankTag) then
		logger:error("UI_Node_Map_Multiplayer_Racing_Item.prefab ObjectReference key=rankTagRectTransform is missing")

		return
	end

	rankTag.gameObject:SetActiveEx(not self.is_rank_block and trackEntry.isRankOpen)
end

function WorldRacingMapCtrl:setSelectedTrack(trackId)
	if trackId == self.selectedTrackId then
		return
	end

	for index, trackEntry in ipairs(self.trackEntries) do
		if trackEntry.trackId == trackId and self:isTrackSelectable(trackEntry) then
			self.selectedTrackId = trackId

			self.view.chooseMapListUList:SelectItem(index - 1, false)
			self:refreshSelectedTrack(true)

			return
		end
	end
end

function WorldRacingMapCtrl:refreshSelectedTrack(animated)
	local trackConfig = self.selectedTrackId and WorldRacingTrackData[self.selectedTrackId]

	ClientTextUtils.setText(self.view.textMapNameUBaseText, trackConfig and pg.getLocalizationText(trackConfig.name) or "")

	if trackConfig then
		local prefsCacheUtils = pg.global.prefsCacheUtils

		if prefsCacheUtils:getInt(self.selectedTrackPrefsKey, 0, ClientConst.CACHE_TYPE_FLAG.USER) ~= self.selectedTrackId then
			prefsCacheUtils:setInt(self.selectedTrackPrefsKey, self.selectedTrackId, ClientConst.CACHE_TYPE_FLAG.USER)
			prefsCacheUtils:save()
		end

		pg.me:initWorldRaceTrackPetLists(self.selectedTrackId)
	end

	if self.teamCom then
		self.teamCom:setTrackInfo(trackConfig and trackConfig.sceneId, self.selectedTrackId)
	end

	self:refreshTeamPanel()
	self:refreshMapMarks(animated)
	self:refreshMapPan(animated)
	self:refreshSingleInfo()
end

function WorldRacingMapCtrl:initMap()
	self.mapReady = false
	self.mapViewWidth, self.mapViewHeight = nil
	self.mapContentWidth, self.mapContentHeight = nil
	self.mapPanPlaced = false

	local content = self.view.mapContentRectTransform
	local viewRect = self.view.mapViewRectTransform
	local markRoot = self.view.mapMarkRootRectTransform

	if IsNil(content) or IsNil(viewRect) or IsNil(markRoot) then
		logger:error("initMap: map nodes are missing, add ObjectReference keys " .. "mapViewRectTransform/mapContentRectTransform/mapMarkRootRectTransform " .. "to UI_Pb_Map_Multiplayer_Racing")

		return
	end

	local bgUImage = self.view.mapBgUImage

	if IsNil(bgUImage) then
		logger:error("initMap: mapBgUImage is missing, add the ObjectReference key " .. "to UI_Pb_Map_Multiplayer_Racing")

		return
	end

	if not self.mapId then
		return
	end

	local bgUrl = WorldRacingMapPointUtils.getMapBgUrl(self.mapId)

	if not bgUrl then
		return
	end

	if NotNil(self.view.mapMarkTemplateUButton) then
		self.view.mapMarkTemplateUButton.gameObject:SetActiveEx(false)
	end

	content.anchorMin = Vector2(0.5, 0.5)
	content.anchorMax = Vector2(0.5, 0.5)
	content.pivot = Vector2(0.5, 0.5)
	content.anchoredPosition = Vector2(0, 0)
	markRoot.anchorMin = Vector2(0, 0)
	markRoot.anchorMax = Vector2(1, 1)
	markRoot.pivot = Vector2(0.5, 0.5)
	markRoot.anchoredPosition = Vector2(0, 0)
	markRoot.sizeDelta = Vector2(0, 0)
	bgUImage.url = bgUrl
	self.mapReady = true

	self:refreshMapLayout()
end

function WorldRacingMapCtrl:refreshMapLayout()
	if not self.mapReady then
		return
	end

	local viewRect = self.view.mapViewRectTransform
	local content = self.view.mapContentRectTransform

	if IsNil(viewRect) or IsNil(content) then
		return
	end

	local rect = viewRect.rect
	local viewWidth, viewHeight = rect.width, rect.height

	if viewWidth <= 0 or viewHeight <= 0 then
		logger:error("refreshMapLayout: canvas size is invalid, width=%s, height=%s", tostring(viewWidth), tostring(viewHeight))

		return
	end

	if self.mapViewWidth == viewWidth and self.mapViewHeight == viewHeight then
		return
	end

	local mapAspect = WorldRacingMapPointUtils.getMapAspect(self.mapId)
	local zoom = WorldRacingMapPointUtils.getViewZoom(self.mapId, pg.global.ui:runPlatformByMobile())

	if not mapAspect or not zoom then
		return
	end

	self.mapViewWidth, self.mapViewHeight = viewWidth, viewHeight

	local contentWidth = viewWidth * zoom
	local contentHeight = contentWidth / mapAspect

	if contentHeight < viewHeight then
		logger:error("refreshMapLayout: zoom is too small to cover the canvas, zoom=%s, mapAspect=%s, " .. "canvas=%sx%s, need zoom >= %s", tostring(zoom), tostring(mapAspect), tostring(viewWidth), tostring(viewHeight), tostring(mapAspect * viewHeight / viewWidth))

		contentHeight = viewHeight
		contentWidth = contentHeight * mapAspect
	end

	content.sizeDelta = Vector2(contentWidth, contentHeight)
	self.mapContentWidth, self.mapContentHeight = contentWidth, contentHeight

	self:refreshMapPan(false)
end

function WorldRacingMapCtrl.markKey(trackId, pointType)
	return trackId * 10 + pointType
end

function WorldRacingMapCtrl:getPointAnchor(trackId, pointType)
	if not self.mapReady then
		return nil, nil
	end

	local u, v = WorldRacingMapPointUtils.getPointUV(trackId, pointType)

	if not u then
		return nil, nil
	end

	return u, 1 - v
end

function WorldRacingMapCtrl:initMapTweenIds()
	self.markScaleTweenId = self.markScaleTweenId or LuaUIUtils.TweenId("WorldRacingMapMarkScale")
	self.mapPanTweenId = self.mapPanTweenId or LuaUIUtils.TweenId("WorldRacingMapPan")
end

function WorldRacingMapCtrl:refreshMapPan(animated)
	if not self.mapReady or not self.mapContentWidth or not self.mapContentHeight then
		return
	end

	local content = self.view.mapContentRectTransform

	if IsNil(content) then
		return
	end

	local offsetX, offsetY = 0, 0
	local u, v

	if self.selectedTrackId then
		u, v = WorldRacingMapPointUtils.getPointUV(self.selectedTrackId, WorldRacingMapPointUtils.POINT_TYPE.TRACK)
	end

	if u then
		local rangeX = math.max(0, (self.mapContentWidth - self.mapViewWidth) * 0.5)
		local rangeY = math.max(0, (self.mapContentHeight - self.mapViewHeight) * 0.5)

		offsetX = math.clamp((0.5 - u) * self.mapContentWidth, -rangeX, rangeX)
		offsetY = math.clamp((v - 0.5) * self.mapContentHeight, -rangeY, rangeY)
	end

	local instant = not animated or not self.mapPanPlaced

	self.mapPanPlaced = true

	self:initMapTweenIds()
	DoTweenAnimMgr.Kill(content.gameObject, self.mapPanTweenId)
	DoTweenAnimMgr.AnchorPositionMove(content, self.mapPanTweenId, Vector3(offsetX, offsetY, 0), MAP_PAN_DURATION, 0, CS.DG.Tweening.Ease.__CastFrom(Const.DoTweenEaseType.OutCubic), nil, instant)
end

function WorldRacingMapCtrl:collectMarkSpecs()
	local specs = {}
	local pointType = WorldRacingMapPointUtils.POINT_TYPE

	for _, trackEntry in ipairs(self.trackEntries or {}) do
		specs[#specs + 1] = {
			trackEntry = trackEntry,
			pointType = pointType.TRACK
		}

		if trackEntry.config.isHaceSpecialEvent == 1 then
			specs[#specs + 1] = {
				trackEntry = trackEntry,
				pointType = pointType.EVENT
			}
		end
	end

	return specs
end

function WorldRacingMapCtrl:refreshMapMarks(animated)
	if not self.mapReady then
		return
	end

	local markRoot = self.view.mapMarkRootRectTransform

	if IsNil(markRoot) then
		return
	end

	self.mapMarks = self.mapMarks or {}
	self.mapMarkLoadingKeys = self.mapMarkLoadingKeys or {}

	local pendingSpecs

	for _, spec in ipairs(self:collectMarkSpecs()) do
		local key = WorldRacingMapCtrl.markKey(spec.trackEntry.trackId, spec.pointType)
		local mark = self.mapMarks[key]

		if mark then
			self:renderMapMark(mark, spec, animated)
		elseif not self.mapMarkLoadingKeys[key] then
			pendingSpecs = pendingSpecs or {}
			pendingSpecs[#pendingSpecs + 1] = spec
			self.mapMarkLoadingKeys[key] = true
		end
	end

	if not pendingSpecs then
		return
	end

	local queue = pendingSpecs
	local queueIndex = 0

	self.view:addPrefabWithPathAsyncBatch(markRoot, AddressDataConst.UI_NODE_MAP_RACING_DOT, #queue, function(item)
		queueIndex = queueIndex + 1

		local spec = queue[queueIndex]

		if not spec then
			logger:error("refreshMapMarks: batch callback overruns the queue, res=%s, index=%s, queue=%s", AddressDataConst.UI_NODE_MAP_RACING_DOT, tostring(queueIndex), tostring(#queue))

			return
		end

		local key = WorldRacingMapCtrl.markKey(spec.trackEntry.trackId, spec.pointType)

		self.mapMarkLoadingKeys[key] = nil

		if not item or IsNil(item.gameObject) then
			logger:error("refreshMapMarks: dot prefab instantiate failed, res=%s, index=%s", AddressDataConst.UI_NODE_MAP_RACING_DOT, tostring(queueIndex))

			return
		end

		local mark = self:bindMapMark(item.gameObject)

		if not mark then
			self.view:destroyInstance(item.gameObject)

			return
		end

		self.mapMarks[key] = mark

		self:renderMapMark(mark, spec, false)
	end)
end

function WorldRacingMapCtrl:bindMapMark(gameObject)
	local objectReference = gameObject:GetComponent("ObjectReference")
	local rootUButton = objectReference and objectReference:GetRefValue("rootUButton")
	local markUContainer = objectReference and objectReference:GetRefValue("markUContainer")
	local eventBgUImage = objectReference and objectReference:GetRefValue("eventBgUImage")
	local eventMaskRectTransform = objectReference and objectReference:GetRefValue("eventMaskRectTransform")
	local eventIconUImage = objectReference and objectReference:GetRefValue("eventIconUImage")
	local eventFrameUImage = objectReference and objectReference:GetRefValue("eventFrameUImage")

	if IsNil(rootUButton) or IsNil(markUContainer) or IsNil(eventBgUImage) or IsNil(eventMaskRectTransform) or IsNil(eventIconUImage) or IsNil(eventFrameUImage) then
		logger:error("bindMapMark: ObjectReference keys rootUButton/markUContainer/eventBgUImage/" .. "eventMaskRectTransform/eventIconUImage/eventFrameUImage are missing on %s", AddressDataConst.UI_NODE_MAP_RACING_DOT)

		return nil
	end

	return {
		gameObject = gameObject,
		rectTransform = gameObject:GetComponent("RectTransform"),
		button = rootUButton,
		markContainer = markUContainer,
		eventBg = eventBgUImage,
		eventMask = eventMaskRectTransform,
		eventIcon = eventIconUImage,
		eventFrame = eventFrameUImage
	}
end

function WorldRacingMapCtrl:renderMapMark(mark, spec, animated)
	local trackEntry = spec.trackEntry
	local trackId = trackEntry.trackId
	local isTrackPoint = spec.pointType == WorldRacingMapPointUtils.POINT_TYPE.TRACK
	local anchorX, anchorY = self:getPointAnchor(trackId, spec.pointType)

	if not anchorX then
		mark.gameObject:SetActiveEx(false)

		return
	end

	local markScale = WorldRacingMapPointUtils.getMarkScale(trackId, spec.pointType)

	if not markScale then
		mark.gameObject:SetActiveEx(false)

		return
	end

	local isRevealed, eventConfig = false

	if not isTrackPoint then
		isRevealed, eventConfig = self:getSpecialEventState(trackId)

		if isRevealed == nil then
			mark.gameObject:SetActiveEx(false)

			return
		end
	end

	mark.gameObject.name = string.format("RacingMark_%d_%d", trackId, spec.pointType)
	mark.rectTransform.anchorMin = Vector2(anchorX, anchorY)
	mark.rectTransform.anchorMax = Vector2(anchorX, anchorY)
	mark.rectTransform.anchoredPosition = Vector2(0, 0)

	mark.gameObject:SetActiveEx(true)
	mark.button:TryChangePage("State", (isTrackPoint or isRevealed) and DOT_STATE_PAGE.SUPER or DOT_STATE_PAGE.UNREVEALED_EVENT)

	local showEventIcon = not isTrackPoint and isRevealed

	mark.eventBg.gameObject:SetActiveEx(showEventIcon)
	mark.eventMask.gameObject:SetActiveEx(showEventIcon)
	mark.eventFrame.gameObject:SetActiveEx(showEventIcon)

	mark.eventIcon.url = showEventIcon and eventConfig.eventCompleteIcon or ""

	mark.markContainer.gameObject:SetActiveEx(isTrackPoint)

	if isTrackPoint then
		local markPrefab = WorldRacingMapPointUtils.getMarkPrefab(trackId, spec.pointType)

		if not markPrefab then
			mark.gameObject:SetActiveEx(false)

			return
		end

		if mark.markContainer:CheckURLLoaded(markPrefab) then
			self:refreshTrackMarkAnimation(mark, trackId, mark.markContainer.content)
		elseif not mark.trackMarkLoading then
			mark.trackMarkLoading = true

			mark.markContainer:SetUrlWithCallback(markPrefab, function(content)
				mark.trackMarkLoading = false

				self:refreshTrackMarkAnimation(mark, trackId, content)
			end)
		end
	end

	local enableEventTooltip = not isTrackPoint and not self:isMatchConfirming()

	mark.button.enableAutoTransition = not isTrackPoint
	mark.button.enabledTooltip = enableEventTooltip

	if isTrackPoint then
		mark.button.interactable = self:isTrackSelectable(trackEntry)
		mark.button.tooltipId = ""

		function mark.button.luaClick()
			self:setSelectedTrack(trackId)
		end
	else
		mark.button.interactable = enableEventTooltip
		mark.button.tooltipId = pg.getLocalizationText(isRevealed and eventConfig.eventCompleteDesc or eventConfig.eventDefaultDesc)
		mark.button.luaClick = nil
	end

	self:initMapTweenIds()
	DoTweenAnimMgr.Kill(mark.gameObject, self.markScaleTweenId)
	DoTweenAnimMgr.Scale(mark.rectTransform, self.markScaleTweenId, Vector3(markScale, markScale, 1), MARK_SCALE_DURATION, 0, CS.DG.Tweening.Ease.__CastFrom(Const.DoTweenEaseType.OutCubic), nil, not animated)
end

function WorldRacingMapCtrl:refreshTrackMarkAnimation(mark, trackId, content)
	if IsNil(content) or IsNil(content.anim) or IsNil(content.anim.clip) then
		logger:error("refreshTrackMarkAnimation: table=world_racing_map_point_data, trackId=%s, " .. "field=points.markPrefab, loaded prefab or root Animation/default clip is missing", tostring(trackId))

		return
	end

	local animation = content.anim
	local selected = trackId == self.selectedTrackId

	if mark.trackMarkContent == content and mark.trackMarkSelected == selected and (not selected or animation.isPlaying) then
		return
	end

	mark.trackMarkContent = content
	mark.trackMarkSelected = selected

	if selected then
		content:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
	else
		animation:Stop()
		UIUtils.SampleAnimation(animation, animation.clip.length, animation.clip.name)
	end
end

function WorldRacingMapCtrl:refreshTeamPanel()
	local teamEntries = {}
	local abilityEntries = {}
	local player = pg.me
	local prepareList, exploreList
	local teamReady = false

	if player then
		prepareList, exploreList, teamReady = player:getWorldRaceTrackPetLists(self.selectedTrackId)

		if self.selectedTrackId and prepareList == nil and exploreList == nil then
			local formation = player.prepareFormationList and player.prepareFormationList[player.curPetFormationIndex]
			local exploreFormation = player.prepareFormationList and player.prepareFormationList[1]

			prepareList = formation and formation.formation
			exploreList = exploreFormation and exploreFormation.exploreFormation
		end
	end

	for slotIndex = 1, Const.PET_PREPARE_NUM_LIMIT do
		local petId = prepareList and prepareList[slotIndex]
		local petInfo = petId and petId ~= "" and player:getPetInfo(petId)

		teamEntries[slotIndex] = {
			tIndex = petInfo and 0 or 1,
			petInfo = petInfo
		}

		if petId and petId ~= "" and not petInfo then
			logger:error("refreshTeamPanel: battle pet not found, slotIndex=%s, petId=%s", tostring(slotIndex), tostring(petId))
		end
	end

	for abilityIndex = 1, Const.PET_EXPLORE_PREPARE_NUM_LIMIT do
		local petId = exploreList and exploreList[abilityIndex]
		local petInfo = petId and petId ~= "" and player:getPetInfo(petId)

		abilityEntries[abilityIndex] = {
			abilityIndex = abilityIndex,
			petInfo = petInfo
		}

		if petId and petId ~= "" and not petInfo then
			logger:error("refreshTeamPanel: explore pet not found, abilityIndex=%s, petId=%s", tostring(abilityIndex), tostring(petId))
		end
	end

	self.view.teamListUList:SetList(teamEntries)
	self.view.teamAbilityUList:SetList(abilityEntries)
	self:refreshStartEntry(teamReady)
end

function WorldRacingMapCtrl:refreshStartEntry(teamReady)
	if teamReady == nil and pg.me then
		local _, _, ready = pg.me:getWorldRaceTrackPetLists(self.selectedTrackId)

		teamReady = ready
	end

	local inMatching = self:isTrackMatching()
	local hideEntry = self:isMatchConfirming()

	self.view.btnStartUComponent.gameObject:SetActiveEx(not hideEntry)
	self.view.btnStartUComponent:TryChangePage("MatchState", inMatching and 1 or 0)
	self.view.btnStartUComponent:TryChangePage("MatchLock", inMatching and 1 or 0)
	self:setMatchStateWidgetsVisible(inMatching)
	self:refreshMatchCountDown()

	if inMatching then
		self.view.btnStartUComponent:TryChangePage("Colour", 0)
		self.view.btnStartTipsUBaseText.gameObject:SetActiveEx(false)

		return
	end

	self:refreshStartButtonText()

	local canStart, disabledTip = self:getTeamStartState(teamReady)

	self.view.btnStartUButton.interactable = canStart
	self.view.btnStartUButton.visualInteractable = canStart

	self.view.btnStartUButton:TryChangePage("button", canStart and 0 or 4)
	self.view.btnStartUComponent:TryChangePage("Colour", disabledTip and 1 or 0)
	ClientTextUtils.setText(self.view.btnStartTipsUBaseText, disabledTip or "")
	self.view.btnStartTipsUBaseText.gameObject:SetActiveEx(disabledTip ~= nil)
end

function WorldRacingMapCtrl:isMatchConfirming()
	return self.matchEntryHidden == true and self.mode == WorldRaceDungeonConst.MODE.MULTI
end

function WorldRacingMapCtrl:setMatchStateWidgetsVisible(inMatching)
	self.view.btnStartUButton.gameObject:SetActiveEx(not inMatching)

	if NotNil(self.view.btnCancelUButton) then
		self.view.btnCancelUButton.gameObject:SetActiveEx(inMatching)
	end

	if NotNil(self.view.txtWaitingUSDFText) then
		self.view.txtWaitingUSDFText.gameObject:SetActiveEx(inMatching)
	end
end

function WorldRacingMapCtrl:isTrackMatching()
	if self.mode ~= WorldRaceDungeonConst.MODE.MULTI or not pg.me then
		return false
	end

	local status = pg.me.matchState

	if status ~= Const.PLAYER_MATCH_STATUS.MATCH_DUNGEON and status ~= Const.PLAYER_MATCH_STATUS.MATCH_TEAM and status ~= Const.PLAYER_MATCH_STATUS.MATCHED then
		return false
	end

	local matchDungeonId = pg.me:getMatchDungeonId()

	return matchDungeonId > 0 and Utils.isWorldRacingDungeonMultiScene(matchDungeonId)
end

function WorldRacingMapCtrl:refreshMatchCountDown()
	local countDown = self.view and self.view.matchCountDown

	if IsNil(countDown) then
		return
	end

	countDown.positiveTiming = true

	local startTime = pg.me and pg.me.matchStartTime or 0

	if startTime <= 0 then
		countDown:Reset(0, MATCH_COUNT_DOWN_TOTAL_SECOND)

		return
	end

	countDown:Play(math.max(0, Time.secondCache - startTime), MATCH_COUNT_DOWN_TOTAL_SECOND)
end

function WorldRacingMapCtrl:onTeamInfoChanged()
	self:refreshStartEntry()
end

function WorldRacingMapCtrl:onTeamMatchedStatusChange()
	self:refreshStartEntry()
end

function WorldRacingMapCtrl:onMatchEntryInteractableChange(interactable)
	self.matchEntryHidden = interactable ~= true

	self:refreshFunctionWidgets()
	self:refreshTeamPanel()
end

function WorldRacingMapCtrl:refreshFunctionWidgets()
	local usable = not self:isMatchConfirming()
	local buttons = {
		self.view.btnDescriptionUButton,
		self.view.btnRankUButton,
		self.view.btnRewardUButton,
		self.view.btnSwitchTeamUButton,
		self.view.btnSwitchBuffUButton,
		self.view.buffUButton
	}

	for _, button in ipairs(buttons) do
		if NotNil(button) then
			button.interactable = usable
			button.visualInteractable = usable
		end
	end

	if self.trackEntries then
		self:refreshTrackTabs()
	end

	self:refreshMapMarks(false)
end

function WorldRacingMapCtrl:isTrackSelectable(trackEntry)
	return trackEntry.state == TRACK_STATE.COMPETING and not self:isMatchConfirming()
end

function WorldRacingMapCtrl:cancelMatch()
	if not pg.me or not pg.me:isInMatching() then
		return
	end

	if pg.me.matchState == Const.PLAYER_MATCH_STATUS.MATCHED then
		pg.global.showBubbleMessageById(11115)

		return
	end

	pg.me:cancelTeamMatching()
end

function WorldRacingMapCtrl:getTeamStartState(teamInitialized)
	if not teamInitialized then
		return false
	end

	local isMulti = self.mode == WorldRaceDungeonConst.MODE.MULTI

	if isMulti and pg.me:isInTeam() and not pg.me:isTeamLeader() then
		return false, pg.getGameString(MEMBER_DISABLE_TIP_TEXT_KEY)
	end

	local trackConfig = self.selectedTrackId and WorldRacingTrackData[self.selectedTrackId]
	local lockReason = ClientActivityUtils.getWorldRaceTrackLockReason(self.selectedTrackId, trackConfig and trackConfig.sceneId)

	if lockReason ~= ClientActivityUtils.WORLD_RACE_TRACK_LOCK.NONE then
		return false, ClientActivityUtils.getWorldRaceTrackLockTip(lockReason, self.selectedTrackId)
	end

	if isMulti and self:isTeamMemberCountOverflow() then
		return false, pg.getGameString(NUMBER_NOT_READY_TEXT_KEY)
	end

	if isMulti then
		return ClientActivityUtils.isWorldRaceTeamReady(self.selectedTrackId)
	end

	return true
end

function WorldRacingMapCtrl:isTeamMemberCountOverflow()
	if not pg.me or not pg.me:isInTeam() then
		return false
	end

	local trackConfig = self.selectedTrackId and WorldRacingTrackData[self.selectedTrackId]
	local maxCount = ClientActivityUtils.getWorldRaceTeamMemberMax(trackConfig and trackConfig.sceneId)

	return maxCount < pg.me:getTeamMemberCount()
end

function WorldRacingMapCtrl:refreshStartButtonText()
	local text = pg.getGameString(self:getStartButtonTextKey())

	ClientTextUtils.setText(self.view.btnStartTxtNameUBaseText, text)
	ClientTextUtils.setText(self.view.btnStartDisabledTxtNameUBaseText, text)
end

function WorldRacingMapCtrl:getStartButtonTextKey()
	if self.mode ~= WorldRaceDungeonConst.MODE.MULTI then
		return START_CHALLENGE_TEXT_KEY
	end

	if pg.me and pg.me:isInTeam() and not pg.me:isTeamLeader() then
		return START_CHALLENGE_TEXT_KEY
	end

	return START_MATCH_TEXT_KEY
end

function WorldRacingMapCtrl:onTrackPetListChanged(trackId)
	if trackId == nil or trackId == self.selectedTrackId then
		self:refreshTeamPanel()
	end
end

function WorldRacingMapCtrl:renderTeamPetItem(button, data)
	local petInfo = data.petInfo

	button.draggable = false
	button.interactable = not self:isMatchConfirming()

	function button.luaClick()
		self:openPetManagement(petInfo and petInfo.id)
	end

	if not petInfo then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local petIdDisplay = objectReference:GetRefValue("petIdDisplay")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local umbralUContainer = objectReference:GetRefValue("umbralUContainer")

	button:TryChangePage("state", 0)

	local petConfig = PetData[petInfo.templateId]

	if not petConfig then
		logger:error("renderTeamPetItem: pet config not found, templateId=%s", tostring(petInfo.templateId))

		return
	end

	local isShiny = Utils.isLabelShiny(petInfo.label)
	local isDark = Utils.isLabelDark(petInfo.label)

	petIdDisplay.gameObject.name = tostring(petInfo.id)
	iconUImage.url = LuaUIUtils.getPetIcon(petConfig.iconName, LuaUIUtils.PET_ICON, petInfo.label, petInfo.gender)

	button:TryChangePage("Type", isDark and 2 or isShiny and 1 or 0)
	LuaUIUtils.renderPetHeadFlashBgAndFrame(objectReference, isShiny, petInfo.shinyStyle)
	umbralUContainer:SetActive(isDark)

	if isDark then
		umbralUContainer:LoadDefaultUrlManually()
	end

	PetManagementDataHelper.tryChangePetHeadBossTagPage(button, petInfo.label)
end

function WorldRacingMapCtrl:renderAbilityItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local panelAddUWidget = objectReference:GetRefValue("panelAddUWidget")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local petCharUButton = objectReference:GetRefValue("petCharUButton")
	local petInfo = data.petInfo

	button:TryChangePage("PetChar", data.abilityIndex)
	button:TryChangePage("State", petInfo and 0 or 1)
	panelAddUWidget.gameObject:SetActiveEx(not petInfo)

	button.interactable = not self:isMatchConfirming()

	function button.luaClick()
		self:openPetManagement(petInfo and petInfo.id, UIConst.PetMgrTabType.EXPLORE + 1)
	end

	if not petInfo then
		iconUImage.url = ""

		return
	end

	local petConfig = PetData[petInfo.templateId]

	if not petConfig then
		logger:error("renderAbilityItem: pet config not found, templateId=%s", tostring(petInfo.templateId))

		return
	end

	local abilityIndex = data.abilityIndex == AbilityConst.SPECIFIC_ABILITY_INDEX_GLIDE and AbilityConst.SPECIFIC_ABILITY_INDEX_FLY or data.abilityIndex
	local abilityName = AbilityConst.SPECIFIC_ABILITY_INDEX_2_NAME[abilityIndex]
	local abilityLevel = petConfig[abilityName]

	if not abilityLevel or abilityLevel < 1 or abilityLevel > 3 then
		logger:error("renderAbilityItem: invalid explore ability level, templateId=%s, abilityName=%s, level=%s", tostring(petInfo.templateId), tostring(abilityName), tostring(abilityLevel))

		return
	end

	petCharUButton:TryChangePage("quality", abilityLevel - 1)

	iconUImage.url = LuaUIUtils.getPetIcon(petConfig.iconName, LuaUIUtils.PET_ICON, petInfo.label, petInfo.gender)
end

function WorldRacingMapCtrl:openPetManagement(petId, tab)
	local _, _, teamReady = pg.me:getWorldRaceTrackPetLists(self.selectedTrackId)

	if not teamReady then
		pg.global.showBubbleMessage(NoticeDef.ERROR_CLIENT_OPERATION)

		return
	end

	pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT, {
		isWorldRacing = true,
		trackId = self.selectedTrackId,
		petId = petId,
		tab = tab,
		autoFilter = tab ~= UIConst.PetMgrTabType.EXPLORE + 1
	})
end

function WorldRacingMapCtrl:switchTeamFormation()
	self:openPetManagement()
end

function WorldRacingMapCtrl:onSelectedBuffChanged()
	self:refreshBuffPanel()
	self:refreshStartEntry()
end

function WorldRacingMapCtrl:onSelectedBuffChanged()
	self:refreshBuffPanel()
	self:refreshStartEntry()
end

function WorldRacingMapCtrl:refreshBuffPanel()
	if not self.activityConfig then
		return
	end

	local buffIds = self.activityConfig.originalBuffIds
	local hasBuffs = buffIds ~= nil and #buffIds > 0

	self.view.panelBuffUWidget.gameObject:SetActiveEx(hasBuffs)

	if not hasBuffs then
		return
	end

	local buffId = pg.me.racingSelectedBuffId

	self.view.buffTemplateRectTransform.gameObject:SetActiveEx(true)

	self.view.buffIconUImage.url = ""

	ClientTextUtils.setText(self.view.textBuffContentUBaseText, "")
	self.view.widget:TryChangePage("State", buffId == 0 and 1 or 0)

	if buffId == 0 then
		return
	end

	local config = ClientActivityUtils.getWorldRaceBuffConfig(buffId)

	if not config then
		return
	end

	self.view.buffIconUImage.url = config.icon

	ClientTextUtils.setText(self.view.textBuffContentUBaseText, pg.getLocalizationText(config.buffDesc))
end

function WorldRacingMapCtrl:openBuffChoose()
	pg.global.ui:open(UIConst.UI_ID_WORLD_RACING_BUFF_CHOOSE, {
		eventPhase = self.eventPhase
	})
end

function WorldRacingMapCtrl:isMultiDailyOpen()
	if self.mode ~= WorldRaceDungeonConst.MODE.MULTI then
		return true
	end

	return ClientActivityUtils.isWorldRaceMultiDailyOpen(self.activityConfig)
end

function WorldRacingMapCtrl:startSelectedTrack()
	if self:isTrackMatching() then
		return
	end

	if pg.me:isInMatching() then
		local matchingDungeonId = pg.me:getMatchDungeonId()
		local matchingDungeonConfig = LevelData[matchingDungeonId]

		if not matchingDungeonConfig or not matchingDungeonConfig.name or matchingDungeonConfig.name == 0 or matchingDungeonConfig.name == "" then
			logger:error("startSelectedTrack: table=level_data, id=%s, field=name, " .. "matching dungeon config or required name is missing", tostring(matchingDungeonId))

			return
		end

		pg.global.showBubbleMessageRaw(pg.getFormatText(pg.getGameString(OTHER_MATCHING_TIP_TEXT_KEY), pg.getLocalizationText(matchingDungeonConfig.name)))

		return
	end

	local trackConfig = self.selectedTrackId and WorldRacingTrackData[self.selectedTrackId]

	if not trackConfig then
		pg.global.showBubbleMessage(NoticeDef.ERROR_ACTIVITY_NOT_OPEN)

		return
	end

	if not self:isMultiDailyOpen() then
		pg.global.showBubbleMessage(NoticeDef.ERROR_ACTIVITY_NOT_OPEN)

		return
	end

	local _, _, teamReady = pg.me:getWorldRaceTrackPetLists(self.selectedTrackId)

	if not self:getTeamStartState(teamReady) then
		self:refreshTeamPanel()

		return
	end

	local matchType = self.mode == WorldRaceDungeonConst.MODE.MULTI and MatchConst.MATCH_TEAM_MEMBER_TYPE.MATCH_MEMBER_ENTER or MatchConst.MATCH_TEAM_MEMBER_TYPE.DIRECTLY_ENTER

	pg.me:startMatch(trackConfig.sceneId, self.selectedTrackId, matchType)
end

function WorldRacingMapCtrl:onDestroy()
	self:killTimer(self.trackOpenStateTimerId)

	self.trackOpenStateTimerId = nil

	self:initMapTweenIds()

	for _, mark in pairs(self.mapMarks or {}) do
		if NotNil(mark.gameObject) then
			DoTweenAnimMgr.Kill(mark.gameObject, self.markScaleTweenId)
		end
	end

	self.mapMarks = nil
	self.mapMarkLoadingKeys = nil

	local content = self.view and self.view.mapContentRectTransform

	if NotNil(content) then
		DoTweenAnimMgr.Kill(content.gameObject, self.mapPanTweenId)
	end

	self.mapPanPlaced = false

	UICtrl.onDestroy(self)
end

return WorldRacingMapCtrl
