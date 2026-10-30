-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Noop_Failure.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Noop_Failure = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Noop_Failure",
		version = 10,
		properties = {},
		pars = {
			{
				type = "float",
				name = "CurrentEP",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "maxSkillDist",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "skillStopDist",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "goBackDist",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "CurrentBoxDistToTarget",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tSkillUsed",
				value = "0",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "3",
			class = "DecoratorAlwaysFailure",
			properties = {
				{
					DecorateWhenChildEnds = "false"
				}
			},
			attachments = {},
			children = {
				{
					node = {
						id = "1",
						class = "Noop",
						properties = {},
						attachments = {},
						children = {}
					}
				}
			}
		}
	}
}

return PBT_Noop_Failure
