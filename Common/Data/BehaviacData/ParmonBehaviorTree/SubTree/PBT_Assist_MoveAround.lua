-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Assist_MoveAround.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Assist_MoveAround = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_Assist_MoveAround",
		useForRoute = false,
		version = 11,
		agenttype = "CombatAgent",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			class = "SelectorProbability",
			id = "14",
			properties = {
				{
					UntilSuccessOrEnd = false
				}
			},
			attachments = {},
			children = {
				{
					node = {
						class = "DecoratorWeight",
						id = "13",
						properties = {
							{
								DecorateWhenChildEnds = "false"
							},
							{
								Weight = {
									const = 1
								}
							}
						},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "12",
									properties = {
										{
											Method = {
												func = "moveAroundTarget",
												params = {
													{
														field = "tgt"
													},
													{
														const = 3
													},
													{
														const = 0
													},
													{
														const = BaseEnum.SpeedRateType.Mid
													},
													{
														const = true
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
							}
						}
					}
				},
				{
					node = {
						class = "DecoratorWeight",
						id = "15",
						properties = {
							{
								DecorateWhenChildEnds = "false"
							},
							{
								Weight = {
									const = 1
								}
							}
						},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "16",
									properties = {
										{
											Method = {
												func = "moveAroundTarget",
												params = {
													{
														field = "tgt"
													},
													{
														const = 3
													},
													{
														const = 0
													},
													{
														const = BaseEnum.SpeedRateType.Mid
													},
													{
														const = false
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_Assist_MoveAround
