-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_Chase.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_Chase = {
	behavior = {
		useForRoute = false,
		version = 14,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_Chase",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tTargetActorId"
			},
			{
				type = "SpeedRateType",
				value = "Mid",
				name = "",
				const = BaseEnum.SpeedRateType.Mid
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "Speed"
			}
		},
		attachments = {},
		node = {
			id = "2",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "10",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playAction",
									params = {
										{
											const = "Behav_AngryLoop"
										},
										{
											const = 0
										},
										{
											const = ""
										},
										{
											const = false
										},
										{
											const = true
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
						id = "7",
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
									id = "8",
									class = "Sequence",
									properties = {},
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
																	const = 2
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
										},
										{
											node = {
												id = "9",
												class = "ReferencedBehavior",
												properties = {
													{
														ReferenceBehavior = {
															const = "PBT_ReadyToFight"
														}
													},
													{
														subTreeProperties = {}
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
					}
				}
			}
		}
	}
}

return PBT_Behav_Com_Chase
