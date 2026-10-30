-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPlayer\\PBT_BotPlayer_Assist_Combat.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPlayer_Assist_Combat = {
	behavior = {
		version = 127,
		useForRoute = false,
		agenttype = "BotPlayerAgent",
		name = "CombatUnit/NPC/BotPlayer/PBT_BotPlayer_Assist_Combat",
		properties = {},
		pars = {
			{
				type = "int",
				name = "tCurrentPet",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "tCurrentPetHpPercent",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tSwitchPetId",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tTargetSkillId",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "tCurrentEp",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tTeammateId1",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tTeammateId2",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tTeammateId3",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "tCurrentBreakPercent",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "tCurrentSp",
				value = "0",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "2",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "381",
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
									func = "getBattlePetActorId",
									params = {
										{
											field = "selfId"
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
																		const = "Common"
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
													},
													{
														node = {
															id = "127",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "128",
																		class = "Assignment",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "tTeammateId1"
																				}
																			},
																			{
																				Opr = {
																					func = "getTeammatePetActorId",
																					params = {
																						{
																							const = 1
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
																		id = "129",
																		class = "Assignment",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "tTeammateId2"
																				}
																			},
																			{
																				Opr = {
																					func = "getTeammatePetActorId",
																					params = {
																						{
																							const = 2
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
																		id = "130",
																		class = "Assignment",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "tTeammateId3"
																				}
																			},
																			{
																				Opr = {
																					func = "getTeammatePetActorId",
																					params = {
																						{
																							const = 3
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
															id = "288",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentBreakPercent"
																	}
																},
																{
																	Opr = {
																		func = "getBreakPercent",
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
															id = "289",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentSp"
																	}
																},
																{
																	Opr = {
																		func = "getSp",
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
													}
												}
											}
										},
										{
											node = {
												id = "4",
												class = "Selector",
												properties = {},
												attachments = {
													{
														precondition = true,
														transition = false,
														id = "462",
														class = "Precondition",
														effector = false,
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
																			field = "tCurrentPet"
																		},
																		{
																			const = 4003032
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
															id = "75",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "132",
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
																		id = "133",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "376",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_HEAL"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Type = "Self",
																									Name = "tCurrentPet",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentPetHpPercent",
																									Value = {
																										field = "tCurrentPetHpPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tSwitchPetId",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTargetSkillId",
																									Value = {
																										field = "tTargetSkillId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentEp",
																									Value = {
																										field = "tCurrentEp"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId1",
																									Value = {
																										field = "tTeammateId1"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId2",
																									Value = {
																										field = "tTeammateId2"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId3",
																									Value = {
																										field = "tTeammateId3"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentBreakPercent",
																									Value = {
																										field = "tCurrentBreakPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentSp",
																									Value = {
																										field = "tCurrentSp"
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
																					id = "385",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_ENERGY"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Type = "Self",
																									Name = "tCurrentPet",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentPetHpPercent",
																									Value = {
																										field = "tCurrentPetHpPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tSwitchPetId",
																									Value = {
																										field = "tSwitchPetId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTargetSkillId",
																									Value = {
																										field = "tTargetSkillId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentEp",
																									Value = {
																										field = "tCurrentEp"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId1",
																									Value = {
																										field = "tTeammateId1"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId2",
																									Value = {
																										field = "tTeammateId2"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId3",
																									Value = {
																										field = "tTeammateId3"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentBreakPercent",
																									Value = {
																										field = "tCurrentBreakPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentSp",
																									Value = {
																										field = "tCurrentSp"
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
																					id = "386",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_SUP"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Type = "Self",
																									Name = "tCurrentPet",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentPetHpPercent",
																									Value = {
																										field = "tCurrentPetHpPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tSwitchPetId",
																									Value = {
																										field = "tSwitchPetId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTargetSkillId",
																									Value = {
																										field = "tTargetSkillId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentEp",
																									Value = {
																										field = "tCurrentEp"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId1",
																									Value = {
																										field = "tTeammateId1"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId2",
																									Value = {
																										field = "tTeammateId2"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId3",
																									Value = {
																										field = "tTeammateId3"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentBreakPercent",
																									Value = {
																										field = "tCurrentBreakPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentSp",
																									Value = {
																										field = "tCurrentSp"
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
																					id = "387",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_BREAK"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Type = "Self",
																									Name = "tCurrentPet",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentPetHpPercent",
																									Value = {
																										field = "tCurrentPetHpPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tSwitchPetId",
																									Value = {
																										field = "tSwitchPetId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTargetSkillId",
																									Value = {
																										field = "tTargetSkillId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentEp",
																									Value = {
																										field = "tCurrentEp"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId1",
																									Value = {
																										field = "tTeammateId1"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId2",
																									Value = {
																										field = "tTeammateId2"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId3",
																									Value = {
																										field = "tTeammateId3"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentBreakPercent",
																									Value = {
																										field = "tCurrentBreakPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentSp",
																									Value = {
																										field = "tCurrentSp"
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
																					id = "388",
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
															id = "169",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "170",
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
																							const = "BREAK"
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
																		id = "171",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "392",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_DPS"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Type = "Self",
																									Name = "tCurrentPet",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentPetHpPercent",
																									Value = {
																										field = "tCurrentPetHpPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tSwitchPetId",
																									Value = {
																										field = "tSwitchPetId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTargetSkillId",
																									Value = {
																										field = "tTargetSkillId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentEp",
																									Value = {
																										field = "tCurrentEp"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId1",
																									Value = {
																										field = "tTeammateId1"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId2",
																									Value = {
																										field = "tTeammateId2"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId3",
																									Value = {
																										field = "tTeammateId3"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentBreakPercent",
																									Value = {
																										field = "tCurrentBreakPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentSp",
																									Value = {
																										field = "tCurrentSp"
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
																					id = "389",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_HEAL"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Type = "Self",
																									Name = "tCurrentPet",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentPetHpPercent",
																									Value = {
																										field = "tCurrentPetHpPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tSwitchPetId",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTargetSkillId",
																									Value = {
																										field = "tTargetSkillId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentEp",
																									Value = {
																										field = "tCurrentEp"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId1",
																									Value = {
																										field = "tTeammateId1"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId2",
																									Value = {
																										field = "tTeammateId2"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId3",
																									Value = {
																										field = "tTeammateId3"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentBreakPercent",
																									Value = {
																										field = "tCurrentBreakPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentSp",
																									Value = {
																										field = "tCurrentSp"
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
																					id = "390",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_ENERGY"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Type = "Self",
																									Name = "tCurrentPet",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentPetHpPercent",
																									Value = {
																										field = "tCurrentPetHpPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tSwitchPetId",
																									Value = {
																										field = "tSwitchPetId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTargetSkillId",
																									Value = {
																										field = "tTargetSkillId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentEp",
																									Value = {
																										field = "tCurrentEp"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId1",
																									Value = {
																										field = "tTeammateId1"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId2",
																									Value = {
																										field = "tTeammateId2"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId3",
																									Value = {
																										field = "tTeammateId3"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentBreakPercent",
																									Value = {
																										field = "tCurrentBreakPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentSp",
																									Value = {
																										field = "tCurrentSp"
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
																					id = "391",
																					class = "ReferencedBehavior",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_SUP"
																							}
																						},
																						{
																							subTreeProperties = {
																								{
																									Type = "Self",
																									Name = "tCurrentPet",
																									Value = {
																										field = "tCurrentPet"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentPetHpPercent",
																									Value = {
																										field = "tCurrentPetHpPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tSwitchPetId",
																									Value = {
																										field = "tSwitchPetId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTargetSkillId",
																									Value = {
																										field = "tTargetSkillId"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentEp",
																									Value = {
																										field = "tCurrentEp"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId1",
																									Value = {
																										field = "tTeammateId1"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId2",
																									Value = {
																										field = "tTeammateId2"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tTeammateId3",
																									Value = {
																										field = "tTeammateId3"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentBreakPercent",
																									Value = {
																										field = "tCurrentBreakPercent"
																									}
																								},
																								{
																									Type = "Self",
																									Name = "tCurrentSp",
																									Value = {
																										field = "tCurrentSp"
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
																					id = "393",
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
															id = "211",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "210",
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
																							const = "HEAL"
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
																		id = "411",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "416",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "445",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "412",
																											class = "Selector",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "409",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	func = "getHpPercent",
																																	params = {
																																		{
																																			field = "tTeammateId1"
																																		}
																																	}
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
																														id = "413",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	func = "getHpPercent",
																																	params = {
																																		{
																																			field = "tTeammateId2"
																																		}
																																	}
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
																														id = "414",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	func = "getHpPercent",
																																	params = {
																																		{
																																			field = "tTeammateId3"
																																		}
																																	}
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
																														id = "415",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
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
																																Opr = {
																																	const = 0.7
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
																											id = "448",
																											class = "Selector",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "465",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "446",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "tTargetSkillId"
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
																																						field = "tCurrentPet"
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
																																	id = "447",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "NotEqual"
																																		},
																																		{
																																			Opl = {
																																				field = "tTargetSkillId"
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
																														id = "467",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "449",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "tTargetSkillId"
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
																																						field = "tCurrentPet"
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
																																	id = "466",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "NotEqual"
																																		},
																																		{
																																			Opl = {
																																				field = "tTargetSkillId"
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
																									}
																								}
																							}
																						},
																						{
																							node = {
																								id = "418",
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
																											const = "Tactics_Heal"
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
																								id = "397",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_DPS"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "tCurrentPet",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentPetHpPercent",
																												Value = {
																													field = "tCurrentPetHpPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tSwitchPetId",
																												Value = {
																													field = "tSwitchPetId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTargetSkillId",
																												Value = {
																													field = "tTargetSkillId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentEp",
																												Value = {
																													field = "tCurrentEp"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId1",
																												Value = {
																													field = "tTeammateId1"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId2",
																												Value = {
																													field = "tTeammateId2"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId3",
																												Value = {
																													field = "tTeammateId3"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentBreakPercent",
																												Value = {
																													field = "tCurrentBreakPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentSp",
																												Value = {
																													field = "tCurrentSp"
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
																								id = "395",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_ENERGY"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "tCurrentPet",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentPetHpPercent",
																												Value = {
																													field = "tCurrentPetHpPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tSwitchPetId",
																												Value = {
																													field = "tSwitchPetId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTargetSkillId",
																												Value = {
																													field = "tTargetSkillId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentEp",
																												Value = {
																													field = "tCurrentEp"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId1",
																												Value = {
																													field = "tTeammateId1"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId2",
																												Value = {
																													field = "tTeammateId2"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId3",
																												Value = {
																													field = "tTeammateId3"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentBreakPercent",
																												Value = {
																													field = "tCurrentBreakPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentSp",
																												Value = {
																													field = "tCurrentSp"
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
																								id = "396",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_SUP"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "tCurrentPet",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentPetHpPercent",
																												Value = {
																													field = "tCurrentPetHpPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tSwitchPetId",
																												Value = {
																													field = "tSwitchPetId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTargetSkillId",
																												Value = {
																													field = "tTargetSkillId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentEp",
																												Value = {
																													field = "tCurrentEp"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId1",
																												Value = {
																													field = "tTeammateId1"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId2",
																												Value = {
																													field = "tTeammateId2"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId3",
																												Value = {
																													field = "tTeammateId3"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentBreakPercent",
																												Value = {
																													field = "tCurrentBreakPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentSp",
																												Value = {
																													field = "tCurrentSp"
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
																								id = "451",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "450",
																											class = "Condition",
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
																											id = "398",
																											class = "ReferencedBehavior",
																											properties = {
																												{
																													ReferenceBehavior = {
																														const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_BREAK"
																													}
																												},
																												{
																													subTreeProperties = {
																														{
																															Type = "Self",
																															Name = "tCurrentPet",
																															Value = {
																																field = "tCurrentPet"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentPetHpPercent",
																															Value = {
																																field = "tCurrentPetHpPercent"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tSwitchPetId",
																															Value = {
																																field = "tSwitchPetId"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTargetSkillId",
																															Value = {
																																field = "tTargetSkillId"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentEp",
																															Value = {
																																field = "tCurrentEp"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTeammateId1",
																															Value = {
																																field = "tTeammateId1"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTeammateId2",
																															Value = {
																																field = "tTeammateId2"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTeammateId3",
																															Value = {
																																field = "tTeammateId3"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentBreakPercent",
																															Value = {
																																field = "tCurrentBreakPercent"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentSp",
																															Value = {
																																field = "tCurrentSp"
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
													},
													{
														node = {
															id = "236",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "235",
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
																							const = "SUP"
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
																		id = "429",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "430",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "433",
																								class = "Selector",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "434",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "435",
																														class = "Assignment",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "tTargetSkillId"
																																}
																															},
																															{
																																Opr = {
																																	func = "getSkillIdByFeature",
																																	params = {
																																		{
																																			const = 6
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
																																			field = "tCurrentPet"
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
																														id = "436",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "NotEqual"
																															},
																															{
																																Opl = {
																																	field = "tTargetSkillId"
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
																														id = "464",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkTargetHasBuffFromSource",
																																	params = {
																																		{
																																			field = "tCurrentPet"
																																		},
																																		{
																																			const = "Positive"
																																		},
																																		{
																																			field = "tCurrentPet"
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
																											id = "440",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "437",
																														class = "Assignment",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "tTargetSkillId"
																																}
																															},
																															{
																																Opr = {
																																	func = "getSkillIdByFeature",
																																	params = {
																																		{
																																			const = 7
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
																																			field = "tCurrentPet"
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
																														id = "438",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "NotEqual"
																															},
																															{
																																Opl = {
																																	field = "tTargetSkillId"
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
																														id = "463",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkTargetHasBuffFromSource",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = "Negative"
																																		},
																																		{
																																			field = "tCurrentPet"
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
																									}
																								}
																							}
																						},
																						{
																							node = {
																								id = "431",
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
																											const = "Tactics_Sup"
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
																					id = "234",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "401",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_DPS"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "tCurrentPet",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentPetHpPercent",
																												Value = {
																													field = "tCurrentPetHpPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tSwitchPetId",
																												Value = {
																													field = "tSwitchPetId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTargetSkillId",
																												Value = {
																													field = "tTargetSkillId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentEp",
																												Value = {
																													field = "tCurrentEp"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId1",
																												Value = {
																													field = "tTeammateId1"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId2",
																												Value = {
																													field = "tTeammateId2"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId3",
																												Value = {
																													field = "tTeammateId3"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentBreakPercent",
																												Value = {
																													field = "tCurrentBreakPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentSp",
																												Value = {
																													field = "tCurrentSp"
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
																								id = "403",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_HEAL"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "tCurrentPet",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentPetHpPercent",
																												Value = {
																													field = "tCurrentPetHpPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tSwitchPetId",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTargetSkillId",
																												Value = {
																													field = "tTargetSkillId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentEp",
																												Value = {
																													field = "tCurrentEp"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId1",
																												Value = {
																													field = "tTeammateId1"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId2",
																												Value = {
																													field = "tTeammateId2"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId3",
																												Value = {
																													field = "tTeammateId3"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentBreakPercent",
																												Value = {
																													field = "tCurrentBreakPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentSp",
																												Value = {
																													field = "tCurrentSp"
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
																								id = "399",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_ENERGY"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "tCurrentPet",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentPetHpPercent",
																												Value = {
																													field = "tCurrentPetHpPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tSwitchPetId",
																												Value = {
																													field = "tSwitchPetId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTargetSkillId",
																												Value = {
																													field = "tTargetSkillId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentEp",
																												Value = {
																													field = "tCurrentEp"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId1",
																												Value = {
																													field = "tTeammateId1"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId2",
																												Value = {
																													field = "tTeammateId2"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId3",
																												Value = {
																													field = "tTeammateId3"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentBreakPercent",
																												Value = {
																													field = "tCurrentBreakPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentSp",
																												Value = {
																													field = "tCurrentSp"
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
																								id = "453",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "452",
																											class = "Condition",
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
																											id = "400",
																											class = "ReferencedBehavior",
																											properties = {
																												{
																													ReferenceBehavior = {
																														const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_BREAK"
																													}
																												},
																												{
																													subTreeProperties = {
																														{
																															Type = "Self",
																															Name = "tCurrentPet",
																															Value = {
																																field = "tCurrentPet"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentPetHpPercent",
																															Value = {
																																field = "tCurrentPetHpPercent"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tSwitchPetId",
																															Value = {
																																field = "tSwitchPetId"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTargetSkillId",
																															Value = {
																																field = "tTargetSkillId"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentEp",
																															Value = {
																																field = "tCurrentEp"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTeammateId1",
																															Value = {
																																field = "tTeammateId1"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTeammateId2",
																															Value = {
																																field = "tTeammateId2"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTeammateId3",
																															Value = {
																																field = "tTeammateId3"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentBreakPercent",
																															Value = {
																																field = "tCurrentBreakPercent"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentSp",
																															Value = {
																																field = "tCurrentSp"
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
													},
													{
														node = {
															id = "263",
															class = "Sequence",
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
																					func = "checkTargetIsFunctionId",
																					params = {
																						{
																							field = "tCurrentPet"
																						},
																						{
																							const = "ENERGY"
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
																		id = "426",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "424",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "442",
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
																														field = "tTargetSkillId"
																													}
																												},
																												{
																													Opr = {
																														func = "getSkillIdByFeature",
																														params = {
																															{
																																const = 5
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
																																field = "tCurrentPet"
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
																											id = "444",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "NotEqual"
																												},
																												{
																													Opl = {
																														field = "tTargetSkillId"
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
																											id = "420",
																											class = "Selector",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "419",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	func = "getEp",
																																	params = {
																																		{
																																			field = "tCurrentPet"
																																		}
																																	}
																																}
																															},
																															{
																																Opr = {
																																	const = 20
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "421",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	func = "getEp",
																																	params = {
																																		{
																																			field = "tTeammateId1"
																																		}
																																	}
																																}
																															},
																															{
																																Opr = {
																																	const = 20
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "427",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	func = "getEp",
																																	params = {
																																		{
																																			field = "tTeammateId2"
																																		}
																																	}
																																}
																															},
																															{
																																Opr = {
																																	const = 20
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "428",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	func = "getEp",
																																	params = {
																																		{
																																			field = "tTeammateId3"
																																		}
																																	}
																																}
																															},
																															{
																																Opr = {
																																	const = 20
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
																								id = "425",
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
																											const = "Tactics_Energy"
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
																					id = "261",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "405",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_DPS"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "tCurrentPet",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentPetHpPercent",
																												Value = {
																													field = "tCurrentPetHpPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tSwitchPetId",
																												Value = {
																													field = "tSwitchPetId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTargetSkillId",
																												Value = {
																													field = "tTargetSkillId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentEp",
																												Value = {
																													field = "tCurrentEp"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId1",
																												Value = {
																													field = "tTeammateId1"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId2",
																												Value = {
																													field = "tTeammateId2"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId3",
																												Value = {
																													field = "tTeammateId3"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentBreakPercent",
																												Value = {
																													field = "tCurrentBreakPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentSp",
																												Value = {
																													field = "tCurrentSp"
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
																								id = "406",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_HEAL"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "tCurrentPet",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentPetHpPercent",
																												Value = {
																													field = "tCurrentPetHpPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tSwitchPetId",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTargetSkillId",
																												Value = {
																													field = "tTargetSkillId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentEp",
																												Value = {
																													field = "tCurrentEp"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId1",
																												Value = {
																													field = "tTeammateId1"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId2",
																												Value = {
																													field = "tTeammateId2"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId3",
																												Value = {
																													field = "tTeammateId3"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentBreakPercent",
																												Value = {
																													field = "tCurrentBreakPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentSp",
																												Value = {
																													field = "tCurrentSp"
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
																								id = "408",
																								class = "ReferencedBehavior",
																								properties = {
																									{
																										ReferenceBehavior = {
																											const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_SUP"
																										}
																									},
																									{
																										subTreeProperties = {
																											{
																												Type = "Self",
																												Name = "tCurrentPet",
																												Value = {
																													field = "tCurrentPet"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentPetHpPercent",
																												Value = {
																													field = "tCurrentPetHpPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tSwitchPetId",
																												Value = {
																													field = "tSwitchPetId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTargetSkillId",
																												Value = {
																													field = "tTargetSkillId"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentEp",
																												Value = {
																													field = "tCurrentEp"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId1",
																												Value = {
																													field = "tTeammateId1"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId2",
																												Value = {
																													field = "tTeammateId2"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tTeammateId3",
																												Value = {
																													field = "tTeammateId3"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentBreakPercent",
																												Value = {
																													field = "tCurrentBreakPercent"
																												}
																											},
																											{
																												Type = "Self",
																												Name = "tCurrentSp",
																												Value = {
																													field = "tCurrentSp"
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
																								id = "455",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "456",
																											class = "Condition",
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
																											id = "454",
																											class = "ReferencedBehavior",
																											properties = {
																												{
																													ReferenceBehavior = {
																														const = "PBT_BotPlayer_Assist_Combat_BACKSTAGE_BREAK"
																													}
																												},
																												{
																													subTreeProperties = {
																														{
																															Type = "Self",
																															Name = "tCurrentPet",
																															Value = {
																																field = "tCurrentPet"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentPetHpPercent",
																															Value = {
																																field = "tCurrentPetHpPercent"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tSwitchPetId",
																															Value = {
																																field = "tSwitchPetId"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTargetSkillId",
																															Value = {
																																field = "tTargetSkillId"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentEp",
																															Value = {
																																field = "tCurrentEp"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTeammateId1",
																															Value = {
																																field = "tTeammateId1"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTeammateId2",
																															Value = {
																																field = "tTeammateId2"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tTeammateId3",
																															Value = {
																																field = "tTeammateId3"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentBreakPercent",
																															Value = {
																																field = "tCurrentBreakPercent"
																															}
																														},
																														{
																															Type = "Self",
																															Name = "tCurrentSp",
																															Value = {
																																field = "tCurrentSp"
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
										},
										{
											node = {
												id = "80",
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

return PBT_BotPlayer_Assist_Combat
