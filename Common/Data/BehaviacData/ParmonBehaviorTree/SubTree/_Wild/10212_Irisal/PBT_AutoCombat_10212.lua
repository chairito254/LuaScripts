-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10212_Irisal\\PBT_AutoCombat_10212.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_AutoCombat_10212 = {
	behavior = {
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/_Wild/10212_Irisal/PBT_AutoCombat_10212",
		agenttype = "PetAgent",
		version = 42,
		properties = {},
		pars = {
			{
				name = "CurrentEP",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "maxSkillDist",
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
				name = "goBackDist",
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
				name = "tSkillUsed",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "skillId",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "CurrentDistToTarget",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "CurrentHpPercent",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "Weight_RunBack",
				const = 0,
				value = "0",
				type = "int"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "49",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Sequence",
						id = "52",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Assignment",
									id = "63",
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
									id = "53",
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
									id = "62",
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
									id = "55",
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
									id = "54",
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
									id = "56",
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
									id = "57",
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
									id = "64",
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
						class = "Sequence",
						id = "95",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "93",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkSkillExist",
												params = {
													{
														field = "selfId"
													},
													{
														const = 12120130
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
									class = "IfElse",
									id = "67",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "91",
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
																	const = 912120104
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
												class = "Sequence",
												id = "7",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Selector",
															id = "98",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Sequence",
																		id = "100",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "99",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								func = "checkSkillExist",
																								params = {
																									{
																										field = "selfId"
																									},
																									{
																										const = 12120230
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
																					id = "8",
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
																								const = 12120230
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
																		id = "101",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Assignment",
																					id = "105",
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
																					class = "Condition",
																					id = "106",
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
															class = "Assignment",
															id = "16",
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
															id = "15",
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
															id = "13",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "12",
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
																		id = "14",
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
																					id = "9",
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
																		id = "10",
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
												class = "IfElse",
												id = "78",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "79",
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
															id = "81",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Assignment",
																		id = "80",
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
																							const = 14
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
																		id = "82",
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
																		class = "Assignment",
																		id = "88",
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
																		id = "89",
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
																		id = "90",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "86",
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
																					id = "87",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Action",
																								id = "85",
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
																								id = "83",
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
																					id = "84",
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
															class = "IfElse",
															id = "41",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Or",
																		id = "40",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "38",
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
																					id = "39",
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
																		id = "42",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "43",
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
																					id = "44",
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
																		id = "45",
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
																				class = "Precondition",
																				id = "356",
																				transition = false,
																				effector = false,
																				precondition = true,
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
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

return PBT_AutoCombat_10212
