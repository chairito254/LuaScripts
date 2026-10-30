-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_Alert.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Alert = {
	behavior = {
		useForRoute = true,
		version = 6,
		agenttype = "CombatAgent",
		name = "PatrolTree/PatrolSubTree/ST_Alert",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "6",
			class = "Selector",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "5",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "7",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "hasAnimState",
												params = {
													{
														const = "Behav_AlertLoop"
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
									id = "3",
									class = "Action",
									properties = {
										{
											Method = {
												func = "playPhaseAction",
												params = {
													{
														const = "Behav_AlertStart"
													},
													{
														const = "Behav_AlertLoop"
													},
													{
														const = "Behav_AlertEnd"
													},
													{
														const = 0
													},
													{
														const = ""
													},
													{
														const = true
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
				},
				{
					node = {
						id = "4",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playAction",
									params = {
										{
											const = "Behav_Alert"
										},
										{
											const = 6
										},
										{
											const = ""
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
											const = BaseEnum.AIAnimationRootMotionType.Default
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

return ST_Alert
