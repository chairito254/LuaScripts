-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\A1TipArea\\WorldRaceFinishItem.lua

local Class = require("Core.Framework.Class")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local Time = require("Core.Common.Time")
local ClientTextUtils = require("Utils.ClientTextUtils")
local WorldRaceFinishItem = Class.LightClass("WorldRaceFinishItem", BaseQueueItem)

function WorldRaceFinishItem:onInit()
	self:setMaxLimit(1)

	self.uContainer = self.uWidget
end

function WorldRaceFinishItem:onUpdate()
	self:tryPopupItem()
	self:refreshRemainTime()
end

function WorldRaceFinishItem:tryPopupItem()
	if self:isQueueEmpty() or self:isReachTheLimit() then
		return
	end

	local data = self:dequeue()

	data.endTime = Time.realSecondCache + (data.duration or 2)

	self:addRunItem(data)
	self:initUContainer(data)
end

function WorldRaceFinishItem:onClearRunningList(force)
	local runNum = #self.runList

	for index = runNum, 1, -1 do
		self:recycleToast(self.runList[index], force)
	end
end

function WorldRaceFinishItem:onRecycleFinished(data, reason)
	local onFinished = data.onFinished

	data.onFinished = nil

	if onFinished and not self:isRecycleCancelled(reason) then
		onFinished()
	end
end

function WorldRaceFinishItem:refreshRemainTime()
	if not self:isRunning() then
		return
	end

	local data = self.runList[1]

	if Time.realSecondCache < data.endTime then
		return
	end

	self:recycleToast(data)
end

function WorldRaceFinishItem:recycleToast(data, force)
	if data.removing then
		return
	end

	data.removing = true

	local item = self.uContainer.content

	if not force and NotNil(item) and item:CheckHasEvent(CS.XGUI.EInvokeTime.Hide) then
		item:InvokeCallbackWithCallback(CS.XGUI.EInvokeTime.Hide, function()
			self:destroyContent(data)
		end)
	else
		self:destroyContent(data)
	end
end

function WorldRaceFinishItem:destroyContent(data)
	if self:isQueueEmpty() then
		self.uContainer:DestroyContent()
	end

	self:removeItem(data)
end

function WorldRaceFinishItem:initUContainer(data)
	if not self.uContainer:CheckURLLoaded() then
		self.uContainer:LoadDefaultUrlManually(function()
			self:renderItem(self.uContainer.content, data)
		end)
	else
		self:renderItem(self.uContainer.content, data)
	end
end

function WorldRaceFinishItem:renderItem(item, data)
	local objectReference = item:GetComponent("ObjectReference")

	self.txtTimeGlodUBaseText = objectReference:GetRefValue("txtTimeGlodUBaseText")

	if self.txtTimeGlodUBaseText then
		ClientTextUtils.setText(self.txtTimeGlodUBaseText, pg.getGameString("RACING_REACH_FINISHING_LINE"))
	end
end

return WorldRaceFinishItem
