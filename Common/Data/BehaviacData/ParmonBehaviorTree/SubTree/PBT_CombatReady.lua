-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_CombatReady.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_CombatReady = {
	behavior = {
		useForRoute = false,
		version = 5,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_CombatReady",
		properties = {},
		pars = {
			{
				type = "vector<float>",
				name = "tBornPos",
				value = "0:",
				const = {}
			},
			{
				type = "int",
				name = "tBehaviorTgtActorId",
				const = 0,
				value = "0"
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
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tBehaviorTgtActorId"
								}
							},
							{
								Opr = {
									func = "getTarget"
								}
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
									func = "turnToTarget",
									params = {
										{
											field = "tBehaviorTgtActorId"
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
						id = "5",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playAction",
									params = {
										{
											const = "Behav_Angry"
										},
										{
											const = -1
										},
										{
											const = ""
										},
										{
											const = false
										},
										{
											const = false
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

return PBT_CombatReady
