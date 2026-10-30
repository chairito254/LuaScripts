-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10443_Bat\\PBT_10443_TurnAndCustomAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_10443_TurnAndCustomAnimation = {
	behavior = {
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/_Wild/10443_Bat/PBT_10443_TurnAndCustomAnimation",
		agenttype = "CombatAgent",
		version = 67,
		properties = {},
		pars = {
			{
				value = "0",
				const = 0,
				name = "tTargetActorId",
				type = "int"
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
				name = "tAnimationPlayOnce",
				type = "bool"
			},
			{
				value = "false",
				const = false,
				name = "tEmojiBubbleMustPlayFull",
				type = "bool"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "40",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Parallel",
						id = "114",
						properties = {
							{
								ChildFinishPolicy = "CHILDFINISH_ONCE"
							},
							{
								ExitPolicy = "EXIT_ABORT_RUNNINGSIBLINGS"
							},
							{
								FailurePolicy = "FAIL_ON_ONE"
							},
							{
								SuccessPolicy = "SUCCEED_ON_ONE"
							}
						},
						attachments = {},
						children = {
							{
								node = {
									class = "DecoratorAlwaysRunning",
									id = "115",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										}
									},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "21",
												properties = {
													{
														Method = {
															func = "turnToTarget",
															params = {
																{
																	field = "tTargetActorId"
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
										}
									}
								}
							},
							{
								node = {
									class = "Sequence",
									id = "81",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "106",
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
												id = "107",
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
																	field = "tEmojiBubbleMustPlayFull"
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
												id = "108",
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
																	field = "tAnimationPlayOnce"
																},
																{
																	const = 10
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

return PBT_10443_TurnAndCustomAnimation
