-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Gameplay_FogForestWitchin.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Gameplay_FogForestWitchin = {
	behavior = {
		useForRoute = false,
		version = 22,
		agenttype = "PuppetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Gameplay_FogForestWitchin",
		properties = {},
		pars = {
			{
				name = "disToTgtForSkillMon",
				value = "7",
				type = "float",
				const = 7
			},
			{
				name = "goBackDist",
				value = "0",
				type = "float",
				const = 0
			},
			{
				name = "tgtNoAuth",
				value = "0",
				type = "int",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "164",
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
						id = "165",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "163",
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
												func = "getAuthorityPlayer"
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "212",
									class = "Assignment",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tgtNoAuth"
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
									id = "174",
									class = "Selector",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "157",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "213",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "211",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkTargetHasBuffById",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 10071
																						},
																						{
																							const = 1
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
																		id = "214",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkTargetHasBuffById",
																					params = {
																						{
																							field = "tgtNoAuth"
																						},
																						{
																							const = 10071
																						},
																						{
																							const = 1
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
																}
															}
														}
													},
													{
														node = {
															id = "175",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "177",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "167",
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
																										const = 10
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
																										const = BaseEnum.MoveUpdateLevel.Fast
																									},
																									{
																										const = BaseEnum.PathFindType.Auto
																									},
																									{
																										const = BaseEnum.SpeedRateType.Fast
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
																					attachments = {
																						{
																							class = "Precondition",
																							transition = false,
																							id = "173",
																							effector = false,
																							precondition = true,
																							properties = {
																								{
																									BinaryOperator = "And"
																								},
																								{
																									Operator = "Equal"
																								},
																								{
																									Opl = {
																										field = "tgt"
																									}
																								},
																								{
																									Opr2 = {
																										func = "getAuthorityPlayer"
																									}
																								},
																								{
																									Phase = "Both"
																								}
																							}
																						}
																					},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "166",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 12030252
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
																							ResultResumeOption = "BT_ResumeSelf"
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "215",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "sendMessageToTrigger",
																								params = {
																									{
																										field = "selfId"
																									},
																									{
																										const = 1020301
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
																},
																{
																	node = {
																		id = "176",
																		class = "True",
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
												id = "168",
												class = "Action",
												properties = {
													{
														Method = {
															func = "castSkill",
															params = {
																{
																	field = "tgt"
																},
																{
																	const = 12030251
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

return ST_Monster_AutoCombat_Gameplay_FogForestWitchin
