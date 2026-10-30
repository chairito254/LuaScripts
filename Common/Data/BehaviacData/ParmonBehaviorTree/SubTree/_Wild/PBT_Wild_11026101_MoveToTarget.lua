-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\PBT_Wild_11026101_MoveToTarget.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_11026101_MoveToTarget = {
	behavior = {
		agenttype = "CombatAgent",
		version = 20,
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/_Wild/PBT_Wild_11026101_MoveToTarget",
		properties = {},
		pars = {
			{
				type = "int",
				name = "tTargetActorId",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "tStopDist",
				value = "0.2",
				const = 0.2
			},
			{
				type = "float",
				name = "tMaxTimeout",
				value = "5",
				const = 5
			},
			{
				type = "bool",
				name = "tFaceTarget",
				value = "true",
				const = true
			},
			{
				type = "float",
				name = "tSpeed",
				value = "0",
				const = 0
			},
			{
				type = "MoveUpdateLevel",
				name = "tMoveUpdateLevel",
				value = "Once",
				const = BaseEnum.MoveUpdateLevel.Once
			},
			{
				type = "PathFindType",
				name = "tPathFindType",
				value = "Auto",
				const = BaseEnum.PathFindType.Auto
			},
			{
				type = "SpeedRateType",
				name = "tSpeedRateType",
				value = "Slow",
				const = BaseEnum.SpeedRateType.Slow
			},
			{
				type = "bool",
				name = "tUseAccurateArrive",
				value = "false",
				const = false
			},
			{
				type = "bool",
				name = "tNoBodySize",
				value = "false",
				const = false
			}
		},
		attachments = {},
		node = {
			id = "10",
			class = "Selector",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "8",
						class = "Action",
						properties = {
							{
								Method = {
									func = "moveToTarget",
									params = {
										{
											field = "tTargetActorId"
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
											field = "tMoveUpdateLevel"
										},
										{
											field = "tPathFindType"
										},
										{
											field = "tSpeedRateType"
										},
										{
											const = 0
										},
										{
											field = "tUseAccurateArrive"
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
				},
				{
					node = {
						id = "12",
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

return PBT_Wild_11026101_MoveToTarget
