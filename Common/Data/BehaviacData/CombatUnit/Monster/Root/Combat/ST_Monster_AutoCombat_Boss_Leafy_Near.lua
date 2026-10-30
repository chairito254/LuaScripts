-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_Leafy_Near.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_Leafy_Near = {
	behavior = {
		useForRoute = false,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_Leafy_Near",
		agenttype = "PuppetAgent",
		version = 19,
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				name = "creations",
				value = "0"
			},
			{
				type = "int",
				const = 0,
				name = "ID",
				value = "0"
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
									id = "3",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "13",
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
												id = "15",
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
												id = "31",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "ID"
														}
													},
													{
														Opr = {
															func = "getMasterId"
														}
													}
												},
												attachments = {},
												children = {}
											}
										},
										{
											node = {
												id = "25",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "creations"
														}
													},
													{
														Opr = {
															func = "getCreatedCreationCount",
															params = {
																{
																	field = "ID"
																},
																{
																	const = 104505
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
												id = "33",
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
																		func = "isInCombat",
																		params = {
																			{
																				field = "ID"
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
															id = "23",
															class = "IfElse",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "24",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "LessEqual"
																			},
																			{
																				Opl = {
																					field = "creations"
																				}
																			},
																			{
																				Opr = {
																					const = 15
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		id = "6",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "11",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "LessEqual"
																						},
																						{
																							Opl = {
																								field = "distToTgt"
																							}
																						},
																						{
																							Opr = {
																								const = 4
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "8",
																					class = "SelectorProbability",
																					properties = {
																						{
																							UntilSuccessOrEnd = false
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "9",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 30
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "5",
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
																																const = 10450401
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
																						},
																						{
																							node = {
																								id = "7",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 70
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "10",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																const = 0
																															},
																															{
																																const = 10450402
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
																			},
																			{
																				node = {
																					id = "14",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										const = 0
																									},
																									{
																										const = 10450402
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
																},
																{
																	node = {
																		id = "32",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "waitTime",
																					params = {
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
																		func = "enterDestroySelf"
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
												id = "27",
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

return ST_Monster_AutoCombat_Boss_Leafy_Near
