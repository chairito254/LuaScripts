-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_CastNormalAtkCombo.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_CastNormalAtkCombo = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_CastNormalAtkCombo",
		useForRoute = false,
		version = 19,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "0",
				name = "tWaitTime",
				type = "float",
				const = 0
			},
			{
				value = "false",
				name = "tSkipBackswing",
				type = "bool",
				const = false
			},
			{
				value = "0",
				name = "tSkillTargetActorId",
				type = "int",
				const = 0
			},
			{
				value = "",
				name = "tEmojiBubbleKey",
				type = "string",
				const = ""
			},
			{
				value = "0",
				name = "tEmojiBubbleTimeout",
				type = "float",
				const = 0
			},
			{
				value = "false",
				name = "tRaycastOpen",
				type = "bool",
				const = false
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
									id = "27",
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
						id = "42",
						class = "Action",
						properties = {
							{
								Method = {
									func = "castNormalAtkCombo",
									params = {
										{
											field = "tSkillTargetActorId"
										},
										{
											const = 4
										},
										{
											field = "tSkipBackswing"
										},
										{
											const = 4
										},
										{
											field = "tSkipBackswing"
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

return PBT_CastNormalAtkCombo
