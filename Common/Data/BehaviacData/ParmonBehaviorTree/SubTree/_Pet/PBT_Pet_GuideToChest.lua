-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Pet\\PBT_Pet_GuideToChest.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_GuideToChest = {
	behavior = {
		version = 15,
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/_Pet/PBT_Pet_GuideToChest",
		agenttype = "PetAgent",
		properties = {},
		pars = {
			{
				const = 0,
				type = "int",
				name = "tTargetActorId",
				value = "0"
			},
			{
				const = 0,
				type = "float",
				name = "tStopDist",
				value = "0"
			},
			{
				const = 0,
				type = "float",
				name = "tMaxTimeout",
				value = "0"
			},
			{
				const = false,
				type = "bool",
				name = "tFaceTarget",
				value = "false"
			},
			{
				const = 0,
				type = "float",
				name = "tSpeed",
				value = "0"
			},
			{
				type = "MoveUpdateLevel",
				name = "tMoveUpdateLevel",
				value = "VeryFast",
				const = BaseEnum.MoveUpdateLevel.VeryFast
			},
			{
				type = "PathFindType",
				name = "tPathFindType",
				value = "Auto",
				const = BaseEnum.PathFindType.Auto
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "2",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "3",
						properties = {
							{
								Method = {
									func = "turnToTargetAtYaw",
									params = {
										{
											field = "masterId"
										},
										{
											const = 0
										},
										{
											const = false
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
				},
				{
					node = {
						class = "Action",
						id = "1",
						properties = {
							{
								Method = {
									func = "showEmojiBubble",
									params = {
										{
											const = "Happy"
										},
										{
											const = 4
										},
										{
											const = false
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
								ResultResumeOption = "BT_None"
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						class = "Action",
						id = "0",
						properties = {
							{
								Method = {
									func = "playAction",
									params = {
										{
											const = "Behav_Happy"
										},
										{
											const = 3
										},
										{
											const = ""
										},
										{
											const = false
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = BaseEnum.AIAnimationRootMotionType.Default
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
						class = "Action",
						id = "4",
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
		}
	}
}

return PBT_Pet_GuideToChest
