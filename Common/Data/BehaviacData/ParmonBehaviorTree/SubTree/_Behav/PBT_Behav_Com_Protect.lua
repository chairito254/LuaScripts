-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_Protect.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_Protect = {
	behavior = {
		version = 5,
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_Protect",
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tProtectActorId"
			},
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tEnemyActorId"
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
						class = "ReferencedBehavior",
						id = "1",
						properties = {
							{
								ReferenceBehavior = {
									const = "PBT_Node_Com_SensedAlert"
								}
							},
							{
								subTreeProperties = {}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						class = "DecoratorLoop",
						id = "8",
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
									class = "Sequence",
									id = "9",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "7",
												properties = {
													{
														Method = {
															func = "moveToProtect",
															params = {
																{
																	field = "tProtectActorId"
																},
																{
																	field = "tEnemyActorId"
																},
																{
																	const = 3
																},
																{
																	const = 10
																},
																{
																	const = false
																},
																{
																	const = 0
																},
																{
																	const = BaseEnum.SpeedRateType.Mid
																},
																{
																	const = BaseEnum.PathFindType.Auto
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
												id = "10",
												properties = {
													{
														Method = {
															func = "turnToTarget",
															params = {
																{
																	field = "tEnemyActorId"
																},
																{
																	const = false
																},
																{
																	const = 2
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
												class = "ReferencedBehavior",
												id = "3",
												properties = {
													{
														ReferenceBehavior = {
															const = "PBT_Com_Angry"
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

return PBT_Behav_Com_Protect
