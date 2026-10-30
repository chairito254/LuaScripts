-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\A1TipArea\\WorldRaceEndItem.lua

local Class = require("Core.Framework.Class")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local Time = require("Core.Common.Time")
local ClientTextUtils = require("Utils.ClientTextUtils")
local WorldRaceEndItem = Class.LightClass("WorldRaceEndItem", BaseQueueItem)

function WorldRaceEndItem:onInit()
	self:setMaxLimit(1)

	self.uContainer = self.uWidget
end

function WorldRaceEndItem:onUpdate()
	self:tryPopupItem()
	self:refreshRemainTime()
end

function WorldRaceEndItem:tryPopupItem()
	if self:isQueueEmpty() or self:isReachTheLimit() then
		return
	end

	local data = self:dequeue()

	data.endTime = Time.realSecondCache + (data.duration or 2)

	self:addRunItem(data)
	self:initUContainer(data)
end

function WorldRaceEndItem:onClearRunningList(force)
	self:clearRecycleRunningList(force)
end

function WorldRaceEndItem:onRecycleFinished(data, reason)
	local onFinished = data.onFinished

	data.onFinished = nil

	if onFinished and not self:isRecycleCancelled(reason) then
		onFinished()
	end
end

function WorldRaceEndItem:refreshRemainTime()
	if not self:isRunning() then
		return
	end

	local data = self.runList[1]

	if Time.realSecondCache < data.endTime then
		return
	end

	self:recycleToast(data)
end

function WorldRaceEndItem:initUContainer(data)
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

function WorldRaceEndItem:renderItem(item, data)
	local objectReference = item:GetComponent("ObjectReference")

	self.wave1UBaseText = objectReference:GetRefValue("wave1UBaseText")
	self.waveUBaseText = objectReference:GetRefValue("waveUBaseText")

	if self.wave1UBaseText then
		ClientTextUtils.setText(self.wave1UBaseText, pg.getGameString("RACING_FINISH_GAME"))
	end

	if self.waveUBaseText then
		ClientTextUtils.setText(self.waveUBaseText, pg.getGameString("RACING_FINISH_GAME"))
	end
end

return WorldRaceEndItem
