-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_CastCutsomSkill.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_CastCutsomSkill = {
	behavior = {
		agenttype = "CombatAgent",
		name = "PatrolTree/PatrolSubTree/ST_CastCutsomSkill",
		useForRoute = true,
		version = 6,
		properties = {},
		pars = {
			{
				type = "float",
				name = "tWaitTime",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tSkillId",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tSkillTargetActorId",
				value = "0",
				const = 0
			},
			{
				type = "string",
				name = "tEmojiBubbleKey",
				value = "",
				const = ""
			},
			{
				type = "float",
				name = "tEmojiBubbleTimeout",
				value = "0",
				const = 0
			},
			{
				type = "bool",
				name = "tRaycastOpen",
				value = "false",
				const = false
			},
			{
				type = "CastAbilitySourceType",
				name = "tCastAbilitySource",
				value = "Normal",
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
									id = "9",
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
									id = "7",
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
									id = "8",
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
						id = "4",
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
						id = "5",
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

return ST_CastCutsomSkill
