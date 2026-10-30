-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\TopTipArea\\GrabEggWaitingInfoItem.lua

local Class = require("Core.Framework.Class")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local ClientTextUtils = require("Utils.ClientTextUtils")
local Time = require("Core.Common.Time")
local GrabEggWaitingInfoItem = Class.LightClass("GrabEggWaitingInfoItem", BaseQueueItem)
local DEFAULT_TIPS_TEXT_KEY = "GRAB_EGG_LOADING_WAIT"

function GrabEggWaitingInfoItem:onInit()
	self:setMaxLimit(1)

	self.uContainer = self.uWidget
end

function GrabEggWaitingInfoItem:pushData(data)
	if self:isRunning() or not self:isQueueEmpty() then
		return
	end

	self:enqueue(data or {})
end

function GrabEggWaitingInfoItem:onUpdate()
	self:tryPopupItem()
	self:_refreshCountdownText()
end

function GrabEggWaitingInfoItem:tryPopupItem()
	if self:isQueueEmpty() or self:isReachTheLimit() then
		return
	end

	local data = self:dequeue()

	self:addRunItem(data)
	self:initUContainer(data)
end

function GrabEggWaitingInfoItem:onClearRunningList(force)
	local data = self:firstRunItem()

	if data then
		self:recycleToast(data, force)
	end
end

function GrabEggWaitingInfoItem:hide()
	self:onClearDataQueue()
	self:clearRunningList(true)

	self._tipsTxt = nil
	self._lastCountdownSecond = nil
end

function GrabEggWaitingInfoItem:initUContainer(data)
	if not self.uContainer:CheckURLLoaded() then
		self.uContainer:LoadDefaultUrlManually(self:guardRunCallback(data, function(loadedItem)
			if IsNil(loadedItem) or self.uContainer.content ~= loadedItem then
				return
			end

			if data.removing or self:firstRunItem() ~= data then
				return
			end

			self:renderItem(loadedItem, data)
		end))
	else
		self:renderItem(self.uContainer.content, data)
	end
end

function GrabEggWaitingInfoItem:renderItem(item, data)
	if IsNil(item) then
		return
	end

	local objectReference = item:GetComponent("ObjectReference")

	if objectReference == nil then
		return
	end

	local tipsTxt = objectReference:GetRefValue("tipsTxt")

	if NotNil(tipsTxt) then
		self._tipsTxt = tipsTxt
		self._lastCountdownSecond = nil

		if data.endTime and data.tipsTextKey then
			self:_refreshCountdownText()
		else
			local tipsText = data.tipsText or pg.getGameString(data.tipsTextKey or DEFAULT_TIPS_TEXT_KEY)

			ClientTextUtils.setText(tipsTxt, tipsText)
		end
	end
end

function GrabEggWaitingInfoItem:_refreshCountdownText()
	local data = self:firstRunItem()

	if not data or not data.endTime or not data.tipsTextKey or IsNil(self._tipsTxt) then
		return
	end

	local remainSecond = math.ceil(data.endTime - Time.secondCache)
	local isRacingDungeon = pg.space and pg.space.isRacingDungeon and pg.space:isRacingDungeon()

	if isRacingDungeon and remainSecond <= 0 then
		self:hide()

		return
	end

	remainSecond = math.max(0, remainSecond)

	if self._lastCountdownSecond == remainSecond then
		return
	end

	self._lastCountdownSecond = remainSecond

	ClientTextUtils.setText(self._tipsTxt, pg.getFormatText(pg.getGameString(data.tipsTextKey), remainSecond))
end

return GrabEggWaitingInfoItem
