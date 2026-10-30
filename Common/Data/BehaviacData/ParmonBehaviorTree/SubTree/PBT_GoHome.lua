-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_GoHome.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_GoHome = {
	behavior = {
		agenttype = "CombatAgent",
		version = 5,
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/PBT_GoHome",
		properties = {},
		pars = {
			{
				type = "vector<float>",
				value = "0:",
				name = "tBornPos",
				const = {}
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Selector",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "2",
						class = "Action",
						properties = {
							{
								Method = {
									func = "gotoBornPos",
									params = {
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
				},
				{
					node = {
						id = "3",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "6",
									class = "Assignment",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tBornPos"
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
									id = "5",
									class = "Action",
									properties = {
										{
											Method = {
												func = "teleportToPosition",
												params = {
													{
														field = "tBornPos"
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

return PBT_GoHome
