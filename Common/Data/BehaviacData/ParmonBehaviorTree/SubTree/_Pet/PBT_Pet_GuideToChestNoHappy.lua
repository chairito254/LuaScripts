-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Pet\\PBT_Pet_GuideToChestNoHappy.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_GuideToChestNoHappy = {
	behavior = {
		version = 7,
		useForRoute = false,
		agenttype = "PetAgent",
		name = "ParmonBehaviorTree/SubTree/_Pet/PBT_Pet_GuideToChestNoHappy",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tTargetActorId"
			},
			{
				type = "float",
				const = 0.2,
				value = "0.2",
				name = "tStopDist"
			},
			{
				type = "float",
				const = 5,
				value = "5",
				name = "tMaxTimeout"
			},
			{
				type = "bool",
				const = false,
				value = "false",
				name = "tFaceTarget"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "tSpeed"
			},
			{
				type = "MoveUpdateLevel",
				value = "Once",
				name = "tMoveUpdateLevel",
				const = BaseEnum.MoveUpdateLevel.Once
			},
			{
				type = "PathFindType",
				value = "Auto",
				name = "tPathFindType",
				const = BaseEnum.PathFindType.Auto
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "1",
			properties = {
				{
					Method = {
						func = "moveToTarget",
						params = {
							{
								field = "guideTargetActorId"
							},
							{
								field = "tStopDist"
							},
							{
								field = "tMaxTimeout"
							},
							{
								const = false
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
								const = BaseEnum.SpeedRateType.Slow
							},
							{
								const = 0
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

return PBT_Pet_GuideToChestNoHappy
