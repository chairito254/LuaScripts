-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_SneakSprint.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_SneakSprint = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_SneakSprint",
		version = 5,
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tTargetId"
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
						class = "Condition",
						id = "2",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									field = "tTargetId"
								}
							},
							{
								Opr = {
									const = 0
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
									id = "6",
									properties = {
										{
											Method = {
												func = "turnToTargetAtYaw",
												params = {
													{
														field = "tTargetId"
													},
													{
														const = -180
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
									class = "True",
									id = "7",
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
						class = "Action",
						id = "5",
						properties = {
							{
								Method = {
									func = "castSkill",
									params = {
										{
											const = 0
										},
										{
											const = 11610430
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = false
										},
										{
											const = BaseEnum.CastAbilitySourceType.Normal
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

return PBT_SneakSprint
