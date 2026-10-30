-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_10141_FlyToHeight.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_10141_FlyToHeight = {
	behavior = {
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/PBT_10141_FlyToHeight",
		agenttype = "CombatAgent",
		version = 21,
		properties = {},
		pars = {
			{
				name = "tHeight",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "tActorId",
				const = 0,
				type = "int",
				value = "0"
			},
			{
				name = "tWaitTime",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "tSpeed",
				const = 0,
				type = "float",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "3",
			class = "IfElse",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "4",
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
											field = "selfId"
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
						id = "1",
						class = "Action",
						properties = {
							{
								Method = {
									func = "flyToTarget",
									params = {
										{
											field = "tActorId"
										},
										{
											const = 0
										},
										{
											field = "tHeight"
										},
										{
											const = 20
										},
										{
											const = true
										},
										{
											field = "tWaitTime"
										},
										{
											const = false
										},
										{
											const = true
										},
										{
											field = "tSpeed"
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
						id = "5",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "6",
									class = "Action",
									properties = {
										{
											Method = {
												func = "switchToFly",
												params = {
													{
														const = 0
													},
													{
														const = 0.5
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
									id = "7",
									class = "Action",
									properties = {
										{
											Method = {
												func = "flyToTarget",
												params = {
													{
														field = "tActorId"
													},
													{
														const = 0
													},
													{
														field = "tHeight"
													},
													{
														const = 20
													},
													{
														const = true
													},
													{
														field = "tWaitTime"
													},
													{
														const = false
													},
													{
														const = true
													},
													{
														field = "tSpeed"
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

return PBT_10141_FlyToHeight
