-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_Drunk.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_Drunk = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_Drunk",
		useForRoute = false,
		version = 13,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "3",
				name = "tDuration",
				type = "float",
				const = 3
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "9",
			properties = {},
			attachments = {
				{
					transition = false,
					class = "Effector",
					effector = true,
					precondition = false,
					id = "11",
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
										const = "TE_Par_Drunk"
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
						class = "Action",
						id = "12",
						properties = {
							{
								Method = {
									func = "addEntityTag",
									params = {
										{
											field = "selfId"
										},
										{
											const = "TE_Par_Drunk"
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
						class = "Action",
						id = "6",
						properties = {
							{
								Method = {
									func = "playEffectOnTarget",
									params = {
										{
											const = "Eff_Debuff_stun"
										},
										{}
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
						class = "Action",
						id = "5",
						properties = {
							{
								Method = {
									func = "playSleAnimationFixTime",
									params = {
										{
											const = "StunStart"
										},
										{
											const = "StunLoop"
										},
										{
											const = ""
										},
										{
											const = 3
										},
										{
											const = ""
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
									func = "stopEffectOnTarget",
									params = {
										{
											const = "Eff_Debuff_stun"
										},
										{}
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

return PBT_Behav_Com_Drunk
