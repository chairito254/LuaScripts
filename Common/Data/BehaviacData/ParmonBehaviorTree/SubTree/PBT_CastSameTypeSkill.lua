-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_CastSameTypeSkill.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_CastSameTypeSkill = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_CastSameTypeSkill",
		version = 7,
		useForRoute = false,
		properties = {},
		pars = {
			{
				type = "float",
				value = "0",
				name = "tWaitTime",
				const = 0
			},
			{
				type = "int",
				value = "0",
				name = "tSkillId",
				const = 0
			},
			{
				type = "int",
				value = "0",
				name = "tSkillTargetActorId",
				const = 0
			},
			{
				type = "string",
				value = "",
				name = "tEmojiBubbleKey",
				const = ""
			},
			{
				type = "float",
				value = "5",
				name = "tEmojiBubbleTimeout",
				const = 5
			},
			{
				type = "bool",
				value = "false",
				name = "tRaycastOpen",
				const = false
			},
			{
				type = "CastAbilitySourceType",
				value = "Normal",
				name = "tCastAbilitySource",
				const = BaseEnum.CastAbilitySourceType.Normal
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
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "4",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "tRaycastOpen"
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
									class = "Assignment",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tSkillTargetActorId"
											}
										},
										{
											Opr = {
												func = "getRaycastEntityActorId",
												params = {
													{
														const = 0
													},
													{
														const = 5
													}
												}
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "6",
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
						id = "8",
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
						id = "7",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tSkillId"
								}
							},
							{
								Opr = {
									func = "getSameTypeSkillId",
									params = {
										{
											field = "tSkillId"
										}
									}
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "9",
						class = "Action",
						properties = {
							{
								Method = {
									func = "castSkill",
									params = {
										{
											field = "tSkillTargetActorId"
										},
										{
											field = "tSkillId"
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = false
										},
										{
											field = "tCastAbilitySource"
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

return PBT_CastSameTypeSkill
