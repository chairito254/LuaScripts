-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Monster\\ST_Monster_AutoCombat_Boss_10583.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_10583 = {
	behavior = {
		version = 233,
		name = "ParmonBehaviorTree/SubTree/_Monster/ST_Monster_AutoCombat_Boss_10583",
		useForRoute = false,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				type = "float",
				name = "disToTgtForSkillMon",
				const = 0,
				value = "0"
			},
			{
				type = "float",
				name = "goBackDist",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "tPlayer",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "Attack",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "Attackttimes",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "FXpopo",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "DMpopo",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "Jump3",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "Relax",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "Tail",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "QQprojectile",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "XNBP",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "sidewalk",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "walkback",
				const = 0,
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "133",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "2001",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "Attack"
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
						id = "1180",
						class = "Action",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "enterCombat"
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
						id = "1179",
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
						id = "1178",
						class = "Condition",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									field = "tgt"
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
						id = "1662",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "bornPos"
								}
							},
							{
								Opr = {
									func = "getBornPos"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "1664",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tPlayer"
								}
							},
							{
								Opr = {
									func = "getAuthorityPlayer"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "2746",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "2745",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkCanUseSkill",
												params = {
													{
														field = "selfId"
													},
													{
														const = 15831300
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
									id = "2474",
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
														const = 15831300
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
											ResultResumeOption = "BT_ResumeTree"
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "2747",
									class = "True",
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
						id = "131",
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
									id = "2706",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "2709",
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
												id = "2708",
												class = "Condition",
												properties = {
													{
														Operator = "NotEqual"
													},
													{
														Opl = {
															field = "tgt"
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
												id = "2707",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "distToTgt"
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
												id = "2667",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "bornPos"
														}
													},
													{
														Opr = {
															func = "getBornPos"
														}
													}
												},
												attachments = {},
												children = {}
											}
										},
										{
											node = {
												id = "2660",
												class = "Selector",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "2700",
															class = "Sequence",
															properties = {},
															attachments = {
																{
																	id = "2702",
																	transition = false,
																	effector = false,
																	precondition = true,
																	class = "Precondition",
																	properties = {
																		{
																			BinaryOperator = "Or"
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
																						const = 21583003
																					},
																					{
																						const = 1
																					}
																				}
																			}
																		},
																		{
																			Opr2 = {
																				const = true
																			}
																		},
																		{
																			Phase = "Both"
																		}
																	}
																},
																{
																	id = "2704",
																	transition = false,
																	effector = false,
																	precondition = true,
																	class = "Precondition",
																	properties = {
																		{
																			BinaryOperator = "Or"
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
																						const = 21583005
																					},
																					{
																						const = 1
																					}
																				}
																			}
																		},
																		{
																			Opr2 = {
																				const = true
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
																		id = "2699",
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
																		id = "2736",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "2737",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "2740",
																								class = "Condition",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											func = "checkTargetLocation",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = -30
																												},
																												{
																													const = 30
																												},
																												{
																													const = 0
																												},
																												{
																													const = 99
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
																								id = "2739",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "turnToTarget",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = true
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
																					id = "2738",
																					class = "True",
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
																		id = "2701",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "2482",
																					class = "Sequence",
																					properties = {},
																					attachments = {
																						{
																							id = "2483",
																							transition = false,
																							effector = false,
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
																												const = 21583003
																											},
																											{
																												const = 1
																											}
																										}
																									}
																								},
																								{
																									Opr2 = {
																										const = true
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
																								id = "2488",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "playSleAnimationMultiTime",
																											params = {
																												{
																													const = "Behav_HappyStart"
																												},
																												{
																													const = "Behav_HappyLoop"
																												},
																												{
																													const = "Behav_HappyEnd"
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
																					id = "2486",
																					class = "Sequence",
																					properties = {},
																					attachments = {
																						{
																							id = "2483",
																							transition = false,
																							effector = false,
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
																												const = 21583005
																											},
																											{
																												const = 1
																											}
																										}
																									}
																								},
																								{
																									Opr2 = {
																										const = true
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
																								id = "2489",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "playSleAnimationOnce",
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
																			}
																		}
																	}
																}
															}
														}
													},
													{
														node = {
															id = "2705",
															class = "Sequence",
															properties = {},
															attachments = {
																{
																	id = "2702",
																	transition = false,
																	effector = false,
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
																						const = 21583003
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
																},
																{
																	id = "2704",
																	transition = false,
																	effector = false,
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
																						const = 21583005
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
																		id = "2664",
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
																		id = "2665",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "NotEqual"
																			},
																			{
																				Opl = {
																					field = "tgt"
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
																		id = "2663",
																		class = "Assignment",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "distToTgt"
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
																		id = "2679",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "2680",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "2683",
																								class = "Condition",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											func = "checkTargetLocation",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = -30
																												},
																												{
																													const = 30
																												},
																												{
																													const = 0
																												},
																												{
																													const = 99
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
																								id = "2682",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "turnToTarget",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = true
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
																					id = "2681",
																					class = "True",
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
																		id = "149",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "2264",
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
																					id = "2266",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "NotEqual"
																						},
																						{
																							Opl = {
																								field = "tgt"
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
																					id = "2378",
																					class = "Assignment",
																					properties = {
																						{
																							CastRight = "false"
																						},
																						{
																							Opl = {
																								field = "distToTgt"
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
																					id = "2684",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "2685",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2688",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														func = "checkTargetLocation",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = -30
																															},
																															{
																																const = 30
																															},
																															{
																																const = 0
																															},
																															{
																																const = 99
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
																											id = "2687",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "turnToTarget",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = true
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
																								id = "2686",
																								class = "True",
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
																					id = "2006",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "2007",
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
																								id = "2008",
																								class = "Condition",
																								properties = {
																									{
																										Operator = "NotEqual"
																									},
																									{
																										Opl = {
																											field = "tgt"
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
																								id = "2009",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "distToTgt"
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
																								id = "2010",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "distToTgtForSkill"
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
																								id = "2446",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2434",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Greater"
																												},
																												{
																													Opl = {
																														field = "Relax"
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
																											id = "2656",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2435",
																														class = "Assignment",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "Relax"
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
																														id = "2652",
																														class = "IfElse",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2655",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "Greater"
																																		},
																																		{
																																			Opl = {
																																				field = "distToTgt"
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
																															},
																															{
																																node = {
																																	id = "2445",
																																	class = "Action",
																																	properties = {
																																		{
																																			Method = {
																																				func = "playSleAnimationOnce",
																																				params = {
																																					{
																																						const = "Behav_DoubtStart"
																																					},
																																					{
																																						const = "Behav_DoubtLoop"
																																					},
																																					{
																																						const = "Behav_DoubtEnd"
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
																															},
																															{
																																node = {
																																	id = "2658",
																																	class = "Action",
																																	properties = {
																																		{
																																			Method = {
																																				func = "playSleAnimationOnce",
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
																														id = "2695",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2693",
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
																																	id = "2689",
																																	class = "Selector",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "2694",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "2691",
																																							class = "Condition",
																																							properties = {
																																								{
																																									Operator = "Equal"
																																								},
																																								{
																																									Opl = {
																																										func = "checkTargetLocation",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = -30
																																											},
																																											{
																																												const = 30
																																											},
																																											{
																																												const = 0
																																											},
																																											{
																																												const = 99
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
																																							id = "2692",
																																							class = "Action",
																																							properties = {
																																								{
																																									Method = {
																																										func = "turnToTarget",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = true
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
																																				id = "2690",
																																				class = "True",
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
																									},
																									{
																										node = {
																											id = "2012",
																											class = "IfElse",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2637",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Greater"
																															},
																															{
																																Opl = {
																																	field = "distToTgt"
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
																														id = "2011",
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
																																			const = 8
																																		},
																																		{
																																			const = 3
																																		},
																																		{
																																			const = false
																																		},
																																		{
																																			const = true
																																		},
																																		{
																																			const = true
																																		},
																																		{
																																			const = 8
																																		},
																																		{
																																			const = BaseEnum.MoveUpdateLevel.Slow
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
																																ResultResumeOption = "BT_ResumeSelf"
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "2643",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2025",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "distToTgt"
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
																																	id = "2028",
																																	class = "Selector",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "2029",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "2645",
																																							class = "And",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "2027",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													field = "distToTgt"
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
																																										id = "2030",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Equal"
																																											},
																																											{
																																												Opl = {
																																													func = "isGoBackCd"
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
																																							id = "2046",
																																							class = "Compute",
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
																																										field = "distToTgt"
																																									}
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "2023",
																																							class = "Selector",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "2031",
																																										class = "Action",
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
																																															const = 10
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
																																												ResultResumeOption = "BT_ResumeSelf"
																																											}
																																										},
																																										attachments = {},
																																										children = {}
																																									}
																																								},
																																								{
																																									node = {
																																										id = "2022",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "runBack",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															const = 6
																																														},
																																														{
																																															const = 3
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
																																				id = "2639",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "2644",
																																							class = "And",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "2640",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													field = "distToTgt"
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
																																										id = "2641",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Greater"
																																											},
																																											{
																																												Opl = {
																																													field = "distToTgt"
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
																																							id = "2717",
																																							class = "IfElse",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "2720",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Greater"
																																											},
																																											{
																																												Opl = {
																																													field = "sidewalk"
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
																																										id = "2721",
																																										class = "True",
																																										properties = {},
																																										attachments = {},
																																										children = {}
																																									}
																																								},
																																								{
																																									node = {
																																										id = "2718",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "2719",
																																													class = "Compute",
																																													properties = {
																																														{
																																															Operator = "Add"
																																														},
																																														{
																																															Opl = {
																																																field = "sidewalk"
																																															}
																																														},
																																														{
																																															Opr1 = {
																																																field = "sidewalk"
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
																																													id = "2059",
																																													class = "SelectorProbability",
																																													properties = {
																																														{
																																															UntilSuccessOrEnd = false
																																														}
																																													},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "2061",
																																																class = "DecoratorWeight",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			const = 50
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "2062",
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
																																																								const = 5
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
																																																id = "2064",
																																																class = "DecoratorWeight",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			const = 50
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "2065",
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
																																																								const = 5
																																																							},
																																																							{
																																																								const = 35
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
																																				id = "2056",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "2069",
																																							class = "Condition",
																																							properties = {
																																								{
																																									Operator = "LessEqual"
																																								},
																																								{
																																									Opl = {
																																										field = "distToTgt"
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
																																					},
																																					{
																																						node = {
																																							id = "2728",
																																							class = "IfElse",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "2730",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Greater"
																																											},
																																											{
																																												Opl = {
																																													field = "walkback"
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
																																										id = "2731",
																																										class = "True",
																																										properties = {},
																																										attachments = {},
																																										children = {}
																																									}
																																								},
																																								{
																																									node = {
																																										id = "2729",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "2732",
																																													class = "Compute",
																																													properties = {
																																														{
																																															Operator = "Add"
																																														},
																																														{
																																															Opl = {
																																																field = "walkback"
																																															}
																																														},
																																														{
																																															Opr1 = {
																																																field = "walkback"
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
																																													id = "2733",
																																													class = "Action",
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
																																																		const = 4
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
																							}
																						}
																					}
																				}
																			},
																			{
																				node = {
																					id = "2531",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "2493",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "Attack"
																										}
																									},
																									{
																										Opr = {
																											const = 25
																										}
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								id = "2495",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2533",
																											class = "And",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2532",
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
																																			field = "selfId"
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
																														id = "2497",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkCanUseSkill",
																																	params = {
																																		{
																																			field = "selfId"
																																		},
																																		{
																																			const = 15831100
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
																											id = "2498",
																											class = "Assignment",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "FXpopo"
																													}
																												},
																												{
																													Opr = {
																														const = 75
																													}
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "2496",
																											class = "True",
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
																								id = "2504",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2505",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														func = "checkCanUseSkill",
																														params = {
																															{
																																field = "selfId"
																															},
																															{
																																const = 15831200
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
																											id = "2507",
																											class = "Assignment",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "DMpopo"
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
																											id = "2506",
																											class = "True",
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
																								id = "2514",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2512",
																											class = "And",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2513",
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
																																			field = "selfId"
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
																														id = "2509",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkCanUseSkill",
																																	params = {
																																		{
																																			field = "selfId"
																																		},
																																		{
																																			const = 15831400
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
																											id = "2511",
																											class = "Assignment",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "XNBP"
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
																											id = "2510",
																											class = "True",
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
																								id = "2515",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2516",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														func = "checkCanUseSkill",
																														params = {
																															{
																																field = "selfId"
																															},
																															{
																																const = 15831600
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
																											id = "2536",
																											class = "IfElse",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2535",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "GreaterEqual"
																															},
																															{
																																Opl = {
																																	field = "distToTgt"
																																}
																															},
																															{
																																Opr = {
																																	const = 7
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "2517",
																														class = "Assignment",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "QQprojectile"
																																}
																															},
																															{
																																Opr = {
																																	const = 75
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "2537",
																														class = "Assignment",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "QQprojectile"
																																}
																															},
																															{
																																Opr = {
																																	const = 25
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
																											id = "2518",
																											class = "True",
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
																								id = "2526",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2530",
																											class = "And",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2529",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	field = "distToTgt"
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
																														id = "2527",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkCanUseSkill",
																																	params = {
																																		{
																																			field = "selfId"
																																		},
																																		{
																																			const = 15831500
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
																											id = "2528",
																											class = "Assignment",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "Tail"
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
																											id = "2525",
																											class = "True",
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
																								id = "2741",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2742",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														func = "checkCanUseSkill",
																														params = {
																															{
																																field = "selfId"
																															},
																															{
																																const = 15831300
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
																											id = "2744",
																											class = "Assignment",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "Jump3"
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
																											id = "2743",
																											class = "True",
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
																								id = "2735",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2716",
																											class = "Assignment",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "sidewalk"
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
																											id = "2734",
																											class = "Assignment",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "walkback"
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
																					id = "2613",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "2539",
																								class = "SelectorProbability",
																								properties = {
																									{
																										UntilSuccessOrEnd = false
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2540",
																											class = "DecoratorWeight",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												},
																												{
																													Weight = {
																														field = "Attack"
																													}
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2552",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2604",
																																	class = "IfElse",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "2599",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "GreaterEqual"
																																					},
																																					{
																																						Opl = {
																																							field = "Attackttimes"
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
																																		},
																																		{
																																			node = {
																																				id = "2602",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "2601",
																																							class = "Action",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castNormalAtkCombo",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 4
																																											},
																																											{
																																												const = true
																																											},
																																											{
																																												const = 4
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
																																					},
																																					{
																																						node = {
																																							id = "2603",
																																							class = "Assignment",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "Attackttimes"
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
																																				id = "2600",
																																				class = "Action",
																																				properties = {
																																					{
																																						Method = {
																																							func = "castNormalAtkCombo",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = 3
																																								},
																																								{
																																									const = true
																																								},
																																								{
																																									const = 3
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
																																	id = "2548",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "Attack"
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
																											id = "2538",
																											class = "DecoratorWeight",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												},
																												{
																													Weight = {
																														field = "FXpopo"
																													}
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2560",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2561",
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
																																						const = 15831100
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
																																	id = "2553",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "FXpopo"
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
																											id = "2544",
																											class = "DecoratorWeight",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												},
																												{
																													Weight = {
																														field = "DMpopo"
																													}
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2566",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2696",
																																	class = "IfElse",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "2697",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "GreaterEqual"
																																					},
																																					{
																																						Opl = {
																																							func = "getHpPercent",
																																							params = {
																																								{
																																									field = "selfId"
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
																																				id = "2614",
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
																																									const = 15831200
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
																																						ResultResumeOption = "BT_ResumeTree"
																																					}
																																				},
																																				attachments = {},
																																				children = {}
																																			}
																																		},
																																		{
																																			node = {
																																				id = "2698",
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
																																									const = 15831201
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
																																	id = "2568",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "DMpopo"
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
																											id = "2541",
																											class = "DecoratorWeight",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												},
																												{
																													Weight = {
																														field = "QQprojectile"
																													}
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2615",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2573",
																																	class = "IfElse",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "2575",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "LessEqual"
																																					},
																																					{
																																						Opl = {
																																							field = "distToTgt"
																																						}
																																					},
																																					{
																																						Opr = {
																																							const = 8
																																						}
																																					}
																																				},
																																				attachments = {},
																																				children = {}
																																			}
																																		},
																																		{
																																			node = {
																																				id = "2577",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "2650",
																																							class = "IfElse",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "2648",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Equal"
																																											},
																																											{
																																												Opl = {
																																													func = "isGoBackCd"
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
																																										id = "2619",
																																										class = "Action",
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
																																															const = 10
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
																																												ResultResumeOption = "BT_ResumeSelf"
																																											}
																																										},
																																										attachments = {},
																																										children = {}
																																									}
																																								},
																																								{
																																									node = {
																																										id = "2651",
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
																																															const = 15831500
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
																																							id = "2617",
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
																																												const = 15831600
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
																																				id = "2616",
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
																																									const = 15831600
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
																																	id = "2572",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "QQprojectile"
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
																											id = "2542",
																											class = "DecoratorWeight",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												},
																												{
																													Weight = {
																														field = "Tail"
																													}
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2590",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2673",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "2671",
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
																																				id = "2670",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "NotEqual"
																																					},
																																					{
																																						Opl = {
																																							field = "tgt"
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
																																				id = "2672",
																																				class = "Assignment",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "distToTgt"
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
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	id = "2620",
																																	class = "IfElse",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "2622",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "GreaterEqual"
																																					},
																																					{
																																						Opl = {
																																							field = "distToTgt"
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
																																		},
																																		{
																																			node = {
																																				id = "2677",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "2674",
																																							class = "Action",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castNormalAtkCombo",
																																										params = {
																																											{
																																												field = "tgt"
																																											},
																																											{
																																												const = 4
																																											},
																																											{
																																												const = true
																																											},
																																											{
																																												const = 4
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
																																					},
																																					{
																																						node = {
																																							id = "2678",
																																							class = "Compute",
																																							properties = {
																																								{
																																									Operator = "Sub"
																																								},
																																								{
																																									Opl = {
																																										field = "Attackttimes"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "Attackttimes"
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
																																					}
																																				}
																																			}
																																		},
																																		{
																																			node = {
																																				id = "2592",
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
																																									const = 15831500
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
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	id = "2591",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "Tail"
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
																																	id = "2666",
																																	class = "Compute",
																																	properties = {
																																		{
																																			Operator = "Sub"
																																		},
																																		{
																																			Opl = {
																																				field = "Relax"
																																			}
																																		},
																																		{
																																			Opr1 = {
																																				field = "Relax"
																																			}
																																		},
																																		{
																																			Opr2 = {
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											id = "2543",
																											class = "DecoratorWeight",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												},
																												{
																													Weight = {
																														field = "XNBP"
																													}
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2589",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2583",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "XNBP"
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
																																	id = "2636",
																																	class = "Action",
																																	properties = {
																																		{
																																			Method = {
																																				func = "moveToPos",
																																				params = {
																																					{
																																						field = "bornPos"
																																					},
																																					{
																																						const = 10
																																					},
																																					{
																																						const = true
																																					},
																																					{
																																						const = 0
																																					},
																																					{
																																						const = BaseEnum.SpeedRateType.Fast
																																					},
																																					{
																																						const = 8
																																					},
																																					{
																																						const = BaseEnum.PathFindType.Auto
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
																																			ResultResumeOption = "BT_ResumeSelf"
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "2625",
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
																																						const = 15831400
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
																																			ResultResumeOption = "BT_NextNode"
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
																											id = "2633",
																											class = "DecoratorWeight",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												},
																												{
																													Weight = {
																														field = "Jump3"
																													}
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "2634",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "2635",
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
																																						const = 15831300
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
																																			ResultResumeOption = "BT_ResumeTree"
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "2632",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "Jump3"
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
																								id = "2612",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "2598",
																											class = "Compute",
																											properties = {
																												{
																													Operator = "Add"
																												},
																												{
																													Opl = {
																														field = "Relax"
																													}
																												},
																												{
																													Opr1 = {
																														field = "Relax"
																													}
																												},
																												{
																													Opr2 = {
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
																											id = "2611",
																											class = "Compute",
																											properties = {
																												{
																													Operator = "Add"
																												},
																												{
																													Opl = {
																														field = "Attackttimes"
																													}
																												},
																												{
																													Opr1 = {
																														field = "Attackttimes"
																													}
																												},
																												{
																													Opr2 = {
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

return ST_Monster_AutoCombat_Boss_10583
