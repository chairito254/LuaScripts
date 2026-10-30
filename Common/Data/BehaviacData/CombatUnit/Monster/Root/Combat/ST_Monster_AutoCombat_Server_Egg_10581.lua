-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Server_Egg_10581.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Server_Egg_10581 = {
	behavior = {
		useForRoute = false,
		agenttype = "PuppetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Server_Egg_10581",
		version = 106,
		properties = {},
		pars = {
			{
				name = "CurrentDistToTarget",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "CurrentBoxDistToTarget",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "goBackDist",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "skillStopDist",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "tWeight_Group_SideWalk",
				const = 100,
				value = "100",
				type = "int"
			},
			{
				name = "tWeight_Group_Wait",
				const = 100,
				value = "100",
				type = "int"
			},
			{
				name = "tWeight_Group_Angry",
				const = 100,
				value = "100",
				type = "int"
			},
			{
				name = "tSkillRecoverCount",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "CurrentHpPercent",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "tSkillBuffCount",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tSkillControlCount",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tSkillFar",
				const = 0,
				value = "0",
				type = "float"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "212",
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
						id = "217",
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
						id = "385",
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
						class = "Action",
						id = "425",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "goBackCd"
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
									id = "171",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "355",
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
															class = "Assignment",
															id = "356",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "CurrentHpPercent"
																	}
																},
																{
																	Opr = {
																		func = "getHpPercent",
																		params = {
																			{
																				field = "selfId"
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
															id = "406",
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
												id = "172",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "169",
															properties = {
																{
																	Operator = "Equal"
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
															class = "Sequence",
															id = "416",
															properties = {},
															attachments = {
																{
																	class = "Precondition",
																	transition = false,
																	effector = false,
																	precondition = true,
																	id = "417",
																	properties = {
																		{
																			BinaryOperator = "And"
																		},
																		{
																			Operator = "NotEqual"
																		},
																		{
																			Opl = {
																				func = "getTarget"
																			}
																		},
																		{
																			Opr2 = {
																				const = 0
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
																		class = "DecoratorLoop",
																		id = "424",
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
																					class = "Action",
																					id = "422",
																					properties = {
																						{
																							Method = {
																								func = "patrolInRange",
																								params = {
																									{
																										const = 3
																									},
																									{
																										const = BaseEnum.SpeedRateType.Slow
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
															id = "167",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "165",
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
																		id = "166",
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
																},
																{
																	node = {
																		class = "IfElse",
																		id = "313",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "314",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								func = "checkCharacterState",
																								params = {
																									{
																										const = "MIMICRY"
																									},
																									{}
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
																					id = "312",
																					properties = {
																						{
																							Method = {
																								func = "switchToState",
																								params = {
																									{
																										const = "MIMICRYOUT"
																									},
																									{
																										const = 5
																									},
																									{
																										const = ""
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
																					id = "317",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "318",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											func = "checkCharacterState",
																											params = {
																												{
																													const = "SWIMMIMICRY"
																												},
																												{}
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
																								id = "316",
																								properties = {
																									{
																										Method = {
																											func = "switchToState",
																											params = {
																												{
																													const = "SWIMMIMICRYOUT"
																												},
																												{
																													const = 5
																												},
																												{
																													const = ""
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
																								id = "216",
																								properties = {},
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
																														id = "6",
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
																												},
																												{
																													node = {
																														class = "Assignment",
																														id = "188",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "CurrentBoxDistToTarget"
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											class = "IfElse",
																											id = "229",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "234",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkCharacterState",
																																	params = {
																																		{
																																			const = "SWIMMING"
																																		},
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
																														class = "Sequence",
																														id = "297",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "296",
																																	properties = {
																																		{
																																			Method = {
																																				func = "calcQualifiedPosByTarget",
																																				params = {
																																					{
																																						field = "tgt"
																																					},
																																					{
																																						const = 0
																																					},
																																					{
																																						field = "maxAttackDist"
																																					},
																																					{
																																						const = BaseEnum.CalcQualifiedPosQueryType.EightCompassDirections
																																					},
																																					{
																																						const = 2
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
																																	id = "298",
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
																																						const = 1
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
																														class = "IfElse",
																														id = "150",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Sequence",
																																	id = "311",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "151",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "checkCanMoveToTarget",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									field = "attackStopBoxDist"
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
																																				class = "Condition",
																																				id = "310",
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
																																							const = 2
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
																																	id = "468",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "469",
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
																																				id = "462",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "And",
																																							id = "470",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "465",
																																										properties = {
																																											{
																																												Operator = "GreaterEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getVerticalDis",
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
																																										class = "Condition",
																																										id = "471",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getVerticalDis",
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
																																													const = 4
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
																																							id = "463",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Action",
																																										id = "474",
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
																																															const = BaseEnum.MoveUpdateLevel.Slow
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
																																										class = "Action",
																																										id = "472",
																																										properties = {
																																											{
																																												Method = {
																																													func = "playJumpAction",
																																													params = {
																																														{
																																															const = "Jump"
																																														},
																																														{
																																															const = 5
																																														},
																																														{
																																															const = 0
																																														},
																																														{
																																															const = 3
																																														},
																																														{
																																															const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
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
																																							class = "IfElse",
																																							id = "473",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "And",
																																										id = "476",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Condition",
																																													id = "464",
																																													properties = {
																																														{
																																															Operator = "LessEqual"
																																														},
																																														{
																																															Opl = {
																																																func = "getVerticalDis",
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
																																																const = -0.5
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
																																													id = "487",
																																													properties = {
																																														{
																																															Operator = "GreaterEqual"
																																														},
																																														{
																																															Opl = {
																																																func = "getVerticalDis",
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
																																																const = -2.75
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
																																										id = "488",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Condition",
																																													id = "475",
																																													properties = {
																																														{
																																															Operator = "Equal"
																																														},
																																														{
																																															Opl = {
																																																func = "checkCanFly"
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
																																													id = "481",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "479",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "switchToFly",
																																																			params = {
																																																				{
																																																					const = 4.5
																																																				},
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
																																														},
																																														{
																																															node = {
																																																class = "Action",
																																																id = "477",
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
																																																					const = BaseEnum.MoveUpdateLevel.Slow
																																																				},
																																																				{
																																																					const = BaseEnum.PathFindType.AirNav
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
																																																		ResultOption = "BT_SUCCESS"
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
																																																id = "480",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "switchToState",
																																																			params = {
																																																				{
																																																					const = "LOCOMOTION"
																																																				},
																																																				{
																																																					const = 5
																																																				},
																																																				{
																																																					const = ""
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
																																													id = "489",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Condition",
																																																id = "492",
																																																properties = {
																																																	{
																																																		Operator = "GreaterEqual"
																																																	},
																																																	{
																																																		Opl = {
																																																			func = "getVerticalDis",
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
																																																			const = -1.5
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
																																																id = "491",
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
																																																					const = BaseEnum.MoveUpdateLevel.Slow
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
																																																class = "Action",
																																																id = "490",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playJumpAction",
																																																			params = {
																																																				{
																																																					const = "Jump"
																																																				},
																																																				{
																																																					const = 5
																																																				},
																																																				{
																																																					const = 0
																																																				},
																																																				{
																																																					const = 3
																																																				},
																																																				{
																																																					const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
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
																																										id = "478",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Sequence",
																																													id = "467",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "486",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "calcQualifiedPosByTarget",
																																																			params = {
																																																				{
																																																					field = "selfId"
																																																				},
																																																				{
																																																					const = 0
																																																				},
																																																				{
																																																					field = "CurrentBoxDistToTarget"
																																																				},
																																																				{
																																																					const = BaseEnum.CalcQualifiedPosQueryType.EightCompassDirections
																																																				},
																																																				{
																																																					const = 4
																																																				},
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = true
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
																																														},
																																														{
																																															node = {
																																																class = "Action",
																																																id = "466",
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
																																													class = "IfElse",
																																													id = "482",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Condition",
																																																id = "484",
																																																properties = {
																																																	{
																																																		Operator = "Equal"
																																																	},
																																																	{
																																																		Opl = {
																																																			func = "checkCanMoveToTarget",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					field = "attackStopBoxDist"
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
																																																id = "483",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "moveToTarget",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 0.5
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
																																																		ResultOption = "BT_SUCCESS"
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
																																																id = "485",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "sideWalk",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 1.5
																																																				},
																																																				{
																																																					const = -35
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
																																																		ResultOption = "BT_SUCCESS"
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
																																							field = "CurrentBoxDistToTarget"
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
																																				id = "11",
																																				properties = {
																																					{
																																						Method = {
																																							func = "moveToTarget",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									field = "bestKeepBoxDist"
																																								},
																																								{
																																									const = 99
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
																																									const = 8
																																								},
																																								{
																																									const = BaseEnum.MoveUpdateLevel.Fast
																																								},
																																								{
																																									const = BaseEnum.PathFindType.Auto
																																								},
																																								{
																																									const = BaseEnum.SpeedRateType.Burst
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
																																				id = "194",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "True",
																																							id = "426",
																																							properties = {},
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
																																																class = "Selector",
																																																id = "289",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Sequence",
																																																			id = "291",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Sequence",
																																																						id = "252",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Condition",
																																																									id = "251",
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
																																																									id = "260",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "And",
																																																												id = "261",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "Condition",
																																																															id = "257",
																																																															properties = {
																																																																{
																																																																	Operator = "GreaterEqual"
																																																																},
																																																																{
																																																																	Opl = {
																																																																		func = "getVerticalDis",
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
																																																															class = "Condition",
																																																															id = "262",
																																																															properties = {
																																																																{
																																																																	Operator = "LessEqual"
																																																																},
																																																																{
																																																																	Opl = {
																																																																		func = "getVerticalDis",
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
																																																																		const = 4
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
																																																												id = "259",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "Action",
																																																															id = "265",
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
																																																																				const = BaseEnum.MoveUpdateLevel.Slow
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
																																																															class = "Action",
																																																															id = "263",
																																																															properties = {
																																																																{
																																																																	Method = {
																																																																		func = "playJumpAction",
																																																																		params = {
																																																																			{
																																																																				const = "Jump"
																																																																			},
																																																																			{
																																																																				const = 5
																																																																			},
																																																																			{
																																																																				const = 0
																																																																			},
																																																																			{
																																																																				const = 3
																																																																			},
																																																																			{
																																																																				const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
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
																																																												class = "IfElse",
																																																												id = "264",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "And",
																																																															id = "267",
																																																															properties = {},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "Condition",
																																																																		id = "258",
																																																																		properties = {
																																																																			{
																																																																				Operator = "LessEqual"
																																																																			},
																																																																			{
																																																																				Opl = {
																																																																					func = "getVerticalDis",
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
																																																																					const = -0.5
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
																																																																		id = "283",
																																																																		properties = {
																																																																			{
																																																																				Operator = "GreaterEqual"
																																																																			},
																																																																			{
																																																																				Opl = {
																																																																					func = "getVerticalDis",
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
																																																																					const = -2.75
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
																																																															id = "284",
																																																															properties = {},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "Condition",
																																																																		id = "266",
																																																																		properties = {
																																																																			{
																																																																				Operator = "Equal"
																																																																			},
																																																																			{
																																																																				Opl = {
																																																																					func = "checkCanFly"
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
																																																																		id = "272",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Action",
																																																																					id = "270",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "switchToFly",
																																																																								params = {
																																																																									{
																																																																										const = 4.5
																																																																									},
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
																																																																			},
																																																																			{
																																																																				node = {
																																																																					class = "Action",
																																																																					id = "268",
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
																																																																										const = BaseEnum.MoveUpdateLevel.Slow
																																																																									},
																																																																									{
																																																																										const = BaseEnum.PathFindType.AirNav
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
																																																																							ResultOption = "BT_SUCCESS"
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
																																																																					id = "271",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "switchToState",
																																																																								params = {
																																																																									{
																																																																										const = "LOCOMOTION"
																																																																									},
																																																																									{
																																																																										const = 5
																																																																									},
																																																																									{
																																																																										const = ""
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
																																																																		id = "285",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Condition",
																																																																					id = "288",
																																																																					properties = {
																																																																						{
																																																																							Operator = "GreaterEqual"
																																																																						},
																																																																						{
																																																																							Opl = {
																																																																								func = "getVerticalDis",
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
																																																																								const = -1.5
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
																																																																					id = "287",
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
																																																																										const = BaseEnum.MoveUpdateLevel.Slow
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
																																																																					class = "Action",
																																																																					id = "286",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "playJumpAction",
																																																																								params = {
																																																																									{
																																																																										const = "Jump"
																																																																									},
																																																																									{
																																																																										const = 5
																																																																									},
																																																																									{
																																																																										const = 0
																																																																									},
																																																																									{
																																																																										const = 3
																																																																									},
																																																																									{
																																																																										const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
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
																																																															id = "269",
																																																															properties = {},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "Sequence",
																																																																		id = "255",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Action",
																																																																					id = "282",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "calcQualifiedPosByTarget",
																																																																								params = {
																																																																									{
																																																																										field = "selfId"
																																																																									},
																																																																									{
																																																																										const = 0
																																																																									},
																																																																									{
																																																																										field = "CurrentBoxDistToTarget"
																																																																									},
																																																																									{
																																																																										const = BaseEnum.CalcQualifiedPosQueryType.EightCompassDirections
																																																																									},
																																																																									{
																																																																										const = 4
																																																																									},
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = true
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
																																																																			},
																																																																			{
																																																																				node = {
																																																																					class = "Action",
																																																																					id = "256",
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
																																																																		class = "IfElse",
																																																																		id = "273",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Condition",
																																																																					id = "275",
																																																																					properties = {
																																																																						{
																																																																							Operator = "Equal"
																																																																						},
																																																																						{
																																																																							Opl = {
																																																																								func = "checkCanMoveToTarget",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										field = "attackStopBoxDist"
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
																																																																					id = "274",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "moveToTarget",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 0.5
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
																																																																							ResultOption = "BT_SUCCESS"
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
																																																																					id = "276",
																																																																					properties = {
																																																																						{
																																																																							Method = {
																																																																								func = "sideWalk",
																																																																								params = {
																																																																									{
																																																																										field = "tgt"
																																																																									},
																																																																									{
																																																																										const = 1.5
																																																																									},
																																																																									{
																																																																										const = -35
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
																																																																							ResultOption = "BT_SUCCESS"
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
																																																						class = "Assignment",
																																																						id = "294",
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
																																																				},
																																																				{
																																																					node = {
																																																						class = "Assignment",
																																																						id = "293",
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
																																																			id = "24",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Selector",
																																																						id = "505",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Sequence",
																																																									id = "503",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Condition",
																																																												id = "504",
																																																												properties = {
																																																													{
																																																														Operator = "NotEqual"
																																																													},
																																																													{
																																																														Opl = {
																																																															func = "getEntityCacheValue",
																																																															params = {
																																																																{
																																																																	const = "HpMin"
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
																																																												class = "Assignment",
																																																												id = "502",
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
																																																															func = "getEntityCacheValue",
																																																															params = {
																																																																{
																																																																	const = "HpMin"
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
																																																												id = "498",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "moveToTarget",
																																																															params = {
																																																																{
																																																																	field = "tgt"
																																																																},
																																																																{
																																																																	const = 2
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
																																																																	const = false
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
																																																												id = "557",
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
																																																																	const = 45
																																																																},
																																																																{
																																																																	const = 2
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
																																																									class = "Sequence",
																																																									id = "506",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Condition",
																																																												id = "509",
																																																												properties = {
																																																													{
																																																														Operator = "Equal"
																																																													},
																																																													{
																																																														Opl = {
																																																															func = "getEntityCacheValue",
																																																															params = {
																																																																{
																																																																	const = "HpMin"
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
																																																												class = "Selector",
																																																												id = "550",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "Sequence",
																																																															id = "510",
																																																															properties = {},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "Selector",
																																																																		id = "515",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Condition",
																																																																					id = "514",
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
																																																																					id = "520",
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
																																																																		class = "And",
																																																																		id = "518",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Condition",
																																																																					id = "512",
																																																																					properties = {
																																																																						{
																																																																							Operator = "LessEqual"
																																																																						},
																																																																						{
																																																																							Opl = {
																																																																								field = "CurrentHpPercent"
																																																																							}
																																																																						},
																																																																						{
																																																																							Opr = {
																																																																								const = 0.6
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
																																																																					id = "519",
																																																																					properties = {
																																																																						{
																																																																							Operator = "Less"
																																																																						},
																																																																						{
																																																																							Opl = {
																																																																								field = "tSkillRecoverCount"
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
																																																																			}
																																																																		}
																																																																	}
																																																																},
																																																																{
																																																																	node = {
																																																																		class = "Selector",
																																																																		id = "513",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Sequence",
																																																																					id = "525",
																																																																					properties = {},
																																																																					attachments = {},
																																																																					children = {
																																																																						{
																																																																							node = {
																																																																								class = "Assignment",
																																																																								id = "511",
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
																																																																											func = "getSkillIdByFeature",
																																																																											params = {
																																																																												{
																																																																													const = 3
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
																																																																													const = 0
																																																																												},
																																																																												{
																																																																													const = true
																																																																												},
																																																																												{
																																																																													const = true
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
																																																																								id = "524",
																																																																								properties = {
																																																																									{
																																																																										Operator = "NotEqual"
																																																																									},
																																																																									{
																																																																										Opl = {
																																																																											field = "skillId"
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
																																																																					class = "Sequence",
																																																																					id = "526",
																																																																					properties = {},
																																																																					attachments = {},
																																																																					children = {
																																																																						{
																																																																							node = {
																																																																								class = "Assignment",
																																																																								id = "516",
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
																																																																											func = "getSkillIdByFeature",
																																																																											params = {
																																																																												{
																																																																													const = 4
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
																																																																													const = 0
																																																																												},
																																																																												{
																																																																													const = true
																																																																												},
																																																																												{
																																																																													const = true
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
																																																																								id = "527",
																																																																								properties = {
																																																																									{
																																																																										Operator = "NotEqual"
																																																																									},
																																																																									{
																																																																										Opl = {
																																																																											field = "skillId"
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
																																																																					class = "Sequence",
																																																																					id = "528",
																																																																					properties = {},
																																																																					attachments = {},
																																																																					children = {
																																																																						{
																																																																							node = {
																																																																								class = "Assignment",
																																																																								id = "517",
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
																																																																											func = "getSkillIdByFeature",
																																																																											params = {
																																																																												{
																																																																													const = 2
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
																																																																													const = 0
																																																																												},
																																																																												{
																																																																													const = true
																																																																												},
																																																																												{
																																																																													const = true
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
																																																																								id = "529",
																																																																								properties = {
																																																																									{
																																																																										Operator = "NotEqual"
																																																																									},
																																																																									{
																																																																										Opl = {
																																																																											field = "skillId"
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
																																																																			}
																																																																		}
																																																																	}
																																																																},
																																																																{
																																																																	node = {
																																																																		class = "Action",
																																																																		id = "521",
																																																																		properties = {
																																																																			{
																																																																				Method = {
																																																																					func = "castSkill",
																																																																					params = {
																																																																						{
																																																																							field = "tgt"
																																																																						},
																																																																						{
																																																																							field = "skillId"
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
																																																																		id = "522",
																																																																		properties = {
																																																																			{
																																																																				CastRight = "false"
																																																																			},
																																																																			{
																																																																				Opl = {
																																																																					field = "tSkillRecoverCount"
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
																																																																		class = "Action",
																																																																		id = "523",
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
																																																															id = "551",
																																																															properties = {},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "IfElse",
																																																																		id = "555",
																																																																		properties = {},
																																																																		attachments = {},
																																																																		children = {
																																																																			{
																																																																				node = {
																																																																					class = "Condition",
																																																																					id = "556",
																																																																					properties = {
																																																																						{
																																																																							Operator = "LessEqual"
																																																																						},
																																																																						{
																																																																							Opl = {
																																																																								func = "getMaxAttackDist",
																																																																								params = {
																																																																									{
																																																																										field = "selfId"
																																																																									}
																																																																								}
																																																																							}
																																																																						},
																																																																						{
																																																																							Opr = {
																																																																								field = "CurrentDistToTarget"
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
																																																																					id = "554",
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
																																																																										const = 8
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
																																																																					id = "553",
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
																																																																		id = "552",
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
																																																						id = "46",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
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
																																																												const = 10
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
																																																									id = "50",
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
																																																class = "Compute",
																																																id = "60",
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
																																																			const = 50
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
																																																			const = 10
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
																																													id = "71",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Sequence",
																																																id = "72",
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
																																																						field = "CurrentDistToTarget"
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
																																																			id = "429",
																																																			properties = {
																																																				{
																																																					Operator = "GreaterEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getTimerValue",
																																																						params = {
																																																							{
																																																								const = "goBackCd"
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 3
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
																																																			id = "147",
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
																																																						field = "CurrentBoxDistToTarget"
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
																																																			id = "76",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "IfElse",
																																																						id = "326",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Condition",
																																																									id = "323",
																																																									properties = {
																																																										{
																																																											Operator = "NotEqual"
																																																										},
																																																										{
																																																											Opl = {
																																																												func = "isChildOfCharState",
																																																												params = {
																																																													{
																																																														field = "selfId"
																																																													},
																																																													{
																																																														const = "SPECIALDEFENSE"
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
																																																									id = "78",
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
																																																														field = "goBackDist"
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
																																																									class = "Noop",
																																																									id = "331",
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
																																																						id = "80",
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
																																																	},
																																																	{
																																																		node = {
																																																			class = "Action",
																																																			id = "428",
																																																			properties = {
																																																				{
																																																					Method = {
																																																						func = "startTimer",
																																																						params = {
																																																							{
																																																								const = "goBackCd"
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
																																																id = "124",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Condition",
																																																			id = "101",
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
																																																			class = "Action",
																																																			id = "105",
																																																			properties = {
																																																				{
																																																					Method = {
																																																						func = "sideWalk",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 1.5
																																																							},
																																																							{
																																																								const = -35
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
																																					},
																																					{
																																						node = {
																																							class = "IfElse",
																																							id = "206",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "200",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													field = "CurrentDistToTarget"
																																												}
																																											},
																																											{
																																												Opr = {
																																													field = "minKeepBoxDist"
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
																																										id = "195",
																																										properties = {
																																											{
																																												Method = {
																																													func = "walkBack",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															field = "bestKeepBoxDist"
																																														},
																																														{
																																															const = 5
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
																																										class = "IfElse",
																																										id = "213",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Condition",
																																													id = "215",
																																													properties = {
																																														{
																																															Operator = "Equal"
																																														},
																																														{
																																															Opl = {
																																																func = "checkInViewport",
																																																params = {
																																																	{
																																																		field = "selfId"
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
																																													id = "209",
																																													properties = {
																																														{
																																															Method = {
																																																func = "moveToTargetPos",
																																																params = {
																																																	{
																																																		field = "tgt"
																																																	},
																																																	{
																																																		const = 0
																																																	},
																																																	{
																																																		field = "bestKeepBoxDist"
																																																	},
																																																	{
																																																		const = 2
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
																																																		const = 8
																																																	},
																																																	{
																																																		const = BaseEnum.SpeedRateType.Slow
																																																	},
																																																	{
																																																		const = BaseEnum.PathFindType.Auto
																																																	},
																																																	{
																																																		const = false
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
																																																			field = "tWeight_Group_SideWalk"
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Sequence",
																																																			id = "239",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Assignment",
																																																						id = "240",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "tWeight_Group_SideWalk"
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
																																																						id = "241",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "tWeight_Group_Wait"
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
																																																						id = "242",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "tWeight_Group_Angry"
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
																																																				},
																																																				{
																																																					node = {
																																																						class = "Action",
																																																						id = "204",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "sideWalk",
																																																									params = {
																																																										{
																																																											field = "tgt"
																																																										},
																																																										{
																																																											const = 2
																																																										},
																																																										{
																																																											const = -35
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
																																																class = "DecoratorWeight",
																																																id = "220",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			field = "tWeight_Group_Wait"
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Sequence",
																																																			id = "243",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Assignment",
																																																						id = "246",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "tWeight_Group_Angry"
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
																																																				},
																																																				{
																																																					node = {
																																																						class = "Assignment",
																																																						id = "244",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "tWeight_Group_SideWalk"
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
																																																						id = "245",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "tWeight_Group_Wait"
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
																																																						class = "Action",
																																																						id = "222",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "waitTime",
																																																									params = {
																																																										{
																																																											const = 3
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
																																																id = "221",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			field = "tWeight_Group_Angry"
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Sequence",
																																																			id = "247",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Assignment",
																																																						id = "248",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "tWeight_Group_SideWalk"
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
																																																						id = "249",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "tWeight_Group_Wait"
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
																																																						id = "250",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "tWeight_Group_Angry"
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
																																																						class = "Action",
																																																						id = "302",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "turnToTarget",
																																																									params = {
																																																										{
																																																											field = "tgt"
																																																										},
																																																										{
																																																											const = false
																																																										},
																																																										{
																																																											const = 1
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
																																																						class = "Selector",
																																																						id = "225",
																																																						properties = {},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									class = "Sequence",
																																																									id = "224",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Condition",
																																																												id = "226",
																																																												properties = {
																																																													{
																																																														Operator = "Equal"
																																																													},
																																																													{
																																																														Opl = {
																																																															func = "hasAnimState",
																																																															params = {
																																																																{
																																																																	const = "Behav_AngryLoop"
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
																																																												id = "227",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "playPhaseAction",
																																																															params = {
																																																																{
																																																																	const = "Behav_AngryStart"
																																																																},
																																																																{
																																																																	const = "Behav_AngryLoop"
																																																																},
																																																																{
																																																																	const = "Behav_AngryEnd"
																																																																},
																																																																{
																																																																	const = 0
																																																																},
																																																																{
																																																																	const = ""
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
																																																									id = "223",
																																																									properties = {
																																																										{
																																																											Method = {
																																																												func = "playAction",
																																																												params = {
																																																													{
																																																														const = "Behav_Angry"
																																																													},
																																																													{
																																																														const = 4
																																																													},
																																																													{
																																																														const = ""
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

return ST_Monster_AutoCombat_Server_Egg_10581
