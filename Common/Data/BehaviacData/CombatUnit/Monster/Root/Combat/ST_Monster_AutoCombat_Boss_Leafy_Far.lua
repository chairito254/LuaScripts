-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_Leafy_Far.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_Leafy_Far = {
	behavior = {
		useForRoute = false,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_Leafy_Far",
		agenttype = "PuppetAgent",
		version = 36,
		properties = {},
		pars = {
			{
				name = "creations",
				value = "0",
				const = 0,
				type = "int"
			},
			{
				name = "ID",
				value = "0",
				const = 0,
				type = "int"
			},
			{
				name = "creations2",
				value = "0",
				const = 0,
				type = "int"
			},
			{
				name = "creations3",
				value = "0",
				const = 0,
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
						id = "38",
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
											const = 10450409
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
												id = "32",
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
												id = "39",
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
												id = "40",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "creations2"
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
																	const = 104511
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
												id = "41",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "creations3"
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
																	const = 104512
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
												id = "36",
												class = "IfElse",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "37",
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
															id = "55",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "44",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "43",
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
																					id = "56",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "57",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "waitTime",
																											params = {
																												{
																													const = 10
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
																								id = "46",
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
																													const = 10450406
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
																					id = "45",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "waitTime",
																								params = {
																									{
																										const = 0.1
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
																		id = "48",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "47",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "LessEqual"
																						},
																						{
																							Opl = {
																								field = "creations2"
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
																					id = "58",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "59",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "waitTime",
																											params = {
																												{
																													const = 10
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
																								id = "49",
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
																													const = 10450407
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
																					id = "50",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "waitTime",
																								params = {
																									{
																										const = 0.1
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
																		id = "52",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "51",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "LessEqual"
																						},
																						{
																							Opl = {
																								field = "creations3"
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
																					id = "60",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "61",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "waitTime",
																											params = {
																												{
																													const = 10
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
																								id = "53",
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
																													const = 10450408
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
																					id = "54",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "waitTime",
																								params = {
																									{
																										const = 0.1
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
															id = "26",
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

return ST_Monster_AutoCombat_Boss_Leafy_Far
