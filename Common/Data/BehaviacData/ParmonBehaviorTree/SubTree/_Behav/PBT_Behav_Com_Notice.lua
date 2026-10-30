-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_Notice.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_Notice = {
	behavior = {
		version = 17,
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_Notice",
		properties = {},
		pars = {
			{
				const = 0,
				type = "int",
				value = "0",
				name = "tTargetActorId"
			},
			{
				const = true,
				type = "bool",
				value = "true",
				name = "tWait"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "2",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "10",
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
				},
				{
					node = {
						class = "Action",
						id = "8",
						properties = {
							{
								Method = {
									func = "showQuestionMark",
									params = {
										{
											const = "DirectFull"
										},
										{
											const = 0
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
						class = "IfElse",
						id = "11",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "12",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "tWait"
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
									class = "Action",
									id = "9",
									properties = {
										{
											Method = {
												func = "waitTime",
												params = {
													{
														const = 0.5
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
									class = "True",
									id = "13",
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

return PBT_Behav_Com_Notice
