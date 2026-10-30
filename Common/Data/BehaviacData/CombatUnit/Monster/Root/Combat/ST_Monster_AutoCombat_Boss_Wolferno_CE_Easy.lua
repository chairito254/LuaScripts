-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_Wolferno_CE_Easy.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_Wolferno_CE_Easy = {
	behavior = {
		agenttype = "PuppetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_Wolferno_CE_Easy",
		version = 114,
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				type = "int",
				name = "creations"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "disToTgtForSkillMon"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "selfhp"
			},
			{
				const = false,
				value = "false",
				type = "bool",
				name = "hasUsedEx"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "goBackDist"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "160",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "126",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "enterCombat"
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
						class = "Assignment",
						id = "203",
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
						class = "Action",
						id = "441",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "fightCD2"
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
						class = "Sequence",
						id = "472",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "544",
									properties = {
										{
											Method = {
												func = "turnToTarget",
												params = {
													{
														field = "tgt"
													},
													{
														const = true
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
									class = "Action",
									id = "641",
									properties = {
										{
											Method = {
												func = "castSkill",
												params = {
													{
														field = "tgt"
													},
													{
														const = 10531310
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
						class = "DecoratorLoop",
						id = "127",
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
									id = "159",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Selector",
												id = "129",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Sequence",
															id = "130",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "131",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkIsInSneak"
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
																		id = "132",
																		properties = {
																			{
																				Method = {
																					func = "switchToSneakOut",
																					params = {
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
															class = "True",
															id = "158",
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
												class = "Sequence",
												id = "128",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Assignment",
															id = "133",
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
															id = "134",
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
															id = "135",
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
															id = "136",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "distToTgtForSkill"
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
													},
													{
														node = {
															class = "IfElse",
															id = "137",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "138",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					field = "distToTgtForSkill"
																				}
																			},
																			{
																				Opr = {
																					field = "maxKeepBoxDist"
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		class = "SelectorProbability",
																		id = "666",
																		properties = {
																			{
																				UntilSuccessOrEnd = false
																			}
																		},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "DecoratorWeight",
																					id = "668",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 15
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Action",
																								id = "669",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 10531210
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
																					class = "DecoratorWeight",
																					id = "667",
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
																								class = "Action",
																								id = "139",
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
																													const = 4
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
																													const = 5
																												},
																												{
																													const = BaseEnum.MoveUpdateLevel.Normal
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
																		id = "140",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "SelectorProbability",
																					id = "141",
																					properties = {
																						{
																							UntilSuccessOrEnd = false
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "DecoratorWeight",
																								id = "143",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											field = "attackWeight"
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "142",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "146",
																														properties = {
																															{
																																Operator = "GreaterEqual"
																															},
																															{
																																Opl = {
																																	func = "getTimerValue",
																																	params = {
																																		{
																																			const = "enterCombat"
																																		}
																																	}
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
																														class = "Sequence",
																														id = "147",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "55",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "checkCanCombat"
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
																																	class = "Sequence",
																																	id = "67",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Assignment",
																																				id = "56",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "fightCd"
																																						}
																																					},
																																					{
																																						Opr = {
																																							func = "getPropertyCd",
																																							params = {
																																								{
																																									const = "fightCd"
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
																																				id = "68",
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
																																							func = "getPropertyCd",
																																							params = {
																																								{
																																									const = "skillCd"
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
																																				id = "69",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "atkCd"
																																						}
																																					},
																																					{
																																						Opr = {
																																							func = "getPropertyCd",
																																							params = {
																																								{
																																									const = "atkCd"
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
																																	class = "Selector",
																																	id = "70",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "71",
																																				properties = {
																																					{
																																						Operator = "Less"
																																					},
																																					{
																																						Opl = {
																																							func = "getTimerValue",
																																							params = {
																																								{
																																									const = "fightCd01"
																																								}
																																							}
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
																																				class = "Condition",
																																				id = "72",
																																				properties = {
																																					{
																																						Operator = "GreaterEqual"
																																					},
																																					{
																																						Opl = {
																																							func = "getTimerValue",
																																							params = {
																																								{
																																									const = "fightCd01"
																																								}
																																							}
																																						}
																																					},
																																					{
																																						Opr = {
																																							field = "fightCd"
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
																																	class = "Selector",
																																	id = "73",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "74",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Selector",
																																							id = "75",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "166",
																																										properties = {
																																											{
																																												Operator = "Less"
																																											},
																																											{
																																												Opl = {
																																													func = "getTimerValue",
																																													params = {
																																														{
																																															const = "skillCd01"
																																														}
																																													}
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
																																										class = "Condition",
																																										id = "165",
																																										properties = {
																																											{
																																												Operator = "GreaterEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getTimerValue",
																																													params = {
																																														{
																																															const = "skillCd01"
																																														}
																																													}
																																												}
																																											},
																																											{
																																												Opr = {
																																													field = "skillCd"
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
																																							id = "76",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "skillId"
																																									}
																																								},
																																								{
																																									Opr = {
																																										func = "selectSkillByWeight",
																																										params = {
																																											{
																																												field = "tgt"
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
																																							id = "443",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "444",
																																										properties = {
																																											{
																																												Operator = "Greater"
																																											},
																																											{
																																												Opl = {
																																													func = "getTimerValue",
																																													params = {
																																														{
																																															const = "fightCD2"
																																														}
																																													}
																																												}
																																											},
																																											{
																																												Opr = {
																																													const = 6
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
																																										id = "185",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Selector",
																																													id = "644",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Sequence",
																																																id = "645",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Condition",
																																																			id = "647",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getHpPercent",
																																																						params = {
																																																							{
																																																								field = "selfId"
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 0.5
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			class = "Selector",
																																																			id = "648",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Sequence",
																																																						id = "651",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Condition",
																																																									id = "652",
																																																									properties = {
																																																										{
																																																											Operator = "Equal"
																																																										},
																																																										{
																																																											Opl = {
																																																												func = "checkCanUseSkill",
																																																												params = {
																																																													{
																																																														field = "selfId"
																																																													},
																																																													{
																																																														const = 10539902
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
																																																									class = "IfElse",
																																																									id = "655",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Condition",
																																																												id = "657",
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
																																																												class = "Action",
																																																												id = "201",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "castSkill",
																																																															params = {
																																																																{
																																																																	field = "tgt"
																																																																},
																																																																{
																																																																	const = 10539902
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
																																																												class = "Sequence",
																																																												id = "658",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "Action",
																																																															id = "659",
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
																																																																				const = 3
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
																																																															class = "Action",
																																																															id = "660",
																																																															properties = {
																																																																{
																																																																	Method = {
																																																																		func = "castSkill",
																																																																		params = {
																																																																			{
																																																																				field = "tgt"
																																																																			},
																																																																			{
																																																																				const = 10539902
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
																																																				},
																																																				{
																																																					node = {
																																																						class = "Sequence",
																																																						id = "653",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Condition",
																																																									id = "654",
																																																									properties = {
																																																										{
																																																											Operator = "Equal"
																																																										},
																																																										{
																																																											Opl = {
																																																												func = "checkCanUseSkill",
																																																												params = {
																																																													{
																																																														field = "selfId"
																																																													},
																																																													{
																																																														const = 10539910
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
																																																									class = "IfElse",
																																																									id = "661",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Condition",
																																																												id = "662",
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
																																																															const = 5
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
																																																												id = "638",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "castSkill",
																																																															params = {
																																																																{
																																																																	field = "tgt"
																																																																},
																																																																{
																																																																	const = 10539910
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
																																																												class = "Sequence",
																																																												id = "664",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "Action",
																																																															id = "663",
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
																																																																				const = 3
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
																																																															class = "Action",
																																																															id = "665",
																																																															properties = {
																																																																{
																																																																	Method = {
																																																																		func = "castSkill",
																																																																		params = {
																																																																			{
																																																																				field = "tgt"
																																																																			},
																																																																			{
																																																																				const = 10539910
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
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																class = "IfElse",
																																																id = "209",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Condition",
																																																			id = "211",
																																																			properties = {
																																																				{
																																																					Operator = "GreaterEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "distToTgt"
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
																																																			class = "IfElse",
																																																			id = "501",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Condition",
																																																						id = "503",
																																																						properties = {
																																																							{
																																																								Operator = "Equal"
																																																							},
																																																							{
																																																								Opl = {
																																																									func = "checkTargetBlocked",
																																																									params = {
																																																										{
																																																											field = "selfId"
																																																										},
																																																										{
																																																											field = "tgt"
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
																																																						class = "Selector",
																																																						id = "510",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Selector",
																																																									id = "511",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Action",
																																																												id = "508",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "castChargetSkill",
																																																															params = {
																																																																{
																																																																	field = "tgt"
																																																																},
																																																																{
																																																																	const = 10531500
																																																																},
																																																																{
																																																																	const = 2.5
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
																																																												id = "541",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "castChargetSkill",
																																																															params = {
																																																																{
																																																																	field = "tgt"
																																																																},
																																																																{
																																																																	const = 10531710
																																																																},
																																																																{
																																																																	const = 0
																																																																},
																																																																{
																																																																	const = 0
																																																																},
																																																																{
																																																																	const = false
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
																																																										}
																																																									}
																																																								}
																																																							},
																																																							{
																																																								node = {
																																																									class = "Sequence",
																																																									id = "551",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Action",
																																																												id = "526",
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
																																																																	const = 3
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
																																																												class = "IfElse",
																																																												id = "504",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "Condition",
																																																															id = "505",
																																																															properties = {
																																																																{
																																																																	Operator = "LessEqual"
																																																																},
																																																																{
																																																																	Opl = {
																																																																		func = "getHpPercent",
																																																																		params = {
																																																																			{
																																																																				field = "selfId"
																																																																			}
																																																																		}
																																																																	}
																																																																},
																																																																{
																																																																	Opr = {
																																																																		const = 0.5
																																																																	}
																																																																}
																																																															},
																																																															attachments = {},
																																																															children = {}
																																																														}
																																																													},
																																																													{
																																																														node = {
																																																															class = "Selector",
																																																															id = "553",
																																																															properties = {},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "Action",
																																																																		id = "554",
																																																																		properties = {
																																																																			{
																																																																				Method = {
																																																																					func = "castSkill",
																																																																					params = {
																																																																						{
																																																																							field = "tgt"
																																																																						},
																																																																						{
																																																																							const = 10531312
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
																																																																		id = "555",
																																																																		properties = {
																																																																			{
																																																																				Method = {
																																																																					func = "castSkill",
																																																																					params = {
																																																																						{
																																																																							field = "tgt"
																																																																						},
																																																																						{
																																																																							const = 10531310
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
																																																															class = "Action",
																																																															id = "552",
																																																															properties = {
																																																																{
																																																																	Method = {
																																																																		func = "castSkill",
																																																																		params = {
																																																																			{
																																																																				field = "tgt"
																																																																			},
																																																																			{
																																																																				const = 10531310
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
																																																				},
																																																				{
																																																					node = {
																																																						class = "Sequence",
																																																						id = "548",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Action",
																																																									id = "516",
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
																																																														const = 3
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
																																																									class = "Action",
																																																									id = "550",
																																																									properties = {
																																																										{
																																																											Method = {
																																																												func = "castSkill",
																																																												params = {
																																																													{
																																																														field = "tgt"
																																																													},
																																																													{
																																																														const = 10531310
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
																																																			class = "IfElse",
																																																			id = "594",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Condition",
																																																						id = "595",
																																																						properties = {
																																																							{
																																																								Operator = "LessEqual"
																																																							},
																																																							{
																																																								Opl = {
																																																									func = "getHpPercent",
																																																									params = {
																																																										{
																																																											field = "selfId"
																																																										}
																																																									}
																																																								}
																																																							},
																																																							{
																																																								Opr = {
																																																									const = 0.5
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
																																																						id = "617",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Action",
																																																									id = "614",
																																																									properties = {
																																																										{
																																																											Method = {
																																																												func = "startTimer",
																																																												params = {
																																																													{
																																																														const = "fightCD2"
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
																																																									id = "615",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Condition",
																																																												id = "616",
																																																												properties = {
																																																													{
																																																														Operator = "GreaterEqual"
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
																																																												class = "SelectorProbability",
																																																												id = "604",
																																																												properties = {
																																																													{
																																																														UntilSuccessOrEnd = false
																																																													}
																																																												},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "DecoratorWeight",
																																																															id = "605",
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
																																																																		class = "Sequence",
																																																																		id = "610",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Condition",
																																																																					id = "618",
																																																																					properties = {
																																																																						{
																																																																							Operator = "Equal"
																																																																						},
																																																																						{
																																																																							Opl = {
																																																																								func = "checkTargetBlocked",
																																																																								params = {
																																																																									{
																																																																										field = "selfId"
																																																																									},
																																																																									{
																																																																										field = "tgt"
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
																																																																					class = "IfElse",
																																																																					id = "613",
																																																																					properties = {},
																																																																					attachments = {},
																																																																					children = {
																																																																						{
																																																																							node = {
																																																																								class = "Condition",
																																																																								id = "602",
																																																																								properties = {
																																																																									{
																																																																										Operator = "LessEqual"
																																																																									},
																																																																									{
																																																																										Opl = {
																																																																											func = "getHpPercent",
																																																																											params = {
																																																																												{
																																																																													field = "selfId"
																																																																												}
																																																																											}
																																																																										}
																																																																									},
																																																																									{
																																																																										Opr = {
																																																																											const = 0.5
																																																																										}
																																																																									}
																																																																								},
																																																																								attachments = {},
																																																																								children = {}
																																																																							}
																																																																						},
																																																																						{
																																																																							node = {
																																																																								class = "Selector",
																																																																								id = "598",
																																																																								properties = {},
																																																																								attachments = {},
																																																																								children = {
																																																																									{
																																																																										node = {
																																																																											class = "Action",
																																																																											id = "601",
																																																																											properties = {
																																																																												{
																																																																													Method = {
																																																																														func = "castSkill",
																																																																														params = {
																																																																															{
																																																																																field = "tgt"
																																																																															},
																																																																															{
																																																																																const = 10531312
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
																																																																											id = "600",
																																																																											properties = {
																																																																												{
																																																																													Method = {
																																																																														func = "castSkill",
																																																																														params = {
																																																																															{
																																																																																field = "tgt"
																																																																															},
																																																																															{
																																																																																const = 10531310
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
																																																																								class = "Action",
																																																																								id = "599",
																																																																								properties = {
																																																																									{
																																																																										Method = {
																																																																											func = "castSkill",
																																																																											params = {
																																																																												{
																																																																													field = "tgt"
																																																																												},
																																																																												{
																																																																													const = 10531310
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
																																																													},
																																																													{
																																																														node = {
																																																															class = "DecoratorWeight",
																																																															id = "606",
																																																															properties = {
																																																																{
																																																																	DecorateWhenChildEnds = "false"
																																																																},
																																																																{
																																																																	Weight = {
																																																																		const = 20
																																																																	}
																																																																}
																																																															},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "Action",
																																																																		id = "607",
																																																																		properties = {
																																																																			{
																																																																				Method = {
																																																																					func = "castSkill",
																																																																					params = {
																																																																						{
																																																																							field = "tgt"
																																																																						},
																																																																						{
																																																																							const = 10531210
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
																																																															class = "DecoratorWeight",
																																																															id = "609",
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
																																																																		class = "Sequence",
																																																																		id = "611",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Condition",
																																																																					id = "608",
																																																																					properties = {
																																																																						{
																																																																							Operator = "Equal"
																																																																						},
																																																																						{
																																																																							Opl = {
																																																																								func = "checkTargetBlocked",
																																																																								params = {
																																																																									{
																																																																										field = "selfId"
																																																																									},
																																																																									{
																																																																										field = "tgt"
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
																																																																					id = "612",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "castSkill",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 10531500
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
																																																										},
																																																										{
																																																											node = {
																																																												class = "Sequence",
																																																												id = "603",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "SelectorProbability",
																																																															id = "624",
																																																															properties = {
																																																																{
																																																																	UntilSuccessOrEnd = false
																																																																}
																																																															},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "DecoratorWeight",
																																																																		id = "625",
																																																																		properties = {
																																																																			{
																																																																				DecorateWhenChildEnds = "false"
																																																																			},
																																																																			{
																																																																				Weight = {
																																																																					const = 20
																																																																				}
																																																																			}
																																																																		},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Action",
																																																																					id = "627",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "castSkill",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 10531800
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
																																																																		class = "DecoratorWeight",
																																																																		id = "626",
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
																																																																					class = "Action",
																																																																					id = "628",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "castSkill",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 10531400
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
																																																																		class = "DecoratorWeight",
																																																																		id = "630",
																																																																		properties = {
																																																																			{
																																																																				DecorateWhenChildEnds = "false"
																																																																			},
																																																																			{
																																																																				Weight = {
																																																																					const = 20
																																																																				}
																																																																			}
																																																																		},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Action",
																																																																					id = "631",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "castSkill",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 10531210
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
																																																																		class = "DecoratorWeight",
																																																																		id = "629",
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
																																																																					class = "Sequence",
																																																																					id = "632",
																																																																					properties = {},
																																																																					attachments = {},
																																																																					children = {
																																																																						{
																																																																							node = {
																																																																								class = "Condition",
																																																																								id = "633",
																																																																								properties = {
																																																																									{
																																																																										Operator = "Equal"
																																																																									},
																																																																									{
																																																																										Opl = {
																																																																											func = "checkTargetBlocked",
																																																																											params = {
																																																																												{
																																																																													field = "selfId"
																																																																												},
																																																																												{
																																																																													field = "tgt"
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
																																																																								id = "634",
																																																																								properties = {
																																																																									{
																																																																										Method = {
																																																																											func = "castSkill",
																																																																											params = {
																																																																												{
																																																																													field = "tgt"
																																																																												},
																																																																												{
																																																																													const = 10531500
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
																																																																		class = "DecoratorWeight",
																																																																		id = "636",
																																																																		properties = {
																																																																			{
																																																																				DecorateWhenChildEnds = "false"
																																																																			},
																																																																			{
																																																																				Weight = {
																																																																					const = 20
																																																																				}
																																																																			}
																																																																		},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "IfElse",
																																																																					id = "619",
																																																																					properties = {},
																																																																					attachments = {},
																																																																					children = {
																																																																						{
																																																																							node = {
																																																																								class = "Condition",
																																																																								id = "635",
																																																																								properties = {
																																																																									{
																																																																										Operator = "LessEqual"
																																																																									},
																																																																									{
																																																																										Opl = {
																																																																											func = "getHpPercent",
																																																																											params = {
																																																																												{
																																																																													field = "selfId"
																																																																												}
																																																																											}
																																																																										}
																																																																									},
																																																																									{
																																																																										Opr = {
																																																																											const = 0.5
																																																																										}
																																																																									}
																																																																								},
																																																																								attachments = {},
																																																																								children = {}
																																																																							}
																																																																						},
																																																																						{
																																																																							node = {
																																																																								class = "Selector",
																																																																								id = "620",
																																																																								properties = {},
																																																																								attachments = {},
																																																																								children = {
																																																																									{
																																																																										node = {
																																																																											class = "Action",
																																																																											id = "623",
																																																																											properties = {
																																																																												{
																																																																													Method = {
																																																																														func = "castSkill",
																																																																														params = {
																																																																															{
																																																																																field = "tgt"
																																																																															},
																																																																															{
																																																																																const = 10531312
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
																																																																											id = "622",
																																																																											properties = {
																																																																												{
																																																																													Method = {
																																																																														func = "castSkill",
																																																																														params = {
																																																																															{
																																																																																field = "tgt"
																																																																															},
																																																																															{
																																																																																const = 10531310
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
																																																																								class = "Action",
																																																																								id = "621",
																																																																								properties = {
																																																																									{
																																																																										Method = {
																																																																											func = "castSkill",
																																																																											params = {
																																																																												{
																																																																													field = "tgt"
																																																																												},
																																																																												{
																																																																													const = 10531310
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
																																																						class = "Sequence",
																																																						id = "457",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Action",
																																																									id = "440",
																																																									properties = {
																																																										{
																																																											Method = {
																																																												func = "startTimer",
																																																												params = {
																																																													{
																																																														const = "fightCD2"
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
																																																									id = "212",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Condition",
																																																												id = "214",
																																																												properties = {
																																																													{
																																																														Operator = "GreaterEqual"
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
																																																												class = "SelectorProbability",
																																																												id = "298",
																																																												properties = {
																																																													{
																																																														UntilSuccessOrEnd = false
																																																													}
																																																												},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "DecoratorWeight",
																																																															id = "299",
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
																																																																		class = "Sequence",
																																																																		id = "528",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Condition",
																																																																					id = "529",
																																																																					properties = {
																																																																						{
																																																																							Operator = "Equal"
																																																																						},
																																																																						{
																																																																							Opl = {
																																																																								func = "checkTargetBlocked",
																																																																								params = {
																																																																									{
																																																																										field = "selfId"
																																																																									},
																																																																									{
																																																																										field = "tgt"
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
																																																																					class = "IfElse",
																																																																					id = "556",
																																																																					properties = {},
																																																																					attachments = {},
																																																																					children = {
																																																																						{
																																																																							node = {
																																																																								class = "Condition",
																																																																								id = "561",
																																																																								properties = {
																																																																									{
																																																																										Operator = "LessEqual"
																																																																									},
																																																																									{
																																																																										Opl = {
																																																																											func = "getHpPercent",
																																																																											params = {
																																																																												{
																																																																													field = "selfId"
																																																																												}
																																																																											}
																																																																										}
																																																																									},
																																																																									{
																																																																										Opr = {
																																																																											const = 0.5
																																																																										}
																																																																									}
																																																																								},
																																																																								attachments = {},
																																																																								children = {}
																																																																							}
																																																																						},
																																																																						{
																																																																							node = {
																																																																								class = "Selector",
																																																																								id = "557",
																																																																								properties = {},
																																																																								attachments = {},
																																																																								children = {
																																																																									{
																																																																										node = {
																																																																											class = "Action",
																																																																											id = "560",
																																																																											properties = {
																																																																												{
																																																																													Method = {
																																																																														func = "castSkill",
																																																																														params = {
																																																																															{
																																																																																field = "tgt"
																																																																															},
																																																																															{
																																																																																const = 10531312
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
																																																																											id = "559",
																																																																											properties = {
																																																																												{
																																																																													Method = {
																																																																														func = "castSkill",
																																																																														params = {
																																																																															{
																																																																																field = "tgt"
																																																																															},
																																																																															{
																																																																																const = 10531310
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
																																																																								class = "Action",
																																																																								id = "558",
																																																																								properties = {
																																																																									{
																																																																										Method = {
																																																																											func = "castSkill",
																																																																											params = {
																																																																												{
																																																																													field = "tgt"
																																																																												},
																																																																												{
																																																																													const = 10531310
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
																																																													},
																																																													{
																																																														node = {
																																																															class = "DecoratorWeight",
																																																															id = "300",
																																																															properties = {
																																																																{
																																																																	DecorateWhenChildEnds = "false"
																																																																},
																																																																{
																																																																	Weight = {
																																																																		const = 20
																																																																	}
																																																																}
																																																															},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "Action",
																																																																		id = "227",
																																																																		properties = {
																																																																			{
																																																																				Method = {
																																																																					func = "castSkill",
																																																																					params = {
																																																																						{
																																																																							field = "tgt"
																																																																						},
																																																																						{
																																																																							const = 10531210
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
																																																															class = "DecoratorWeight",
																																																															id = "410",
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
																																																																		class = "Sequence",
																																																																		id = "532",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Condition",
																																																																					id = "533",
																																																																					properties = {
																																																																						{
																																																																							Operator = "Equal"
																																																																						},
																																																																						{
																																																																							Opl = {
																																																																								func = "checkTargetBlocked",
																																																																								params = {
																																																																									{
																																																																										field = "selfId"
																																																																									},
																																																																									{
																																																																										field = "tgt"
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
																																																																					id = "534",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "castSkill",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 10531500
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
																																																										},
																																																										{
																																																											node = {
																																																												class = "Sequence",
																																																												id = "229",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "SelectorProbability",
																																																															id = "230",
																																																															properties = {
																																																																{
																																																																	UntilSuccessOrEnd = false
																																																																}
																																																															},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "DecoratorWeight",
																																																																		id = "231",
																																																																		properties = {
																																																																			{
																																																																				DecorateWhenChildEnds = "false"
																																																																			},
																																																																			{
																																																																				Weight = {
																																																																					const = 20
																																																																				}
																																																																			}
																																																																		},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Action",
																																																																					id = "236",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "castSkill",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 10531800
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
																																																																		class = "DecoratorWeight",
																																																																		id = "392",
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
																																																																					class = "Action",
																																																																					id = "393",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "castSkill",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 10531400
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
																																																																		class = "DecoratorWeight",
																																																																		id = "395",
																																																																		properties = {
																																																																			{
																																																																				DecorateWhenChildEnds = "false"
																																																																			},
																																																																			{
																																																																				Weight = {
																																																																					const = 15
																																																																				}
																																																																			}
																																																																		},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Action",
																																																																					id = "394",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "castSkill",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 10531210
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
																																																																		class = "DecoratorWeight",
																																																																		id = "397",
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
																																																																					class = "Sequence",
																																																																					id = "535",
																																																																					properties = {},
																																																																					attachments = {},
																																																																					children = {
																																																																						{
																																																																							node = {
																																																																								class = "Condition",
																																																																								id = "536",
																																																																								properties = {
																																																																									{
																																																																										Operator = "Equal"
																																																																									},
																																																																									{
																																																																										Opl = {
																																																																											func = "checkTargetBlocked",
																																																																											params = {
																																																																												{
																																																																													field = "selfId"
																																																																												},
																																																																												{
																																																																													field = "tgt"
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
																																																																								id = "537",
																																																																								properties = {
																																																																									{
																																																																										Method = {
																																																																											func = "castSkill",
																																																																											params = {
																																																																												{
																																																																													field = "tgt"
																																																																												},
																																																																												{
																																																																													const = 10531500
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
																																																																		class = "DecoratorWeight",
																																																																		id = "574",
																																																																		properties = {
																																																																			{
																																																																				DecorateWhenChildEnds = "false"
																																																																			},
																																																																			{
																																																																				Weight = {
																																																																					const = 10
																																																																				}
																																																																			}
																																																																		},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "IfElse",
																																																																					id = "562",
																																																																					properties = {},
																																																																					attachments = {},
																																																																					children = {
																																																																						{
																																																																							node = {
																																																																								class = "Condition",
																																																																								id = "567",
																																																																								properties = {
																																																																									{
																																																																										Operator = "LessEqual"
																																																																									},
																																																																									{
																																																																										Opl = {
																																																																											func = "getHpPercent",
																																																																											params = {
																																																																												{
																																																																													field = "selfId"
																																																																												}
																																																																											}
																																																																										}
																																																																									},
																																																																									{
																																																																										Opr = {
																																																																											const = 0.5
																																																																										}
																																																																									}
																																																																								},
																																																																								attachments = {},
																																																																								children = {}
																																																																							}
																																																																						},
																																																																						{
																																																																							node = {
																																																																								class = "Selector",
																																																																								id = "563",
																																																																								properties = {},
																																																																								attachments = {},
																																																																								children = {
																																																																									{
																																																																										node = {
																																																																											class = "Action",
																																																																											id = "566",
																																																																											properties = {
																																																																												{
																																																																													Method = {
																																																																														func = "castSkill",
																																																																														params = {
																																																																															{
																																																																																field = "tgt"
																																																																															},
																																																																															{
																																																																																const = 10531312
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
																																																																											id = "565",
																																																																											properties = {
																																																																												{
																																																																													Method = {
																																																																														func = "castSkill",
																																																																														params = {
																																																																															{
																																																																																field = "tgt"
																																																																															},
																																																																															{
																																																																																const = 10531310
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
																																																																								class = "Action",
																																																																								id = "564",
																																																																								properties = {
																																																																									{
																																																																										Method = {
																																																																											func = "castSkill",
																																																																											params = {
																																																																												{
																																																																													field = "tgt"
																																																																												},
																																																																												{
																																																																													const = 10531310
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
																																								},
																																								{
																																									node = {
																																										class = "Action",
																																										id = "446",
																																										properties = {
																																											{
																																												Method = {
																																													func = "sideWalk",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															const = 5
																																														},
																																														{
																																															const = -35
																																														},
																																														{
																																															const = -1
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
																																							class = "Action",
																																							id = "78",
																																							properties = {
																																								{
																																									Method = {
																																										func = "startTimer",
																																										params = {
																																											{
																																												const = "skillCd01"
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
																																				class = "Sequence",
																																				id = "79",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Selector",
																																							id = "80",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "163",
																																										properties = {
																																											{
																																												Operator = "Less"
																																											},
																																											{
																																												Opl = {
																																													func = "getTimerValue",
																																													params = {
																																														{
																																															const = "atkCd01"
																																														}
																																													}
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
																																										class = "Condition",
																																										id = "164",
																																										properties = {
																																											{
																																												Operator = "GreaterEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getTimerValue",
																																													params = {
																																														{
																																															const = "atkCd01"
																																														}
																																													}
																																												}
																																											},
																																											{
																																												Opr = {
																																													field = "atkCd"
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
																																							class = "Action",
																																							id = "125",
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
																																												const = 3
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
																																												const = 0
																																											},
																																											{
																																												const = BaseEnum.MoveUpdateLevel.Once
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
																																							class = "Action",
																																							id = "291",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castNormalAtkCombo",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 4
																																											},
																																											{
																																												const = true
																																											},
																																											{
																																												const = 3
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
																																					},
																																					{
																																						node = {
																																							class = "SelectorProbability",
																																							id = "367",
																																							properties = {
																																								{
																																									UntilSuccessOrEnd = false
																																								}
																																							},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "DecoratorWeight",
																																										id = "368",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													const = 15
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Sequence",
																																													id = "377",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "376",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "turnToTarget",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = true
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
																																																class = "Action",
																																																id = "372",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Behav_Angry"
																																																				},
																																																				{
																																																					const = -1
																																																				},
																																																				{
																																																					const = ""
																																																				},
																																																				{
																																																					const = false
																																																				},
																																																				{
																																																					const = false
																																																				},
																																																				{
																																																					const = 0
																																																				},
																																																				{
																																																					const = BaseEnum.AIAnimationRootMotionType.Default
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
																																										class = "DecoratorWeight",
																																										id = "369",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													const = 15
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Sequence",
																																													id = "378",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "379",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "turnToTarget",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = true
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
																																																class = "Action",
																																																id = "373",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Behav_Angry"
																																																				},
																																																				{
																																																					const = -1
																																																				},
																																																				{
																																																					const = ""
																																																				},
																																																				{
																																																					const = false
																																																				},
																																																				{
																																																					const = false
																																																				},
																																																				{
																																																					const = 0
																																																				},
																																																				{
																																																					const = BaseEnum.AIAnimationRootMotionType.Default
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
																																										class = "DecoratorWeight",
																																										id = "370",
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
																																													class = "Action",
																																													id = "380",
																																													properties = {
																																														{
																																															Method = {
																																																func = "moveToTarget",
																																																params = {
																																																	{
																																																		field = "tgt"
																																																	},
																																																	{
																																																		const = 4
																																																	},
																																																	{
																																																		const = 3
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
																																																		const = 0
																																																	},
																																																	{
																																																		const = BaseEnum.MoveUpdateLevel.Once
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
																																										class = "DecoratorWeight",
																																										id = "371",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													const = 40
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Action",
																																													id = "381",
																																													properties = {
																																														{
																																															Method = {
																																																func = "sideWalk",
																																																params = {
																																																	{
																																																		field = "tgt"
																																																	},
																																																	{
																																																		const = 3
																																																	},
																																																	{
																																																		const = -35
																																																	},
																																																	{
																																																		const = -1
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
																																								}
																																							}
																																						}
																																					},
																																					{
																																						node = {
																																							class = "Action",
																																							id = "82",
																																							properties = {
																																								{
																																									Method = {
																																										func = "startTimer",
																																										params = {
																																											{
																																												const = "atkCd01"
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
																															},
																															{
																																node = {
																																	class = "IfElse",
																																	id = "83",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "84",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "checkIsBossAI"
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
																																				class = "Sequence",
																																				id = "85",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Compute",
																																							id = "87",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "sideWalkWeight"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "sideWalkWeight"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 25
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
																																										field = "attackWeight"
																																									}
																																								},
																																								{
																																									Opr = {
																																										const = 125
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
																																				class = "Sequence",
																																				id = "86",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Compute",
																																							id = "89",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "sideWalkWeight"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "sideWalkWeight"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 25
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
																																							id = "90",
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
																																										const = 125
																																									}
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
																																	id = "91",
																																	properties = {
																																		{
																																			Method = {
																																				func = "startTimer",
																																				params = {
																																					{
																																						const = "fightCd01"
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
																							}
																						},
																						{
																							node = {
																								class = "DecoratorWeight",
																								id = "145",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											field = "sideWalkWeight"
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "False",
																											id = "144",
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
																					class = "Sequence",
																					id = "148",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "IfElse",
																								id = "149",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "150",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														func = "checkIsBossAI"
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
																											class = "Sequence",
																											id = "151",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Compute",
																														id = "152",
																														properties = {
																															{
																																Operator = "Add"
																															},
																															{
																																Opl = {
																																	field = "attackWeight"
																																}
																															},
																															{
																																Opr1 = {
																																	field = "attackWeight"
																																}
																															},
																															{
																																Opr2 = {
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
																														class = "Assignment",
																														id = "153",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "sideWalkWeight"
																																}
																															},
																															{
																																Opr = {
																																	const = 50
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
																											class = "Sequence",
																											id = "154",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Compute",
																														id = "155",
																														properties = {
																															{
																																Operator = "Add"
																															},
																															{
																																Opl = {
																																	field = "attackWeight"
																																}
																															},
																															{
																																Opr1 = {
																																	field = "attackWeight"
																																}
																															},
																															{
																																Opr2 = {
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
																														class = "Assignment",
																														id = "156",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "sideWalkWeight"
																																}
																															},
																															{
																																Opr = {
																																	const = 50
																																}
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
																								id = "92",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "93",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "157",
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
																														class = "Condition",
																														id = "94",
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
																																	field = "minAttackDist"
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
																														id = "95",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "isGoBackCd"
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
																														class = "Compute",
																														id = "417",
																														properties = {
																															{
																																Operator = "Sub"
																															},
																															{
																																Opl = {
																																	field = "goBackDist"
																																}
																															},
																															{
																																Opr1 = {
																																	field = "attackStopBoxDist"
																																}
																															},
																															{
																																Opr2 = {
																																	field = "distToTgt"
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Selector",
																														id = "96",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "642",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						field = "tgt"
																																					},
																																					{
																																						const = 10531400
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
																																	id = "100",
																																	properties = {
																																		{
																																			Method = {
																																				func = "runBack",
																																				params = {
																																					{
																																						field = "tgt"
																																					},
																																					{
																																						const = 5
																																					},
																																					{
																																						const = 3
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
																									},
																									{
																										node = {
																											class = "Selector",
																											id = "102",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "SelectorProbability",
																														id = "103",
																														properties = {
																															{
																																UntilSuccessOrEnd = false
																															}
																														},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "DecoratorWeight",
																																	id = "105",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				const = 1
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "104",
																																				properties = {},
																																				attachments = {
																																					{
																																						class = "Precondition",
																																						effector = false,
																																						transition = false,
																																						id = "135",
																																						precondition = true,
																																						properties = {
																																							{
																																								BinaryOperator = "And"
																																							},
																																							{
																																								Operator = "Less"
																																							},
																																							{
																																								Opl = {
																																									func = "getTimerValue",
																																									params = {
																																										{
																																											const = "fightCd01"
																																										}
																																									}
																																								}
																																							},
																																							{
																																								Opr2 = {
																																									field = "fightCd"
																																								}
																																							},
																																							{
																																								Phase = "Enter"
																																							}
																																						}
																																					}
																																				},
																																				children = {
																																					{
																																						node = {
																																							class = "Assignment",
																																							id = "106",
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
																																							class = "Condition",
																																							id = "107",
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
																																										field = "bestKeepBoxDist"
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
																																							id = "108",
																																							properties = {
																																								{
																																									Method = {
																																										func = "walkBack",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 5
																																											},
																																											{
																																												const = 1.5
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
																															},
																															{
																																node = {
																																	class = "DecoratorWeight",
																																	id = "110",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				const = 1
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "False",
																																				id = "109",
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
																																	class = "DecoratorWeight",
																																	id = "112",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				const = 1
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "111",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Condition",
																																							id = "113",
																																							properties = {
																																								{
																																									Operator = "Equal"
																																								},
																																								{
																																									Opl = {
																																										func = "hasAnimState",
																																										params = {
																																											{
																																												const = "Taught01"
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
																																							class = "Selector",
																																							id = "114",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "115",
																																										properties = {
																																											{
																																												Operator = "Less"
																																											},
																																											{
																																												Opl = {
																																													func = "getTimerValue",
																																													params = {
																																														{
																																															const = "Taught01"
																																														}
																																													}
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
																																										class = "Condition",
																																										id = "116",
																																										properties = {
																																											{
																																												Operator = "GreaterEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getTimerValue",
																																													params = {
																																														{
																																															const = "Taught01"
																																														}
																																													}
																																												}
																																											},
																																											{
																																												Opr = {
																																													const = 12
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
																																							class = "Action",
																																							id = "117",
																																							properties = {
																																								{
																																									Method = {
																																										func = "turnToTarget",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = true
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
																																							class = "Action",
																																							id = "118",
																																							properties = {
																																								{
																																									Method = {
																																										func = "playAction",
																																										params = {
																																											{
																																												const = "Taught01"
																																											},
																																											{
																																												const = -1
																																											},
																																											{
																																												const = ""
																																											},
																																											{
																																												const = false
																																											},
																																											{
																																												const = false
																																											},
																																											{
																																												const = 0
																																											},
																																											{
																																												const = BaseEnum.AIAnimationRootMotionType.Default
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
																																							id = "119",
																																							properties = {
																																								{
																																									Method = {
																																										func = "startTimer",
																																										params = {
																																											{
																																												const = "Taught01"
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
																													}
																												},
																												{
																													node = {
																														class = "Sequence",
																														id = "124",
																														properties = {},
																														attachments = {
																															{
																																class = "Precondition",
																																effector = false,
																																transition = false,
																																id = "135",
																																precondition = true,
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Less"
																																	},
																																	{
																																		Opl = {
																																			func = "getTimerValue",
																																			params = {
																																				{
																																					const = "fightCd01"
																																				}
																																			}
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			field = "fightCd"
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {
																															{
																																node = {
																																	class = "IfElse",
																																	id = "57",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "120",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							field = "canWalkLeftOrRight"
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
																																				class = "Sequence",
																																				id = "63",
																																				properties = {},
																																				attachments = {
																																					{
																																						class = "Precondition",
																																						effector = false,
																																						transition = false,
																																						id = "109",
																																						precondition = true,
																																						properties = {
																																							{
																																								BinaryOperator = "And"
																																							},
																																							{
																																								Operator = "Greater"
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
																																								Opr2 = {
																																									field = "minAttackDist"
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
																																							class = "Action",
																																							id = "65",
																																							properties = {
																																								{
																																									Method = {
																																										func = "sideWalk",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 1.2
																																											},
																																											{
																																												const = 35
																																											},
																																											{
																																												const = -1
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
																																		},
																																		{
																																			node = {
																																				class = "Wait",
																																				id = "162",
																																				properties = {
																																					{
																																						Time = {
																																							const = 50
																																						}
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

return ST_Monster_AutoCombat_Boss_Wolferno_CE_Easy
