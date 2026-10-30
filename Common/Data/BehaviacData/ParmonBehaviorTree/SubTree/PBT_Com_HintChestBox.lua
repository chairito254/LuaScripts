-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Com_HintChestBox.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_HintChestBox = {
	behavior = {
		useForRoute = false,
		version = 5,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Com_HintChestBox",
		properties = {},
		pars = {
			{
				value = "0",
				const = 0,
				name = "tTargetActorId",
				type = "int"
			},
			{
				value = "0.2",
				const = 0.2,
				name = "tStopDist",
				type = "float"
			},
			{
				value = "5",
				const = 5,
				name = "tMaxTimeout",
				type = "float"
			},
			{
				value = "true",
				const = true,
				name = "tFaceTarget",
				type = "bool"
			},
			{
				value = "0",
				const = 0,
				name = "tSpeed",
				type = "float"
			},
			{
				value = "Once",
				name = "tMoveUpdateLevel",
				type = "MoveUpdateLevel",
				const = BaseEnum.MoveUpdateLevel.Once
			},
			{
				value = "0",
				const = 0,
				name = "tTgtId",
				type = "int"
			},
			{
				value = "0",
				const = 0,
				name = "tTargetAtYawDegree",
				type = "float"
			},
			{
				value = "0",
				const = 0,
				name = "tWaitTime",
				type = "float"
			},
			{
				value = "",
				const = "",
				name = "tAnimationKey",
				type = "string"
			},
			{
				value = "5",
				const = 5,
				name = "tAnimationTimeout",
				type = "float"
			},
			{
				value = "",
				const = "",
				name = "tEmojiBubbleKey",
				type = "string"
			},
			{
				value = "5",
				const = 5,
				name = "tEmojiBubbleTimeout",
				type = "float"
			},
			{
				value = "",
				const = "",
				name = "tTimelineTag",
				type = "string"
			},
			{
				value = "false",
				const = false,
				name = "tNeedLoop",
				type = "bool"
			},
			{
				value = "false",
				const = false,
				name = "IsCloseEnough",
				type = "bool"
			}
		},
		attachments = {},
		node = {
			id = "8",
			class = "IfElse",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "9",
						class = "Condition",
						properties = {
							{
								Operator = "Equal"
							},
							{
								Opl = {
									field = "IsCloseEnough"
								}
							},
							{
								Opr = {
									const = true
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "2",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "6",
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
														const = BaseEnum.PathFindType.Auto
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
							},
							{
								node = {
									id = "10",
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
									id = "11",
									class = "Action",
									properties = {
										{
											Method = {
												func = "waitTime",
												params = {
													{
														field = "tWaitTime"
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
									class = "Action",
									properties = {
										{
											Method = {
												func = "showEmojiBubble",
												params = {
													{
														field = "tEmojiBubbleKey"
													},
													{
														field = "tEmojiBubbleTimeout"
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
									id = "13",
									class = "Action",
									properties = {
										{
											Method = {
												func = "playAction",
												params = {
													{
														field = "tAnimationKey"
													},
													{
														field = "tAnimationTimeout"
													},
													{
														field = "tTimelineTag"
													},
													{
														field = "tNeedLoop"
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
							}
						}
					}
				},
				{
					node = {
						id = "1",
						class = "Action",
						properties = {
							{
								Method = {
									func = "showDialogue",
									params = {
										{
											const = 30002000
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
				}
			}
		}
	}
}

return PBT_Com_HintChestBox
