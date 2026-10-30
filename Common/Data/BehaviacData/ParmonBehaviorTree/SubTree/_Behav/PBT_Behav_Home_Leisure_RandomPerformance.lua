-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Home_Leisure_RandomPerformance.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Home_Leisure_RandomPerformance = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Home_Leisure_RandomPerformance",
		version = 16,
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "tIsStartLoopEndAnim",
				const = false,
				value = "false",
				type = "bool"
			},
			{
				name = "tAnimationStartKey",
				const = "",
				value = "",
				type = "string"
			},
			{
				name = "tAnimationLoopKey",
				const = "",
				value = "",
				type = "string"
			},
			{
				name = "tAnimationEndKey",
				const = "",
				value = "",
				type = "string"
			},
			{
				name = "tEmojiKey",
				const = "",
				value = "",
				type = "string"
			},
			{
				name = "tBornPos",
				value = "0:",
				type = "vector<float>",
				const = {}
			}
		},
		attachments = {},
		node = {
			id = "39",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "52",
						class = "Action",
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
						id = "51",
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "44",
									class = "Action",
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
									id = "49",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "46",
												class = "Action",
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
												id = "50",
												class = "Assignment",
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
												id = "47",
												class = "Action",
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
									id = "48",
									class = "Action",
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
				},
				{
					node = {
						id = "42",
						class = "Action",
						properties = {
							{
								Method = {
									func = "showEmojiBubble",
									params = {
										{
											field = "tEmojiKey"
										},
										{
											const = 5
										},
										{
											const = false
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
								ResultResumeOption = "BT_None"
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "41",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "43",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "tIsStartLoopEndAnim"
											}
										},
										{
											Opr = {
												const = false
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "40",
									class = "Action",
									properties = {
										{
											Method = {
												func = "playAction",
												params = {
													{
														field = "tAnimationLoopKey"
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
									id = "45",
									class = "Action",
									properties = {
										{
											Method = {
												func = "playPhaseAction",
												params = {
													{
														field = "tAnimationStartKey"
													},
													{
														field = "tAnimationLoopKey"
													},
													{
														field = "tAnimationEndKey"
													},
													{
														const = 0
													},
													{
														const = ""
													},
													{
														const = true
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
		}
	}
}

return PBT_Behav_Home_Leisure_RandomPerformance
