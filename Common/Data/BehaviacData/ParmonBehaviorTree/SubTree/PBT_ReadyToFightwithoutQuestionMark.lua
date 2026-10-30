-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_ReadyToFightwithoutQuestionMark.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_ReadyToFightwithoutQuestionMark = {
	behavior = {
		agenttype = "CombatAgent",
		useForRoute = false,
		version = 17,
		name = "ParmonBehaviorTree/SubTree/PBT_ReadyToFightwithoutQuestionMark",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tSensorTgtId"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "tRandomWaitTime"
			},
			{
				type = "bool",
				const = false,
				value = "false",
				name = "tShowExclamation"
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
						id = "13",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "14",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "tSensorTgtId"
											}
										},
										{
											Opr = {
												const = 0
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "12",
									class = "Assignment",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tSensorTgtId"
											}
										},
										{
											Opr = {
												func = "getPerceptibilityTarget"
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "15",
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
									func = "enterCombat",
									params = {
										{
											field = "tSensorTgtId"
										}
									}
								}
							},
							{
								ResultOption = "BT_SUCCESS"
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

return PBT_ReadyToFightwithoutQuestionMark
