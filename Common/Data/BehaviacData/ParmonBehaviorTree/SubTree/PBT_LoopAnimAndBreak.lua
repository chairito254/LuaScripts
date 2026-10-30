-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_LoopAnimAndBreak.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_LoopAnimAndBreak = {
	behavior = {
		agenttype = "CombatAgent",
		version = 14,
		name = "ParmonBehaviorTree/SubTree/PBT_LoopAnimAndBreak",
		useForRoute = false,
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
				value = "AnimationEnd",
				name = "tBreakTag",
				type = "string",
				const = "AnimationEnd"
			}
		},
		attachments = {},
		node = {
			class = "Selector",
			id = "15",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Sequence",
						id = "1",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "2",
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
									class = "Action",
									id = "3",
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
									class = "Action",
									id = "4",
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
														field = "tAnimationTimeout"
													},
													{
														field = "tTimelineTag"
													},
													{
														const = false
													},
													{
														field = "tNeedLoop"
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
									attachments = {
										{
											effector = false,
											precondition = true,
											class = "Precondition",
											transition = false,
											id = "13",
											properties = {
												{
													BinaryOperator = "And"
												},
												{
													Operator = "Equal"
												},
												{
													Opl = {
														func = "hasAITag",
														params = {
															{
																field = "selfId"
															},
															{
																field = "tBreakTag"
															}
														}
													}
												},
												{
													Opr2 = {
														const = false
													}
												},
												{
													Phase = "Both"
												}
											}
										}
									},
									children = {}
								}
							}
						}
					}
				},
				{
					node = {
						class = "Sequence",
						id = "10",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "11",
									properties = {
										{
											Method = {
												func = "playAction",
												params = {
													{
														field = "tAnimationEndKey"
													},
													{
														const = 0
													},
													{
														field = "tTimelineTag"
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
									class = "Action",
									id = "12",
									properties = {
										{
											Method = {
												func = "removeAITag",
												params = {
													{
														field = "selfId"
													},
													{
														field = "tBreakTag"
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
		}
	}
}

return PBT_LoopAnimAndBreak
