-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\TopTipArea\\WorldRaceCountdownItem.lua

local Class = require("Core.Framework.Class")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local Time = require("Core.Common.Time")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local WorldRaceCountdownItem = Class.LightClass("WorldRaceCountdownItem", BaseQueueItem)

function WorldRaceCountdownItem:onInit()
	self:setMaxLimit(1)

	self.uContainer = self.uWidget
end

function WorldRaceCountdownItem:pushData(data)
	local currentData = self:firstRunItem() or self:peek()

	if currentData then
		currentData.endTime = data.endTime
		currentData.lastRemainSeconds = nil

		self:_refreshCountdown(currentData)

		return
	end

	self:enqueue(data)
end

function WorldRaceCountdownItem:onStart()
	self:_refreshCountdown(self:firstRunItem())
end

function WorldRaceCountdownItem:onUpdate()
	self:_tryPopupItem()
	self:_refreshCountdown(self:firstRunItem())
end

function WorldRaceCountdownItem:_tryPopupItem()
	if self:isQueueEmpty() or self:isReachTheLimit() then
		return
	end

	local data = self:dequeue()

	self:addRunItem(data)
	self:_initUContainer(data)
end

function WorldRaceCountdownItem:_initUContainer(data)
	if not self.uContainer:CheckURLLoaded() then
		self.uContainer:LoadDefaultUrlManually(self:guardRunCallback(data, function(loadedItem)
			if IsNil(loadedItem) or self.uContainer.content ~= loadedItem then
				return
			end

			self:_renderItem(loadedItem, data)
		end))

		return
	end

	self:_renderItem(self.uContainer.content, data)
end

function WorldRaceCountdownItem:_renderItem(item, data)
	local objectReference = item:GetComponent("ObjectReference")

	data.timeTxt = objectReference:GetRefValue("timeTxt")

	local tipsText = objectReference:GetRefValue("txtTipsUBaseText")

	ClientTextUtils.setText(tipsText, pg.getGameString("RACING_FINISH_TIPS"))

	data.lastRemainSeconds = nil

	self:_refreshCountdown(data)
end

function WorldRaceCountdownItem:_refreshCountdown(data)
	if not data then
		return
	end

	local remainSeconds = math.ceil(math.max(0, (tonumber(data.endTime) or 0) - Time.secondCache))

	if remainSeconds <= 0 then
		self:recycleToast(data)

		return
	end

	if data.lastRemainSeconds == remainSeconds or IsNil(data.timeTxt) then
		return
	end

	data.lastRemainSeconds = remainSeconds

	ClientTextUtils.setText(data.timeTxt, LuaUIUtils.getCountDownFormateText(remainSeconds))
end

function WorldRaceCountdownItem:onClearRunningList(force)
	if force then
		self:clearRecycleRunningList(true)
	end
end

function WorldRaceCountdownItem:hide()
	self:clearAllData(true)
end

function WorldRaceCountdownItem:onRecycleStarted(data, target)
	data.timeTxt = nil
	data.lastRemainSeconds = nil
end

return WorldRaceCountdownItem
