-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Com_Alert.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_Alert = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_Com_Alert",
		agenttype = "CombatAgent",
		version = 7,
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = 0,
				name = "tTargetActorId",
				value = "0",
				type = "int"
			}
		},
		attachments = {},
		node = {
			id = "8",
			class = "Sequence",
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
									id = "2",
									class = "Action",
									properties = {
										{
											Method = {
												func = "moveToTargetPos",
												params = {
													{
														field = "tTargetActorId"
													},
													{
														const = 340
													},
													{
														const = 5
													},
													{
														const = 0
													},
													{
														const = 30
													},
													{
														const = true
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
														const = BaseEnum.SpeedRateType.Mid
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
									id = "5",
									class = "Action",
									properties = {
										{
											Method = {
												func = "turnToTargetAtYaw",
												params = {
													{
														field = "tTargetActorId"
													},
													{
														const = 180
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
									id = "6",
									class = "Action",
									properties = {
										{
											Method = {
												func = "showEmojiBubble",
												params = {
													{
														const = "Alert"
													},
													{
														const = 0
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
											ResultResumeOption = "BT_None"
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
												func = "playAction",
												params = {
													{
														const = "Behav_Alert"
													},
													{
														const = 0
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
				},
				{
					node = {
						id = "21",
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
												func = "moveToTargetPos",
												params = {
													{
														field = "tTargetActorId"
													},
													{
														const = 20
													},
													{
														const = 5
													},
													{
														const = 0
													},
													{
														const = 30
													},
													{
														const = true
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
														const = BaseEnum.SpeedRateType.Mid
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
									id = "22",
									class = "Action",
									properties = {
										{
											Method = {
												func = "turnToTargetAtYaw",
												params = {
													{
														field = "tTargetActorId"
													},
													{
														const = 180
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
									id = "23",
									class = "Action",
									properties = {
										{
											Method = {
												func = "showEmojiBubble",
												params = {
													{
														const = "Alert"
													},
													{
														const = 0
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
											ResultResumeOption = "BT_None"
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "24",
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
														const = 0
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
									id = "25",
									class = "Action",
									properties = {
										{
											Method = {
												func = "moveToTargetPos",
												params = {
													{
														field = "tTargetActorId"
													},
													{
														const = 20
													},
													{
														const = 2.5
													},
													{
														const = 0
													},
													{
														const = 30
													},
													{
														const = true
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
														const = BaseEnum.SpeedRateType.Mid
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
									id = "26",
									class = "Action",
									properties = {
										{
											Method = {
												func = "turnToTargetAtYaw",
												params = {
													{
														field = "tTargetActorId"
													},
													{
														const = 0
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_Com_Alert
