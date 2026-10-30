-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_MoveToTargetEntityAtPos.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_MoveToTargetEntityAtPos = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_MoveToTargetEntityAtPos",
		useForRoute = false,
		version = 6,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				name = "tTargetActorId",
				type = "int"
			},
			{
				const = 0.2,
				value = "0.2",
				name = "tStopDist",
				type = "float"
			},
			{
				const = 5,
				value = "5",
				name = "tMaxTimeout",
				type = "float"
			},
			{
				const = true,
				value = "true",
				name = "tFaceTarget",
				type = "bool"
			},
			{
				const = 0,
				value = "0",
				name = "tTargetYaw",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "tTargetDistance",
				type = "float"
			},
			{
				const = false,
				value = "false",
				name = "tNoBodySize",
				type = "bool"
			},
			{
				const = 0,
				value = "0",
				name = "tSpeed",
				type = "float"
			},
			{
				value = "Slow",
				name = "tSpeedRateType",
				type = "SpeedRateType",
				const = BaseEnum.SpeedRateType.Slow
			},
			{
				const = false,
				value = "false",
				name = "tUseAccurateArrive",
				type = "bool"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "moveToTargetPos",
						params = {
							{
								field = "tTargetActorId"
							},
							{
								field = "tTargetYaw"
							},
							{
								field = "tTargetDistance"
							},
							{
								field = "tStopDist"
							},
							{
								field = "tMaxTimeout"
							},
							{
								field = "tNoBodySize"
							},
							{
								const = false
							},
							{
								field = "tFaceTarget"
							},
							{
								field = "tSpeed"
							},
							{
								field = "tSpeedRateType"
							},
							{
								const = BaseEnum.PathFindType.Auto
							},
							{
								field = "tUseAccurateArrive"
							},
							{
								const = false
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

return PBT_MoveToTargetEntityAtPos
