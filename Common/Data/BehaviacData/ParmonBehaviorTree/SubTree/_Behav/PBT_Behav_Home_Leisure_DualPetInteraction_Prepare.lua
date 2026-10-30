-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Home_Leisure_DualPetInteraction_Prepare.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Home_Leisure_DualPetInteraction_Prepare = {
	behavior = {
		version = 76,
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Home_Leisure_DualPetInteraction_Prepare",
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "tSpeed",
				const = 2,
				value = "2",
				type = "float"
			},
			{
				name = "tSpeedRateType",
				value = "Mid",
				type = "SpeedRateType",
				const = BaseEnum.SpeedRateType.Mid
			},
			{
				name = "tActorId",
				const = 0,
				value = "0",
				type = "int"
			}
		},
		attachments = {},
		node = {
			id = "53",
			class = "Selector",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "57",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "56",
									class = "Condition",
									properties = {
										{
											Operator = "NotEqual"
										},
										{
											Opl = {
												field = "tActorId"
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
									id = "58",
									class = "Action",
									properties = {
										{
											Method = {
												func = "moveToTarget",
												params = {
													{
														field = "tActorId"
													},
													{
														const = 2
													},
													{
														const = 0
													},
													{
														const = false
													},
													{
														const = true
													},
													{
														const = true
													},
													{
														field = "tSpeed"
													},
													{
														const = BaseEnum.MoveUpdateLevel.Normal
													},
													{
														const = BaseEnum.PathFindType.Auto
													},
													{
														field = "tSpeedRateType"
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
							}
						}
					}
				},
				{
					node = {
						id = "62",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "61",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "tActorId"
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
									id = "63",
									class = "Noop",
									properties = {},
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

return PBT_Behav_Home_Leisure_DualPetInteraction_Prepare
