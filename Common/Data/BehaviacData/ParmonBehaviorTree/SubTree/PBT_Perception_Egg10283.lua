-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Perception_Egg10283.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Perception_Egg10283 = {
	behavior = {
		useForRoute = false,
		version = 71,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Perception_Egg10283",
		properties = {},
		pars = {
			{
				name = "tSensorTgtId",
				const = 0,
				type = "int",
				value = "0"
			},
			{
				name = "tLeaveTimeOut",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "tSpeedRateType",
				type = "SpeedRateType",
				value = "Mid",
				const = BaseEnum.SpeedRateType.Mid
			},
			{
				name = "tSpeed",
				const = 3.5,
				type = "float",
				value = "3.5"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "83",
			properties = {},
			attachments = {
				{
					class = "Effector",
					effector = true,
					precondition = false,
					transition = false,
					id = "5",
					properties = {
						{
							Operator = "Invalid"
						},
						{
							Opl = {
								func = "removeEntityTag",
								params = {
									{
										field = "selfId"
									},
									{
										const = "TE_Par_Leave"
									}
								}
							}
						},
						{
							Phase = "Both"
						}
					}
				}
			},
			children = {
				{
					node = {
						class = "Assignment",
						id = "87",
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
									func = "getPerceptibilityTarget"
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
						id = "86",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									field = "tgt"
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
						class = "Assignment",
						id = "88",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "distToTgt"
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
											const = false
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
				},
				{
					node = {
						class = "DecoratorLoop",
						id = "104",
						properties = {
							{
								Count = {
									const = -1
								}
							},
							{
								DecorateWhenChildEnds = "true"
							},
							{
								DoneWithinFrame = "false"
							}
						},
						attachments = {},
						children = {
							{
								node = {
									class = "Sequence",
									id = "106",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Assignment",
												id = "105",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "distToTgt"
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
																	const = false
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
										},
										{
											node = {
												class = "IfElse",
												id = "101",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "91",
															properties = {
																{
																	Operator = "Greater"
																},
																{
																	Opl = {
																		field = "distToTgt"
																	}
																},
																{
																	Opr = {
																		const = 7
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
															id = "93",
															properties = {
																{
																	Method = {
																		func = "moveToTarget",
																		params = {
																			{
																				field = "tgt"
																			},
																			{
																				const = 5
																			},
																			{
																				const = 9999
																			},
																			{
																				const = true
																			},
																			{
																				const = true
																			},
																			{
																				const = true
																			},
																			{
																				const = 3
																			},
																			{
																				const = BaseEnum.MoveUpdateLevel.Slow
																			},
																			{
																				const = BaseEnum.PathFindType.Auto
																			},
																			{
																				const = BaseEnum.SpeedRateType.Slow
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
															class = "Sequence",
															id = "100",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Action",
																		id = "102",
																		properties = {
																			{
																				Method = {
																					func = "turnBack",
																					params = {
																						{
																							const = 180
																						},
																						{
																							const = true
																						},
																						{
																							const = 0
																						},
																						{
																							const = BaseEnum.RootMotionSyncPointEnum.Point1
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
																		id = "103",
																		properties = {
																			{
																				Method = {
																					func = "leaveTarget",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 30
																						},
																						{
																							const = 3
																						},
																						{
																							const = BaseEnum.SpeedRateType.Slow
																						},
																						{
																							const = 3.5
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
					}
				}
			}
		}
	}
}

return PBT_Perception_Egg10283
