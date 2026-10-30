-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPlayer\\PBT_BotPlayer_Combat_151008.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPlayer_Combat_151008 = {
	behavior = {
		useForRoute = false,
		agenttype = "BotPlayerAgent",
		version = 178,
		name = "CombatUnit/NPC/BotPlayer/PBT_BotPlayer_Combat_151008",
		properties = {},
		pars = {
			{
				type = "int",
				value = "0",
				name = "tCurrentPet",
				const = 0
			},
			{
				type = "float",
				value = "0",
				name = "tCurrentPetHpPercent",
				const = 0
			},
			{
				type = "int",
				value = "0",
				name = "tSwitchPetId",
				const = 0
			},
			{
				type = "int",
				value = "0",
				name = "tTargetSkillId",
				const = 0
			},
			{
				type = "float",
				value = "0",
				name = "tCurrentEp",
				const = 0
			}
		},
		attachments = {},
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
									id = "566",
									class = "IfElse",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "567",
												class = "Condition",
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
												id = "568",
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
												id = "569",
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
									id = "4",
									class = "Selector",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "610",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "612",
															class = "And",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "611",
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
																		id = "613",
																		class = "Condition",
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
																}
															}
														}
													},
													{
														node = {
															id = "615",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "616",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "617",
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
																								func = "getPetActorIdByMainTypeResistAndSupportTagList",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = {
																											"DPS"
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
																					id = "618",
																					class = "Condition",
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
																		id = "609",
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
																}
															}
														}
													},
													{
														node = {
															id = "619",
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
													},
													{
														node = {
															id = "614",
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
										},
										{
											node = {
												id = "620",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "621",
															class = "Condition",
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
															id = "649",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "650",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "651",
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
																								func = "getPetActorIdByMainTypeResistAndSupportTagList",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = {
																											"BREAK",
																											"DPS"
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
																					id = "652",
																					class = "Condition",
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
																		id = "653",
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
															id = "633",
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
																		id = "645",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "646",
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
																					id = "644",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "640",
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
																								id = "639",
																								class = "And",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "642",
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
																											id = "641",
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
																								id = "643",
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
													}
												}
											}
										},
										{
											node = {
												id = "672",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "673",
															class = "Condition",
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
															id = "674",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "675",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "676",
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
																								func = "getPetActorIdByMainTypeResistAndSupportTagList",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = {
																											"DPS"
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
																					id = "677",
																					class = "Condition",
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
																		id = "678",
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
																}
															}
														}
													},
													{
														node = {
															id = "679",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "682",
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
																		id = "683",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "685",
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
																					id = "686",
																					class = "And",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "684",
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
																								id = "680",
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
																					id = "681",
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
										}
									}
								}
							},
							{
								node = {
									id = "385",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "386",
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
												id = "381",
												class = "IfElse",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "383",
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
															id = "378",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "377",
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
																		id = "379",
																		class = "Sequence",
																		properties = {},
																		attachments = {
																			{
																				effector = false,
																				transition = false,
																				id = "155",
																				precondition = true,
																				class = "Precondition",
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
																					id = "382",
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
															id = "384",
															class = "Sequence",
															properties = {},
															attachments = {
																{
																	effector = false,
																	transition = false,
																	id = "155",
																	precondition = true,
																	class = "Precondition",
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
																		id = "380",
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

return PBT_BotPlayer_Combat_151008
