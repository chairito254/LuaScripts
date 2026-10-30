-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\A2TipArea\\WorldRankingTipsItem.lua

local Class = require("Core.Framework.Class")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local Time = require("Core.Common.Time")
local ClientTextUtils = require("Utils.ClientTextUtils")
local WorldRankingTipsItem = Class.LightClass("WorldRankingTipsItem", BaseQueueItem)

WorldRankingTipsItem.COLOR_PAGE = {
	MECHANISM = 0,
	DEFEND = 3,
	HIT = 2,
	HIT_BY = 1
}

function WorldRankingTipsItem:onInit()
	self:setMaxLimit(1)

	self.uContainer = self.uWidget
end

function WorldRankingTipsItem:pushData(data)
	self:onClearDataQueue()
	self:enqueue(data)
end

function WorldRankingTipsItem:onUpdate()
	self:tryPopupItem()
	self:refreshRemainTime()
end

function WorldRankingTipsItem:tryPopupItem()
	if self:isQueueEmpty() or self:isReachTheLimit() then
		return
	end

	local data = self:dequeue()

	data.endTime = Time.realSecondCache + (data.duration or 3)

	self:addRunItem(data)
	self:initUContainer(data)
end

function WorldRankingTipsItem:refreshRemainTime()
	local data = self:firstRunItem()

	if data and Time.realSecondCache >= data.endTime then
		self:recycleToast(data)
	end
end

function WorldRankingTipsItem:onClearRunningList(force)
	self:clearRecycleRunningList(force)
end

function WorldRankingTipsItem:hide()
	self:clearAllData(true)
end

function WorldRankingTipsItem:initUContainer(data)
	if not self.uContainer:CheckURLLoaded() then
		self.uContainer:LoadDefaultUrlManually(self:guardRunCallback(data, function(loadedItem)
			if IsNil(loadedItem) or self.uContainer.content ~= loadedItem or self:firstRunItem() ~= data then
				return
			end

			self:renderItem(loadedItem, data)
		end))

		return
	end

	self:renderItem(self.uContainer.content, data)
end

function WorldRankingTipsItem:renderItem(item, data)
	local colorPage = tonumber(data.colorPage) or WorldRankingTipsItem.COLOR_PAGE.MECHANISM

	if colorPage < WorldRankingTipsItem.COLOR_PAGE.MECHANISM or colorPage > WorldRankingTipsItem.COLOR_PAGE.DEFEND then
		colorPage = WorldRankingTipsItem.COLOR_PAGE.MECHANISM
	end

	item:TryChangePage("Color", colorPage)

	local objectReference = item:GetComponent("ObjectReference")
	local tipsText = objectReference:GetRefValue("txtTipsUSDFText")

	ClientTextUtils.setText(tipsText, data.text)
end

return WorldRankingTipsItem
