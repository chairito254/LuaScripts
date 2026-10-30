-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\_GrabEggs\\PBT_Wild_GrabEggs_ProtectEgg_CheckEgg.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_GrabEggs_ProtectEgg_CheckEgg = {
	behavior = {
		version = 19,
		name = "ParmonBehaviorTree/SubTree/_Wild/_GrabEggs/PBT_Wild_GrabEggs_ProtectEgg_CheckEgg",
		agenttype = "CombatAgent",
		useForRoute = false,
		properties = {},
		pars = {
			{
				value = "0",
				type = "int",
				name = "EggActorId",
				const = 0
			},
			{
				value = "0",
				type = "float",
				name = "tWaitTime",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "19",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "26",
						class = "Action",
						properties = {
							{
								Method = {
									func = "addEntityTag",
									params = {
										{},
										{
											const = "protecteggfirst"
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
						id = "21",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "13",
									class = "Action",
									properties = {
										{
											Method = {
												func = "moveToTarget",
												params = {
													{
														const = 0
													},
													{
														const = 5
													},
													{
														const = 0
													},
													{
														const = false
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
														const = BaseEnum.MoveUpdateLevel.Once
													},
													{
														const = BaseEnum.PathFindType.Auto
													},
													{
														const = BaseEnum.SpeedRateType.Mid
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
									id = "20",
									class = "Action",
									properties = {
										{
											Method = {
												func = "turnToTarget",
												params = {
													{
														const = 0
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
									id = "23",
									class = "Assignment",
									properties = {
										{
											CastRight = "true"
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
														const = 3
													},
													{
														const = 5
													}
												}
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "24",
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_Wild_GrabEggs_ProtectEgg_CheckEgg
