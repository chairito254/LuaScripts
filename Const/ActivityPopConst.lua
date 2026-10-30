-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Const\\ActivityPopConst.lua

local ActivityConst = require("Common.Const.ActivityConst")
local TipAreaConst = require("Guis.Panels.Tips.TipAreaConst")
local ActivityPopConst = {}

ActivityPopConst.CooldownType = {
	Once = 1,
	None = 0,
	Phase = 3,
	Daily = 2
}
ActivityPopConst.PopTarget = {
	[ActivityConst.EventType.PetSave] = {
		checker = "checkPetSave",
		legacy = true,
		cooldown = ActivityPopConst.CooldownType.Daily
	},
	[ActivityConst.EventType.SeasonActivity] = {
		checker = "checkSeasonActivity",
		itemKey = "EventSeason",
		areaType = TipAreaConst.AREAS.A1,
		cooldown = ActivityPopConst.CooldownType.Phase
	}
}

return ActivityPopConst
