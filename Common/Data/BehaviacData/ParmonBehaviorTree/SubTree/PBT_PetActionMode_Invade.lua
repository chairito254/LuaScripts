-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_PetActionMode_Invade.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_PetActionMode_Invade = {
	behavior = {
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/PBT_PetActionMode_Invade",
		version = 15,
		agenttype = "PetAgent",
		properties = {},
		pars = {
			{
				const = 0,
				name = "tTargetID",
				type = "int",
				value = "0"
			},
			{
				const = 0,
				name = "CurrentDistToTarget",
				type = "float",
				value = "0"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "6",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Sequence",
						id = "27",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Assignment",
									id = "7",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tgt"
											}
										},
										{
											Opr = {
												field = "tTargetID"
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									class = "Assignment",
									id = "28",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "CurrentDistToTarget"
											}
										},
										{
											Opr = {
												func = "getDistByTgt",
												params = {
													{
														field = "tgt"
													},
													{
														const = false
													},
													{
														const = true
													},
													{
														const = 0
													}
												}
											}
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
						class = "Assignment",
						id = "11",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "isEnterCombatByInvadeMode"
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
						class = "IfElse",
						id = "22",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "20",
									properties = {
										{
											Operator = "Greater"
										},
										{
											Opl = {
												field = "CurrentDistToTarget"
											}
										},
										{
											Opr = {
												field = "maxAttackDist"
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
									id = "23",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "24",
												properties = {
													{
														Method = {
															func = "moveToTarget",
															params = {
																{
																	field = "tgt"
																},
																{
																	field = "attackStopBoxDist"
																},
																{
																	const = 5
																},
																{
																	const = false
																},
																{
																	const = false
																},
																{
																	const = true
																},
																{
																	const = 0
																},
																{
																	const = BaseEnum.MoveUpdateLevel.Normal
																},
																{
																	const = BaseEnum.PathFindType.Voxel
																},
																{
																	const = BaseEnum.SpeedRateType.Mid
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
														ResultResumeOption = "BT_ResumeTree"
													}
												},
												attachments = {},
												children = {}
											}
										},
										{
											node = {
												class = "Action",
												id = "25",
												properties = {
													{
														Method = {
															func = "castNormalAtkCombo",
															params = {
																{
																	field = "tgt"
																},
																{
																	const = 0
																},
																{
																	const = true
																},
																{
																	const = 1
																},
																{
																	const = true
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
														ResultResumeOption = "BT_ResumeTree"
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
									class = "Action",
									id = "26",
									properties = {
										{
											Method = {
												func = "castNormalAtkCombo",
												params = {
													{
														field = "tgt"
													},
													{
														const = 0
													},
													{
														const = true
													},
													{
														const = 1
													},
													{
														const = true
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
											ResultResumeOption = "BT_ResumeTree"
										}
									},
									attachments = {
										{
											precondition = true,
											class = "Precondition",
											transition = false,
											id = "356",
											effector = false,
											properties = {
												{
													BinaryOperator = "And"
												},
												{
													Operator = "LessEqual"
												},
												{
													Opl = {
														field = "CurrentDistToTarget"
													}
												},
												{
													Opr2 = {
														field = "maxAttackDist"
													}
												},
												{
													Phase = "Update"
												}
											}
										}
									},
									children = {}
								}
							}
						}
					}
				},
				{
					node = {
						class = "Sequence",
						id = "16",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "17",
									properties = {
										{
											Operator = "NotEqual"
										},
										{
											Opl = {
												func = "isInCombat",
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
									class = "Action",
									id = "18",
									properties = {
										{
											Method = {
												func = "showEmojiBubble",
												params = {
													{
														const = "Think"
													},
													{
														const = 5
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_PetActionMode_Invade
