-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_TransferTarget.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_TransferTarget = {
	behavior = {
		useForRoute = false,
		version = 27,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_TransferTarget",
		properties = {},
		pars = {
			{
				type = "float",
				const = 0,
				value = "0",
				name = "CurrentDistToTarget"
			},
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tActorId"
			},
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tSkillID"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "maxSkillDist"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "skillStopDist"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "CurrentBoxDistToTarget"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "tMaxAttackDist"
			}
		},
		attachments = {},
		node = {
			class = "DecoratorLoop",
			id = "46",
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
						class = "Sequence",
						id = "3",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Sequence",
									id = "27",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Assignment",
												id = "44",
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
																	field = "tActorId"
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
												id = "45",
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
																	field = "tActorId"
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
									class = "Assignment",
									id = "29",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tSkillID"
											}
										},
										{
											Opr = {
												func = "getSkillIdByFeature",
												params = {
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
									class = "IfElse",
									id = "30",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "31",
												properties = {
													{
														Operator = "NotEqual"
													},
													{
														Opl = {
															field = "tSkillID"
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
												id = "32",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Assignment",
															id = "40",
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
																				field = "tSkillID"
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
															id = "41",
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
																				field = "tSkillID"
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
															id = "34",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "42",
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
																		id = "38",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "37",
																					properties = {
																						{
																							Method = {
																								func = "moveToTarget",
																								params = {
																									{
																										field = "tActorId"
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
																					id = "39",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tActorId"
																									},
																									{
																										field = "tSkillID"
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
																		id = "36",
																		properties = {
																			{
																				Method = {
																					func = "castSkill",
																					params = {
																						{
																							field = "tActorId"
																						},
																						{
																							field = "tSkillID"
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
																		field = "tMaxAttackDist"
																	}
																},
																{
																	Opr1 = {
																		field = "maxAttackDist"
																	}
																},
																{
																	Opr2 = {
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
															class = "IfElse",
															id = "49",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Or",
																		id = "48",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "58",
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
																					id = "54",
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
																		id = "50",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "51",
																					properties = {
																						{
																							Method = {
																								func = "moveToTarget",
																								params = {
																									{
																										field = "tActorId"
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
																					class = "Parallel",
																					id = "55",
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
																								class = "Action",
																								id = "53",
																								properties = {
																									{
																										Method = {
																											func = "castNormalAtkCombo",
																											params = {
																												{
																													field = "tActorId"
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
																													field = "tMaxAttackDist"
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
																						},
																						{
																							node = {
																								class = "Assignment",
																								id = "47",
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
																													field = "tActorId"
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
																			}
																		}
																	}
																},
																{
																	node = {
																		class = "Parallel",
																		id = "57",
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
																					class = "Action",
																					id = "52",
																					properties = {
																						{
																							Method = {
																								func = "castNormalAtkCombo",
																								params = {
																									{
																										field = "tActorId"
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
																										field = "tMaxAttackDist"
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
																			},
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
																								field = "CurrentDistToTarget"
																							}
																						},
																						{
																							Opr = {
																								func = "getDistByTgt",
																								params = {
																									{
																										field = "tActorId"
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
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

return PBT_TransferTarget
