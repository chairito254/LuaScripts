-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\BTipArea\\WorldRaceExitItem.lua

local Class = require("Core.Framework.Class")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local Time = require("Core.Common.Time")
local ClientTextUtils = require("Utils.ClientTextUtils")
local WorldRaceExitItem = Class.LightClass("WorldRaceExitItem", BaseQueueItem)

function WorldRaceExitItem:onInit()
	self:setMaxLimit(1)

	self.uContainer = self.uWidget
end

function WorldRaceExitItem:pushData(data)
	local currentData = self:firstRunItem() or self:peek()

	if currentData then
		currentData.endTime = data.endTime
		currentData.lastRemainSeconds = nil

		self:_refreshCountdown(currentData)

		return
	end

	self:enqueue(data)
end

function WorldRaceExitItem:onStart()
	self:_refreshCountdown(self:firstRunItem())
end

function WorldRaceExitItem:onUpdate()
	self:_tryPopupItem()
	self:_refreshCountdown(self:firstRunItem())
end

function WorldRaceExitItem:_tryPopupItem()
	if self:isQueueEmpty() or self:isReachTheLimit() then
		return
	end

	local data = self:dequeue()

	self:addRunItem(data)
	self:_initUContainer(data)
end

function WorldRaceExitItem:_initUContainer(data)
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

function WorldRaceExitItem:_renderItem(item, data)
	local objectReference = item:GetComponent("ObjectReference")

	data.countdownText = objectReference:GetRefValue("textUBaseText")
	data.exitButton = objectReference:GetRefValue("btnExitUButton")

	local exitText = objectReference:GetRefValue("txtNameUBaseText")

	ClientTextUtils.setText(exitText, pg.getGameString("RACING_EXIT"))

	function data.exitButton.luaClick()
		self:_onExitClick()
	end

	data.lastRemainSeconds = nil

	self:_refreshCountdown(data)
end

function WorldRaceExitItem:_refreshCountdown(data)
	if not data then
		return
	end

	local remainSeconds = math.ceil(math.max(0, (tonumber(data.endTime) or 0) - Time.secondCache))

	if remainSeconds <= 0 then
		self:recycleToast(data)

		return
	end

	if data.lastRemainSeconds == remainSeconds or IsNil(data.countdownText) then
		return
	end

	data.lastRemainSeconds = remainSeconds

	ClientTextUtils.setText(data.countdownText, pg.getFormatText(pg.getGameString("RACING_FINISH_DELAY"), remainSeconds))
end

function WorldRaceExitItem:_onExitClick()
	if pg.me and pg.me.requestWorldRaceMultiSettlement then
		pg.me:requestWorldRaceMultiSettlement()
	end
end

function WorldRaceExitItem:onClearRunningList(force)
	if force then
		self:clearRecycleRunningList(true)
	end
end

function WorldRaceExitItem:hide()
	self:clearAllData(true)
end

function WorldRaceExitItem:onRecycleStarted(data, target)
	if NotNil(data.exitButton) then
		data.exitButton.luaClick = nil
	end

	data.countdownText = nil
	data.exitButton = nil
	data.lastRemainSeconds = nil
end

return WorldRaceExitItem
