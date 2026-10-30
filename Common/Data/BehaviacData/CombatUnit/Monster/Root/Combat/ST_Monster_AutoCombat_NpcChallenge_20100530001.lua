-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_NpcChallenge_20100530001.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_NpcChallenge_20100530001 = {
	behavior = {
		useForRoute = false,
		version = 330,
		agenttype = "PetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_NpcChallenge_20100530001",
		properties = {},
		pars = {
			{
				value = "false",
				const = false,
				type = "bool",
				name = "tShow50PCBubble"
			},
			{
				value = "false",
				const = false,
				type = "bool",
				name = "tShow20PCBubble"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "CurrentDistToTarget"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "CurrentEP"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "CurrentHpPercent"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_JumpBack"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_RunBack"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_Skill"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_CommonAttack"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_NothingToDo"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "maxSkillDist"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "skillStopDist"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "goBackDist"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tNewTargetForCatchMode"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "CurrentBoxDistToTarget"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tAngryPrepare"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tDrowningDepth"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tFlyHeight"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tVerticalDistToTgt"
			},
			{
				value = "0",
				const = "0",
				type = "string",
				name = "tSkillPlan"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tSkillUsed"
			},
			{
				value = "0",
				const = "0",
				type = "string",
				name = "tCurtentTactic"
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
									class = "Parallel",
									id = "10",
									properties = {
										{
											ChildFinishPolicy = "CHILDFINISH_LOOP"
										},
										{
											ExitPolicy = "EXIT_ABORT_RUNNINGSIBLINGS"
										},
										{
											FailurePolicy = "FAIL_ON_ONE"
										},
										{
											SuccessPolicy = "SUCCEED_ON_ALL"
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
																		id = "1461",
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
																		id = "1578",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "tCurtentTactic"
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
																					id = "1579",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "1580",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											field = "tCurtentTactic"
																										}
																									},
																									{
																										Opr = {
																											const = "SLEEP"
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
																								id = "1581",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "1569",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "1573",
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
																														id = "1574",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkSkillNotInCd",
																																	params = {
																																		{
																																			const = 10530530
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
																														class = "Assignment",
																														id = "1571",
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
																																			const = 10530530
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
																														id = "1572",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "1567",
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
																																	id = "1565",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Action",
																																				id = "1568",
																																				properties = {
																																					{
																																						Method = {
																																							func = "moveToTarget",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = 2.1
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
																																				class = "Action",
																																				id = "1600",
																																				properties = {
																																					{
																																						Method = {
																																							func = "castSkill",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = 10530530
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
																																				id = "1566",
																																				properties = {
																																					{
																																						Method = {
																																							func = "castSkill",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = 10530210
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
																																	class = "Sequence",
																																	id = "1577",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Action",
																																				id = "1601",
																																				properties = {
																																					{
																																						Method = {
																																							func = "castSkill",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = 10530530
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
																																				id = "1570",
																																				properties = {
																																					{
																																						Method = {
																																							func = "castSkill",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = 10530210
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
																											class = "Sequence",
																											id = "1582",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "1598",
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
																														class = "IfElse",
																														id = "1588",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "1590",
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
																																	class = "Sequence",
																																	id = "1584",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1585",
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
																																				class = "Assignment",
																																				id = "1587",
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
																																				class = "Action",
																																				id = "1586",
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
																																				class = "Compute",
																																				id = "1589",
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
																																				class = "Action",
																																				id = "1583",
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
																																	class = "Sequence",
																																	id = "1596",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1597",
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
																																				class = "Action",
																																				id = "1592",
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
																																				class = "Assignment",
																																				id = "1594",
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
																																				class = "Action",
																																				id = "1593",
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
																																				class = "Compute",
																																				id = "1595",
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
																																				class = "Action",
																																				id = "1591",
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
																											class = "Action",
																											id = "1602",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 10530210
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
																											class = "ReferencedBehavior",
																											id = "1599",
																											properties = {
																												{
																													ReferenceBehavior = {
																														const = "PBT_AutoCombat_Attack"
																													}
																												},
																												{
																													subTreeProperties = {}
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
																					id = "18",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Sequence",
																								id = "723",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "115",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "120",
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
																														id = "208",
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
																												},
																												{
																													node = {
																														class = "Assignment",
																														id = "125",
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
																											id = "724",
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
																														id = "713",
																														properties = {
																															{
																																DecorateWhenChildEnds = "false"
																															},
																															{
																																Weight = {
																																	field = "Weight_JumpBack"
																																}
																															}
																														},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Sequence",
																																	id = "714",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Compute",
																																				id = "715",
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
																																				id = "718",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Condition",
																																							id = "722",
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
																																							id = "720",
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
																																							id = "719",
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
																														class = "DecoratorWeight",
																														id = "712",
																														properties = {
																															{
																																DecorateWhenChildEnds = "false"
																															},
																															{
																																Weight = {
																																	field = "Weight_RunBack"
																																}
																															}
																														},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Sequence",
																																	id = "716",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Compute",
																																				id = "717",
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
																																				class = "Action",
																																				id = "721",
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
																																									const = 5
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
																								class = "Selector",
																								id = "737",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "129",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "130",
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
																														class = "Assignment",
																														id = "152",
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
																																			const = false
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = false
																																		},
																																		{
																																			const = false
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
																														id = "154",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkCanUseSkill",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			field = "skillId"
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
																														id = "728",
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											class = "Sequence",
																											id = "158",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "157",
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
																																	const = 0.7
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
																																			const = false
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = false
																																		},
																																		{
																																			const = false
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
																														id = "159",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkCanUseSkill",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			field = "skillId"
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
																														id = "729",
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											class = "Sequence",
																											id = "163",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "And",
																														id = "166",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "162",
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
																																				const = 0.8
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
																																	id = "253",
																																	properties = {
																																		{
																																			Operator = "LessEqual"
																																		},
																																		{
																																			Opl = {
																																				func = "getShieldValue",
																																				params = {
																																					{
																																						field = "selfId"
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
																															}
																														}
																													}
																												},
																												{
																													node = {
																														class = "Assignment",
																														id = "161",
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
																																			const = false
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = false
																																		},
																																		{
																																			const = false
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
																														id = "164",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkCanUseSkill",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			field = "skillId"
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
																														id = "732",
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
																								id = "1366",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "1415",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "1414",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkCharacterState",
																																	params = {
																																		{
																																			const = "SNEAK"
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
																														id = "1397",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "1429",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "checkSkillExistByFeatureId",
																																				params = {
																																					{
																																						field = "selfId"
																																					},
																																					{
																																						const = 16
																																					},
																																					{
																																						const = true
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
																																	id = "1412",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "1398",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Assignment",
																																							id = "1368",
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
																																												const = 16
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
																																							id = "1413",
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
																																					},
																																					{
																																						node = {
																																							class = "Sequence",
																																							id = "1388",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Assignment",
																																										id = "1383",
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
																																										id = "1384",
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
																																										id = "1385",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Condition",
																																													id = "1386",
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
																																													id = "1389",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "1387",
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
																																																id = "1395",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castCombo",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					field = "skillId"
																																																				},
																																																				{
																																																					const = 3
																																																				},
																																																				{
																																																					const = 0
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
																																																id = "1426",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "showEmojiBubble",
																																																			params = {
																																																				{
																																																					const = "Happy"
																																																				},
																																																				{
																																																					const = 5
																																																				},
																																																				{
																																																					const = false
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
																																													id = "1427",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "1396",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castCombo",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					field = "skillId"
																																																				},
																																																				{
																																																					const = 3
																																																				},
																																																				{
																																																					const = 0
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
																																																id = "1428",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "showEmojiBubble",
																																																			params = {
																																																				{
																																																					const = "Happy"
																																																				},
																																																				{
																																																					const = 5
																																																				},
																																																				{
																																																					const = false
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
																																		},
																																		{
																																			node = {
																																				class = "Selector",
																																				id = "1399",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Sequence",
																																							id = "1407",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Assignment",
																																										id = "1408",
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
																																										id = "1409",
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
																																										class = "Action",
																																										id = "1410",
																																										properties = {
																																											{
																																												Method = {
																																													func = "walkBack",
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
																																															const = 2
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
																																							id = "1400",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "DecoratorAlwaysSuccess",
																																										id = "1401",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "SelectorProbability",
																																													id = "1402",
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
																																																id = "1403",
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
																																																			id = "1418",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Action",
																																																						id = "1417",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "showEmojiBubble",
																																																									params = {
																																																										{
																																																											const = "Think"
																																																										},
																																																										{
																																																											const = 5
																																																										},
																																																										{
																																																											const = false
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
																																																						id = "1405",
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
																																																class = "DecoratorWeight",
																																																id = "1404",
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
																																																			id = "1419",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Action",
																																																						id = "1420",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "showEmojiBubble",
																																																									params = {
																																																										{
																																																											const = "Think"
																																																										},
																																																										{
																																																											const = 5
																																																										},
																																																										{
																																																											const = false
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
																																																						id = "1406",
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
																																										id = "1411",
																																										properties = {
																																											{
																																												Method = {
																																													func = "waitTime",
																																													params = {
																																														{
																																															const = 2
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
																																	id = "1416",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "DecoratorAlwaysSuccess",
																																				id = "1382",
																																				properties = {
																																					{
																																						DecorateWhenChildEnds = "false"
																																					}
																																				},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Sequence",
																																							id = "1373",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Selector",
																																										id = "1381",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Condition",
																																													id = "1371",
																																													properties = {
																																														{
																																															Operator = "Less"
																																														},
																																														{
																																															Opl = {
																																																func = "getTimerValue",
																																																params = {
																																																	{
																																																		const = "eventNoticeCD"
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
																																													id = "1372",
																																													properties = {
																																														{
																																															Operator = "GreaterEqual"
																																														},
																																														{
																																															Opl = {
																																																func = "getTimerValue",
																																																params = {
																																																	{
																																																		const = "eventNoticeCD"
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
																																											}
																																										}
																																									}
																																								},
																																								{
																																									node = {
																																										class = "Action",
																																										id = "1369",
																																										properties = {
																																											{
																																												Method = {
																																													func = "startTimer",
																																													params = {
																																														{
																																															const = "eventNoticeCD"
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
																																				id = "1370",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Sequence",
																																							id = "1374",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Assignment",
																																										id = "1379",
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
																																										id = "1380",
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
																																										class = "Action",
																																										id = "1375",
																																										properties = {
																																											{
																																												Method = {
																																													func = "walkBack",
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
																																															const = 2
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
																																							id = "1377",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "DecoratorAlwaysSuccess",
																																										id = "1394",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "SelectorProbability",
																																													id = "1390",
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
																																																id = "1391",
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
																																																			id = "1421",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Action",
																																																						id = "1422",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "showEmojiBubble",
																																																									params = {
																																																										{
																																																											const = "Think"
																																																										},
																																																										{
																																																											const = 5
																																																										},
																																																										{
																																																											const = false
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
																																																						id = "1378",
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
																																																class = "DecoratorWeight",
																																																id = "1392",
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
																																																			id = "1423",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						class = "Action",
																																																						id = "1424",
																																																						properties = {
																																																							{
																																																								Method = {
																																																									func = "showEmojiBubble",
																																																									params = {
																																																										{
																																																											const = "Think"
																																																										},
																																																										{
																																																											const = 5
																																																										},
																																																										{
																																																											const = false
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
																																																						id = "1393",
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
																																										id = "1376",
																																										properties = {
																																											{
																																												Method = {
																																													func = "waitTime",
																																													params = {
																																														{
																																															const = 2
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
																											class = "Sequence",
																											id = "1431",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "1432",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkCharacterState",
																																	params = {
																																		{
																																			const = "FLYING"
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
																														class = "Selector",
																														id = "1433",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Sequence",
																																	id = "1434",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1435",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "checkSkillExistByFeatureId",
																																							params = {
																																								{
																																									field = "selfId"
																																								},
																																								{
																																									const = 15
																																								},
																																								{
																																									const = true
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
																																				class = "Assignment",
																																				id = "1436",
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
																																									const = 15
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
																																				id = "1437",
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
																																		},
																																		{
																																			node = {
																																				class = "Sequence",
																																				id = "1445",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Assignment",
																																							id = "1438",
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
																																							id = "1439",
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
																																							id = "1440",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "1441",
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
																																										id = "1442",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Action",
																																													id = "1443",
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
																																													id = "1446",
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
																																											}
																																										}
																																									}
																																								},
																																								{
																																									node = {
																																										class = "Action",
																																										id = "1444",
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
																																	id = "1447",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1457",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "checkNormalAttackByTags",
																																							params = {
																																								{
																																									field = "selfId"
																																								},
																																								{
																																									const = 5
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
																																				id = "1451",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Or",
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
																																										id = "1449",
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
																																								}
																																							}
																																						}
																																					},
																																					{
																																						node = {
																																							class = "Sequence",
																																							id = "1452",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Action",
																																										id = "1453",
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
																																										id = "1454",
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
																																					},
																																					{
																																						node = {
																																							class = "Action",
																																							id = "1455",
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
																																							attachments = {
																																								{
																																									precondition = true,
																																									class = "Precondition",
																																									transition = false,
																																									id = "356",
																																									effector = false,
																																									properties = {
																																										{
																																											BinaryOperator = "And"
																																										},
																																										{
																																											Operator = "LessEqual"
																																										},
																																										{
																																											Opl = {
																																												field = "CurrentDistToTarget"
																																											}
																																										},
																																										{
																																											Opr2 = {
																																												field = "maxAttackDist"
																																											}
																																										},
																																										{
																																											Phase = "Update"
																																										}
																																									}
																																								}
																																							},
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
																																	id = "1468",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "And",
																																				id = "1469",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Condition",
																																							id = "1470",
																																							properties = {
																																								{
																																									Operator = "Equal"
																																								},
																																								{
																																									Opl = {
																																										func = "checkSkillExistByFeatureId",
																																										params = {
																																											{
																																												field = "selfId"
																																											},
																																											{
																																												const = 15
																																											},
																																											{
																																												const = true
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
																																							id = "1480",
																																							properties = {
																																								{
																																									Operator = "Equal"
																																								},
																																								{
																																									Opl = {
																																										func = "checkNormalAttackByTags",
																																										params = {
																																											{
																																												field = "selfId"
																																											},
																																											{
																																												const = 5
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
																																					}
																																				}
																																			}
																																		},
																																		{
																																			node = {
																																				class = "DecoratorAlwaysSuccess",
																																				id = "1471",
																																				properties = {
																																					{
																																						DecorateWhenChildEnds = "false"
																																					}
																																				},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Sequence",
																																							id = "1479",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Sequence",
																																										id = "1473",
																																										properties = {},
																																										attachments = {
																																											{
																																												precondition = false,
																																												class = "Effector",
																																												transition = false,
																																												id = "1288",
																																												effector = true,
																																												properties = {
																																													{
																																														Operator = "Invalid"
																																													},
																																													{
																																														Opl = {
																																															func = "checkCanMoveToTarget",
																																															params = {
																																																{
																																																	field = "tgt"
																																																},
																																																{
																																																	const = 5
																																																}
																																															}
																																														}
																																													},
																																													{
																																														Phase = "Success"
																																													}
																																												}
																																											}
																																										},
																																										children = {
																																											{
																																												node = {
																																													class = "Action",
																																													id = "1472",
																																													properties = {
																																														{
																																															Method = {
																																																func = "followEntityInCombat",
																																																params = {
																																																	{
																																																		field = "masterId"
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
																																										class = "Selector",
																																										id = "1478",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Condition",
																																													id = "1476",
																																													properties = {
																																														{
																																															Operator = "Less"
																																														},
																																														{
																																															Opl = {
																																																func = "getTimerValue",
																																																params = {
																																																	{
																																																		const = "eventNoticeCD"
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
																																													id = "1477",
																																													properties = {
																																														{
																																															Operator = "GreaterEqual"
																																														},
																																														{
																																															Opl = {
																																																func = "getTimerValue",
																																																params = {
																																																	{
																																																		const = "eventNoticeCD"
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
																																											}
																																										}
																																									}
																																								},
																																								{
																																									node = {
																																										class = "Action",
																																										id = "1475",
																																										properties = {
																																											{
																																												Method = {
																																													func = "startTimer",
																																													params = {
																																														{
																																															const = "eventNoticeCD"
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
																																	id = "1466",
																																	properties = {},
																																	attachments = {
																																		{
																																			precondition = false,
																																			class = "Effector",
																																			transition = false,
																																			id = "1288",
																																			effector = true,
																																			properties = {
																																				{
																																					Operator = "Invalid"
																																				},
																																				{
																																					Opl = {
																																						func = "checkCanMoveToTarget",
																																						params = {
																																							{
																																								field = "tgt"
																																							},
																																							{
																																								const = 5
																																							}
																																						}
																																					}
																																				},
																																				{
																																					Phase = "Success"
																																				}
																																			}
																																		}
																																	},
																																	children = {
																																		{
																																			node = {
																																				class = "Action",
																																				id = "1467",
																																				properties = {
																																					{
																																						Method = {
																																							func = "followEntityInCombat",
																																							params = {
																																								{
																																									field = "masterId"
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
																											class = "DecoratorAlwaysFailure",
																											id = "1430",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Noop",
																														id = "1425",
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
																								class = "Selector",
																								id = "1345",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "1510",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Or",
																														id = "1519",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "1506",
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
																																	class = "Condition",
																																	id = "1520",
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
																														class = "IfElse",
																														id = "1546",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "1547",
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
																																	class = "IfElse",
																																	id = "1521",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1522",
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
																																				class = "Sequence",
																																				id = "1346",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Condition",
																																							id = "1347",
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
																																							class = "Assignment",
																																							id = "1351",
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
																																							class = "Action",
																																							id = "1349",
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
																																							class = "Compute",
																																							id = "1464",
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
																																							class = "Action",
																																							id = "1462",
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
																																				class = "Sequence",
																																				id = "1529",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Condition",
																																							id = "1530",
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
																																							class = "Action",
																																							id = "1524",
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
																																							class = "Assignment",
																																							id = "1527",
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
																																							class = "Action",
																																							id = "1526",
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
																																							class = "Compute",
																																							id = "1528",
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
																																							class = "Action",
																																							id = "1525",
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
																															},
																															{
																																node = {
																																	class = "Noop",
																																	id = "1548",
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
																														id = "1535",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Assignment",
																																	id = "1539",
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
																																	id = "1540",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "checkSkillNotInCd",
																																				params = {
																																					{
																																						const = 10530530
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
																																	class = "Assignment",
																																	id = "1537",
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
																																						const = 10530530
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
																																	id = "1538",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "1533",
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
																																				id = "1531",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Action",
																																							id = "1534",
																																							properties = {
																																								{
																																									Method = {
																																										func = "moveToTarget",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 2.1
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
																																							class = "Action",
																																							id = "1541",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castChargetSkill",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 10530530
																																											},
																																											{
																																												const = 2.2
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
																																					},
																																					{
																																						node = {
																																							class = "Action",
																																							id = "1532",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castSkill",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 10530210
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
																																				class = "Sequence",
																																				id = "1543",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Action",
																																							id = "1542",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castChargetSkill",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 10530530
																																											},
																																											{
																																												const = 2.2
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
																																					},
																																					{
																																						node = {
																																							class = "Action",
																																							id = "1536",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castSkill",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 10530210
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
																											id = "1545",
																											properties = {
																												{
																													ReferenceBehavior = {
																														const = "PBT_AutoCombat_Attack"
																													}
																												},
																												{
																													subTreeProperties = {
																														{
																															Type = "Self",
																															Name = "tShow50PCBubble",
																															Value = {
																																field = "tShow50PCBubble"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tShow20PCBubble",
																															Value = {
																																field = "tShow20PCBubble"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "CurrentDistToTarget",
																															Value = {
																																field = "CurrentDistToTarget"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "CurrentEP",
																															Value = {
																																field = "CurrentEP"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "CurrentHpPercent",
																															Value = {
																																field = "CurrentHpPercent"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "Weight_JumpBack",
																															Value = {
																																field = "Weight_JumpBack"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "Weight_RunBack",
																															Value = {
																																field = "Weight_RunBack"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "Weight_Skill",
																															Value = {
																																field = "Weight_Skill"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "Weight_CommonAttack",
																															Value = {
																																field = "Weight_CommonAttack"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "Weight_NothingToDo",
																															Value = {
																																field = "Weight_NothingToDo"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "maxSkillDist",
																															Value = {
																																field = "maxSkillDist"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "skillStopDist",
																															Value = {
																																field = "skillStopDist"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "goBackDist",
																															Value = {
																																field = "goBackDist"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tNewTargetForCatchMode",
																															Value = {
																																field = "tNewTargetForCatchMode"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "CurrentBoxDistToTarget",
																															Value = {
																																field = "CurrentBoxDistToTarget"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tAngryPrepare",
																															Value = {
																																field = "tAngryPrepare"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tDrowningDepth",
																															Value = {
																																field = "tDrowningDepth"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tFlyHeight",
																															Value = {
																																field = "tFlyHeight"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tVerticalDistToTgt",
																															Value = {
																																field = "tVerticalDistToTgt"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tSkillPlan",
																															Value = {
																																field = "tSkillPlan"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tSkillUsed",
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
																								class = "IfElse",
																								id = "758",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Or",
																											id = "757",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "755",
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
																														id = "756",
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											class = "Sequence",
																											id = "759",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "760",
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
																														id = "761",
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
																									},
																									{
																										node = {
																											class = "Action",
																											id = "762",
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
																											attachments = {
																												{
																													precondition = true,
																													class = "Precondition",
																													transition = false,
																													id = "356",
																													effector = false,
																													properties = {
																														{
																															BinaryOperator = "And"
																														},
																														{
																															Operator = "LessEqual"
																														},
																														{
																															Opl = {
																																field = "CurrentDistToTarget"
																															}
																														},
																														{
																															Opr2 = {
																																field = "maxAttackDist"
																															}
																														},
																														{
																															Phase = "Update"
																														}
																													}
																												}
																											},
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
												id = "80",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Sequence",
															id = "87",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "And",
																		id = "100",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "101",
																					properties = {
																						{
																							Operator = "Less"
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
																					id = "102",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								field = "tShow50PCBubble"
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
																		class = "Action",
																		id = "93",
																		properties = {
																			{
																				Method = {
																					func = "showEmojiBubble",
																					params = {
																						{
																							const = "Cry"
																						},
																						{
																							const = 3
																						},
																						{
																							const = false
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
																		id = "92",
																		properties = {
																			{
																				CastRight = "true"
																			},
																			{
																				Opl = {
																					field = "tShow50PCBubble"
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
															id = "88",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "94",
																		properties = {
																			{
																				Operator = "GreaterEqual"
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
																		class = "Assignment",
																		id = "95",
																		properties = {
																			{
																				CastRight = "true"
																			},
																			{
																				Opl = {
																					field = "tShow50PCBubble"
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
															class = "Sequence",
															id = "89",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "And",
																		id = "103",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "104",
																					properties = {
																						{
																							Operator = "Less"
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
																								const = 0.2
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
																					id = "105",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								field = "tShow20PCBubble"
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
																		class = "Action",
																		id = "96",
																		properties = {
																			{
																				Method = {
																					func = "showEmojiBubble",
																					params = {
																						{
																							const = "Cry"
																						},
																						{
																							const = 3
																						},
																						{
																							const = false
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
																		id = "97",
																		properties = {
																			{
																				CastRight = "true"
																			},
																			{
																				Opl = {
																					field = "tShow20PCBubble"
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
															id = "90",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "98",
																		properties = {
																			{
																				Operator = "GreaterEqual"
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
																					const = 0.2
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
																		id = "99",
																		properties = {
																			{
																				CastRight = "true"
																			},
																			{
																				Opl = {
																					field = "tShow20PCBubble"
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
															class = "Noop",
															id = "91",
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

return ST_Monster_AutoCombat_NpcChallenge_20100530001
