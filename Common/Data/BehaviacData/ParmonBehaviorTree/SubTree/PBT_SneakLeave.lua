-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_SneakLeave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_SneakLeave = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_SneakLeave",
		version = 5,
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				const = 0,
				type = "int",
				name = "tTargetId",
				value = "0"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "8",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tTargetId"
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
						class = "Action",
						id = "9",
						properties = {
							{
								Method = {
									func = "switchToSneak"
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
						class = "DecoratorTime",
						id = "3",
						properties = {
							{
								Time = {
									const = 5000
								}
							},
							{
								DecorateWhenChildEnds = "false"
							}
						},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "7",
									properties = {
										{
											Method = {
												func = "leaveTarget",
												params = {
													{
														field = "tTargetId"
													},
													{
														const = 35
													},
													{
														const = 4.5
													},
													{
														const = BaseEnum.SpeedRateType.Mid
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
											ResultResumeOption = "BT_ResumeSelf"
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
						class = "Action",
						id = "6",
						properties = {
							{
								Method = {
									func = "enterDestroySelf"
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

return PBT_SneakLeave
