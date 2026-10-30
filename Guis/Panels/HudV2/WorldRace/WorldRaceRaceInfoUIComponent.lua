-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HudV2\\WorldRace\\WorldRaceRaceInfoUIComponent.lua

local Class = require("Core.Framework.Class")
local MessageName = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local ActivityConst = require("Common.Const.ActivityConst")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local DungeonConst = require("Common.Const.DungeonConst")
local WorldRacingData = require("Data.event_world_racing_data")
local Utils = require("Common.Utils.Utils")
local HudBaseComponent = require("Guis.Panels.HudV2.HudBaseComponent")
local Time = require("Core.Common.Time")
local ClientConst = require("Const.ClientConst")
local ClientSwitch = require("Common.ClientSwitch")
local EMPTY_TABLE = require("Core.Common.EmptyTable")
local MULTI_RANK_COLORS = {
	"FFE866",
	"C2E5FF",
	"FFAF68"
}
local MULTI_RANK_EXPANDED_PREF_KEY = "worldRaceMultiRankExpanded"
local WorldRaceRaceInfoUIComponent = Class.LightClass("WorldRaceRaceInfoUIComponent", HudBaseComponent)

WorldRaceRaceInfoUIComponent.messages = {
	[MessageName.WORLD_RACE_SINGLE_SNAPSHOT_CHANGED] = {
		"onWorldRaceSingleSnapshotChanged",
		true
	},
	[MessageName.WORLD_RACE_MULTI_RANK_CHANGED] = {
		"refreshMultiRanking",
		true
	},
	[MessageName.WORLD_RACE_GOLD_COINS_CHANGED] = {
		"onWorldRaceGoldCoinsChanged",
		true
	},
	[MessageName.DUNGEON_STATE_CHANGE] = {
		"onDungeonStateChanged",
		true
	}
}

function WorldRaceRaceInfoUIComponent:ctor(ctrl, trans, extInfo)
	self._worldRaceInfoAlive = true

	HudBaseComponent.ctor(self, ctrl, trans, extInfo)
end

function WorldRaceRaceInfoUIComponent:onRootNodeLoaded(trans)
	if not self._worldRaceInfoAlive then
		if trans and trans.gameObject then
			pg.global.uiMgr:DestroyItem(trans.gameObject)
		end

		return
	end

	HudBaseComponent.onRootNodeLoaded(self, trans)
end

function WorldRaceRaceInfoUIComponent:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.rootUComponent = self.objectReference:GetRefValue("rootUComponent")
	self.timeUSDFText = self.objectReference:GetRefValue("timeUSDFText")
	self.endTimeUSDFText = self.objectReference:GetRefValue("endTimeUSDFText")
	self.recordUSDFText = self.objectReference:GetRefValue("recordUSDFText")
	self.rankingUSDFText = self.objectReference:GetRefValue("rankingUSDFText")
	self.rankingListUList = self.objectReference:GetRefValue("rankingListUList")
	self.panelConductUWidget = self.objectReference:GetRefValue("panelConductUWidget")
	self.paneEndUWidget = self.objectReference:GetRefValue("paneEndUWidget")
	self.starBarUContainer = self.objectReference:GetRefValue("starBarUContainer")
	self.evaluateUComponent = self.objectReference:GetRefValue("evaluateUComponent")

	local evaluateObjectReference = self.evaluateUComponent.transform:GetComponent("ObjectReference")

	self.evaluateS = evaluateObjectReference:GetRefValue("evaluateS")
	self.evaluateA = evaluateObjectReference:GetRefValue("evaluateA")
	self.evaluateB = evaluateObjectReference:GetRefValue("evaluateB")
	self.evaluateInfoText = evaluateObjectReference:GetRefValue("infoText")
	self.btnArrowUButton = self.objectReference:GetRefValue("btnArrowUButton")
end

function WorldRaceRaceInfoUIComponent:initView()
	local space = pg.space

	self._worldRaceViewReady = true
	self._worldRaceElapsedText = nil
	self.isSingleWorldRace = space and space.racingDungeonGetMode and space:racingDungeonGetMode() == WorldRaceDungeonConst.MODE.SINGLE

	self.btnArrowUButton:SetActive(not self.isSingleWorldRace)
	self.evaluateUComponent:SetActive(false)
	self.evaluateS:SetActive(false)
	self.evaluateA:SetActive(false)
	self.evaluateB:SetActive(false)
	self:_refreshPhaseVisible(space and space.status)

	if self.starBarUContainer:CheckURLLoaded() then
		self:_onStarBarLoaded(self.starBarUContainer.content)
	else
		self.starBarUContainer:LoadDefaultUrlManually(function(item)
			self:_onStarBarLoaded(item)
		end)
	end

	if self.isSingleWorldRace then
		self:refreshRaceInfo(space.getWorldRaceSingleUISnapshot and space:getWorldRaceSingleUISnapshot() or nil)
	else
		local arrowPage = pg.global.prefsCacheUtils:getInt(MULTI_RANK_EXPANDED_PREF_KEY, 1, ClientConst.CACHE_TYPE_FLAG.USER)

		self:_setMultiRankingExpanded(arrowPage ~= 0)

		function self.btnArrowUButton.luaClick()
			self:onRankingArrowClicked()
		end

		self.rankingUSDFText.supportRichText = true

		function self.rankingListUList.luaRenderItem(button, index, data)
			self:_renderMultiRankingItem(button, data)
		end

		self:refreshMultiRanking()
	end
end

function WorldRaceRaceInfoUIComponent:_setMultiRankingExpanded(expanded)
	local page = expanded and 1 or 0

	self.rootUComponent:TryChangePage("Arrow", page)
	self.btnArrowUButton:TryChangePage("Arrow", page)
	self.rankingListUList:SetActive(expanded)
end

function WorldRaceRaceInfoUIComponent:onRankingArrowClicked()
	if not self._worldRaceViewReady or self.isSingleWorldRace then
		return
	end

	local _, page = self.rootUComponent:TryGetCurrentPage("Arrow")
	local nextPage = page == 0 and 1 or 0

	self:_setMultiRankingExpanded(nextPage == 1)
	pg.global.prefsCacheUtils:setInt(MULTI_RANK_EXPANDED_PREF_KEY, nextPage, ClientConst.CACHE_TYPE_FLAG.USER)
	self:_refreshMultiEvaluationDisplay()

	if nextPage == 1 then
		self:_refreshMultiDistances()
	end
end

function WorldRaceRaceInfoUIComponent:refreshMultiRanking()
	if not self._worldRaceViewReady or self.isSingleWorldRace then
		return
	end

	local space = pg.space
	local rankingList = space and space.getWorldRaceMultiRanking and space:getWorldRaceMultiRanking() or {}
	local myInfo

	for _, info in ipairs(rankingList) do
		if pg.me and info.playerId == pg.me.id then
			myInfo = info

			break
		end
	end

	local myRank = myInfo and myInfo.rank

	ClientTextUtils.setText(self.rankingUSDFText, string.format("<color=#%s>%s</color><size=50%%><color=#FFFFFF>/%d</color></size>", MULTI_RANK_COLORS[myRank] or "FFFFFF", myRank or "--", #rankingList))

	local displayRankingList = self:_buildMultiRankingDisplayList(rankingList, myRank)

	self._worldRaceRankingList = displayRankingList

	self:_hideMultiEvaluationWidget()

	self._worldRaceMyRowRoot = nil
	self._worldRaceMyRowTips = nil

	self.rankingListUList:SetList(displayRankingList)
	self:_updateMultiRankFeedback(myInfo)
	self:_refreshMultiEvaluationDisplay()
	self:_refreshMultiDistances()
end

function WorldRaceRaceInfoUIComponent:_buildMultiRankingDisplayList(rankingList, myRank)
	local displayRankingList = {}

	if myRank == nil or myRank <= 3 then
		for index = 1, math.min(4, #rankingList) do
			displayRankingList[#displayRankingList + 1] = rankingList[index]
		end

		return displayRankingList
	end

	displayRankingList[1] = rankingList[1]
	displayRankingList[2] = rankingList[myRank - 1]
	displayRankingList[3] = rankingList[myRank]

	if rankingList[myRank + 1] then
		displayRankingList[4] = rankingList[myRank + 1]
	end

	return displayRankingList
end

function WorldRaceRaceInfoUIComponent:_refreshMultiDistances()
	if not ClientSwitch.EnableWorldRaceMultiDistance then
		return
	end

	if not self._worldRaceViewReady or self.isSingleWorldRace or not self._worldRaceRankingList then
		return
	end

	local _, arrowPage = self.rootUComponent:TryGetCurrentPage("Arrow")

	if arrowPage ~= 1 then
		return
	end

	local space = pg.space

	if not space or not space.getWorldRaceMultiRouteDistance or space.status ~= DungeonConst.STATUS.PLAYING then
		return
	end

	local myDistance = pg.me and space:getWorldRaceMultiRouteDistance(pg.me.id)

	for index, data in ipairs(self._worldRaceRankingList) do
		if not pg.me or data.playerId ~= pg.me.id then
			local distance = myDistance and space:getWorldRaceMultiRouteDistance(data.playerId)
			local text = "--"

			if distance then
				local meters = math.floor(math.abs(distance - myDistance) + 0.5)

				text = meters == 0 and "0m" or string.format("%+dm", distance < myDistance and -meters or meters)
			end

			if data.distanceText ~= text then
				data.distanceText = text

				local found, button = self.rankingListUList:TryGetChildAt(index - 1)

				if found then
					local objectReference = button:GetComponent("ObjectReference")

					ClientTextUtils.setText(objectReference:GetRefValue("distanceUSDFText"), text)
				end
			end
		end
	end
end

function WorldRaceRaceInfoUIComponent:_renderMultiRankingItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local rootUButton = objectReference:GetRefValue("rootUButton")
	local rankingTxt = objectReference:GetRefValue("rankingUSDFText")
	local numTxt = objectReference:GetRefValue("nameUSDFText")

	ClientTextUtils.setText(rankingTxt, data.rank)
	ClientTextUtils.setText(numTxt, data.name)
	rootUButton:TryChangePage("State", pg.me and data.playerId == pg.me.id and 1 or 0)
	rootUButton:TryChangePage("Finish", data.isFinished and 1 or 0)

	local distanceText = objectReference:GetRefValue("distanceUSDFText")

	distanceText:SetActive(ClientSwitch.EnableWorldRaceMultiDistance and not data.isFinished and (not pg.me or data.playerId ~= pg.me.id))

	if ClientSwitch.EnableWorldRaceMultiDistance then
		ClientTextUtils.setText(distanceText, data.distanceText or "--")
	end

	rootUButton:TryChangePage("Tips", 0)

	if pg.me and data.playerId == pg.me.id then
		self._worldRaceMyRowRoot = rootUButton
		self._worldRaceMyRowTips = objectReference:GetRefValue("ratingTagUComponent")
	elseif self._worldRaceMyRowRoot == rootUButton then
		self._worldRaceMyRowRoot = nil
		self._worldRaceMyRowTips = nil
	end

	self:_refreshMultiEvaluationDisplay()

	local teamNumberUContainer = objectReference:GetRefValue("teamNumberUContainer")

	if teamNumberUContainer then
		teamNumberUContainer:SetActive(false)
	end
end

function WorldRaceRaceInfoUIComponent:_onStarBarLoaded(item)
	if not self._worldRaceInfoAlive or not self._worldRaceViewReady or IsNil(item) or self.starBarUContainer.content ~= item then
		return
	end

	local objectReference = item:GetComponent("ObjectReference")

	self.starRootUComponent = objectReference:GetRefValue("rootUComponent")
	self.scoreUSDFText = objectReference:GetRefValue("scoreUSDFText")

	self:refreshStarBar()
end

function WorldRaceRaceInfoUIComponent:onDungeonStateChanged()
	local space = pg.space

	self:_refreshPhaseVisible(space and space:isRacingDungeon() and space.status or nil)

	if not self.isSingleWorldRace then
		self:refreshMultiRanking()
	end
end

function WorldRaceRaceInfoUIComponent:_refreshPhaseVisible(status)
	if not self._worldRaceViewReady then
		return
	end

	local isPlaying = status == DungeonConst.STATUS.PLAYING

	self.panelConductUWidget:SetActive(isPlaying and not self.isSingleWorldRace)
	self.paneEndUWidget:SetActive(isPlaying and self.isSingleWorldRace)
	self.starBarUContainer:SetActive(isPlaying)

	if isPlaying then
		if not self._worldRaceTimeTimer then
			self:_refreshRaceTime()

			self._worldRaceTimeTimer = self:startTimer(function()
				self:_refreshRaceTime()
			end, 0.05, true)
		end
	else
		self:killTimer(self._worldRaceTimeTimer)

		self._worldRaceTimeTimer = nil
		self._worldRaceElapsedText = nil
	end

	if isPlaying and not self.isSingleWorldRace then
		if not self._worldRaceDistanceTimer then
			self._worldRaceDistanceTimer = self:startTimer(function()
				self:_tickMultiPresentation()
				self:_refreshMultiDistances()
			end, 0.2, true)
		end
	else
		if self._worldRaceDistanceTimer then
			self:killTimer(self._worldRaceDistanceTimer)

			self._worldRaceDistanceTimer = nil
		end

		if not self.isSingleWorldRace then
			self:_clearMultiRankFeedback()
		end
	end
end

function WorldRaceRaceInfoUIComponent:_refreshRaceTime()
	if not self._worldRaceViewReady or not self:checkUIShow() then
		return
	end

	local space = pg.space

	if not space or not space:isRacingDungeon() or space.status ~= DungeonConst.STATUS.PLAYING then
		return
	end

	local elapsed = math.max(0, Time.secondCache - (space.start_ts or Time.secondCache))
	local timeText = ClientActivityUtils.formatWorldRaceTime(elapsed)

	if self._worldRaceElapsedText == timeText then
		return
	end

	self._worldRaceElapsedText = timeText

	local timeUSDFText = self.isSingleWorldRace and self.endTimeUSDFText or self.timeUSDFText

	ClientTextUtils.setText(timeUSDFText, timeText)
end

function WorldRaceRaceInfoUIComponent:_getMultiRankConfig()
	local phase = ActivityUtils.getOprActivityPhase(ActivityConst.EventType.OpenWorldRacing, pg.me)

	return phase and WorldRacingData[phase] or EMPTY_TABLE
end

function WorldRaceRaceInfoUIComponent:_updateMultiRankFeedback(myInfo)
	if not pg.space or pg.space.status ~= DungeonConst.STATUS.PLAYING or not myInfo or myInfo.isFinished then
		self:_clearMultiRankFeedback()

		return
	end

	local previousRank = self._worldRaceMyRank
	local rank = myInfo.rank

	self._worldRaceMyRank = rank

	if rank == 1 then
		if not self._worldRaceFirstTipAt then
			local interval = tonumber(self:_getMultiRankConfig().multiKeepFirstInterval) or 10

			self._worldRaceFirstTipAt = Time.realSecondCache + (interval > 0 and interval or 10)
		end
	else
		self._worldRaceFirstTipAt = nil
	end

	if previousRank then
		if rank < previousRank and rank <= 3 then
			self:_showMultiEvaluation("multiRankUpText", "RACE_EVALUATE_BREAK", true)
		elseif previousRank < rank then
			self:_showMultiEvaluation("multiRankDownText", "RACE_EVALUATE_DEMOTE", false)
		end
	end
end

function WorldRaceRaceInfoUIComponent:_tickMultiPresentation()
	if not pg.space or pg.space.status ~= DungeonConst.STATUS.PLAYING then
		return
	end

	local now = Time.realSecondCache

	if self._worldRaceEvaluation and now >= self._worldRaceEvaluation.endTime then
		self._worldRaceEvaluation = nil

		self:_refreshMultiEvaluationDisplay()
	end

	if self._worldRaceFirstTipAt and now >= self._worldRaceFirstTipAt then
		local interval = tonumber(self:_getMultiRankConfig().multiKeepFirstInterval) or 10

		self._worldRaceFirstTipAt = now + (interval > 0 and interval or 10)

		self:_showMultiEvaluation("multiKeepFirstText", "RACE_EVALUATE_S_KEEP_2", true)
	end
end

function WorldRaceRaceInfoUIComponent:_showMultiEvaluation(textField, fallbackKey, positive)
	local now = Time.realSecondCache

	if self._worldRaceNextTipAt and now < self._worldRaceNextTipAt then
		return
	end

	local config = self:_getMultiRankConfig()
	local duration = tonumber(config.multiRankTipDuration) or 2
	local cooldown = tonumber(config.multiRankTipCooldown) or 2

	self._worldRaceNextTipAt = now + math.max(0, cooldown)
	self._worldRaceEvaluation = {
		textId = tonumber(config[textField]),
		fallbackKey = fallbackKey,
		positive = positive,
		endTime = now + (duration > 0 and duration or 2)
	}

	self:_refreshMultiEvaluationDisplay()
end

function WorldRaceRaceInfoUIComponent:_hideMultiEvaluationWidget()
	local widget = self._worldRaceTipWidget

	if not IsNil(self._worldRaceTipRoot) then
		self._worldRaceTipRoot:TryChangePage("Tips", 0)
	elseif not IsNil(widget) then
		widget:SetActive(false)
	end

	self._worldRaceTipWidget = nil
	self._worldRaceTipRoot = nil
end

function WorldRaceRaceInfoUIComponent:_refreshMultiEvaluationDisplay()
	local evaluation = self._worldRaceEvaluation
	local _, arrowPage = self.rootUComponent:TryGetCurrentPage("Arrow")
	local widget
	local hasEvaluation = evaluation and Time.realSecondCache < evaluation.endTime

	if not hasEvaluation or arrowPage ~= 0 then
		self.evaluateUComponent:SetActive(false)
	end

	if hasEvaluation then
		if arrowPage == 0 then
			widget = self.evaluateUComponent
		elseif not IsNil(self._worldRaceMyRowRoot) then
			widget = self._worldRaceMyRowTips
		end
	end

	if self._worldRaceTipWidget ~= widget then
		self:_hideMultiEvaluationWidget()
	end

	if IsNil(widget) then
		return
	end

	self._worldRaceTipWidget = widget
	self._worldRaceTipRoot = widget ~= self.evaluateUComponent and self._worldRaceMyRowRoot or nil

	local text

	if widget == self.evaluateUComponent then
		text = self.evaluateInfoText
	else
		local objectReference = widget:GetComponent("ObjectReference")

		objectReference:GetRefValue("rootUComponent"):TryChangePage("State", evaluation.positive and 0 or 1)

		text = objectReference:GetRefValue("tagUSDFText")
	end

	if evaluation.textId and evaluation.textId > 0 then
		ClientTextUtils.setTextWithId(text, evaluation.textId)
	else
		ClientTextUtils.setText(text, pg.getGameString(evaluation.fallbackKey))
	end

	if self._worldRaceTipRoot then
		self._worldRaceTipRoot:TryChangePage("Tips", 1)
	else
		widget:SetActive(true)
	end
end

function WorldRaceRaceInfoUIComponent:_clearMultiRankFeedback()
	self._worldRaceMyRank = nil
	self._worldRaceFirstTipAt = nil
	self._worldRaceNextTipAt = nil
	self._worldRaceEvaluation = nil

	self:_hideMultiEvaluationWidget()

	if self.evaluateUComponent then
		self.evaluateUComponent:SetActive(false)
	end
end

function WorldRaceRaceInfoUIComponent:refreshStarBar()
	if not self.scoreUSDFText or not pg.me then
		return
	end

	local currentCount = math.max(0, tonumber(pg.me.racingGoldCoins) or 0)
	local phase = ActivityUtils.getOprActivityPhase(ActivityConst.EventType.OpenWorldRacing, pg.me)
	local maxLayerConfig = phase and WorldRacingData[phase] and WorldRacingData[phase].maxSpeedBuffLayer
	local maxCount = Utils.isTable(maxLayerConfig) and tonumber(maxLayerConfig[2]) or tonumber(maxLayerConfig)

	maxCount = math.max(0, maxCount or 0)

	ClientTextUtils.setText(self.scoreUSDFText, string.format("%d/%d", currentCount, maxCount))

	local previousCount = self._worldRaceStarCount

	self._worldRaceStarCount = currentCount

	if previousCount ~= nil and pg.space and pg.space.status == DungeonConst.STATUS.PLAYING and not IsNil(self.starRootUComponent) then
		if currentCount < previousCount then
			self.starRootUComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom2)
		elseif maxCount > 0 and previousCount < maxCount and maxCount <= currentCount then
			self.starRootUComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
		end
	end
end

function WorldRaceRaceInfoUIComponent:onWorldRaceGoldCoinsChanged()
	self:refreshStarBar()
end

function WorldRaceRaceInfoUIComponent:refreshRaceInfo(info)
	if not self._worldRaceViewReady then
		return
	end

	if self.isSingleWorldRace then
		self:_refreshPhaseVisible(info and info.status)

		local bestTimeText = ClientActivityUtils.formatWorldRaceTime(info and info.bestTime or 0)

		ClientTextUtils.setText(self.recordUSDFText, string.format(ClientTextUtils.getGameString("RACING_BEST_RECORD"), bestTimeText))

		local hasRating = info and info.hasRating

		self.evaluateUComponent:SetActive(hasRating == true)

		if hasRating then
			local grade = info.grade

			self.evaluateS:SetActive(grade == "S")
			self.evaluateA:SetActive(grade == "A")
			self.evaluateB:SetActive(grade == "B")

			if self._worldRaceSingleGrade ~= grade then
				self.evaluateUComponent:TryChangePage("Grade", 0)

				if self._worldRaceSingleGrade then
					local previousPage = ClientActivityUtils.getWorldRaceRatingPageByGrade(self._worldRaceSingleGrade)
					local currentPage = ClientActivityUtils.getWorldRaceRatingPageByGrade(grade)

					self.evaluateUComponent:TryChangePage("Grade", currentPage < previousPage and 1 or 2)
				end

				self._worldRaceSingleGrade = grade
			end

			ClientTextUtils.setText(self.evaluateInfoText, ClientActivityUtils.getWorldRaceRatingDescriptionByGrade(grade))

			local progress = grade == "S" and self.evaluateS or grade == "A" and self.evaluateA or self.evaluateB

			progress.minValue = 0
			progress.maxValue = 1
			progress.value = math.max(0, math.min(1, info.fillPercent or 0))
		elseif self._worldRaceSingleGrade then
			self.evaluateUComponent:TryChangePage("Grade", 0)

			self._worldRaceSingleGrade = nil

			self.evaluateS:SetActive(false)
			self.evaluateA:SetActive(false)
			self.evaluateB:SetActive(false)
		end

		return
	end

	if not pg.space or pg.space.status ~= DungeonConst.STATUS.PLAYING then
		ClientTextUtils.setText(self.timeUSDFText, ClientActivityUtils.formatWorldRaceTime(info and info.elapsedTime or 0))
	end
end

function WorldRaceRaceInfoUIComponent:onWorldRaceSingleSnapshotChanged(snapshot)
	if self.isSingleWorldRace then
		self:refreshRaceInfo(snapshot)
	end
end

function WorldRaceRaceInfoUIComponent:onDestroy()
	self:_clearMultiRankFeedback()

	self._worldRaceInfoAlive = false
	self._worldRaceViewReady = false

	self:killTimer(self._worldRaceTimeTimer)

	self._worldRaceTimeTimer = nil
	self._worldRaceElapsedText = nil

	self:killTimer(self._worldRaceDistanceTimer)

	self._worldRaceDistanceTimer = nil
	self._worldRaceRankingList = nil

	if self.rankingListUList then
		self.rankingListUList.luaRenderItem = nil
	end

	if self.btnArrowUButton then
		self.btnArrowUButton.luaClick = nil
	end

	self.objectReference = nil
	self.rootUComponent = nil
	self.timeUSDFText = nil
	self.endTimeUSDFText = nil
	self.recordUSDFText = nil
	self.rankingUSDFText = nil
	self.rankingListUList = nil
	self.btnArrowUButton = nil
	self._worldRaceMyRowRoot = nil
	self._worldRaceMyRowTips = nil
	self.panelConductUWidget = nil
	self.paneEndUWidget = nil
	self.starBarUContainer = nil
	self.scoreUSDFText = nil
	self.starRootUComponent = nil
	self._worldRaceStarCount = nil
	self.evaluateUComponent = nil
	self.evaluateS = nil
	self.evaluateA = nil
	self.evaluateB = nil
	self.evaluateInfoText = nil
	self._worldRaceSingleGrade = nil
	self.isSingleWorldRace = nil

	HudBaseComponent.onDestroy(self)
end

return WorldRaceRaceInfoUIComponent
