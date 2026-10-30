-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Behav_Com_Sleep.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_Sleep = {
	behavior = {
		agenttype = "CombatAgent",
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/PBT_Behav_Com_Sleep",
		version = 10,
		properties = {},
		pars = {
			{
				const = 0,
				name = "tSleepTimeout",
				type = "float",
				value = "0"
			},
			{
				const = false,
				name = "tisLoop",
				type = "bool",
				value = "false"
			}
		},
		attachments = {},
		node = {
			id = "17",
			class = "Sequence",
			properties = {},
			attachments = {
				{
					id = "8",
					transition = false,
					class = "Effector",
					effector = true,
					precondition = false,
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
										const = "TE_Par_Sleep"
									}
								}
							}
						},
						{
							Phase = "Both"
						}
					}
				},
				{
					id = "10",
					transition = false,
					class = "Effector",
					effector = true,
					precondition = false,
					properties = {
						{
							Operator = "Invalid"
						},
						{
							Opl = {
								func = "setVisionAreaOverride",
								params = {
									{
										const = "visionAreaDefault"
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
						id = "16",
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
											const = "TE_Par_Sleep"
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
						id = "12",
						class = "Action",
						properties = {
							{
								Method = {
									func = "setVisionAreaOverride",
									params = {
										{
											const = "visionAreaLow"
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
						id = "11",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playPhaseAction",
									params = {
										{
											const = "Behav_SleepStart"
										},
										{
											const = "Behav_SleepLoop"
										},
										{
											const = "Behav_SleepEnd"
										},
										{
											field = "tSleepTimeout"
										},
										{
											const = ""
										},
										{
											const = false
										},
										{
											field = "tisLoop"
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
						id = "13",
						class = "Action",
						properties = {
							{
								Method = {
									func = "setVisionAreaOverride",
									params = {
										{
											const = "visionAreaDefault"
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
				}
			}
		}
	}
}

return PBT_Behav_Com_Sleep
