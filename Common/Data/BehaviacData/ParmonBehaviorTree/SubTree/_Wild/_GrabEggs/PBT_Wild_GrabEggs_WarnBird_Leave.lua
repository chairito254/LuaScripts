-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\_GrabEggs\\PBT_Wild_GrabEggs_WarnBird_Leave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_GrabEggs_WarnBird_Leave = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Wild/_GrabEggs/PBT_Wild_GrabEggs_WarnBird_Leave",
		version = 12,
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				type = "int",
				name = "tSensorTgtId",
				const = 0,
				value = "0"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "0",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "10",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tSensorTgtId"
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
						id = "3",
						properties = {
							{
								Method = {
									func = "showQuestionMark",
									params = {
										{
											const = "Orange"
										},
										{
											const = 1.14
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
						class = "Sequence",
						id = "4",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "7",
									properties = {
										{
											Method = {
												func = "switchToFly",
												params = {
													{
														const = 3
													},
													{
														const = 1
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
									id = "6",
									properties = {
										{
											Method = {
												func = "leaveTarget",
												params = {
													{
														field = "tSensorTgtId"
													},
													{
														const = 12
													},
													{
														const = 6
													},
													{
														const = BaseEnum.SpeedRateType.Mid
													},
													{
														const = 5
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
									id = "5",
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
		}
	}
}

return PBT_Wild_GrabEggs_WarnBird_Leave
