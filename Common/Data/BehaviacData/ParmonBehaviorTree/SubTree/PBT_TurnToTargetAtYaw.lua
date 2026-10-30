-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_TurnToTargetAtYaw.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_TurnToTargetAtYaw = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_TurnToTargetAtYaw",
		version = 6,
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				type = "int",
				name = "tTgtId"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "tTargetAtYawDegree"
			},
			{
				const = false,
				value = "false",
				type = "bool",
				name = "tInstant"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "turnToTargetAtYaw",
						params = {
							{
								field = "tTgtId"
							},
							{
								field = "tTargetAtYawDegree"
							},
							{
								const = false
							},
							{
								const = 0
							},
							{
								field = "tInstant"
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

return PBT_TurnToTargetAtYaw
