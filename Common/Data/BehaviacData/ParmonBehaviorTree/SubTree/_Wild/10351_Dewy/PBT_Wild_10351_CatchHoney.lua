-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10351_Dewy\\PBT_Wild_10351_CatchHoney.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10351_CatchHoney = {
	behavior = {
		version = 20,
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Wild/10351_Dewy/PBT_Wild_10351_CatchHoney",
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				name = "tSensorTgtId",
				type = "int"
			},
			{
				const = false,
				value = "false",
				name = "",
				type = "bool"
			},
			{
				const = 5.1,
				value = "5.1",
				name = "eatTimeOut",
				type = "float"
			}
		},
		attachments = {},
		node = {
			id = "47",
			class = "Sequence",
			properties = {},
			attachments = {
				{
					precondition = false,
					transition = false,
					id = "51",
					class = "Effector",
					effector = true,
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
						id = "52",
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
						id = "48",
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
						id = "49",
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

return PBT_Wild_10351_CatchHoney
