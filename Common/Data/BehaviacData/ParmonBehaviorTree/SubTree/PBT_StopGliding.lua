-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_StopGliding.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_StopGliding = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_StopGliding",
		version = 11,
		useForRoute = true,
		agenttype = "WxAgent",
		properties = {},
		pars = {
			{
				value = "false",
				name = "exitGlidingImmediate",
				const = false,
				type = "bool"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "4",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Selector",
						id = "5",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "6",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkCharacterState",
												params = {
													{
														const = "GLIDING"
													},
													{
														const = 0
													}
												}
											}
										},
										{
											Opr = {
												const = false
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									class = "Condition",
									id = "7",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "exitGlidingImmediate"
											}
										},
										{
											Opr = {
												const = false
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									class = "Sequence",
									id = "9",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "8",
												properties = {
													{
														Method = {
															func = "switchToState",
															params = {
																{
																	const = "AIRING"
																},
																{
																	const = -1
																},
																{
																	const = ""
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
												class = "Action",
												id = "10",
												properties = {
													{
														Method = {
															func = "switchToState",
															params = {
																{
																	const = "LOCOMOTION"
																},
																{
																	const = 0
																},
																{
																	const = ""
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
				},
				{
					node = {
						class = "Selector",
						id = "2",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "3",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkCharacterState",
												params = {
													{
														const = "GLIDING"
													},
													{
														const = 0
													}
												}
											}
										},
										{
											Opr = {
												const = false
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
									id = "1",
									properties = {
										{
											Method = {
												func = "switchToState",
												params = {
													{
														const = "LOCOMOTION"
													},
													{
														const = 0
													},
													{
														const = ""
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

return PBT_StopGliding
