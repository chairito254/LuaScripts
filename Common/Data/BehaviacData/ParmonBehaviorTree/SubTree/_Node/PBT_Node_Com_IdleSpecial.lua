-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_IdleSpecial.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_IdleSpecial = {
	behavior = {
		useForRoute = true,
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_IdleSpecial",
		agenttype = "CombatAgent",
		version = 17,
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "37",
			class = "Selector",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "27",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "28",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "hasAnimState",
												params = {
													{
														const = "IdleSpecial02"
													}
												}
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
									id = "19",
									class = "Action",
									properties = {
										{
											Method = {
												func = "playAction",
												params = {
													{
														const = "IdleSpecial"
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
							}
						}
					}
				},
				{
					node = {
						id = "31",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "33",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "hasAnimState",
												params = {
													{
														const = "IdleSpecial"
													}
												}
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
									id = "21",
									class = "Action",
									properties = {
										{
											Method = {
												func = "playAction",
												params = {
													{
														const = "IdleSpecial02"
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
							}
						}
					}
				},
				{
					node = {
						id = "35",
						class = "SelectorProbability",
						properties = {
							{
								UntilSuccessOrEnd = false
							}
						},
						attachments = {},
						children = {
							{
								node = {
									id = "36",
									class = "DecoratorWeight",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										},
										{
											Weight = {
												const = 1
											}
										}
									},
									attachments = {},
									children = {
										{
											node = {
												id = "39",
												class = "Action",
												properties = {
													{
														Method = {
															func = "playAction",
															params = {
																{
																	const = "IdleSpecial"
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
										}
									}
								}
							},
							{
								node = {
									id = "40",
									class = "DecoratorWeight",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										},
										{
											Weight = {
												const = 1
											}
										}
									},
									attachments = {},
									children = {
										{
											node = {
												id = "38",
												class = "Action",
												properties = {
													{
														Method = {
															func = "playAction",
															params = {
																{
																	const = "IdleSpecial02"
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

return PBT_Node_Com_IdleSpecial
