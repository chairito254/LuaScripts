-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10401_shimp\\PBT_Wild_10401_Combat_underwater.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10401_Combat_underwater = {
	behavior = {
		version = 28,
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Wild/10401_shimp/PBT_Wild_10401_Combat_underwater",
		properties = {},
		pars = {
			{
				name = "tSensorTgtId",
				type = "int",
				value = "0",
				const = 0
			},
			{
				name = "tBornPos",
				type = "vector<float>",
				value = "0:",
				const = {}
			}
		},
		attachments = {},
		node = {
			id = "2",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "19",
						class = "Action",
						properties = {
							{
								Method = {
									func = "castSkill",
									params = {
										{
											field = "tSensorTgtId"
										},
										{
											const = 14010003
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
								ResultResumeOption = "BT_NextNode"
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "9",
						class = "Action",
						properties = {
							{
								Method = {
									func = "addBuff",
									params = {
										{
											const = 2140101
										},
										{
											const = 5
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
									func = "waitTime",
									params = {
										{
											const = 4
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
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "24",
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
									id = "25",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "26",
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
												id = "27",
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
		}
	}
}

return PBT_Wild_10401_Combat_underwater
