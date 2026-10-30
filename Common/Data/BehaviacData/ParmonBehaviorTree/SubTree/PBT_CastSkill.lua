-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_CastSkill.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_CastSkill = {
	behavior = {
		useForRoute = false,
		version = 8,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_CastSkill",
		properties = {},
		pars = {
			{
				value = "0",
				const = 0,
				name = "tWaitTime",
				type = "float"
			},
			{
				value = "0",
				const = 0,
				name = "tSkillId",
				type = "int"
			},
			{
				value = "0",
				const = 0,
				name = "tSkillTargetActorId",
				type = "int"
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
				value = "false",
				const = false,
				name = "tRaycastOpen",
				type = "bool"
			},
			{
				value = "Normal",
				name = "tCastAbilitySource",
				type = "CastAbilitySourceType",
				const = BaseEnum.CastAbilitySourceType.Normal
			}
		},
		attachments = {},
		node = {
			id = "8",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "4",
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
						id = "0",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "11",
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
									id = "1",
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
									id = "2",
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
						id = "5",
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
								ResultResumeOption = "BT_NextNode"
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

return PBT_CastSkill
