-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Egg_10028.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Egg_10028 = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Egg_10028",
		useForRoute = false,
		agenttype = "PuppetAgent",
		version = 88,
		properties = {},
		pars = {
			{
				name = "CurrentDistToTarget",
				value = "0",
				type = "float",
				const = 0
			},
			{
				name = "CurrentBoxDistToTarget",
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
				name = "skillStopDist",
				value = "0",
				type = "float",
				const = 0
			},
			{
				name = "tWeight_Group_SideWalk",
				value = "100",
				type = "int",
				const = 100
			},
			{
				name = "tWeight_Group_Wait",
				value = "100",
				type = "int",
				const = 100
			},
			{
				name = "tWeight_Group_Angry",
				value = "100",
				type = "int",
				const = 100
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "344",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "347",
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
						class = "Condition",
						id = "346",
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
						id = "345",
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
						class = "Assignment",
						id = "351",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "attackWeight"
								}
							},
							{
								Opr = {
									const = 100
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
						id = "352",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "skillCd"
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
						class = "Sequence",
						id = "434",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "IfElse",
									id = "435",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "438",
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
												class = "Action",
												id = "437",
												properties = {
													{
														Method = {
															func = "moveToTarget",
															params = {
																{
																	field = "tgt"
																},
																{
																	const = 3
																},
																{
																	const = 0
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
																	const = BaseEnum.MoveUpdateLevel.Once
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
												attachments = {},
												children = {}
											}
										},
										{
											node = {
												class = "Noop",
												id = "436",
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
									class = "Action",
									id = "439",
									properties = {
										{
											Method = {
												func = "castSkill",
												params = {
													{
														field = "tgt"
													},
													{
														const = 14330200
													},
													{
														const = false
													},
													{
														const = 0
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
									id = "450",
									properties = {
										{
											Method = {
												func = "startTimer",
												params = {
													{
														const = "Punch"
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
									class = "IfElse",
									id = "440",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "442",
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
												class = "Action",
												id = "443",
												properties = {
													{
														Method = {
															func = "moveToTarget",
															params = {
																{
																	field = "tgt"
																},
																{
																	const = 3
																},
																{
																	const = 0
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
																	const = BaseEnum.MoveUpdateLevel.Once
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
												attachments = {},
												children = {}
											}
										},
										{
											node = {
												class = "Noop",
												id = "441",
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
									class = "Action",
									id = "494",
									properties = {
										{
											Method = {
												func = "startTimer",
												params = {
													{
														const = "CD_14330304"
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
									class = "DecoratorLoop",
									id = "482",
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
												class = "IfElse",
												id = "480",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "471",
															properties = {
																{
																	Operator = "LessEqual"
																},
																{
																	Opl = {
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
																},
																{
																	Opr = {
																		const = 200
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
															id = "487",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "485",
																		properties = {
																			{
																				Operator = "Less"
																			},
																			{
																				Opl = {
																					func = "getTimerValue",
																					params = {
																						{
																							const = "Punch"
																						}
																					}
																				}
																			},
																			{
																				Opr = {
																					const = 8
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
																		id = "496",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "498",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
																								func = "getTimerValue",
																								params = {
																									{
																										const = "CD_14330304"
																									}
																								}
																							}
																						},
																						{
																							Opr = {
																								const = 0.1
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
																					id = "484",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 14330304
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
																					class = "Action",
																					id = "497",
																					properties = {
																						{
																							Method = {
																								func = "startTimer",
																								params = {
																									{
																										const = "CD_14330304"
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
																		class = "IfElse",
																		id = "489",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "490",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
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
																						},
																						{
																							Opr = {
																								const = 200
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
																					id = "492",
																					properties = {
																						{
																							Method = {
																								func = "runBack",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										field = "goBackDist"
																									},
																									{
																										const = 2
																									},
																									{
																										const = 0.5
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
																					id = "488",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 14330111
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
															class = "Action",
															id = "481",
															properties = {
																{
																	Method = {
																		func = "runBack",
																		params = {
																			{
																				field = "tgt"
																			},
																			{
																				field = "goBackDist"
																			},
																			{
																				const = 2
																			},
																			{
																				const = 0.5
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
				},
				{
					node = {
						class = "DecoratorLoop",
						id = "3",
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
									class = "IfElse",
									id = "470",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "491",
												properties = {
													{
														Operator = "GreaterEqual"
													},
													{
														Opl = {
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
													},
													{
														Opr = {
															const = 200
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
												id = "472",
												properties = {
													{
														Method = {
															func = "runBack",
															params = {
																{
																	field = "tgt"
																},
																{
																	field = "goBackDist"
																},
																{
																	const = 2
																},
																{
																	const = 0.5
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
												id = "468",
												properties = {
													{
														Method = {
															func = "castSkill",
															params = {
																{
																	field = "tgt"
																},
																{
																	const = 14330111
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

return ST_Monster_AutoCombat_Egg_10028
