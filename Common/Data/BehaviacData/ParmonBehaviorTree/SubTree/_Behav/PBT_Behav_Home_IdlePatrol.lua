-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Home_IdlePatrol.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Home_IdlePatrol = {
	behavior = {
		version = 53,
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Home_IdlePatrol",
		useForRoute = false,
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
				type = "vector<float>",
				name = "tBornPos",
				value = "0:",
				const = {}
			}
		},
		attachments = {},
		node = {
			class = "DecoratorLoop",
			id = "85",
			properties = {
				{
					Count = {
						const = -1
					}
				},
				{
					DecorateWhenChildEnds = "true"
				},
				{
					DoneWithinFrame = "false"
				}
			},
			attachments = {},
			children = {
				{
					node = {
						class = "Selector",
						id = "55",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Sequence",
									id = "84",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "42",
												properties = {
													{
														Method = {
															func = "patrolInHomeland",
															params = {
																{
																	const = 3
																},
																{
																	const = 5
																},
																{
																	const = BaseEnum.SpeedRateType.Slow
																},
																{
																	const = 0
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
												class = "Assignment",
												id = "13",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "patrolWeight"
														}
													},
													{
														Opr = {
															const = 0
														}
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
									class = "Sequence",
									id = "69",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "74",
												properties = {
													{
														Method = {
															func = "waitTime",
															params = {
																{
																	const = 2
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
												class = "Assignment",
												id = "82",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "tBornPos"
														}
													},
													{
														Opr = {
															func = "getBornPos"
														}
													}
												},
												attachments = {},
												children = {}
											}
										},
										{
											node = {
												class = "Action",
												id = "73",
												properties = {
													{
														Method = {
															func = "patrolInHomeland",
															params = {
																{
																	const = 3
																},
																{
																	const = 5
																},
																{
																	const = BaseEnum.SpeedRateType.Slow
																},
																{
																	const = 0
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
									class = "Action",
									id = "77",
									properties = {
										{
											Method = {
												func = "teleportToPosition",
												params = {
													{
														field = "tBornPos"
													},
													{
														const = true
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
		}
	}
}

return PBT_Behav_Home_IdlePatrol
