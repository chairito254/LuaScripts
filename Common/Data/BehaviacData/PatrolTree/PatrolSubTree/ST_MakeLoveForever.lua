-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_MakeLoveForever.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_MakeLoveForever = {
	behavior = {
		name = "PatrolTree/PatrolSubTree/ST_MakeLoveForever",
		version = 16,
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "7",
				const = 7,
				type = "float",
				name = "MakeLoveTimeOut"
			},
			{
				value = "false",
				const = false,
				type = "bool",
				name = "tIsLoop"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tDialogueId"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {
				{
					class = "Effector",
					id = "27",
					transition = false,
					effector = true,
					precondition = false,
					properties = {
						{
							Operator = "Invalid"
						},
						{
							Opl = {
								func = "lerpProperty",
								params = {
									{
										const = false
									},
									{
										const = 2
									}
								}
							}
						},
						{
							Phase = "Both"
						}
					}
				}
			},
			children = {
				{
					node = {
						id = "26",
						class = "Action",
						properties = {
							{
								Method = {
									func = "showEmojiBubble",
									params = {
										{
											const = "love"
										},
										{
											const = 3
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
								ResultResumeOption = "BT_None"
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "25",
						class = "Action",
						properties = {
							{
								Method = {
									func = "lerpProperty",
									params = {
										{
											const = true
										},
										{
											const = 0.5
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
						id = "20",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "21",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "tIsLoop"
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
									id = "23",
									class = "Sequence",
									properties = {},
									attachments = {
										{
											class = "Precondition",
											id = "24",
											transition = false,
											effector = false,
											precondition = true,
											properties = {
												{
													BinaryOperator = "And"
												},
												{
													Operator = "Equal"
												},
												{
													Opl = {
														field = "tIsLoop"
													}
												},
												{
													Opr2 = {
														const = true
													}
												},
												{
													Phase = "Both"
												}
											}
										}
									},
									children = {
										{
											node = {
												id = "22",
												class = "Action",
												properties = {
													{
														Method = {
															func = "switchToPerformStateMultiTime",
															params = {
																{
																	const = "Behav_MakeLove_Start"
																},
																{
																	const = "Behav_MakeLove_Loop"
																},
																{
																	const = "Behav_MakeLove_End"
																},
																{
																	const = 999
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
									id = "19",
									class = "Action",
									properties = {
										{
											Method = {
												func = "switchToPerformStateFixTime",
												params = {
													{
														const = "Behav_MakeLove_Start"
													},
													{
														const = "Behav_MakeLove_Loop"
													},
													{
														const = "Behav_MakeLove_End"
													},
													{
														const = 999
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

return ST_MakeLoveForever
