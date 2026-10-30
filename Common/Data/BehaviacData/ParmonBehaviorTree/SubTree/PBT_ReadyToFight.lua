-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_ReadyToFight.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_ReadyToFight = {
	behavior = {
		version = 12,
		useForRoute = true,
		name = "ParmonBehaviorTree/SubTree/PBT_ReadyToFight",
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				name = "tSensorTgtId",
				value = "0"
			},
			{
				type = "float",
				const = 0,
				name = "tRandomWaitTime",
				value = "0"
			},
			{
				type = "bool",
				const = false,
				name = "tShowExclamation",
				value = "false"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "IfElse",
						id = "13",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "14",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "tSensorTgtId"
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
							},
							{
								node = {
									class = "Assignment",
									id = "12",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tSensorTgtId"
											}
										},
										{
											Opr = {
												func = "getPerceptibilityTarget"
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									class = "Noop",
									id = "15",
									properties = {},
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
						id = "21",
						properties = {
							{
								Method = {
									func = "waitTime",
									params = {
										{
											field = "tRandomWaitTime"
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
						id = "11",
						properties = {
							{
								Method = {
									func = "turnToTarget",
									params = {
										{
											field = "tSensorTgtId"
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
						class = "IfElse",
						id = "16",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "17",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "tShowExclamation"
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
									class = "Sequence",
									id = "23",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "24",
												properties = {
													{
														Method = {
															func = "hideQuestionMark"
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
												id = "20",
												properties = {
													{
														Method = {
															func = "showQuestionMark",
															params = {
																{
																	const = "DirectFull"
																},
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
												id = "22",
												properties = {
													{
														Method = {
															func = "waitTime",
															params = {
																{
																	const = 1
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
									class = "Noop",
									id = "18",
									properties = {},
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
						id = "5",
						properties = {
							{
								Method = {
									func = "enterCombat",
									params = {
										{
											field = "tSensorTgtId"
										}
									}
								}
							},
							{
								ResultOption = "BT_SUCCESS"
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

return PBT_ReadyToFight
