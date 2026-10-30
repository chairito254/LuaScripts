-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10501_Cubbo\\ST_Wild_10501_Gohome.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Wild_10501_Gohome = {
	behavior = {
		agenttype = "CombatAgent",
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/_Wild/10501_Cubbo/ST_Wild_10501_Gohome",
		version = 5,
		properties = {},
		pars = {
			{
				name = "tBornPos",
				value = "0:",
				type = "vector<float>",
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
						id = "9",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "10",
									class = "Action",
									properties = {
										{
											Method = {
												func = "addBuff",
												params = {
													{
														const = 215010101
													},
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
											ResultResumeOption = "BT_ResumeSelf"
										}
									},
									attachments = {},
									children = {}
								}
							},
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
									id = "11",
									class = "Action",
									properties = {
										{
											Method = {
												func = "addEntityTag",
												params = {
													{},
													{
														const = "TE_Wild_10501_ReturnSleep"
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
							}
						}
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
									id = "7",
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
									id = "8",
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
							},
							{
								node = {
									id = "12",
									class = "Action",
									properties = {
										{
											Method = {
												func = "addBuff",
												params = {
													{
														const = 215010101
													},
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
											ResultResumeOption = "BT_ResumeSelf"
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "13",
									class = "Action",
									properties = {
										{
											Method = {
												func = "addEntityTag",
												params = {
													{},
													{
														const = "TE_Wild_10501_ReturnSleep"
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
							}
						}
					}
				}
			}
		}
	}
}

return ST_Wild_10501_Gohome
