-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\_SubTree\\ST_GoHome_Monster_Helgon.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_GoHome_Monster_Helgon = {
	behavior = {
		version = 5,
		agenttype = "CombatAgent",
		name = "CombatUnit/_SubTree/ST_GoHome_Monster_Helgon",
		useForRoute = false,
		properties = {},
		pars = {},
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
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "4",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "6",
												class = "Condition",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkIsFlying",
															params = {
																{
																	const = 0
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
												id = "7",
												class = "Action",
												properties = {
													{
														Method = {
															func = "switchToGround"
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
									id = "5",
									class = "True",
									properties = {},
									attachments = {},
									children = {}
								}
							}
						}
					}
				},
				{
					node = {
						id = "3",
						class = "Action",
						properties = {
							{
								Method = {
									func = "gotoBornPos",
									params = {
										{
											const = 100
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

return ST_GoHome_Monster_Helgon
