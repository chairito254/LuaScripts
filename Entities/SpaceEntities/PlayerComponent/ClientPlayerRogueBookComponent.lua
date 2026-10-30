-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\PlayerComponent\\ClientPlayerRogueBookComponent.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local Class = require("Core.Framework.Class")
local MessageName = require("Const.MessageName")
local ExtraRandomBuffData = require("Data.extra_random_buff")
local RogueBookBuffData = require("Data.rogue_book_buff_data")
local RogueBookBossData = require("Data.rogue_book_boss_data")
local RogueBuffLevelInfo = require("Data.rogue_buff_level_info")
local RogueBookEventData = require("Data.rogue_book_event_data")
local RogueBookStatus = {
	REWARD_CLAIMED = 2,
	REWARD_PENDING = 1
}
local ClientPlayerRogueBookComponent = Class.Component("ClientPlayerRogueBookComponent")

function ClientPlayerRogueBookComponent:ctor()
	return
end

function ClientPlayerRogueBookComponent:init(dict)
	return true
end

function ClientPlayerRogueBookComponent:onRogueBookBuffValueAdd(buffId, v)
	facade:sendMsgToUI(MessageName.ROGUE_BOOK_BUFF_STATE_UPDATE, {
		buffId = buffId,
		newValue = v
	})
end

function ClientPlayerRogueBookComponent:onRogueBookBuffValueChanged(oldVal, newVal, buffId)
	if oldVal == newVal then
		return
	end

	facade:sendMsgToUI(MessageName.ROGUE_BOOK_BUFF_STATE_UPDATE, {
		buffId = buffId,
		oldValue = oldVal,
		newValue = newVal
	})
end

function ClientPlayerRogueBookComponent:onRogueBookEventValueAdd(eventType, v)
	facade:sendMsgToUI(MessageName.ROGUE_BOOK_EVENT_STATE_UPDATE, {
		eventType = eventType,
		newValue = v
	})
end

function ClientPlayerRogueBookComponent:onRogueBookEventValueChanged(oldVal, newVal, eventType)
	facade:sendMsgToUI(MessageName.ROGUE_BOOK_EVENT_STATE_UPDATE, {
		eventType = eventType,
		oldValue = oldVal,
		newValue = newVal
	})
end

function ClientPlayerRogueBookComponent:onRogueBookBossValueAdd(buffSeries, indexMap)
	facade:sendMsgToUI(MessageName.ROGUE_BOOK_BOSS_STATE_UPDATE, {
		buffSeries = buffSeries,
		newValue = indexMap
	})
end

function ClientPlayerRogueBookComponent:onRogueBookBossValueChanged(oldVal, newVal, buffSeries)
	facade:sendMsgToUI(MessageName.ROGUE_BOOK_BOSS_STATE_UPDATE, {
		buffSeries = buffSeries,
		oldValue = oldVal,
		newValue = newVal
	})
end

function ClientPlayerRogueBookComponent:getBuffRewards(buffId)
	self:serverMsg("RPC_CS_ReceiveRogueBookBuffReward", buffId)
end

function ClientPlayerRogueBookComponent:getEventRewards(eventType, eventIndex)
	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		self.logger:debug("ClientPlayerRogueBookComponent:getEventRewards eventType：【%d】， eventIndex ：【%d】, unlock:[%s], got [%s]", eventType, eventIndex, self:isEventUnlock(eventType, eventIndex), self:isEventRewardGot(eventType, eventIndex))
	end

	self:serverMsg("RPC_CS_ReceiveRogueBookEventReward", eventType, eventIndex)
end

function ClientPlayerRogueBookComponent:getBossRewards(buffSeries, index)
	self:serverMsg("RPC_CS_ReceiveRogueBookBossReward", buffSeries, index)
end

function ClientPlayerRogueBookComponent:getGroupAll(bookId)
	self:serverMsg("RPC_CS_ReceiveAllRogueBookReward", bookId or 0)
end

function ClientPlayerRogueBookComponent:isBuffUnlock(buffId)
	if self.rogueBookBuffMap[buffId] == nil then
		return false
	end

	return true
end

function ClientPlayerRogueBookComponent:isBuffRewardGot(buffId)
	if self.rogueBookBuffMap[buffId] == nil then
		return false
	end

	return self.rogueBookBuffMap[buffId] == RogueBookStatus.REWARD_CLAIMED
end

function ClientPlayerRogueBookComponent:checkCanGetReward()
	for _, val in pairs(self.rogueBookBuffMap) do
		if val == RogueBookStatus.REWARD_PENDING then
			return true
		end
	end

	return false
end

function ClientPlayerRogueBookComponent:checkCanGetRewardBuff(buffId)
	if self.rogueBookBuffMap[buffId] == nil then
		return false
	end

	return self.rogueBookBuffMap[buffId] == RogueBookStatus.REWARD_PENDING
end

function ClientPlayerRogueBookComponent:isEventUnlock(eventType, eventIndex)
	local eventMap = self.rogueBookEventMap or {}
	local eventTypeMap = eventMap[eventType] or eventMap[tostring(eventType)]
	local state = eventTypeMap and (eventTypeMap[eventIndex] or eventTypeMap[tostring(eventIndex)])

	if state == nil then
		return false
	end

	return true
end

function ClientPlayerRogueBookComponent:isEventRewardGot(eventType, eventIndex)
	local eventMap = self.rogueBookEventMap or {}
	local eventTypeMap = eventMap[eventType] or eventMap[tostring(eventType)]
	local state = eventTypeMap and (eventTypeMap[eventIndex] or eventTypeMap[tostring(eventIndex)])

	if state == nil then
		return false
	end

	return state == RogueBookStatus.REWARD_CLAIMED
end

function ClientPlayerRogueBookComponent:checkEventBookCanGetReward()
	for _, eventTypeMap in pairs(self.rogueBookEventMap or {}) do
		for _, val in pairs(eventTypeMap) do
			if val == RogueBookStatus.REWARD_PENDING then
				return true
			end
		end
	end

	return false
end

function ClientPlayerRogueBookComponent:checkCanGetRewardEvent(eventType, eventIndex)
	local eventMap = self.rogueBookEventMap or {}
	local eventTypeMap = eventMap[eventType] or eventMap[tostring(eventType)]
	local state = eventTypeMap and (eventTypeMap[eventIndex] or eventTypeMap[tostring(eventIndex)])

	if state == nil then
		return false
	end

	return state == RogueBookStatus.REWARD_PENDING
end

function ClientPlayerRogueBookComponent:isBossUnlock(buffSeries, index)
	local seriesMap = self.rogueBookBossMap and self.rogueBookBossMap[buffSeries]

	return seriesMap ~= nil and seriesMap[index] ~= nil
end

function ClientPlayerRogueBookComponent:isBossRewardGot(buffSeries, index)
	local seriesMap = self.rogueBookBossMap and self.rogueBookBossMap[buffSeries]

	return seriesMap ~= nil and seriesMap[index] == RogueBookStatus.REWARD_CLAIMED
end

function ClientPlayerRogueBookComponent:checkCanGetRewardBoss(buffSeries, index)
	local seriesMap = self.rogueBookBossMap and self.rogueBookBossMap[buffSeries]

	return seriesMap ~= nil and seriesMap[index] == RogueBookStatus.REWARD_PENDING
end

function ClientPlayerRogueBookComponent:checkBossBookCanGetReward()
	for _, seriesMap in pairs(self.rogueBookBossMap or {}) do
		for _, status in pairs(seriesMap) do
			if status == RogueBookStatus.REWARD_PENDING then
				return true
			end
		end
	end

	return false
end

function ClientPlayerRogueBookComponent:countMapEntries(map)
	local count = 0

	for _ in pairs(map or {}) do
		count = count + 1
	end

	return count
end

function ClientPlayerRogueBookComponent:countBossEntries(bossMap, buffSeries)
	if buffSeries ~= nil then
		return self:countMapEntries(bossMap and bossMap[buffSeries])
	end

	local count = 0

	for _, seriesMap in pairs(bossMap or {}) do
		count = count + self:countMapEntries(seriesMap)
	end

	return count
end

function ClientPlayerRogueBookComponent:getBuffUnlockCount()
	return self:countMapEntries(self.rogueBookBuffMap), self:countMapEntries(RogueBookBuffData)
end

function ClientPlayerRogueBookComponent:getEventUnlockCount()
	local count = 0

	for _, eventCfg in pairs(RogueBookEventData) do
		if self:isEventUnlock(eventCfg.type, eventCfg.eventId) then
			count = count + 1
		end
	end

	return count, self:countMapEntries(RogueBookEventData)
end

function ClientPlayerRogueBookComponent:getBossUnlockCount(buffSeries)
	return self:countBossEntries(self.rogueBookBossMap, buffSeries), self:countBossEntries(RogueBookBossData, buffSeries)
end

function ClientPlayerRogueBookComponent:getRogueBookUnlockCount()
	local buffCount, buffTotal = self:getBuffUnlockCount()
	local eventCount, eventTotal = self:getEventUnlockCount()
	local bossCount, bossTotal = self:getBossUnlockCount()

	return {
		buffCount = buffCount,
		buffTotal = buffTotal,
		eventCount = eventCount,
		eventTotal = eventTotal,
		bossCount = bossCount,
		bossTotal = bossTotal,
		totalCount = buffCount + eventCount + bossCount,
		total = buffTotal + eventTotal + bossTotal
	}
end

return ClientPlayerRogueBookComponent
