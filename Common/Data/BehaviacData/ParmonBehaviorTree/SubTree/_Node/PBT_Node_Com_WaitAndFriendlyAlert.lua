-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_WaitAndFriendlyAlert.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_WaitAndFriendlyAlert = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_WaitAndFriendlyAlert",
		version = 10,
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "0",
				name = "tTargetActorId",
				const = 0,
				type = "int"
			},
			{
				value = "0",
				name = "tWaitTime",
				const = 0,
				type = "float"
			}
		},
		attachments = {},
		node = {
			id = "3",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "8",
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "9",
									class = "Condition",
									properties = {
										{
											Operator = "GreaterEqual"
										},
										{
											Opl = {
												field = "tWaitTime"
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
									id = "6",
									class = "Assignment",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tWaitTime"
											}
										},
										{
											Opr = {
												func = "getRandomFloat",
												params = {
													{
														const = 0.2
													},
													{
														const = 2
													}
												}
											}
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
						id = "5",
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
						id = "4",
						class = "Action",
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
	}
}

return PBT_Node_Com_WaitAndFriendlyAlert
