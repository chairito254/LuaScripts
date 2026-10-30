-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Egg_10331.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Egg_10331 = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Egg_10331",
		agenttype = "PuppetAgent",
		version = 150,
		useForRoute = false,
		properties = {},
		pars = {
			{
				name = "disToTgtForSkillMon",
				value = "0",
				type = "float",
				const = 0
			},
			{
				name = "goBackDist",
				value = "0",
				type = "float",
				const = 0
			},
			{
				name = "MeleeA1",
				value = "50",
				type = "int",
				const = 50
			},
			{
				name = "MeleeA2",
				value = "50",
				type = "int",
				const = 50
			},
			{
				name = "RangedA1",
				value = "50",
				type = "int",
				const = 50
			},
			{
				name = "RangedA2",
				value = "50",
				type = "int",
				const = 50
			},
			{
				name = "RangedB1",
				value = "0",
				type = "int",
				const = 0
			},
			{
				name = "RangedB2",
				value = "0",
				type = "int",
				const = 0
			},
			{
				name = "MeleeB1",
				value = "50",
				type = "int",
				const = 50
			},
			{
				name = "MeleeB2",
				value = "50",
				type = "int",
				const = 50
			},
			{
				name = "MeleeB3",
				value = "50",
				type = "int",
				const = 50
			},
			{
				name = "RangedC1",
				value = "0",
				type = "int",
				const = 0
			},
			{
				name = "RangedC2",
				value = "20",
				type = "int",
				const = 20
			},
			{
				name = "RangedC3",
				value = "20",
				type = "int",
				const = 20
			},
			{
				name = "Ex1",
				value = "0",
				type = "int",
				const = 0
			},
			{
				name = "Ex2",
				value = "50",
				type = "int",
				const = 50
			},
			{
				name = "Ex3",
				value = "100",
				type = "int",
				const = 100
			},
			{
				name = "hasUsedEx",
				value = "false",
				type = "bool",
				const = false
			},
			{
				name = "wyv",
				value = "0",
				type = "int",
				const = 0
			},
			{
				name = "RangeA3",
				value = "50",
				type = "int",
				const = 50
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
						id = "281",
						class = "Assignment",
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
						id = "280",
						class = "Condition",
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
						id = "1413",
						class = "Assignment",
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
						id = "3",
						class = "DecoratorLoop",
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
									id = "1423",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "1422",
												class = "Assignment",
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
												id = "1416",
												class = "IfElse",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "1417",
															class = "Condition",
															properties = {
																{
																	Operator = "Less"
																},
																{
																	Opl = {
																		field = "distToTgt"
																	}
																},
																{
																	Opr = {
																		const = 1
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															id = "1420",
															class = "Noop",
															properties = {},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															id = "1414",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1421",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "addBuff",
																					params = {
																						{
																							const = 2133101
																						},
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
																		id = "1425",
																		class = "DecoratorLoop",
																		properties = {
																			{
																				Count = {
																					const = -1
																				}
																			},
																			{
																				DecorateWhenChildEnds = "false"
																			},
																			{
																				DoneWithinFrame = "false"
																			}
																		},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "1419",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "moveToTarget",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 1
																									},
																									{
																										const = 4
																									},
																									{
																										const = true
																									},
																									{
																										const = false
																									},
																									{
																										const = true
																									},
																									{
																										const = 7
																									},
																									{
																										const = BaseEnum.MoveUpdateLevel.Fast
																									},
																									{
																										const = BaseEnum.PathFindType.Auto
																									},
																									{
																										const = BaseEnum.SpeedRateType.Mid
																									},
																									{
																										const = 0
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
	}
}

return ST_Monster_AutoCombat_Egg_10331
