-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloween\\EventHalloweenModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local Time = require("Core.Common.Time")
local ActivityConst = require("Common.Const.ActivityConst")
local Const = require("Common.Const.Const")
local RedDotConst = require("Const.RedDotConst")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local TimeUtils = require("Common.Utils.TimeUtils")
local ClientUtils = require("Utils.ClientUtils")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ActivateTasksData = require("Data.activate_tasks_data")
local EventHalloweenData = require("Data.event_halloween_data")
local EventTaskData = require("Data.event_task_data")
local GameEventData = require("Data.game_event_data")
local ItemConstSourceData = require("Data.item_const_source_data")
local EventHalloweenModel = Class.LightClass("EventHalloweenModel", UIModel)

EventHalloweenModel.MATERIAL_SELECT_COUNT = 3
EventHalloweenModel.ROOM_BADGE_COUNT = 4
EventHalloweenModel.PET_BADGE_COUNT = 5
EventHalloweenModel.TOTAL_BADGE_COUNT = 9

function EventHalloweenModel:ctor()
	UIModel.ctor(self)

	self.eventId = nil
end

function EventHalloweenModel:setEventId(eventId)
	local eventConfig = eventId and GameEventData[eventId]

	if eventConfig and eventConfig.eventType == ActivityConst.EventType.Halloween then
		self.eventId = eventId

		return
	end

	local isOpen, openEventId = ActivityUtils.isOprActivityTabOpenByType(ActivityConst.EventType.Halloween, pg.me)

	self.eventId = isOpen and openEventId or nil
end

function EventHalloweenModel:getEventId()
	if not self.eventId then
		self:setEventId(nil)
	end

	return self.eventId
end

function EventHalloweenModel:getEventPhase()
	local eventConfig = GameEventData[self:getEventId()]

	return eventConfig and eventConfig.phase or 1
end

function EventHalloweenModel:isActivityOpen()
	return ClientActivityUtils.isGameEventTabOpen(self:getEventId())
end

function EventHalloweenModel:getActivityConfig()
	return EventHalloweenData[self:getEventPhase()]
end

function EventHalloweenModel:getHalloweenActivityData()
	return ActivityUtils.getActivityData(pg.me, ActivityConst.EventType.Halloween)
end

function EventHalloweenModel:getActivityTitle()
	local eventConfig = GameEventData[self:getEventId()]

	return eventConfig and pg.getLocalizationText(eventConfig.name) or ""
end

function EventHalloweenModel:getProgressTipsText()
	return pg.getGameString("HALLOWEEN_DECORATE_2")
end

function EventHalloweenModel:getRewardPreviewDropId()
	local activityConfig = self:getActivityConfig()

	return activityConfig and activityConfig.showReward
end

function EventHalloweenModel:getCandyRewardDropId()
	local activityConfig = self:getActivityConfig()

	return activityConfig and activityConfig.candyReward
end

function EventHalloweenModel:isCandyHouseRewardNotify(notifyInfo)
	local context = notifyInfo[3]
	local dropIdList = context and context.dropIdList
	local candyRewardDropId = self:getCandyRewardDropId()

	return notifyInfo[2] == ItemConstSourceData.ITEM_SOURCE_COMMUNITY_GUIDE and candyRewardDropId ~= nil and dropIdList ~= nil and dropIdList[candyRewardDropId] ~= nil
end

function EventHalloweenModel:getTaskGroupConfig()
	return ActivateTasksData[self:getEventId()]
end

function EventHalloweenModel:getSortedTaskIds(taskGroupId)
	local taskIds = ActivityUtils.getActTaskIdsByGroupId(taskGroupId) or {}
	local sortedTaskIds = {}

	for _, taskId in ipairs(taskIds) do
		if EventTaskData[taskId] then
			sortedTaskIds[#sortedTaskIds + 1] = taskId
		end
	end

	table.sort(sortedTaskIds, function(leftTaskId, rightTaskId)
		local leftConfig = EventTaskData[leftTaskId]
		local rightConfig = EventTaskData[rightTaskId]
		local leftSort = leftConfig.sort or leftTaskId
		local rightSort = rightConfig.sort or rightTaskId

		if leftSort ~= rightSort then
			return leftSort < rightSort
		end

		return leftTaskId < rightTaskId
	end)

	return sortedTaskIds
end

function EventHalloweenModel:getTaskProgress(taskConfig, taskState)
	if not taskConfig or not pg.me or not pg.me.triggerMap then
		return 0, 0
	end

	local conditionId = taskConfig.taskCondition
	local target = conditionId and pg.me.triggerMap:getConditionTargetCount(conditionId, 1) or 0
	local progress = conditionId and pg.me.triggerMap:getConditionFinishCount(conditionId, 1) or 0

	if taskState and taskState >= ActivityConst.TaskState.Finihed_CanRecv then
		progress = target
	end

	return progress or 0, target or 0
end

function EventHalloweenModel:buildTaskList(taskGroupId)
	local taskList = {}

	for index, taskId in ipairs(self:getSortedTaskIds(taskGroupId)) do
		local taskConfig = EventTaskData[taskId]
		local taskState = ActivityUtils.getActTaskState(pg.me, taskId) or ActivityConst.TaskState.UnFinished
		local progress, target = self:getTaskProgress(taskConfig, taskState)

		taskList[#taskList + 1] = {
			taskId = taskId,
			taskState = taskState,
			taskDes = taskConfig.taskDes,
			taskAward = taskConfig.award,
			sourceId = taskConfig.sourceId,
			sort = taskConfig.sort or index,
			progress = progress,
			target = target
		}
	end

	return taskList
end

function EventHalloweenModel:getDailyTaskDataList()
	local taskGroupConfig = self:getTaskGroupConfig()

	return self:buildTaskList(taskGroupConfig and taskGroupConfig.dailyTaskGroup)
end

function EventHalloweenModel:getDailyTaskProgress()
	local taskList = self:getDailyTaskDataList()
	local completedCount = 0

	for _, taskData in ipairs(taskList) do
		if taskData.taskState >= ActivityConst.TaskState.Finihed_CanRecv then
			completedCount = completedCount + 1
		end
	end

	return completedCount, #taskList
end

function EventHalloweenModel:getProgressRewardTaskList()
	local taskGroupConfig = self:getTaskGroupConfig()
	local foreverTaskGroups = taskGroupConfig and taskGroupConfig.foreverTaskGroup or {}

	return self:buildTaskList(foreverTaskGroups[1])
end

function EventHalloweenModel:getJournalProgress()
	local progress = 0

	for _, taskData in ipairs(self:getProgressRewardTaskList()) do
		progress = math.max(progress, taskData.progress or 0)
	end

	return math.min(progress, self.TOTAL_BADGE_COUNT), self.TOTAL_BADGE_COUNT
end

function EventHalloweenModel:getCandySubmittedCount()
	local activityData = self:getHalloweenActivityData()

	return tonumber(activityData and activityData.candyHouseCandyNum) or 0
end

function EventHalloweenModel:getCandyHouseLevel()
	local activityData = self:getHalloweenActivityData()

	return tonumber(activityData and activityData.candyHouseLevel) or 0
end

function EventHalloweenModel:getCandyHouseUnlockTipText(candyHouseLevel)
	return pg.getFormatText(pg.getGameString("HALLOWEEN_BOOK_UNLOCK_1"), candyHouseLevel)
end

function EventHalloweenModel:getPetStickerUnlockTipText(petId)
	local petName = petId and LuaUIUtils.getPetNameWithIdOrTmpId(petId) or ""

	return pg.getFormatText(pg.getGameString("HALLOWEEN_BOOK_UNLOCK_2"), petName)
end

function EventHalloweenModel:getUnlockedBlendPetMap()
	local activityData = self:getHalloweenActivityData()

	return activityData and activityData.unlockedBlendPets or {}
end

function EventHalloweenModel:getBlendPetIdByIndex(petIndex)
	local unlockedBlendPets = self:getUnlockedBlendPetMap()

	return tonumber(unlockedBlendPets[petIndex])
end

function EventHalloweenModel:getNextLockedBlendPetIndex()
	local activityConfig = self:getActivityConfig()

	for petIndex, petId in ipairs(activityConfig and activityConfig.blendPet or {}) do
		if petId and not self:getBlendPetIdByIndex(petIndex) then
			return petIndex
		end
	end

	return nil
end

function EventHalloweenModel:getActivityStartDayTimestamp()
	local activityData = self:getHalloweenActivityData()
	local activityBase = activityData and activityData.activityBase
	local activateTimestamp = tonumber(activityBase and activityBase.activateTm)

	if not activateTimestamp or activateTimestamp <= 0 then
		return nil
	end

	return TimeUtils.getServerDayBegin(activateTimestamp)
end

function EventHalloweenModel:getBlendPetUnlockTimestamp(petIndex)
	local activityConfig = self:getActivityConfig()
	local unlockDay = activityConfig and activityConfig.blendPetTime and tonumber(activityConfig.blendPetTime[petIndex])
	local startDayTimestamp = self:getActivityStartDayTimestamp()

	if not unlockDay or unlockDay < 1 or not startDayTimestamp then
		return nil
	end

	return startDayTimestamp + (unlockDay - 1) * Const.SECONDS_ONE_DAY
end

function EventHalloweenModel:getPetBlendState(petId)
	local activityData = self:getHalloweenActivityData()
	local petsBlendState = activityData and activityData.petsBlendState

	return tonumber(petId and petsBlendState and petsBlendState[petId]) or 0
end

function EventHalloweenModel:isPetBlendCompleted(petId)
	return self:getPetBlendState(petId) == 1
end

function EventHalloweenModel:getCompletedPerfumePetMap()
	local completedMap = {}

	for petIndex = 1, self.PET_BADGE_COUNT do
		local petId = self:getBlendPetIdByIndex(petIndex)

		completedMap[petIndex] = petId ~= nil and self:isPetBlendCompleted(petId)
	end

	return completedMap
end

function EventHalloweenModel:getCompletedPerfumePetCount()
	local completedCount = 0
	local completedMap = self:getCompletedPerfumePetMap()

	for petIndex = 1, self.PET_BADGE_COUNT do
		if completedMap[petIndex] then
			completedCount = completedCount + 1
		end
	end

	return math.clamp(completedCount, 0, self.PET_BADGE_COUNT)
end

function EventHalloweenModel:getCandyThresholds()
	local activityConfig = self:getActivityConfig()

	return activityConfig and activityConfig.candyRequire or {}
end

function EventHalloweenModel:isCandyHouseMaxLevel()
	local thresholds = self:getCandyThresholds()

	return #thresholds > 0 and self:getCandyHouseLevel() >= #thresholds
end

function EventHalloweenModel:getCandyVisualProgress(candyCount, candyHouseLevel)
	local thresholds = self:getCandyThresholds()

	if #thresholds == 0 then
		return 0
	end

	local stage = math.clamp(candyHouseLevel or 0, 0, #thresholds)

	if stage >= #thresholds then
		return 1
	end

	local currentStageRequire = thresholds[stage + 1]
	local stageProgress = currentStageRequire > 0 and candyCount / currentStageRequire or 0

	return (stage + math.clamp(stageProgress, 0, 1)) / #thresholds
end

function EventHalloweenModel:getCandyProgressViewData(previewCandyCount)
	local candyCount = self:getCandySubmittedCount() + math.max(tonumber(previewCandyCount) or 0, 0)
	local thresholds = self:getCandyThresholds()
	local stage = math.clamp(self:getCandyHouseLevel(), 0, #thresholds)
	local roomDotList = {}

	for index = 1, stage do
		roomDotList[#roomDotList + 1] = {
			state = stage == self.ROOM_BADGE_COUNT and index == stage and 1 or 0
		}
	end

	return {
		stage = stage,
		progress = self:getCandyVisualProgress(candyCount, stage),
		roomDotList = roomDotList
	}
end

function EventHalloweenModel:getCandyItemId()
	local activityConfig = self:getActivityConfig()

	return tonumber(activityConfig and activityConfig.candyId)
end

function EventHalloweenModel:getCandyItemCount()
	local candyItemId = self:getCandyItemId()

	return candyItemId and ClientUtils.getItemCountById(candyItemId) or 0
end

function EventHalloweenModel:getCandyCurrencyList()
	local candyItemId = self:getCandyItemId()

	return candyItemId and {
		{
			itemId = candyItemId
		}
	} or {}
end

function EventHalloweenModel:getCandyItemCountText()
	return self:getCandyItemCountAfterSubmitText(0)
end

function EventHalloweenModel:beginCandySubmitPreview(submitCount)
	self._pendingCandySubmit = {
		succeeded = false,
		remainingCount = submitCount,
		lastItemCount = self:getCandyItemCount()
	}
end

function EventHalloweenModel:clearCandySubmitPreview()
	self._pendingCandySubmit = nil
end

function EventHalloweenModel:hasPendingCandySubmit()
	return self._pendingCandySubmit ~= nil
end

function EventHalloweenModel:updateCandySubmitPreview(success)
	local pending = self._pendingCandySubmit

	if not pending then
		return
	end

	if success == false then
		self:clearCandySubmitPreview()

		return
	end

	local itemCount = self:getCandyItemCount()
	local deductedCount = math.max(pending.lastItemCount - itemCount, 0)

	pending.remainingCount = math.max(pending.remainingCount - deductedCount, 0)
	pending.lastItemCount = itemCount
	pending.succeeded = pending.succeeded or success == true

	if pending.succeeded and pending.remainingCount == 0 then
		self:clearCandySubmitPreview()
	end
end

function EventHalloweenModel:getCandyHouseStageRemaining()
	local thresholds = self:getCandyThresholds()
	local nextRequire = tonumber(thresholds[self:getCandyHouseLevel() + 1])

	if not nextRequire then
		return 0
	end

	return math.max(nextRequire - self:getCandySubmittedCount(), 0)
end

function EventHalloweenModel:getCandySubmitLimit()
	return math.min(self:getCandyItemCount(), self:getCandyHouseStageRemaining())
end

function EventHalloweenModel:getCandyItemCountAfterSubmitText(submitCount)
	local pendingCount = self._pendingCandySubmit and self._pendingCandySubmit.remainingCount or 0

	return tostring(math.max(self:getCandyItemCount() - pendingCount - submitCount, 0))
end

function EventHalloweenModel:canSubmitCandy()
	return self:getCandySubmitLimit() > 0
end

function EventHalloweenModel:getCurrentPetIndex()
	local latestUnlockedIndex

	for petIndex = 1, self.PET_BADGE_COUNT do
		local petId = self:getBlendPetIdByIndex(petIndex)

		if petId then
			latestUnlockedIndex = petIndex

			if not self:isPetBlendCompleted(petId) then
				return petIndex
			end
		end
	end

	return self:getNextLockedBlendPetIndex() or latestUnlockedIndex or 1
end

function EventHalloweenModel:getPerfumePetPageIndex()
	return math.max(self:getCurrentPetIndex() - 1, 0)
end

function EventHalloweenModel:getPerfumeButtonViewData()
	local petIndex = self:getCurrentPetIndex()
	local petId = self:getBlendPetIdByIndex(petIndex)
	local completedPetCount = self:getCompletedPerfumePetCount()
	local canOpen = petId ~= nil and not self:isPetBlendCompleted(petId)
	local lockedPetIndex = not canOpen and self:getNextLockedBlendPetIndex() or nil
	local unlockTimestamp = lockedPetIndex and self:getBlendPetUnlockTimestamp(lockedPetIndex) or nil

	return {
		canOpen = canOpen,
		visible = completedPetCount < self.PET_BADGE_COUNT,
		petId = petId,
		petIndex = petIndex,
		petPageIndex = math.max(petIndex - 1, 0),
		state = canOpen and 0 or 1,
		countdownSeconds = unlockTimestamp and math.max(unlockTimestamp - Time.getSecond(), 0) or 0,
		redDot = {
			path = RedDotConst.RedDotPath.EVENT_HALLOWEEN_PERFUME_LOCAL,
			visible = canOpen,
			style = RedDotConst.RedDotStyle.POINT
		}
	}
end

function EventHalloweenModel:getPerfumeEntryRedDotRecordKey(eventId, petId)
	return string.format(RedDotConst.RedDotPath.EVENT_HALLOWEEN_PERFUME_ENTRY, tonumber(eventId) or 0, tonumber(petId) or 0)
end

function EventHalloweenModel:getPerfumeEntryRedDotStyle(eventId)
	if eventId ~= self:getEventId() then
		return RedDotConst.RedDotStyle.NONE
	end

	local buttonViewData = self:getPerfumeButtonViewData()

	if not buttonViewData.canOpen or not pg.me or not pg.me.getRedDotRecord then
		return RedDotConst.RedDotStyle.NONE
	end

	local recordKey = self:getPerfumeEntryRedDotRecordKey(eventId, buttonViewData.petId)
	local notViewed = pg.me:getRedDotRecord(Const.CLIENT_KEY.EVENT_RED_DOT, recordKey, true)

	return notViewed and RedDotConst.RedDotStyle.POINT or RedDotConst.RedDotStyle.NONE
end

function EventHalloweenModel:getPerfumeTaskRedDotStyle(eventId)
	if eventId ~= self:getEventId() then
		return RedDotConst.RedDotStyle.NONE
	end

	local buttonViewData = self:getPerfumeButtonViewData()

	return buttonViewData.canOpen and RedDotConst.RedDotStyle.POINT or RedDotConst.RedDotStyle.NONE
end

function EventHalloweenModel:getDailyTaskRedDotPath(eventId)
	return string.format(RedDotConst.RedDotPath.EVENT_HALLOWEEN_DAILY_TASK, tonumber(eventId) or 0)
end

function EventHalloweenModel:getDailyTaskRewardRedDotPath(eventId, taskId)
	return string.format(RedDotConst.RedDotPath.EVENT_HALLOWEEN_DAILY_TASK_REWARD, tonumber(eventId) or 0, tonumber(taskId) or 0)
end

function EventHalloweenModel:getDailyTaskRewardRedDotStyle(eventId)
	if eventId ~= self:getEventId() or self:isCandyHouseMaxLevel() then
		return RedDotConst.RedDotStyle.NONE
	end

	for _, taskData in ipairs(self:getDailyTaskDataList()) do
		if taskData.taskState == ActivityConst.TaskState.Finihed_CanRecv then
			return RedDotConst.RedDotStyle.POINT
		end
	end

	return RedDotConst.RedDotStyle.NONE
end

function EventHalloweenModel:getCollectionRedDotPath(eventId)
	return string.format(RedDotConst.RedDotPath.EVENT_HALLOWEEN_COLLECTION, tonumber(eventId) or 0)
end

function EventHalloweenModel:getCollectionRewardRedDotPath(eventId, taskId)
	return string.format(RedDotConst.RedDotPath.EVENT_HALLOWEEN_COLLECTION_REWARD, tonumber(eventId) or 0, tonumber(taskId) or 0)
end

function EventHalloweenModel:getCollectionRewardRedDotStyle(eventId)
	if eventId ~= self:getEventId() then
		return RedDotConst.RedDotStyle.NONE
	end

	for _, taskData in ipairs(self:getProgressRewardTaskList()) do
		if taskData.taskState == ActivityConst.TaskState.Finihed_CanRecv then
			return RedDotConst.RedDotStyle.REWARD
		end
	end

	return RedDotConst.RedDotStyle.NONE
end

function EventHalloweenModel:getPageRedDotStyle(eventId, includePerfumeTask)
	local collectionStyle = self:getCollectionRewardRedDotStyle(eventId)

	if collectionStyle ~= RedDotConst.RedDotStyle.NONE then
		return collectionStyle
	end

	local dailyTaskStyle = self:getDailyTaskRewardRedDotStyle(eventId)

	if dailyTaskStyle ~= RedDotConst.RedDotStyle.NONE then
		return dailyTaskStyle
	end

	if includePerfumeTask then
		return self:getPerfumeTaskRedDotStyle(eventId)
	end

	return self:getPerfumeEntryRedDotStyle(eventId)
end

function EventHalloweenModel:getDiaryTaskRedDotData()
	local eventId = self:getEventId()

	return {
		path = self:getDailyTaskRedDotPath(eventId),
		style = self:getDailyTaskRewardRedDotStyle(eventId)
	}
end

function EventHalloweenModel:getJournalRedDotData()
	local eventId = self:getEventId()

	return {
		path = self:getCollectionRedDotPath(eventId),
		style = self:getCollectionRewardRedDotStyle(eventId)
	}
end

function EventHalloweenModel:markCurrentPerfumeEntryViewed(petId)
	local buttonViewData = self:getPerfumeButtonViewData()

	petId = tonumber(petId)

	if not buttonViewData.canOpen or petId ~= buttonViewData.petId or not pg.me or not pg.me.setRedDotRecord then
		return false
	end

	local recordKey = self:getPerfumeEntryRedDotRecordKey(self:getEventId(), petId)

	return pg.me:setRedDotRecord(Const.CLIENT_KEY.EVENT_RED_DOT, recordKey, false)
end

function EventHalloweenModel:getPetUnlockCountdownText(days, hours, minutes)
	local totalHours = (tonumber(days) or 0) * 24 + (tonumber(hours) or 0)
	local displayMinutes = (tonumber(minutes) or 0) + 1

	return pg.getFormatText(pg.getGameString("HALLOWEEN_BLEND_PET_TIME"), totalHours + math.floor(displayMinutes / 60), displayMinutes % 60)
end

function EventHalloweenModel:getMainViewData()
	local dailyProgress, dailyTotal = self:getDailyTaskProgress()
	local journalProgress, journalTotal = self:getJournalProgress()

	return {
		completedPerfumePetCount = self:getCompletedPerfumePetCount(),
		perfumeBlendingText = pg.getGameString("HALLOWEEN_BLEND_NAME"),
		submitButtonText = pg.getGameString("HALLOWEEN_DECORATE_1"),
		doneTipsText = pg.getGameString("DISPATCH_INVESTIGATION_DONE"),
		taskDescriptionText = pg.getGameString("HALLOWEEN_BLEND_PET_DESC"),
		diaryTaskTitle1Text = pg.getGameString("HALLOWEEN_DAILY_TASK"),
		diaryTaskTitle2Text = pg.getGameString("HALLOWEEN_DAILY_1"),
		diaryTaskTitle3Text = pg.getFormatText("{0}/{1}", dailyProgress, dailyTotal),
		diaryTaskRedDot = self:getDiaryTaskRedDotData(),
		journalTitle1Text = pg.getGameString("HALLOWEEN_BOOK_NAME"),
		journalTitle2Text = pg.getGameString("HALLOWEEN_PROGRESS"),
		journalTitle3Text = pg.getFormatText("{0}/{1}", journalProgress, journalTotal),
		journalRedDot = self:getJournalRedDotData()
	}
end

return EventHalloweenModel
