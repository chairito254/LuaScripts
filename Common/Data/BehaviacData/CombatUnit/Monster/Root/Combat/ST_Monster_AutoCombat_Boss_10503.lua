-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_10503.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_10503 = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_10503",
		agenttype = "PuppetAgent",
		version = 133,
		useForRoute = false,
		properties = {},
		pars = {
			{
				name = "tSkill_ComboAttack",
				const = 200,
				value = "200",
				type = "int"
			},
			{
				name = "tSkill_15030110",
				const = 200,
				value = "200",
				type = "int"
			},
			{
				name = "tSkill_15030111",
				const = 100,
				value = "100",
				type = "int"
			},
			{
				name = "tSkill_15030112",
				const = 100,
				value = "100",
				type = "int"
			},
			{
				name = "tSkill_15030113",
				const = 100,
				value = "100",
				type = "int"
			},
			{
				name = "skillStopDist",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "tPlayer",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tSkill_15030310",
				const = 100,
				value = "100",
				type = "int"
			},
			{
				name = "tSkill_15030210",
				const = 200,
				value = "200",
				type = "int"
			},
			{
				name = "TimerStarted_1",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tSkill_Rest",
				const = 0,
				value = "0",
				type = "int"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "198",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "152",
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
						id = "440",
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
						class = "Action",
						id = "494",
						properties = {
							{
								Method = {
									func = "playPhaseAction",
									params = {
										{
											const = "Behav_AlertStart"
										},
										{
											const = ""
										},
										{
											const = "Behav_AlertEnd"
										},
										{
											const = 0
										},
										{
											const = "0"
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
								ResultOption = "BT_INVALID"
							},
							{
								ResultResumeOption = "BT_NextNode"
							}
						},
						attachments = {},
						children = {}
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
									class = "Sequence",
									id = "4",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Assignment",
												id = "8",
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
												id = "5",
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
												id = "6",
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
												id = "7",
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
												class = "Assignment",
												id = "251",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "tPlayer"
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
												class = "IfElse",
												id = "512",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "548",
															properties = {
																{
																	Operator = "GreaterEqual"
																},
																{
																	Opl = {
																		func = "getTargetBuffLayerCount",
																		params = {
																			{},
																			{
																				const = 215030101
																			}
																		}
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
															class = "Sequence",
															id = "514",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Action",
																		id = "549",
																		properties = {
																			{
																				Method = {
																					func = "removeBuff",
																					params = {
																						{
																							const = 215030101
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
																		id = "513",
																		properties = {
																			{
																				Method = {
																					func = "castSkill",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 15030400
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
																				ResultResumeOption = "BT_NextNode"
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
															id = "9",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "10",
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
																		class = "Action",
																		id = "542",
																		properties = {
																			{
																				Method = {
																					func = "castSkill",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 15030600
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
																		class = "Selector",
																		id = "12",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "SelectorProbability",
																					id = "13",
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
																								id = "15",
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
																											id = "24",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "IfElse",
																														id = "505",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "506",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "checkTargetHasBuffById",
																																				params = {
																																					{
																																						field = "selfId"
																																					},
																																					{
																																						const = 2150102
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
																																	class = "Compute",
																																	id = "507",
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
																																	class = "Compute",
																																	id = "49",
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
																																				const = 100
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
																														class = "SelectorProbability",
																														id = "156",
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
																																	id = "157",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				field = "tSkill_ComboAttack"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "38",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "IfElse",
																																							id = "159",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "158",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													field = "maxAttackDist"
																																												}
																																											},
																																											{
																																												Opr = {
																																													field = "distToTgtForSkill"
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
																																										id = "146",
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
																																										class = "Noop",
																																										id = "160",
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
																																							id = "41",
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
																																												const = false
																																											},
																																											{
																																												const = 2
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
																																							class = "Assignment",
																																							id = "488",
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
																																										const = 400
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
																																							id = "498",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "tSkill_Rest"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "tSkill_Rest"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 30
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
																																	class = "DecoratorWeight",
																																	id = "165",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				field = "tSkill_15030110"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "162",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Assignment",
																																							id = "169",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "skillStopDist"
																																									}
																																								},
																																								{
																																									Opr = {
																																										func = "getSkillStopBoxDist",
																																										params = {
																																											{
																																												const = 15030110
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
																																							id = "153",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "149",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getMaxSkillDist",
																																													params = {
																																														{
																																															const = 15030110
																																														}
																																													}
																																												}
																																											},
																																											{
																																												Opr = {
																																													field = "distToTgtForSkill"
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
																																										id = "212",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Assignment",
																																													id = "211",
																																													properties = {
																																														{
																																															CastRight = "false"
																																														},
																																														{
																																															Opl = {
																																																field = "skillStopDist"
																																															}
																																														},
																																														{
																																															Opr = {
																																																func = "getSkillStopBoxDist",
																																																params = {
																																																	{
																																																		const = 15030110
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
																																													class = "Action",
																																													id = "120",
																																													properties = {
																																														{
																																															Method = {
																																																func = "moveToTarget",
																																																params = {
																																																	{
																																																		field = "tgt"
																																																	},
																																																	{
																																																		field = "skillStopDist"
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
																																											}
																																										}
																																									}
																																								},
																																								{
																																									node = {
																																										class = "Noop",
																																										id = "154",
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
																																							class = "SelectorProbability",
																																							id = "441",
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
																																										id = "442",
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
																																													id = "460",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "166",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castSkill",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 15030110
																																																				},
																																																				{
																																																					const = true
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
																																																		ResultResumeOption = "BT_NextNode"
																																																	}
																																																},
																																																attachments = {},
																																																children = {}
																																															}
																																														},
																																														{
																																															node = {
																																																class = "Action",
																																																id = "461",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castSkill",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 15030112
																																																				},
																																																				{
																																																					const = true
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
																																																		ResultResumeOption = "BT_NextNode"
																																																	}
																																																},
																																																attachments = {},
																																																children = {}
																																															}
																																														},
																																														{
																																															node = {
																																																class = "SelectorProbability",
																																																id = "465",
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
																																																			id = "464",
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
																																																						class = "Action",
																																																						id = "448",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "castSkill",
																																																									params = {
																																																										{
																																																											field = "tgt"
																																																										},
																																																										{
																																																											const = 15030113
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
																																																								ResultResumeOption = "BT_NextNode"
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
																																																			id = "463",
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
																																																						class = "True",
																																																						id = "466",
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
																																										id = "443",
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
																																													id = "462",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "447",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castSkill",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 15030111
																																																				},
																																																				{
																																																					const = true
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
																																																		ResultResumeOption = "BT_NextNode"
																																																	}
																																																},
																																																attachments = {},
																																																children = {}
																																															}
																																														},
																																														{
																																															node = {
																																																class = "Action",
																																																id = "446",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castSkill",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 15030112
																																																				},
																																																				{
																																																					const = true
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
																																																		ResultResumeOption = "BT_NextNode"
																																																	}
																																																},
																																																attachments = {},
																																																children = {}
																																															}
																																														},
																																														{
																																															node = {
																																																class = "SelectorProbability",
																																																id = "469",
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
																																																			id = "468",
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
																																																						class = "Action",
																																																						id = "470",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "castSkill",
																																																									params = {
																																																										{
																																																											field = "tgt"
																																																										},
																																																										{
																																																											const = 15030113
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
																																																								ResultResumeOption = "BT_NextNode"
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
																																																			id = "467",
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
																																																						class = "True",
																																																						id = "471",
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
																																							class = "Compute",
																																							id = "499",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "tSkill_Rest"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "tSkill_Rest"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 30
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
																																	class = "DecoratorWeight",
																																	id = "177",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				field = "tSkill_15030210"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "175",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Assignment",
																																							id = "171",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "skillStopDist"
																																									}
																																								},
																																								{
																																									Opr = {
																																										func = "getSkillStopBoxDist",
																																										params = {
																																											{
																																												const = 15030210
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
																																							id = "176",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "174",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getMaxSkillDist",
																																													params = {
																																														{
																																															const = 15030210
																																														}
																																													}
																																												}
																																											},
																																											{
																																												Opr = {
																																													field = "distToTgtForSkill"
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
																																										id = "213",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Assignment",
																																													id = "214",
																																													properties = {
																																														{
																																															CastRight = "false"
																																														},
																																														{
																																															Opl = {
																																																field = "skillStopDist"
																																															}
																																														},
																																														{
																																															Opr = {
																																																func = "getSkillStopBoxDist",
																																																params = {
																																																	{
																																																		const = 15030210
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
																																													class = "Action",
																																													id = "172",
																																													properties = {
																																														{
																																															Method = {
																																																func = "moveToTarget",
																																																params = {
																																																	{
																																																		field = "tgt"
																																																	},
																																																	{
																																																		field = "skillStopDist"
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
																																											}
																																										}
																																									}
																																								},
																																								{
																																									node = {
																																										class = "Noop",
																																										id = "173",
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
																																							id = "170",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castSkill",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 15030210
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
																																									ResultResumeOption = "BT_NextNode"
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							class = "SelectorProbability",
																																							id = "490",
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
																																										id = "489",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													const = 2
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Action",
																																													id = "493",
																																													properties = {
																																														{
																																															Method = {
																																																func = "castSkill",
																																																params = {
																																																	{
																																																		field = "tgt"
																																																	},
																																																	{
																																																		const = 15030310
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
																																															ResultResumeOption = "BT_NextNode"
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
																																										id = "491",
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
																																													class = "True",
																																													id = "492",
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
																																							class = "Compute",
																																							id = "500",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "tSkill_Rest"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "tSkill_Rest"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 30
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
																																	class = "DecoratorWeight",
																																	id = "453",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				field = "tSkill_15030310"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "449",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Assignment",
																																							id = "454",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "skillStopDist"
																																									}
																																								},
																																								{
																																									Opr = {
																																										func = "getSkillStopBoxDist",
																																										params = {
																																											{
																																												const = 15030310
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
																																							id = "450",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "455",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getMaxSkillDist",
																																													params = {
																																														{
																																															const = 15030310
																																														}
																																													}
																																												}
																																											},
																																											{
																																												Opr = {
																																													field = "distToTgtForSkill"
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
																																										id = "451",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Assignment",
																																													id = "456",
																																													properties = {
																																														{
																																															CastRight = "false"
																																														},
																																														{
																																															Opl = {
																																																field = "skillStopDist"
																																															}
																																														},
																																														{
																																															Opr = {
																																																func = "getSkillStopBoxDist",
																																																params = {
																																																	{
																																																		const = 15030310
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
																																													class = "Action",
																																													id = "457",
																																													properties = {
																																														{
																																															Method = {
																																																func = "moveToTarget",
																																																params = {
																																																	{
																																																		field = "tgt"
																																																	},
																																																	{
																																																		field = "skillStopDist"
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
																																											}
																																										}
																																									}
																																								},
																																								{
																																									node = {
																																										class = "Noop",
																																										id = "452",
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
																																							id = "458",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castSkill",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 15030310
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
																																									ResultResumeOption = "BT_NextNode"
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							class = "Compute",
																																							id = "501",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "tSkill_Rest"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "tSkill_Rest"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 30
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
																																	class = "DecoratorWeight",
																																	id = "481",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				field = "tSkill_Rest"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "495",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Assignment",
																																							id = "496",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "tSkill_Rest"
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
																																							class = "IfElse",
																																							id = "508",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "541",
																																										properties = {
																																											{
																																												Operator = "Equal"
																																											},
																																											{
																																												Opl = {
																																													func = "checkTargetHasBuffById",
																																													params = {
																																														{
																																															field = "selfId"
																																														},
																																														{
																																															const = 2150102
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
																																										class = "True",
																																										id = "510",
																																										properties = {},
																																										attachments = {},
																																										children = {}
																																									}
																																								},
																																								{
																																									node = {
																																										class = "Action",
																																										id = "486",
																																										properties = {
																																											{
																																												Method = {
																																													func = "playPhaseAction",
																																													params = {
																																														{
																																															const = "Behav_EatStart"
																																														},
																																														{
																																															const = "Behav_EatLoop"
																																														},
																																														{
																																															const = "Behav_EatEnd"
																																														},
																																														{
																																															const = 2
																																														},
																																														{
																																															const = "4"
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
																																												ResultOption = "BT_INVALID"
																																											},
																																											{
																																												ResultResumeOption = "BT_NextNode"
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
																								class = "DecoratorWeight",
																								id = "17",
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
																											id = "16",
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
																					id = "53",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Sequence",
																								id = "59",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Assignment",
																											id = "61",
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
																														const = 0
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
																								class = "IfElse",
																								id = "217",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "And",
																											id = "228",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "74",
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
																														id = "75",
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											class = "SelectorProbability",
																											id = "218",
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
																														id = "219",
																														properties = {
																															{
																																DecorateWhenChildEnds = "false"
																															},
																															{
																																Weight = {
																																	const = 100
																																}
																															}
																														},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Sequence",
																																	id = "304",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Selector",
																																				id = "431",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Action",
																																							id = "302",
																																							properties = {
																																								{
																																									Method = {
																																										func = "jumpBackByLinkAngle",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 0
																																											},
																																											{
																																												const = 5
																																											},
																																											{
																																												const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
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
																																							id = "305",
																																							properties = {
																																								{
																																									Method = {
																																										func = "runBack",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 3
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
																																		},
																																		{
																																			node = {
																																				class = "Compute",
																																				id = "306",
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
																																							const = 100
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
																														class = "DecoratorWeight",
																														id = "220",
																														properties = {
																															{
																																DecorateWhenChildEnds = "false"
																															},
																															{
																																Weight = {
																																	const = 60
																																}
																															}
																														},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "109",
																																	properties = {
																																		{
																																			Method = {
																																				func = "sideWalk",
																																				params = {
																																					{
																																						field = "tgt"
																																					},
																																					{
																																						const = 2.5
																																					},
																																					{
																																						const = 20
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											class = "Action",
																											id = "330",
																											properties = {
																												{
																													Method = {
																														func = "sideWalk",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 2.5
																															},
																															{
																																const = 20
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

return ST_Monster_AutoCombat_Boss_10503
