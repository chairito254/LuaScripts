-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Pet_Follow.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_Follow = {
	behavior = {
		version = 28,
		name = "ParmonBehaviorTree/SubTree/PBT_Pet_Follow",
		useForRoute = false,
		agenttype = "PetAgent",
		properties = {},
		pars = {
			{
				value = "0",
				const = 0,
				name = "tInWaterDepth",
				type = "float"
			},
			{
				value = "0",
				const = 0,
				name = "tCurrentDistToMaster",
				type = "float"
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
						id = "30",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "34",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkStartFollow",
												params = {
													{
														field = "followTarget"
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
									id = "5",
									class = "Action",
									properties = {
										{
											Method = {
												func = "followEntity",
												params = {
													{
														field = "followTarget"
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
											ResultResumeOption = "BT_ResumeTree"
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "32",
									class = "Noop",
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
						id = "20",
						class = "Action",
						properties = {
							{
								Method = {
									func = "turnToTarget",
									params = {
										{
											field = "followTarget"
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
								ResultOption = "BT_SUCCESS"
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
						id = "48",
						class = "Compute",
						properties = {
							{
								Operator = "Mul"
							},
							{
								Opl = {
									field = "tInWaterDepth"
								}
							},
							{
								Opr1 = {
									func = "getBodyHeight",
									params = {
										{
											field = "selfId"
										}
									}
								}
							},
							{
								Opr2 = {
									const = -0.3
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "36",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "58",
									class = "And",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "38",
												class = "Condition",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "isOnWater",
															params = {
																{
																	field = "selfId"
																},
																{
																	field = "tInWaterDepth"
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
												id = "57",
												class = "Condition",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkHasAbility",
															params = {
																{
																	field = "selfId"
																},
																{
																	const = BaseEnum.AbilityType.Swim
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
										}
									}
								}
							},
							{
								node = {
									id = "51",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "50",
												class = "Action",
												properties = {
													{
														Method = {
															func = "calcQualifiedPosByTarget",
															params = {
																{
																	field = "selfId"
																},
																{
																	const = 3
																},
																{
																	const = 8
																},
																{
																	const = BaseEnum.CalcQualifiedPosQueryType.EightCompassDirections
																},
																{
																	const = 4
																},
																{
																	const = 0
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
														ResultOption = "BT_SUCCESS"
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
												id = "49",
												class = "Action",
												properties = {
													{
														Method = {
															func = "moveToQualifiedPos",
															params = {
																{
																	field = "selfId"
																},
																{
																	const = 5
																},
																{
																	const = 0
																},
																{
																	const = BaseEnum.SpeedRateType.Mid
																},
																{
																	const = true
																}
															}
														}
													},
													{
														ResultOption = "BT_SUCCESS"
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
												id = "55",
												class = "Action",
												properties = {
													{
														Method = {
															func = "turnToTarget",
															params = {
																{
																	field = "followTarget"
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
														ResultOption = "BT_SUCCESS"
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
												id = "86",
												class = "IfElse",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "85",
															class = "Condition",
															properties = {
																{
																	Operator = "Equal"
																},
																{
																	Opl = {
																		func = "isOnWater",
																		params = {
																			{
																				field = "selfId"
																			},
																			{
																				field = "tInWaterDepth"
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
															id = "83",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "teleportToTargetSide",
																		params = {
																			{
																				field = "followTarget"
																			},
																			{
																				const = 0.5
																			},
																			{
																				const = 1
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
															id = "87",
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
							},
							{
								node = {
									id = "39",
									class = "Noop",
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
						id = "35",
						class = "Action",
						properties = {
							{
								Method = {
									func = "exitFollow"
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

return PBT_Pet_Follow
