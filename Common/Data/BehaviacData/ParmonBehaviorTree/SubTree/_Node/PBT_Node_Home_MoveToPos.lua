-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Home_MoveToPos.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Home_MoveToPos = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Home_MoveToPos",
		version = 7,
		properties = {},
		pars = {
			{
				type = "vector<float>",
				name = "tPosition",
				value = "0:",
				const = {}
			},
			{
				type = "float",
				name = "tYaw",
				const = 0,
				value = "0"
			},
			{
				type = "float",
				name = "tMaxTime",
				const = 0,
				value = "0"
			},
			{
				type = "float",
				name = "tSpeed",
				const = 4,
				value = "4"
			}
		},
		attachments = {},
		node = {
			id = "18",
			class = "Selector",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "10",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "16",
									class = "Action",
									properties = {
										{
											Method = {
												func = "moveToPos",
												params = {
													{
														field = "tPosition"
													},
													{
														field = "tMaxTime"
													},
													{
														const = true
													},
													{
														const = 0
													},
													{
														const = BaseEnum.SpeedRateType.Mid
													},
													{
														field = "tSpeed"
													},
													{
														const = BaseEnum.PathFindType.ForceMove
													},
													{
														const = false
													},
													{
														const = true
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
									id = "15",
									class = "Action",
									properties = {
										{
											Method = {
												func = "turnToYaw",
												params = {
													{
														field = "tYaw"
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
							}
						}
					}
				},
				{
					node = {
						id = "19",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "20",
									class = "Action",
									properties = {
										{
											Method = {
												func = "teleportToPosition",
												params = {
													{
														field = "tPosition"
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
									id = "21",
									class = "Action",
									properties = {
										{
											Method = {
												func = "turnToYaw",
												params = {
													{
														field = "tYaw"
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_Node_Home_MoveToPos
