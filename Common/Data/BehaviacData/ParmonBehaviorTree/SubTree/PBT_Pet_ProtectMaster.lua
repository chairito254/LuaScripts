-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Pet_ProtectMaster.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_ProtectMaster = {
	behavior = {
		useForRoute = false,
		agenttype = "PetAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Pet_ProtectMaster",
		version = 6,
		properties = {},
		pars = {
			{
				name = "tEnemyId",
				const = 0,
				value = "0",
				type = "int"
			}
		},
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
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tEnemyId"
								}
							},
							{
								Opr = {
									func = "getTarget"
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
									func = "showEmojiBubble",
									params = {
										{
											const = "Angry"
										},
										{
											const = 2.5
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
						id = "4",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "9",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkIsInRangeTgt",
												params = {
													{
														field = "tEnemyId"
													},
													{
														const = 0
													},
													{
														const = 15
													},
													{
														const = true
													},
													{
														const = true
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
															func = "letGoAttractMove",
															params = {
																{
																	field = "tEnemyId"
																},
																{
																	const = 2.5
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
												id = "11",
												class = "Action",
												properties = {
													{
														Method = {
															func = "turnToTarget",
															params = {
																{
																	field = "tEnemyId"
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
							},
							{
								node = {
									id = "8",
									class = "Action",
									properties = {
										{
											Method = {
												func = "petTeleportToTarget",
												params = {
													{
														field = "tEnemyId"
													},
													{
														field = "attackStopBoxDist"
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
						id = "5",
						class = "Action",
						properties = {
							{
								Method = {
									func = "attractHatred"
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

return PBT_Pet_ProtectMaster
