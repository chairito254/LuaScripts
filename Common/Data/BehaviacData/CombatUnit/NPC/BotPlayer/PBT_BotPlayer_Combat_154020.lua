-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPlayer\\PBT_BotPlayer_Combat_154020.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPlayer_Combat_154020 = {
	behavior = {
		name = "CombatUnit/NPC/BotPlayer/PBT_BotPlayer_Combat_154020",
		version = 149,
		useForRoute = false,
		agenttype = "BotPlayerAgent",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tCurrentPet"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "tCurrentPetHpPercent"
			},
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tSwitchPetId"
			},
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tTargetSkillId"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "tCurrentEp"
			},
			{
				type = "int",
				const = 2,
				value = "2",
				name = "Pet"
			}
		},
		attachments = {},
		node = {
			id = "448",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "438",
						class = "Action",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "SwitchPet"
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
						id = "1",
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
									id = "11",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "5",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "124",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentPet"
																	}
																},
																{
																	Opr = {
																		func = "getPetActorId",
																		params = {
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
															id = "6",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentPetHpPercent"
																	}
																},
																{
																	Opr = {
																		func = "getHpPercent",
																		params = {
																			{
																				field = "tCurrentPet"
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
															id = "12",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "combatTactic"
																	}
																},
																{
																	Opr = {
																		const = "common"
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															id = "115",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentEp"
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
															id = "126",
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
													}
												}
											}
										},
										{
											node = {
												id = "441",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "443",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tSwitchPetId"
																	}
																},
																{
																	Opr = {
																		func = "getPetActorId",
																		params = {
																			{
																				field = "Pet"
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
															id = "440",
															class = "IfElse",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "439",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					func = "getTimerValue",
																					params = {
																						{
																							const = "SwitchPet"
																						}
																					}
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
																		id = "445",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "469",
																					class = "DecoratorLoopUntil",
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
																							Until = "true"
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "468",
																								class = "Selector",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "467",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														field = "tSwitchPetId"
																													}
																												},
																												{
																													Opr = {
																														field = "tCurrentPet"
																													}
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "462",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "466",
																														class = "Action",
																														properties = {
																															{
																																Method = {
																																	func = "waitTime",
																																	params = {
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
																												},
																												{
																													node = {
																														id = "461",
																														class = "And",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "464",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "isInSkill",
																																				params = {
																																					{
																																						field = "tCurrentPet"
																																					},
																																					{
																																						const = 0
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
																																	id = "465",
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
																																						field = "tCurrentPet"
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
																														id = "463",
																														class = "Action",
																														properties = {
																															{
																																Method = {
																																	func = "switchPetByActorId",
																																	params = {
																																		{
																																			field = "tSwitchPetId"
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
																					id = "446",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "startTimer",
																								params = {
																									{
																										const = "SwitchPet"
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
																					id = "450",
																					class = "IfElse",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "451",
																								class = "Condition",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											field = "Pet"
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
																								id = "458",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "Pet"
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
																								id = "454",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "456",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														field = "Pet"
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
																											id = "459",
																											class = "Assignment",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "Pet"
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
																											id = "460",
																											class = "Assignment",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "Pet"
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
																						}
																					}
																				}
																			}
																		}
																	}
																},
																{
																	node = {
																		id = "442",
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
												id = "247",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "248",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentPet"
																	}
																},
																{
																	Opr = {
																		func = "getPetActorId",
																		params = {
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
															id = "240",
															class = "IfElse",
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
																					func = "checkTargetIsFunctionId",
																					params = {
																						{
																							field = "tCurrentPet"
																						},
																						{
																							const = "DPS"
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
																		id = "243",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "244",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "waitTime",
																								params = {
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
																					id = "242",
																					class = "Sequence",
																					properties = {},
																					attachments = {
																						{
																							class = "Precondition",
																							id = "155",
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
																										func = "getHpPercent",
																										params = {
																											{
																												field = "tCurrentPet"
																											}
																										}
																									}
																								},
																								{
																									Opr2 = {
																										const = 0.2
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
																								id = "444",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "waitTime",
																											params = {
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
																						}
																					}
																				}
																			}
																		}
																	}
																},
																{
																	node = {
																		id = "246",
																		class = "Sequence",
																		properties = {},
																		attachments = {
																			{
																				class = "Precondition",
																				id = "155",
																				transition = false,
																				effector = false,
																				precondition = true,
																				properties = {
																					{
																						BinaryOperator = "And"
																					},
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
																						Opr2 = {
																							const = false
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
																					id = "241",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "waitTime",
																								params = {
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
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

return PBT_BotPlayer_Combat_154020
