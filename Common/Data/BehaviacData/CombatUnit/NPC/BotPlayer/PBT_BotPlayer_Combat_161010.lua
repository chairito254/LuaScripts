-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPlayer\\PBT_BotPlayer_Combat_161010.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPlayer_Combat_161010 = {
	behavior = {
		agenttype = "BotPlayerAgent",
		version = 174,
		useForRoute = false,
		name = "CombatUnit/NPC/BotPlayer/PBT_BotPlayer_Combat_161010",
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
			}
		},
		attachments = {},
		node = {
			class = "DecoratorLoop",
			id = "1",
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
						id = "11",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Sequence",
									id = "5",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Assignment",
												id = "124",
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
												class = "Assignment",
												id = "6",
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
												class = "Assignment",
												id = "12",
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
												class = "Assignment",
												id = "115",
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
												class = "Assignment",
												id = "126",
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
									class = "IfElse",
									id = "427",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "428",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "getPetActorIdByFunctionIdFromPetList",
															params = {
																{
																	const = "DPS"
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
												id = "429",
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
															const = "DPS"
														}
													}
												},
												attachments = {},
												children = {}
											}
										},
										{
											node = {
												class = "Noop",
												id = "430",
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
									id = "4",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "75",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "And",
															id = "112",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "81",
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
																		id = "111",
																		properties = {
																			{
																				Operator = "NotEqual"
																			},
																			{
																				Opl = {
																					func = "getPetActorIdByFunctionIdFromPetList",
																					params = {
																						{
																							const = "BREAK"
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
																}
															}
														}
													},
													{
														node = {
															class = "Assignment",
															id = "73",
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
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "BREAK"
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
															id = "426",
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
													},
													{
														node = {
															class = "Action",
															id = "279",
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
										},
										{
											node = {
												class = "Sequence",
												id = "94",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "90",
															properties = {
																{
																	Operator = "NotEqual"
																},
																{
																	Opl = {
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "ENERGY"
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
															id = "172",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Assignment",
																		id = "93",
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
																					func = "getPetActorIdByFunctionIdFromPetList",
																					params = {
																						{
																							const = "ENERGY"
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
																		id = "173",
																		properties = {
																			{
																				Operator = "NotEqual"
																			},
																			{
																				Opl = {
																					func = "getHpPercent",
																					params = {
																						{
																							field = "tSwitchPetId"
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
																}
															}
														}
													},
													{
														node = {
															class = "Selector",
															id = "524",
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
																					class = "Or",
																					id = "538",
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
																											func = "checkSkillNotInCd",
																											params = {
																												{
																													const = 16140100
																												},
																												{
																													field = "tSwitchPetId"
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
																								id = "539",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											func = "checkSkillNotInCd",
																											params = {
																												{
																													const = 16140101
																												},
																												{
																													field = "tSwitchPetId"
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					class = "Assignment",
																					id = "95",
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
																								const = "ENERGY"
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					class = "DecoratorLoopUntil",
																					id = "256",
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
																								class = "Selector",
																								id = "328",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "329",
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
																											class = "Sequence",
																											id = "327",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "323",
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
																														class = "And",
																														id = "322",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "325",
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
																																	class = "Condition",
																																	id = "324",
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
																														class = "Action",
																														id = "326",
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
																			}
																		}
																	}
																},
																{
																	node = {
																		class = "Sequence",
																		id = "525",
																		properties = {},
																		attachments = {},
																		children = {
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
																								id = "520",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											func = "checkSkillNotInCd",
																											params = {
																												{
																													const = 16141300
																												},
																												{
																													field = "tSwitchPetId"
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
																								id = "521",
																								properties = {
																									{
																										Operator = "Less"
																									},
																									{
																										Opl = {
																											func = "getCreatedPuppetCount",
																											params = {
																												{
																													field = "tSwitchPetId"
																												},
																												{
																													const = 1100005
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					class = "Assignment",
																					id = "527",
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
																								const = "Bee"
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					class = "DecoratorLoopUntil",
																					id = "531",
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
																								class = "Selector",
																								id = "534",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "535",
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
																											class = "Sequence",
																											id = "528",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "532",
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
																														class = "And",
																														id = "533",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "529",
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
																																	class = "Condition",
																																	id = "530",
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
																														class = "Action",
																														id = "526",
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
												id = "399",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "409",
															properties = {
																{
																	Operator = "NotEqual"
																},
																{
																	Opl = {
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "HEAL"
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
															class = "And",
															id = "423",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "396",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "getPetActorIdByFunctionIdFromPetList",
																					params = {
																						{
																							const = "BREAK"
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
																		id = "424",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "getPetActorIdByFunctionIdFromPetList",
																					params = {
																						{
																							const = "ENERGY"
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
																}
															}
														}
													},
													{
														node = {
															class = "Assignment",
															id = "414",
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
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "HEAL"
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
															class = "Sequence",
															id = "402",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Assignment",
																		id = "400",
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
																					const = "DPS"
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		class = "DecoratorLoopUntil",
																		id = "412",
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
																					class = "Selector",
																					id = "415",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "422",
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
																								class = "Sequence",
																								id = "419",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Action",
																											id = "421",
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
																											class = "And",
																											id = "418",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "420",
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
																														class = "Condition",
																														id = "417",
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
																											class = "Action",
																											id = "416",
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
												id = "495",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Sequence",
															id = "498",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "490",
																		properties = {
																			{
																				Operator = "LessEqual"
																			},
																			{
																				Opl = {
																					field = "tCurrentPetHpPercent"
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
																		id = "491",
																		properties = {
																			{
																				Operator = "NotEqual"
																			},
																			{
																				Opl = {
																					func = "getPetActorIdByFunctionIdFromPetList",
																					params = {
																						{
																							const = "HEAL"
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
																}
															}
														}
													},
													{
														node = {
															class = "Assignment",
															id = "493",
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
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "HEAL"
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
															class = "Selector",
															id = "499",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "494",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkSkillExistByFeatureId",
																					params = {
																						{
																							field = "tSwitchPetId"
																						},
																						{
																							const = 3
																						},
																						{
																							const = false
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
																		id = "500",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkSkillExistByFeatureId",
																					params = {
																						{
																							field = "tSwitchPetId"
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
															class = "Selector",
															id = "501",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Sequence",
																		id = "497",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Assignment",
																					id = "496",
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
																										const = false
																									},
																									{
																										const = 0
																									},
																									{
																										const = false
																									},
																									{
																										field = "tSwitchPetId"
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
																					id = "505",
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
																		class = "Sequence",
																		id = "503",
																		properties = {},
																		attachments = {},
																		children = {
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
																										const = false
																									},
																									{
																										const = 0
																									},
																									{
																										const = false
																									},
																									{
																										field = "tSwitchPetId"
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
																					id = "506",
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
													},
													{
														node = {
															class = "Sequence",
															id = "504",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Assignment",
																		id = "492",
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
																					const = "Tactics_HEAL"
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		class = "DecoratorLoopUntil",
																		id = "507",
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
																					class = "Selector",
																					id = "508",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "515",
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
																								class = "Sequence",
																								id = "514",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Action",
																											id = "513",
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
																											class = "And",
																											id = "512",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "511",
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
																														class = "Condition",
																														id = "510",
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
																											class = "Action",
																											id = "509",
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
												id = "118",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "122",
															properties = {
																{
																	Operator = "NotEqual"
																},
																{
																	Opl = {
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "BREAK"
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
															id = "370",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Sequence",
																		id = "371",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Assignment",
																					id = "372",
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
																								func = "getPetActorIdByMainTypeResistAndSupportTagList",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = {
																											"BREAK"
																										}
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
																					id = "373",
																					properties = {
																						{
																							Operator = "NotEqual"
																						},
																						{
																							Opl = {
																								field = "tSwitchPetId"
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
																		class = "Assignment",
																		id = "374",
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
																					func = "getPetActorIdByFunctionIdFromPetList",
																					params = {
																						{
																							const = "BREAK"
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
															id = "432",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "433",
																		properties = {
																			{
																				Operator = "NotEqual"
																			},
																			{
																				Opl = {
																					func = "getPetActorIdByFunctionIdFromPetList",
																					params = {
																						{
																							const = "DPS"
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
																		id = "431",
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
																					const = "BREAK"
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		class = "Noop",
																		id = "434",
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
															class = "IfElse",
															id = "131",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "127",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					func = "getHpPercent",
																					params = {
																						{
																							field = "tSwitchPetId"
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
																		class = "DecoratorLoopUntil",
																		id = "266",
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
																					class = "Selector",
																					id = "344",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "345",
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
																								class = "Sequence",
																								id = "343",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Action",
																											id = "339",
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
																											class = "And",
																											id = "338",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "341",
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
																														class = "Condition",
																														id = "340",
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
																											class = "Action",
																											id = "342",
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
																		class = "Sequence",
																		id = "137",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Assignment",
																					id = "139",
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
																								func = "getPetActorIdByFunctionIdFromPetList",
																								params = {
																									{
																										const = "DPS"
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
																					id = "140",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
																								func = "getHpPercent",
																								params = {
																									{
																										field = "tSwitchPetId"
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
																					class = "DecoratorLoopUntil",
																					id = "271",
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
																								class = "Selector",
																								id = "352",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "353",
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
																											class = "Sequence",
																											id = "351",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "347",
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
																														class = "And",
																														id = "346",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "349",
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
																																	class = "Condition",
																																	id = "348",
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
																														class = "Action",
																														id = "350",
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
												id = "308",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "313",
															properties = {
																{
																	Operator = "Equal"
																},
																{
																	Opl = {
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "BREAK"
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
															id = "379",
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
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "ENERGY"
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
															class = "Selector",
															id = "386",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "387",
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
																		class = "Sequence",
																		id = "388",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "392",
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
																					class = "And",
																					id = "393",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "390",
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
																								class = "Condition",
																								id = "391",
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
																					class = "Action",
																					id = "389",
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
												class = "Noop",
												id = "125",
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
												class = "IfElse",
												id = "240",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "245",
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
															class = "Sequence",
															id = "243",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Action",
																		id = "244",
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
																		class = "Sequence",
																		id = "242",
																		properties = {},
																		attachments = {
																			{
																				effector = false,
																				precondition = true,
																				class = "Precondition",
																				id = "155",
																				transition = false,
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
																					class = "Action",
																					id = "239",
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
															class = "Sequence",
															id = "246",
															properties = {},
															attachments = {
																{
																	effector = false,
																	precondition = true,
																	class = "Precondition",
																	id = "155",
																	transition = false,
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
																		class = "Action",
																		id = "241",
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

return PBT_BotPlayer_Combat_161010
