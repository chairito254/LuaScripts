-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Perception_10631_Leave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Perception_10631_Leave = {
	behavior = {
		useForRoute = false,
		version = 61,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Perception_10631_Leave",
		properties = {},
		pars = {
			{
				type = "int",
				value = "0",
				name = "tTargetId",
				const = 0
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "103",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "104",
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
						id = "109",
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
						id = "105",
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
									id = "108",
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
				}
			}
		}
	}
}

return PBT_Perception_10631_Leave
