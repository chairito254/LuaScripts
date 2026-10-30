-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\_SubTree\\ST_GoHome.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_GoHome = {
	behavior = {
		useForRoute = false,
		name = "CombatUnit/_SubTree/ST_GoHome",
		agenttype = "WxAgent",
		version = 5,
		properties = {},
		pars = {
			{
				value = "0:",
				name = "tBornPos",
				type = "vector<float>",
				const = {}
			}
		},
		attachments = {},
		node = {
			class = "Selector",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "2",
						properties = {
							{
								Method = {
									func = "gotoBornPos",
									params = {
										{
											const = -1
										}
									}
								}
							},
							{
								ResultOption = "BT_INVALID"
							},
							{
								ResultResumeOption = "BT_NextNode"
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
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
									class = "Action",
									id = "8",
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

return ST_GoHome
