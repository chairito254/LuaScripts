-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Rogue_Fly_10181.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Rogue_Fly_10181 = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Rogue_Fly_10181",
		useForRoute = false,
		version = 114,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				name = "CurrentDistToTarget",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "CurrentBoxDistToTarget",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "goBackDist",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "skillStopDist",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "tWeight_Group_SideWalk",
				type = "int"
			},
			{
				const = 0,
				value = "0",
				name = "tWeight_Group_Wait",
				type = "int"
			},
			{
				const = 0,
				value = "0",
				name = "tWeight_Group_Angry",
				type = "int"
			}
		},
		attachments = {},
		node = {
			id = "334",
			class = "DecoratorLoop",
			properties = {
				{
					Count = {
						const = -1
					}
				},
				{
					DecorateWhenChildEnds = "true"
				},
				{
					DoneWithinFrame = "false"
				}
			},
			attachments = {},
			children = {}
		}
	}
}

return ST_Monster_AutoCombat_Rogue_Fly_10181
