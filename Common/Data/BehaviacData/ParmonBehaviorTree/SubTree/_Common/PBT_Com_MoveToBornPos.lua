-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Common\\PBT_Com_MoveToBornPos.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_MoveToBornPos = {
	behavior = {
		version = 5,
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Common/PBT_Com_MoveToBornPos",
		properties = {},
		pars = {
			{
				value = "0:",
				name = "bornPos",
				type = "vector<float>",
				const = {}
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "3",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "7",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "bornPos"
								}
							},
							{
								Opr = {
									func = "getBornPos"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						class = "Selector",
						id = "4",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "1",
									properties = {
										{
											Method = {
												func = "moveToPos",
												params = {
													{
														field = "bornPos"
													},
													{
														const = 15
													},
													{
														const = true
													},
													{
														const = 0
													},
													{
														const = BaseEnum.SpeedRateType.Slow
													},
													{
														const = 0
													},
													{
														const = BaseEnum.PathFindType.Auto
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
									id = "9",
									properties = {
										{
											Method = {
												func = "teleportToPosition",
												params = {
													{
														field = "bornPos"
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
		}
	}
}

return PBT_Com_MoveToBornPos
