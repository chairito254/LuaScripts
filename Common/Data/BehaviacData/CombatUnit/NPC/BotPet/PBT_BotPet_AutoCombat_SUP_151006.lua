-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPet\\PBT_BotPet_AutoCombat_SUP_151006.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPet_AutoCombat_SUP_151006 = {
	behavior = {
		useForRoute = false,
		agenttype = "PetAgent",
		name = "CombatUnit/NPC/BotPet/PBT_BotPet_AutoCombat_SUP_151006",
		version = 342,
		properties = {},
		pars = {
			{
				name = "tShow50PCBubble",
				type = "bool",
				const = false,
				value = "false"
			},
			{
				name = "tShow20PCBubble",
				type = "bool",
				const = false,
				value = "false"
			},
			{
				name = "CurrentDistToTarget",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "CurrentEP",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "CurrentHpPercent",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "Weight_JumpBack",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "Weight_RunBack",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "Weight_Skill",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "Weight_CommonAttack",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "Weight_NothingToDo",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "maxSkillDist",
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
				name = "goBackDist",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "tNewTargetForCatchMode",
				type = "int",
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
				name = "tAngryPrepare",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "tDrowningDepth",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "tFlyHeight",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "tVerticalDistToTgt",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "tSkillPlan",
				type = "string",
				const = "0",
				value = "0"
			},
			{
				name = "tSkillUsed",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "tCurrentTactics",
				type = "string",
				const = "0",
				value = "0"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "569",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Compute",
						id = "687",
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
						class = "Assignment",
						id = "686",
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
						class = "DecoratorLoop",
						id = "570",
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
									id = "464",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "117",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Assignment",
															id = "1398",
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
															id = "116",
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
															id = "550",
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
															class = "Assignment",
															id = "121",
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
															id = "118",
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
															class = "Assignment",
															id = "229",
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
															class = "Assignment",
															id = "252",
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
															class = "Assignment",
															id = "249",
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
															class = "Assignment",
															id = "250",
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
															class = "Assignment",
															id = "251",
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
															class = "Assignment",
															id = "458",
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
															class = "Assignment",
															id = "1123",
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
															class = "Assignment",
															id = "1366",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentTactics"
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
												class = "Selector",
												id = "6",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Sequence",
															id = "624",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "623",
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
																		id = "640",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "And",
																					id = "641",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "635",
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
																								id = "642",
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
																					id = "638",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Action",
																								id = "649",
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
																								id = "648",
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
																					class = "Sequence",
																					id = "689",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Assignment",
																								id = "690",
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
																								class = "IfElse",
																								id = "645",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "And",
																											id = "653",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "636",
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
																														class = "Condition",
																														id = "678",
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
																											class = "IfElse",
																											id = "679",
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
																														id = "661",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Compute",
																																	id = "691",
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
																																	class = "Action",
																																	id = "659",
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
																																	class = "Action",
																																	id = "658",
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
																																	class = "Action",
																																	id = "660",
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
																														id = "680",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "682",
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
																																	id = "681",
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
																											id = "664",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Sequence",
																														id = "627",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "677",
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
																																	id = "628",
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
																														id = "665",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "663",
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
																																	id = "669",
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
																																	id = "671",
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
															class = "Selector",
															id = "436",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Sequence",
																		id = "1402",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "DecoratorAlwaysSuccess",
																					id = "1444",
																					properties = {
																						{
																							DecorateWhenChildEnds = "true"
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Sequence",
																								id = "1400",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Or",
																											id = "1446",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "And",
																														id = "1451",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "1369",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				field = "tCurrentTactics"
																																			}
																																		},
																																		{
																																			Opr = {
																																				const = "Tactics_Stage1"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Or",
																																	id = "1458",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1452",
																																				properties = {
																																					{
																																						Operator = "LessEqual"
																																					},
																																					{
																																						Opl = {
																																							func = "getTimerValue",
																																							params = {
																																								{
																																									const = "skillCd"
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
																																				id = "1454",
																																				properties = {
																																					{
																																						Operator = "GreaterEqual"
																																					},
																																					{
																																						Opl = {
																																							func = "getTimerValue",
																																							params = {
																																								{
																																									const = "skillCd"
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
																																		}
																																	}
																																}
																															}
																														}
																													}
																												},
																												{
																													node = {
																														class = "And",
																														id = "1450",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "1448",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				field = "tCurrentTactics"
																																			}
																																		},
																																		{
																																			Opr = {
																																				const = "DPS_Die"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Or",
																																	id = "1461",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1460",
																																				properties = {
																																					{
																																						Operator = "LessEqual"
																																					},
																																					{
																																						Opl = {
																																							func = "getTimerValue",
																																							params = {
																																								{
																																									const = "skillCd"
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
																																				id = "1459",
																																				properties = {
																																					{
																																						Operator = "GreaterEqual"
																																					},
																																					{
																																						Opl = {
																																							func = "getTimerValue",
																																							params = {
																																								{
																																									const = "skillCd"
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
																											id = "1388",
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
																														const = 11730610
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
																											id = "1406",
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
																																field = "skillId"
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
																											id = "1410",
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
																																field = "skillId"
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
																											class = "Compute",
																											id = "1437",
																											properties = {
																												{
																													Operator = "Add"
																												},
																												{
																													Opl = {
																														field = "skillStopDist"
																													}
																												},
																												{
																													Opr1 = {
																														field = "skillStopDist"
																													}
																												},
																												{
																													Opr2 = {
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
																											class = "IfElse",
																											id = "1411",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "1409",
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
																														class = "Sequence",
																														id = "1408",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "1412",
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
																																	class = "Action",
																																	id = "1413",
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
																														class = "Action",
																														id = "1407",
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
																											class = "Action",
																											id = "1457",
																											properties = {
																												{
																													Method = {
																														func = "cleanTimer",
																														params = {
																															{
																																const = "skillCd"
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
																											id = "1455",
																											properties = {
																												{
																													Method = {
																														func = "startTimer",
																														params = {
																															{
																																const = "skillCd"
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
																					class = "Selector",
																					id = "1463",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Selector",
																								id = "1394",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "1423",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Sequence",
																														id = "1420",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Assignment",
																																	id = "1462",
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
																																	class = "Condition",
																																	id = "1421",
																																	properties = {
																																		{
																																			Operator = "Less"
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
																																	id = "1422",
																																	properties = {
																																		{
																																			Operator = "NotEqual"
																																		},
																																		{
																																			Opl = {
																																				func = "isGoBackCd"
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
																														class = "Sequence",
																														id = "1414",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Compute",
																																	id = "1415",
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
																																	class = "IfElse",
																																	id = "1416",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1418",
																																				properties = {
																																					{
																																						Operator = "Greater"
																																					},
																																					{
																																						Opl = {
																																							func = "getRandomInt",
																																							params = {
																																								{
																																									const = 0
																																								},
																																								{
																																									const = 100
																																								}
																																							}
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
																																				id = "1417",
																																				properties = {
																																					{
																																						Method = {
																																							func = "jumpBackByLinkAngle",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = 45
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
																																				id = "1419",
																																				properties = {
																																					{
																																						Method = {
																																							func = "jumpBackByLinkAngle",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = -45
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
																											class = "Sequence",
																											id = "1425",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "1424",
																														properties = {
																															{
																																Operator = "GreaterEqual"
																															},
																															{
																																Opl = {
																																	func = "getEp",
																																	params = {
																																		{
																																			field = "selfId"
																																		}
																																	}
																																}
																															},
																															{
																																Opr = {
																																	const = 60
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
																														id = "1434",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Assignment",
																																	id = "1435",
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
																																				const = 11730110
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
																																	id = "1433",
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
																																						field = "skillId"
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
																																	id = "1432",
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
																																						field = "skillId"
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
																																	id = "1431",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1426",
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
																																				class = "Sequence",
																																				id = "1427",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Action",
																																							id = "1428",
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
																																							class = "Action",
																																							id = "1430",
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
																																				class = "Action",
																																				id = "1429",
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
																									}
																								}
																							}
																						},
																						{
																							node = {
																								class = "ReferencedBehavior",
																								id = "1465",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_AutoCombat_NormalAtkCombo"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "CurrentDistToTarget",
																												Value = {
																													field = "CurrentDistToTarget"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "CurrentBoxDistToTarget",
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
																},
																{
																	node = {
																		class = "IfElse",
																		id = "442",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "And",
																					id = "445",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "417",
																								properties = {
																									{
																										Operator = "Greater"
																									},
																									{
																										Opl = {
																											field = "CurrentDistToTarget"
																										}
																									},
																									{
																										Opr = {
																											field = "maxAttackDist"
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
																								id = "402",
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
																								id = "415",
																								properties = {
																									{
																										Operator = "Less"
																									},
																									{
																										Opl = {
																											field = "maxAttackDist"
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					class = "Sequence",
																					id = "584",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "IfElse",
																								id = "593",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "592",
																											properties = {
																												{
																													Operator = "Equal"
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
																											class = "Sequence",
																											id = "596",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "605",
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
																														class = "Assignment",
																														id = "604",
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
																											class = "Noop",
																											id = "594",
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
																								class = "Condition",
																								id = "599",
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
																											field = "maxAttackDist"
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
																								id = "595",
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
																								class = "IfElse",
																								id = "601",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "602",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														field = "tAngryPrepare"
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
																											id = "603",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "597",
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
																																			const = 4
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
																														id = "600",
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
																											class = "Noop",
																											id = "598",
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
																								class = "Selector",
																								id = "589",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "588",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "590",
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
																														id = "586",
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
																											id = "587",
																											properties = {
																												{
																													Method = {
																														func = "playAction",
																														params = {
																															{
																																const = "Behav_Angry"
																															},
																															{
																																const = 0
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
																								id = "591",
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_BotPet_AutoCombat_SUP_151006
