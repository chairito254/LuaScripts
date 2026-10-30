-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Eat.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Eat = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Eat",
		version = 10,
		properties = {},
		pars = {
			{
				type = "float",
				const = 5,
				value = "5",
				name = "eatTimeOut"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {
				{
					transition = false,
					effector = true,
					precondition = false,
					id = "5",
					class = "Effector",
					properties = {
						{
							Operator = "Invalid"
						},
						{
							Opl = {
								func = "removeEntityTag",
								params = {
									{
										field = "selfId"
									},
									{
										const = "TE_Par_Eat"
									}
								}
							}
						},
						{
							Phase = "Both"
						}
					}
				}
			},
			children = {
				{
					node = {
						id = "6",
						class = "Action",
						properties = {
							{
								Method = {
									func = "addEntityTag",
									params = {
										{
											field = "selfId"
										},
										{
											const = "TE_Par_Eat"
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
						id = "2",
						class = "Action",
						properties = {
							{
								Method = {
									func = "showEmojiBubble",
									params = {
										{
											const = "Eat"
										},
										{
											field = "eatTimeOut"
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
						id = "3",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playPhaseAction",
									params = {
										{
											const = "Behav_EatStart"
										},
										{
											const = "Behav_EatLoop"
										},
										{
											const = "Behav_EatEnd"
										},
										{
											field = "eatTimeOut"
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
	}
}

return PBT_Eat
