-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_SwitchToFly.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_SwitchToFly = {
	behavior = {
		version = 6,
		name = "ParmonBehaviorTree/SubTree/PBT_SwitchToFly",
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "3",
				type = "float",
				const = 3,
				name = "tFlyHeight"
			},
			{
				value = "5",
				type = "float",
				const = 5,
				name = "tMaxTime"
			}
		},
		attachments = {},
		node = {
			id = "4",
			class = "Action",
			properties = {
				{
					Method = {
						func = "switchToFly",
						params = {
							{
								field = "tFlyHeight"
							},
							{
								field = "tMaxTime"
							}
						}
					}
				},
				{
					ResultOption = "BT_INVALID"
				},
				{
					ResultResumeOption = "BT_ResumeSelf"
				}
			},
			attachments = {},
			children = {}
		}
	}
}

return PBT_SwitchToFly
