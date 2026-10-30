-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_MoveAroundTarget.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_MoveAroundTarget = {
	behavior = {
		useForRoute = false,
		agenttype = "WxAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_MoveAroundTarget",
		version = 9,
		properties = {},
		pars = {
			{
				const = 0,
				name = "tTargetActorId",
				type = "int",
				value = "0"
			},
			{
				const = 0,
				name = "tRadius",
				type = "float",
				value = "0"
			},
			{
				const = 0,
				name = "tSpeed",
				type = "float",
				value = "0"
			},
			{
				name = "tSpeedRateType",
				type = "SpeedRateType",
				value = "Mid",
				const = BaseEnum.SpeedRateType.Mid
			},
			{
				const = false,
				name = "tClockwise",
				type = "bool",
				value = "false"
			},
			{
				const = 0,
				name = "tTimeout",
				type = "float",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "moveAroundTarget",
						params = {
							{
								field = "tTargetActorId"
							},
							{
								field = "tRadius"
							},
							{
								field = "tSpeed"
							},
							{
								field = "tSpeedRateType"
							},
							{
								field = "tClockwise"
							},
							{
								field = "tTimeout"
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

return PBT_MoveAroundTarget
