-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\RobEggInfo.lua

local CustomDict = require("Core.PropertySync.CustomDict")
local class = require("Core.Framework.Class")
local Time = require("Core.Common.Time")
local Const = require("Common.Const.Const")
local ItemUtils = require("Common.Utils.ItemUtils")
local RobEggData = require("CustomTypes.RobEggData")
local RobEggInfo = class.LiteClass("RobEggInfo", CustomDict)

function RobEggInfo:done(result, reward, reason, name)
	self.result = result
	self.finish_time = Time.secondCache

	if result == Const.ROB_EGG_RESULT.Failure then
		self.killed_reason = reason or self.killed_reason
		self.killed_name = name or self.killed_name
	else
		reward = reward or {}

		for itemid, numInfo in pairs(reward) do
			self.reward[itemid] = ItemUtils.getItemCountFromNumInfo(numInfo)
		end
	end
end

function RobEggInfo:bringEggItem(eggs)
	for _, one in ipairs(eggs) do
		local egg = RobEggData({})

		egg.templateId = one.templateId
		egg.patternType = one.patternType
		egg.patternColorType = one.patternColorType

		self.bringEggs:insert(#self.bringEggs + 1, egg)
	end
end

function RobEggInfo:transEggItem(eggItem)
	local egg = RobEggData({})

	egg.templateId = eggItem.templateId
	egg.patternType = eggItem.patternType
	egg.patternColorType = eggItem.patternColorType
	egg.isShare = eggItem.isShare

	self.transEggs:insert(#self.transEggs + 1, egg)
end

function RobEggInfo:getKillUserCount()
	local count = 0

	for _, info in pairs(self.killUser) do
		count = count + info.deadTimes
	end

	return count
end

return RobEggInfo
