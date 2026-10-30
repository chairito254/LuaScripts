-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\A1TipArea\\EventSeasonItem.lua

local Class = require("Core.Framework.Class")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local MessageName = require("Const.MessageName")
local UIConst = require("Const.UIConst")
local Time = require("Core.Common.Time")
local TipAreaConst = require("Guis.Panels.Tips.TipAreaConst")
local Utils = require("Common.Utils.Utils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local SeasonActivityData = require("Data.season_activity_data")
local SEASON_POP_ANIMATION_DURATION = 3.2333333
local EventSeasonItem = Class.LightClass("EventSeasonItem", BaseQueueItem)

function EventSeasonItem:onInit()
	self:setMaxLimit(1)

	self.uContainer = self.uWidget
end

function EventSeasonItem:onUpdate()
	self:tryPopupItem()
	self:refreshRemainTime()
end

function EventSeasonItem:tryPopupItem()
	if self:isQueueEmpty() or self:isReachTheLimit() then
		return
	end

	local data = self:dequeue()

	self:addRunItem(data)
	self:initUContainer(data)
end

function EventSeasonItem:onClearRunningList(force)
	self:clearRecycleRunningList(force)
end

function EventSeasonItem:hide()
	self:clearRunningList()
end

function EventSeasonItem:refreshRemainTime()
	if not self:isRunning() then
		return
	end

	local data = self.runList[1]

	if data.endTime == nil or Time.realSecondCache < data.endTime then
		return
	end

	self:recycleToast(data, false, true)
end

function EventSeasonItem:recycleToast(data, force, playEntryFly)
	if not data.removing then
		data.recycleEntryFly = playEntryFly
	end

	self:requestRecycle(data, force, CS.XGUI.EInvokeTime.Hide)
end

function EventSeasonItem:canPlayEntryFly(sourcePosition)
	local globalUI = pg.global and pg.global.ui
	local hudV2 = globalUI and globalUI.hudV2

	return hudV2 and hudV2:canPlaySeasonEntryFly(sourcePosition) == true
end

function EventSeasonItem:onPopupFinished(data)
	local finishCb = data.popFinishCb

	data.popFinishCb = nil

	if finishCb then
		finishCb()
	end
end

function EventSeasonItem:initUContainer(data)
	if not self.uContainer:CheckURLLoaded() then
		self.uContainer:LoadDefaultUrlManually(self:guardRunCallback(data, function(loadedItem)
			if IsNil(loadedItem) or self.uContainer.content ~= loadedItem then
				return
			end

			self:renderItem(loadedItem, data)
		end))
	else
		self:renderItem(self.uContainer.content, data)
	end
end

function EventSeasonItem:renderItem(item, data)
	data.endTime = Time.realSecondCache + (data.duration or SEASON_POP_ANIMATION_DURATION)

	local objectReference = item:GetComponent("ObjectReference")
	local titleUSDFText = objectReference:GetRefValue("titleUSDFText")
	local tipsUSDFText = objectReference:GetRefValue("tipsUSDFText")
	local seasonStageInfo = Utils.getCurrentSeasonStage()
	local titleText = self:getSeasonActivityField(seasonStageInfo, "popDesc1")
	local tipsText = self:getSeasonActivityField(seasonStageInfo, "popDesc2")

	ClientTextUtils.setText(titleUSDFText, titleText and pg.getLocalizationText(titleText) or "")
	ClientTextUtils.setText(tipsUSDFText, tipsText and pg.getLocalizationText(tipsText) or "")

	local whiteList = {}

	whiteList[UIConst.UI_ID_TIPS] = true

	pg.global.ui:hideAllUIByCustomKey(UIConst.UI_HIDE_KEY.SEASON_OPEN_TIP, whiteList)

	if pg.global.ui.tips then
		pg.global.ui.tips:hideOtherAreasExcept(TipAreaConst.AREAS.A1)
	end
end

function EventSeasonItem:getSeasonActivityField(seasonStageInfo, fieldName)
	local seasonActivityData = seasonStageInfo and SeasonActivityData[seasonStageInfo.seasonId]

	if not seasonActivityData then
		return nil
	end

	local seasonStageActivityData = seasonActivityData[seasonStageInfo.stageId]
	local fieldValue = seasonStageActivityData and seasonStageActivityData[fieldName]

	if fieldValue ~= nil and fieldValue ~= "" then
		return fieldValue
	end

	local firstStageActivityData = seasonActivityData[1]

	return firstStageActivityData and firstStageActivityData[fieldName]
end

function EventSeasonItem:onSceneUnload()
	self:clearRunningList()
end

function EventSeasonItem:onRecycleStarted(data, target)
	if data.recycleEntryFly and NotNil(target) then
		local objectReference = target:GetComponent("ObjectReference")
		local flyStart = objectReference and objectReference:GetRefValue("flyStartUWidget")
		local source = flyStart and flyStart.transform or target.transform

		data.recycleSourcePosition = source and source.position
	end
end

function EventSeasonItem:onRecycleFinished(data, reason)
	local sourcePosition = not self:isRecycleCancelled(reason) and data.recycleSourcePosition or nil

	data.recycleSourcePosition = nil

	pg.global.ui:restoreAllUIByCustomKey(UIConst.UI_HIDE_KEY.SEASON_OPEN_TIP)

	if pg.global.ui.tips then
		pg.global.ui.tips:restoreAllAreas()
	end

	self:onPopupFinished(data)

	if self:canPlayEntryFly(sourcePosition) then
		facade:SendMessageCommand(MessageName.SEASON_ACTIVITY_POP_FLY, {
			sourcePosition = sourcePosition
		})
	end
end

return EventSeasonItem
