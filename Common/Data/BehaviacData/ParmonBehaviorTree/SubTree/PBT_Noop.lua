-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Noop.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Noop = {
	behavior = {
		agenttype = "CombatAgent",
		version = 5,
		name = "ParmonBehaviorTree/SubTree/PBT_Noop",
		useForRoute = false,
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "1",
			class = "Noop",
			properties = {},
			attachments = {},
			children = {}
		}
	}
}

return PBT_Noop
