-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_NpcChallenge_20102630001.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_NpcChallenge_20102630001 = {
	behavior = {
		useForRoute = false,
		agenttype = "PetAgent",
		version = 82,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_NpcChallenge_20102630001",
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				type = "float",
				name = "CurrentEP"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "maxSkillDist"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "skillStopDist"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "goBackDist"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "CurrentBoxDistToTarget"
			},
			{
				const = 0,
				value = "0",
				type = "int",
				name = "tSkillUsed"
			},
			{
				const = 0,
				value = "0",
				type = "int",
				name = "skillId"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "CurrentDistToTarget"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "CurrentHpPercent"
			},
			{
				const = 0,
				value = "0",
				type = "int",
				name = "Weight_RunBack"
			}
		},
		attachments = {},
		node = {
			id = "126",
			class = "DecoratorLoop",
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
						id = "49",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "52",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "123",
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
												id = "53",
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
												id = "62",
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
												id = "55",
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
												id = "54",
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
												id = "56",
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
												id = "57",
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
												id = "64",
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
										}
									}
								}
							},
							{
								node = {
									id = "199",
									class = "Selector",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "200",
												class = "Sequence",
												properties = {},
												attachments = {
													{
														id = "201",
														class = "Precondition",
														transition = false,
														effector = false,
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
																	func = "getSp",
																	params = {
																		{
																			field = "selfId"
																		}
																	}
																}
															},
															{
																Opr2 = {
																	const = 200
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
															id = "259",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "209",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "204",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
																								field = "CurrentEP"
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
																					id = "310",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "283",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "284",
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
																																field = "selfId"
																															},
																															{
																																const = 9126302
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
																											id = "307",
																											class = "Selector",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "294",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "295",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "getTargetBuffLayerCount",
																																				params = {
																																					{
																																						field = "tgt"
																																					},
																																					{
																																						const = 2126301
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
																																	id = "292",
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
																																						const = 12630300
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
																																	id = "293",
																																	class = "IfElse",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "289",
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
																																				id = "287",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "290",
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
																																							id = "291",
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
																																												const = 12630300
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
																																				id = "288",
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
																																									const = 12630300
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
																																	id = "285",
																																	class = "Action",
																																	properties = {
																																		{
																																			Method = {
																																				func = "waitTime",
																																				params = {
																																					{
																																						const = 1
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
																														id = "306",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "308",
																																	class = "Or",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "305",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "getTargetBuffLayerCount",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = 2126301
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
																																				id = "309",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "getTargetBuffLayerCount",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = 2126301
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
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	id = "304",
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
																																						const = 12630200
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
																																	id = "303",
																																	class = "IfElse",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "300",
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
																																				id = "298",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "301",
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
																																							id = "302",
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
																																												const = 12630200
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
																																				id = "299",
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
																																									const = 12630200
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
																																	id = "286",
																																	class = "Action",
																																	properties = {
																																		{
																																			Method = {
																																				func = "waitTime",
																																				params = {
																																					{
																																						const = 1
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
																								id = "260",
																								class = "Selector",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "261",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "263",
																														class = "Or",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "262",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "getTargetBuffLayerCount",
																																				params = {
																																					{
																																						field = "tgt"
																																					},
																																					{
																																						const = 2126301
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
																																	id = "264",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "getTargetBuffLayerCount",
																																				params = {
																																					{
																																						field = "tgt"
																																					},
																																					{
																																						const = 2126301
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
																															}
																														}
																													}
																												},
																												{
																													node = {
																														id = "211",
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
																																			const = 12630300
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
																														id = "213",
																														class = "IfElse",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "207",
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
																																	id = "205",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "208",
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
																																				id = "210",
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
																																									const = 12630300
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
																																	id = "206",
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
																																						const = 12630300
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
																														id = "276",
																														class = "Action",
																														properties = {
																															{
																																Method = {
																																	func = "waitTime",
																																	params = {
																																		{
																																			const = 1
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
																											id = "275",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "274",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "getTargetBuffLayerCount",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = 2126301
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
																														id = "271",
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
																																			const = 12630200
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
																														id = "270",
																														class = "IfElse",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "267",
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
																																	id = "265",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "268",
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
																																				id = "269",
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
																																									const = 12630200
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
																																	id = "266",
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
																																						const = 12630200
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
																														id = "277",
																														class = "Action",
																														properties = {
																															{
																																Method = {
																																	func = "waitTime",
																																	params = {
																																		{
																																			const = 1
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
																		id = "278",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "280",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
																								field = "CurrentEP"
																							}
																						},
																						{
																							Opr = {
																								const = 30
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "281",
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
																										const = 2
																									},
																									{
																										const = -35
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
																		id = "282",
																		class = "ReferencedBehavior",
																		properties = {
																			{
																				ReferenceBehavior = {
																					const = "PBT_AutoCombat_NormalAtkCombo"
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
													},
													{
														node = {
															id = "238",
															class = "Noop",
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
												id = "202",
												class = "Sequence",
												properties = {},
												attachments = {
													{
														id = "201",
														class = "Precondition",
														transition = false,
														effector = false,
														precondition = true,
														properties = {
															{
																BinaryOperator = "And"
															},
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
																Opr2 = {
																	const = 200
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
															id = "247",
															class = "Or",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "245",
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
																		id = "248",
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
															id = "243",
															class = "IfElse",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "249",
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
																		id = "240",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "241",
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
																					id = "257",
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
																					id = "242",
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
																					id = "244",
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
																					id = "239",
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
																		id = "255",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "256",
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
																					id = "251",
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
																					id = "253",
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
																					id = "252",
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
																					id = "254",
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
																					id = "250",
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
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

return ST_Monster_AutoCombat_NpcChallenge_20102630001
