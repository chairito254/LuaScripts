-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_10051_ChaseSheep.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_10051_ChaseSheep = {
	behavior = {
		useForRoute = false,
		version = 8,
		name = "ParmonBehaviorTree/SubTree/PBT_10051_ChaseSheep",
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				name = "tTargetActorId",
				value = "0"
			},
			{
				type = "float",
				const = 0,
				name = "Speed",
				value = "0"
			},
			{
				type = "float",
				const = 0,
				name = "StopDist",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "6",
			class = "DecoratorLoop",
			properties = {
				{
					Count = {
						const = -1
					}
				},
				{
					DecorateWhenChildEnds = "false"
				},
				{
					DoneWithinFrame = "false"
				}
			},
			attachments = {},
			children = {
				{
					node = {
						id = "4",
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
											field = "StopDist"
										},
										{
											const = 10
										},
										{
											const = false
										},
										{
											const = false
										},
										{
											const = true
										},
										{
											field = "Speed"
										},
										{
											const = BaseEnum.MoveUpdateLevel.VeryFast
										},
										{
											const = BaseEnum.PathFindType.Voxel
										},
										{
											const = BaseEnum.SpeedRateType.Mid
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
		}
	}
}

return PBT_10051_ChaseSheep
