-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_CustomLoopAnimation_Perform.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_CustomLoopAnimation_Perform = {
	behavior = {
		agenttype = "CombatAgent",
		version = 10,
		name = "ParmonBehaviorTree/SubTree/PBT_CustomLoopAnimation_Perform",
		useForRoute = true,
		properties = {},
		pars = {
			{
				value = "0",
				name = "tWaitTime",
				type = "float",
				const = 0
			},
			{
				value = "",
				name = "tEmojiBubbleKey",
				type = "string",
				const = ""
			},
			{
				value = "5",
				name = "tEmojiBubbleTimeout",
				type = "float",
				const = 5
			},
			{
				value = "",
				name = "tAnimationStartKey",
				type = "string",
				const = ""
			},
			{
				value = "",
				name = "tAnimationLoopKey",
				type = "string",
				const = ""
			},
			{
				value = "",
				name = "tAnimationEndKey",
				type = "string",
				const = ""
			},
			{
				value = "5",
				name = "tAnimationTimeout",
				type = "float",
				const = 5
			},
			{
				value = "",
				name = "tTimelineTag",
				type = "string",
				const = ""
			},
			{
				value = "false",
				name = "tNeedLoop",
				type = "bool",
				const = false
			},
			{
				value = "false",
				name = "tAnimationPlayOnce",
				type = "bool",
				const = false
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "2",
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
						id = "3",
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
											field = "tNeedLoop"
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
						id = "5",
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "6",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "7",
												class = "Condition",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															field = "tNeedLoop"
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
												id = "8",
												class = "Action",
												properties = {
													{
														Method = {
															func = "switchToPerformStateMultiTime",
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
																	const = 9999
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
									id = "9",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "10",
												class = "Condition",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															field = "tAnimationPlayOnce"
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
												id = "11",
												class = "Action",
												properties = {
													{
														Method = {
															func = "switchToPerformStateOnce",
															params = {
																{
																	field = "tAnimationStartKey"
																},
																{
																	field = "tAnimationLoopKey"
																},
																{
																	field = "tAnimationEndKey"
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
									id = "12",
									class = "Action",
									properties = {
										{
											Method = {
												func = "switchToPerformStateFixTime",
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
														field = "tAnimationTimeout"
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

return PBT_CustomLoopAnimation_Perform
