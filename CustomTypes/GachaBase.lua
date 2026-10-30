-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\GachaBase.lua

local CustomDict = require("Core.PropertySync.CustomDict")
local class = require("Core.Framework.Class")
local GachaBase = class.LiteClass("GachaBase", CustomDict)

function GachaBase:getDailyShareCount()
	return self.dailyShareCount
end

function GachaBase:getCurCanShareCount()
	return self.curCanShareCount
end

function GachaBase:getDailyClaimedShareRewardCount()
	return self.dailyClaimedShareRewardCount
end

function GachaBase:isFirstTenPul()
	return self.gachaFirstTenPull
end

return GachaBase
