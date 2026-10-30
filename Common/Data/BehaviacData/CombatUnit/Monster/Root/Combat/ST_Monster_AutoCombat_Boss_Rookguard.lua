-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_Rookguard.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_Rookguard = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_Rookguard",
		version = 117,
		useForRoute = false,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				name = "CurrentDistToTarget",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "CurrentBoxDistToTarget",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "goBackDist",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "skillStopDist",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "tWeight_Group_SideWalk",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "tWeight_Group_Wait",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "tWeight_Group_Angry",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "skill_lock",
				type = "int",
				const = 0,
				value = "0"
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
									const = 150
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
						id = "429",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "FightCd04"
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
												class = "IfElse",
												id = "304",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "308",
															properties = {
																{
																	Operator = "LessEqual"
																},
																{
																	Opl = {
																		func = "getTimerValue",
																		params = {
																			{
																				const = "wait3"
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
															class = "Sequence",
															id = "306",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Action",
																		id = "307",
																		properties = {
																			{
																				Method = {
																					func = "startTimer",
																					params = {
																						{
																							const = "wait3"
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
																		id = "303",
																		properties = {
																			{
																				Method = {
																					func = "waitTime",
																					params = {
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
													},
													{
														node = {
															class = "Action",
															id = "309",
															properties = {
																{
																	Method = {
																		func = "waitTime",
																		params = {
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
															class = "Action",
															id = "170",
															properties = {
																{
																	Method = {
																		func = "resetRootState",
																		params = {
																			{
																				const = BaseEnum.EBTRootState.ST_Root_Combat
																			}
																		}
																	}
																},
																{
																	ResultOption = "BT_RUNNING"
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
																											class = "Sequence",
																											id = "447",
																											properties = {},
																											attachments = {},
																											children = {
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
																																			const = 8
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
																														class = "SelectorProbability",
																														id = "448",
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
																																	id = "450",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				const = 3
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Action",
																																				id = "451",
																																				properties = {
																																					{
																																						Method = {
																																							func = "waitTime",
																																							params = {
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
																															},
																															{
																																node = {
																																	class = "DecoratorWeight",
																																	id = "449",
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
																																				id = "452",
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
																																																									class = "SelectorProbability",
																																																									id = "402",
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
																																																												id = "400",
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
																																																															id = "403",
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
																																																																				const = 35
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
																																																												class = "DecoratorWeight",
																																																												id = "398",
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
																																																															id = "405",
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
																																																												id = "399",
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
																																																															id = "406",
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
																																																																				const = 60
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
																																																												class = "DecoratorWeight",
																																																												id = "401",
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
																																																															id = "404",
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
																																																																				const = -60
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
																																																												class = "DecoratorWeight",
																																																												id = "397",
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
																																																															id = "408",
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
																																																																				const = 45
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
																																																												class = "DecoratorWeight",
																																																												id = "407",
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
																																																															id = "409",
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
																																																																				const = -45
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
																																													const = 150
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
																																										class = "IfElse",
																																										id = "460",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Sequence",
																																													id = "464",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Condition",
																																																id = "465",
																																																properties = {
																																																	{
																																																		Operator = "LessEqual"
																																																	},
																																																	{
																																																		Opl = {
																																																			func = "getHpPercent",
																																																			params = {
																																																				{
																																																					const = 0
																																																				}
																																																			}
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
																																																id = "463",
																																																properties = {
																																																	{
																																																		Operator = "Equal"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skill_lock"
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
																																													id = "461",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "457",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castSkill",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 10430412
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
																																																id = "462",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "startTimer",
																																																			params = {
																																																				{
																																																					const = "skill02"
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
																																																id = "459",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skill_lock"
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
																																													class = "IfElse",
																																													id = "466",
																																													properties = {},
																																													attachments = {},
																																													children = {
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
																																																					Operator = "GreaterEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getTimerValue",
																																																						params = {
																																																							{
																																																								const = "skill02"
																																																							}
																																																						}
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
																																																	},
																																																	{
																																																		node = {
																																																			class = "Condition",
																																																			id = "470",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getHpPercent",
																																																						params = {
																																																							{
																																																								const = 0
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 0.3
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
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "skill_lock"
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
																																																class = "Sequence",
																																																id = "472",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Action",
																																																			id = "476",
																																																			properties = {
																																																				{
																																																					Method = {
																																																						func = "castSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 10430412
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
																																																			id = "474",
																																																			properties = {
																																																				{
																																																					Method = {
																																																						func = "startTimer",
																																																						params = {
																																																							{
																																																								const = "skill02"
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
																																																			id = "473",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "skill_lock"
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
																																																class = "Selector",
																																																id = "475",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Sequence",
																																																			id = "35",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Condition",
																																																						id = "431",
																																																						properties = {
																																																							{
																																																								Operator = "GreaterEqual"
																																																							},
																																																							{
																																																								Opl = {
																																																									func = "getTimerValue",
																																																									params = {
																																																										{
																																																											const = "FightCd04"
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
																																																				},
																																																				{
																																																					node = {
																																																						class = "SelectorProbability",
																																																						id = "422",
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
																																																									id = "418",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 3
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												class = "Action",
																																																												id = "416",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "castSkill",
																																																															params = {
																																																																{
																																																																	field = "tgt"
																																																																},
																																																																{
																																																																	const = 10430210
																																																																},
																																																																{
																																																																	const = true
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
																																																														ResultResumeOption = "BT_ResumeTree"
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
																																																									id = "419",
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
																																																												class = "IfElse",
																																																												id = "424",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															class = "Condition",
																																																															id = "425",
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
																																																															class = "Sequence",
																																																															id = "427",
																																																															properties = {},
																																																															attachments = {},
																																																															children = {
																																																																{
																																																																	node = {
																																																																		class = "Action",
																																																																		id = "426",
																																																																		properties = {
																																																																			{
																																																																				Method = {
																																																																					func = "moveToTarget",
																																																																					params = {
																																																																						{
																																																																							field = "tgt"
																																																																						},
																																																																						{
																																																																							const = 3.5
																																																																						},
																																																																						{
																																																																							const = 2
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
																																																																		id = "417",
																																																																		properties = {
																																																																			{
																																																																				Method = {
																																																																					func = "castSkill",
																																																																					params = {
																																																																						{
																																																																							field = "tgt"
																																																																						},
																																																																						{
																																																																							const = 10430310
																																																																						},
																																																																						{
																																																																							const = true
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
																																																																				ResultResumeOption = "BT_ResumeTree"
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
																																																																		func = "castSkill",
																																																																		params = {
																																																																			{
																																																																				field = "tgt"
																																																																			},
																																																																			{
																																																																				const = 10430310
																																																																			},
																																																																			{
																																																																				const = true
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
																																																							},
																																																							{
																																																								node = {
																																																									class = "DecoratorWeight",
																																																									id = "420",
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
																																																												id = "421",
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
																																																				},
																																																				{
																																																					node = {
																																																						class = "Action",
																																																						id = "22",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "startTimer",
																																																									params = {
																																																										{
																																																											const = "FightCd04"
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
																																																			class = "SelectorProbability",
																																																			id = "443",
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
																																																						id = "432",
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
																																																									id = "433",
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
																																																														const = 35
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
																																																						class = "DecoratorWeight",
																																																						id = "445",
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
																																																									id = "446",
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
																																																const = 150
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
																																										const = 2
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
																																															const = 3
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
																																															const = 8
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
																																							class = "SelectorProbability",
																																							id = "389",
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
																																										id = "387",
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
																																													id = "390",
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
																																																		const = 35
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
																																										class = "DecoratorWeight",
																																										id = "385",
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
																																													id = "392",
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
																																										id = "386",
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
																																													id = "393",
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
																																																		const = 60
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
																																										class = "DecoratorWeight",
																																										id = "388",
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
																																													id = "391",
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
																																																		const = -60
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
																																										class = "DecoratorWeight",
																																										id = "384",
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
																																													id = "395",
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
																																																		const = 45
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
																																										class = "DecoratorWeight",
																																										id = "394",
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
																																													id = "396",
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
																																																		const = -45
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
				},
				{
					node = {
						class = "Assignment",
						id = "477",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "skill_lock"
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
						id = "478",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "skill02"
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

return ST_Monster_AutoCombat_Boss_Rookguard
