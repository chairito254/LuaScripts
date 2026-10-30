-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Com_Cry.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_Cry = {
	behavior = {
		agenttype = "CombatAgent",
		version = 7,
		name = "ParmonBehaviorTree/SubTree/PBT_Com_Cry",
		useForRoute = false,
		properties = {},
		pars = {
			{
				value = "5",
				name = "tAnimationTimeout",
				const = 5,
				type = "float"
			}
		},
		attachments = {},
		node = {
			class = "IfElse",
			id = "6",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Condition",
						id = "17",
						properties = {
							{
								Operator = "Equal"
							},
							{
								Opl = {
									func = "hasAnimState",
									params = {
										{
											const = "Behav_CryLoop"
										}
									}
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
						id = "15",
						properties = {
							{
								Method = {
									func = "playPhaseAction",
									params = {
										{
											const = "Behav_CryStart"
										},
										{
											const = "Behav_CryLoop"
										},
										{
											const = "Behav_CryEnd"
										},
										{
											field = "tAnimationTimeout"
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
				},
				{
					node = {
						class = "Action",
						id = "10",
						properties = {
							{
								Method = {
									func = "playAction",
									params = {
										{
											const = "Behav_Cry"
										},
										{
											const = 0
										},
										{
											const = ""
										},
										{
											const = false
										},
										{
											const = true
										},
										{
											const = 0
										},
										{
											const = BaseEnum.AIAnimationRootMotionType.Default
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

return PBT_Com_Cry
