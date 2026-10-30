-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Home_Leisure_DualPetInteraction_Action.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Home_Leisure_DualPetInteraction_Action = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Home_Leisure_DualPetInteraction_Action",
		version = 73,
		useForRoute = false,
		properties = {},
		pars = {
			{
				type = "string",
				value = "0",
				name = "tEmojiKey",
				const = "0"
			},
			{
				type = "string",
				value = "",
				name = "tAnimationStartKey",
				const = ""
			},
			{
				type = "string",
				value = "",
				name = "tAnimationLoopKey",
				const = ""
			},
			{
				type = "string",
				value = "",
				name = "tAnimationEndKey",
				const = ""
			},
			{
				type = "int",
				value = "0",
				name = "tActorId",
				const = 0
			},
			{
				type = "float",
				value = "5",
				name = "tAnimationTime",
				const = 5
			},
			{
				type = "float",
				value = "5",
				name = "tEmojiTime",
				const = 5
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
						id = "65",
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "45",
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
														field = "tEmojiTime"
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
									id = "66",
									class = "Noop",
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
						id = "48",
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "51",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "68",
												class = "Action",
												properties = {
													{
														Method = {
															func = "turnToTarget",
															params = {
																{
																	field = "tActorId"
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
												id = "69",
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
																	field = "tAnimationTime"
																},
																{
																	const = ""
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
									id = "64",
									class = "Noop",
									properties = {},
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

return PBT_Behav_Home_Leisure_DualPetInteraction_Action
