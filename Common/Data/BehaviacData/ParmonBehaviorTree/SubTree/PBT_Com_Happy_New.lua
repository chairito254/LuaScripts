-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Com_Happy_New.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_Happy_New = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Com_Happy_New",
		version = 6,
		useForRoute = false,
		properties = {},
		pars = {
			{
				name = "tAnimationTimeout",
				value = "5",
				type = "float",
				const = 5
			},
			{
				name = "tTimelineTag",
				value = "",
				type = "string",
				const = ""
			},
			{
				name = "tNeedLoop",
				value = "false",
				type = "bool",
				const = false
			},
			{
				name = "tPlayOnce",
				value = "false",
				type = "bool",
				const = false
			}
		},
		attachments = {},
		node = {
			id = "11",
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
									func = "showEmojiBubble",
									params = {
										{
											const = "Happy"
										},
										{
											field = "tAnimationTimeout"
										},
										{
											const = false
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
						id = "8",
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "7",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "9",
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
																	const = "Behav_HappyLoop"
																}
															}
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
												id = "5",
												class = "Action",
												properties = {
													{
														Method = {
															func = "playPhaseAction",
															params = {
																{
																	const = "Behav_HappyStart"
																},
																{
																	const = "Behav_HappyLoop"
																},
																{
																	const = "Behav_HappyEnd"
																},
																{
																	field = "tAnimationTimeout"
																},
																{
																	field = "tTimelineTag"
																},
																{
																	field = "tPlayOnce"
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
												attachments = {},
												children = {}
											}
										}
									}
								}
							},
							{
								node = {
									id = "6",
									class = "Action",
									properties = {
										{
											Method = {
												func = "playAction",
												params = {
													{
														const = "Behav_Happy"
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
														field = "tPlayOnce"
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

return PBT_Com_Happy_New
