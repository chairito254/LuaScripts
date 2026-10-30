-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Leave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Leave = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Leave",
		useForRoute = false,
		version = 18,
		properties = {},
		pars = {
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tSensorTgtId"
			}
		},
		attachments = {},
		node = {
			id = "41",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "40",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									const = "PBT_Perception_Leave"
								}
							},
							{
								subTreeProperties = {}
							}
						},
						attachments = {},
						children = {}
					}
				}
			}
		}
	}
}

return PBT_Leave
