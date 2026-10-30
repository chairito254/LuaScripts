-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_NpcChallenge_20102120001.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_NpcChallenge_20102120001 = {
	behavior = {
		version = 323,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_NpcChallenge_20102120001",
		useForRoute = false,
		agenttype = "PetAgent",
		properties = {},
		pars = {
			{
				type = "bool",
				value = "false",
				const = false,
				name = "tShow50PCBubble"
			},
			{
				type = "bool",
				value = "false",
				const = false,
				name = "tShow20PCBubble"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "CurrentDistToTarget"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "CurrentEP"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "CurrentHpPercent"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "Weight_JumpBack"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "Weight_RunBack"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "Weight_Skill"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "Weight_CommonAttack"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "Weight_NothingToDo"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "maxSkillDist"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "skillStopDist"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "goBackDist"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tNewTargetForCatchMode"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "CurrentBoxDistToTarget"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tAngryPrepare"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tDrowningDepth"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tFlyHeight"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tVerticalDistToTgt"
			},
			{
				type = "string",
				value = "0",
				const = "0",
				name = "tSkillPlan"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tSkillUsed"
			},
			{
				type = "string",
				value = "",
				const = "",
				name = "tCurrentTactic"
			}
		},
		attachments = {},
		node = {
			id = "569",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "687",
						class = "Compute",
						properties = {
							{
								Operator = "Mul"
							},
							{
								Opl = {
									field = "tDrowningDepth"
								}
							},
							{
								Opr1 = {
									func = "getBodyHeight",
									params = {
										{
											field = "selfId"
										}
									}
								}
							},
							{
								Opr2 = {
									const = -0.6
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "686",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tAngryPrepare"
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
						id = "570",
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
									id = "464",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "117",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "1461",
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
															id = "116",
															class = "Assignment",
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
															id = "550",
															class = "Assignment",
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
													},
													{
														node = {
															id = "121",
															class = "Assignment",
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
															id = "118",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "CurrentEP"
																	}
																},
																{
																	Opr = {
																		func = "getEp",
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
															id = "229",
															class = "Assignment",
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
													},
													{
														node = {
															id = "252",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "Weight_JumpBack"
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
															id = "249",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "Weight_RunBack"
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
															id = "250",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "Weight_Skill"
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
															id = "251",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "Weight_CommonAttack"
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
															id = "458",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "Weight_NothingToDo"
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
															id = "1123",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tSkillUsed"
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
															id = "1533",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentTactic"
																	}
																},
																{
																	Opr = {
																		func = "getMasterCombatTactic"
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
												id = "6",
												class = "Selector",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "624",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "623",
																		class = "Condition",
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
																		id = "640",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "641",
																					class = "And",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "635",
																								class = "Condition",
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
																								id = "642",
																								class = "Condition",
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
																					id = "638",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "649",
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
																								id = "648",
																								class = "Action",
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
																					id = "689",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "690",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tVerticalDistToTgt"
																										}
																									},
																									{
																										Opr = {
																											func = "getVerticalDis",
																											params = {
																												{
																													field = "tgt"
																												},
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
																								id = "645",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "653",
																											class = "And",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "636",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "GreaterEqual"
																															},
																															{
																																Opl = {
																																	field = "tVerticalDistToTgt"
																																}
																															},
																															{
																																Opr = {
																																	const = 0.25
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "678",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	field = "tVerticalDistToTgt"
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											id = "679",
																											class = "IfElse",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "652",
																														class = "Condition",
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
																														id = "661",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "691",
																																	class = "Compute",
																																	properties = {
																																		{
																																			Operator = "Add"
																																		},
																																		{
																																			Opl = {
																																				field = "tFlyHeight"
																																			}
																																		},
																																		{
																																			Opr1 = {
																																				field = "tVerticalDistToTgt"
																																			}
																																		},
																																		{
																																			Opr2 = {
																																				const = 1.5
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "659",
																																	class = "Action",
																																	properties = {
																																		{
																																			Method = {
																																				func = "switchToFly",
																																				params = {
																																					{
																																						field = "tFlyHeight"
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
																																	id = "658",
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
																																						field = "minAttackDist"
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
																																	id = "660",
																																	class = "Action",
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
																														id = "680",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "682",
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
																																	id = "681",
																																	class = "Action",
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
																											id = "664",
																											class = "Selector",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "627",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "677",
																																	class = "Action",
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
																																	id = "628",
																																	class = "Action",
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
																														id = "665",
																														class = "IfElse",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "663",
																																	class = "Condition",
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
																																	id = "669",
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
																																	id = "671",
																																	class = "Action",
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
																}
															}
														}
													},
													{
														node = {
															id = "436",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1534",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "1535",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								field = "tCurrentTactic"
																							}
																						},
																						{
																							Opr = {
																								const = "FLOWER"
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "1537",
																					class = "Assignment",
																					properties = {
																						{
																							CastRight = "false"
																						},
																						{
																							Opl = {
																								field = "maxSkillDist"
																							}
																						},
																						{
																							Opr = {
																								func = "getMaxSkillDist",
																								params = {
																									{
																										const = 12120130
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
																					id = "1544",
																					class = "IfElse",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1545",
																								class = "Condition",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											func = "checkSkillNotInCd",
																											params = {
																												{
																													const = 12120130
																												},
																												{
																													const = 0
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
																								id = "1543",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "1540",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														field = "CurrentDistToTarget"
																													}
																												},
																												{
																													Opr = {
																														field = "maxSkillDist"
																													}
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "1538",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "1541",
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
																																			const = 1.4
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
																																ResultResumeOption = "BT_ResumeTree"
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "1536",
																														class = "Action",
																														properties = {
																															{
																																Method = {
																																	func = "castChargetSkill",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = 12120130
																																		},
																																		{
																																			const = 8
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = true
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
																											id = "1547",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "castChargetSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 12120130
																															},
																															{
																																const = 8
																															},
																															{
																																const = 0
																															},
																															{
																																const = true
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
																								id = "1546",
																								class = "Noop",
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
																		id = "18",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "1532",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_AutoCombat_KeepDis"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Name = "goBackDist",
																									Type = "Self",
																									Value = {
																										field = "goBackDist"
																									}
																								},
																								{
																									Name = "CurrentDistToTarget",
																									Type = "Self",
																									Value = {
																										field = "CurrentDistToTarget"
																									}
																								},
																								{
																									Name = "CurrentBoxDistToTarget",
																									Type = "Self",
																									Value = {
																										field = "CurrentBoxDistToTarget"
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
																					id = "1345",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1510",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "1519",
																											class = "Or",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "1506",
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
																																			const = 10003
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
																														id = "1520",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "GreaterEqual"
																															},
																															{
																																Opl = {
																																	func = "getSp",
																																	params = {
																																		{
																																			field = "selfId"
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											id = "1521",
																											class = "IfElse",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "1522",
																														class = "Condition",
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
																														id = "1346",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "1347",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "GreaterEqual"
																																		},
																																		{
																																			Opl = {
																																				func = "getSp",
																																				params = {
																																					{
																																						field = "selfId"
																																					}
																																				}
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
																																	id = "1351",
																																	class = "Assignment",
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
																																				func = "getUltimateSkillId"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "1349",
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
																																			ResultResumeOption = "BT_ResumeSelf"
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "1464",
																																	class = "Compute",
																																	properties = {
																																		{
																																			Operator = "Add"
																																		},
																																		{
																																			Opl = {
																																				field = "skillId"
																																			}
																																		},
																																		{
																																			Opr1 = {
																																				field = "skillId"
																																			}
																																		},
																																		{
																																			Opr2 = {
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
																																	id = "1462",
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
																														id = "1529",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "1530",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "GreaterEqual"
																																		},
																																		{
																																			Opl = {
																																				func = "getSp",
																																				params = {
																																					{
																																						field = "selfId"
																																					}
																																				}
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
																																	id = "1524",
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
																																						const = 15
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
																																	id = "1527",
																																	class = "Assignment",
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
																																				func = "getUltimateSkillId"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "1526",
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
																																			ResultResumeOption = "BT_ResumeSelf"
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "1528",
																																	class = "Compute",
																																	properties = {
																																		{
																																			Operator = "Add"
																																		},
																																		{
																																			Opl = {
																																				field = "skillId"
																																			}
																																		},
																																		{
																																			Opr1 = {
																																				field = "skillId"
																																			}
																																		},
																																		{
																																			Opr2 = {
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
																																	id = "1525",
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
																								id = "1152",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_AutoCombat_Attack"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Name = "tShow50PCBubble",
																												Type = "Self",
																												Value = {
																													field = "tShow50PCBubble"
																												}
																											},
																											{
																												Name = "tShow20PCBubble",
																												Type = "Self",
																												Value = {
																													field = "tShow20PCBubble"
																												}
																											},
																											{
																												Name = "CurrentDistToTarget",
																												Type = "Self",
																												Value = {
																													field = "CurrentDistToTarget"
																												}
																											},
																											{
																												Name = "CurrentEP",
																												Type = "Self",
																												Value = {
																													field = "CurrentEP"
																												}
																											},
																											{
																												Name = "CurrentHpPercent",
																												Type = "Self",
																												Value = {
																													field = "CurrentHpPercent"
																												}
																											},
																											{
																												Name = "Weight_JumpBack",
																												Type = "Self",
																												Value = {
																													field = "Weight_JumpBack"
																												}
																											},
																											{
																												Name = "Weight_RunBack",
																												Type = "Self",
																												Value = {
																													field = "Weight_RunBack"
																												}
																											},
																											{
																												Name = "Weight_Skill",
																												Type = "Self",
																												Value = {
																													field = "Weight_Skill"
																												}
																											},
																											{
																												Name = "Weight_CommonAttack",
																												Type = "Self",
																												Value = {
																													field = "Weight_CommonAttack"
																												}
																											},
																											{
																												Name = "Weight_NothingToDo",
																												Type = "Self",
																												Value = {
																													field = "Weight_NothingToDo"
																												}
																											},
																											{
																												Name = "maxSkillDist",
																												Type = "Self",
																												Value = {
																													field = "maxSkillDist"
																												}
																											},
																											{
																												Name = "skillStopDist",
																												Type = "Self",
																												Value = {
																													field = "skillStopDist"
																												}
																											},
																											{
																												Name = "goBackDist",
																												Type = "Self",
																												Value = {
																													field = "goBackDist"
																												}
																											},
																											{
																												Name = "tNewTargetForCatchMode",
																												Type = "Self",
																												Value = {
																													field = "tNewTargetForCatchMode"
																												}
																											},
																											{
																												Name = "CurrentBoxDistToTarget",
																												Type = "Self",
																												Value = {
																													field = "CurrentBoxDistToTarget"
																												}
																											},
																											{
																												Name = "tAngryPrepare",
																												Type = "Self",
																												Value = {
																													field = "tAngryPrepare"
																												}
																											},
																											{
																												Name = "tDrowningDepth",
																												Type = "Self",
																												Value = {
																													field = "tDrowningDepth"
																												}
																											},
																											{
																												Name = "tFlyHeight",
																												Type = "Self",
																												Value = {
																													field = "tFlyHeight"
																												}
																											},
																											{
																												Name = "tVerticalDistToTgt",
																												Type = "Self",
																												Value = {
																													field = "tVerticalDistToTgt"
																												}
																											},
																											{
																												Name = "tSkillPlan",
																												Type = "Self",
																												Value = {
																													field = "tSkillPlan"
																												}
																											},
																											{
																												Name = "tSkillUsed",
																												Type = "Self",
																												Value = {
																													field = "tSkillUsed"
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
																					id = "1531",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_AutoCombat_NormalAtkCombo"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Name = "CurrentDistToTarget",
																									Type = "Self",
																									Value = {
																										field = "CurrentDistToTarget"
																									}
																								},
																								{
																									Name = "CurrentBoxDistToTarget",
																									Type = "Self",
																									Value = {
																										field = "CurrentBoxDistToTarget"
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
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

return ST_Monster_AutoCombat_NpcChallenge_20102120001
