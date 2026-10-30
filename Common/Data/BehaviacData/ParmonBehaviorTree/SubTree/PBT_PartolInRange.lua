-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_PartolInRange.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_PartolInRange = {
	behavior = {
		agenttype = "CombatAgent",
		useForRoute = false,
		version = 5,
		name = "ParmonBehaviorTree/SubTree/PBT_PartolInRange",
		properties = {},
		pars = {
			{
				value = "0",
				name = "tPatrolRange",
				type = "float",
				const = 0
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "1",
			properties = {
				{
					Method = {
						func = "patrolInRange",
						params = {
							{
								field = "tPatrolRange"
							},
							{
								const = BaseEnum.SpeedRateType.Slow
							},
							{
								const = 0
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

return PBT_PartolInRange
