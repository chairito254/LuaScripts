-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Egg_10451.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Egg_10451 = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Egg_10451",
		version = 154,
		agenttype = "PuppetAgent",
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				type = "float",
				name = "disToTgtForSkillMon"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "goBackDist"
			},
			{
				const = 50,
				value = "50",
				type = "int",
				name = "MeleeA1"
			},
			{
				const = 50,
				value = "50",
				type = "int",
				name = "MeleeA2"
			},
			{
				const = 50,
				value = "50",
				type = "int",
				name = "RangedA1"
			},
			{
				const = 50,
				value = "50",
				type = "int",
				name = "RangedA2"
			},
			{
				const = 0,
				value = "0",
				type = "int",
				name = "RangedB1"
			},
			{
				const = 0,
				value = "0",
				type = "int",
				name = "RangedB2"
			},
			{
				const = 50,
				value = "50",
				type = "int",
				name = "MeleeB1"
			},
			{
				const = 50,
				value = "50",
				type = "int",
				name = "MeleeB2"
			},
			{
				const = 50,
				value = "50",
				type = "int",
				name = "MeleeB3"
			},
			{
				const = 0,
				value = "0",
				type = "int",
				name = "RangedC1"
			},
			{
				const = 20,
				value = "20",
				type = "int",
				name = "RangedC2"
			},
			{
				const = 20,
				value = "20",
				type = "int",
				name = "RangedC3"
			},
			{
				const = 0,
				value = "0",
				type = "int",
				name = "Ex1"
			},
			{
				const = 50,
				value = "50",
				type = "int",
				name = "Ex2"
			},
			{
				const = 100,
				value = "100",
				type = "int",
				name = "Ex3"
			},
			{
				const = false,
				value = "false",
				type = "bool",
				name = "hasUsedEx"
			},
			{
				const = 0,
				value = "0",
				type = "int",
				name = "wyv"
			},
			{
				const = 50,
				value = "50",
				type = "int",
				name = "RangeA3"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "281",
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
						id = "280",
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
						id = "1413",
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
						id = "3",
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
									id = "1423",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "1422",
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
												id = "1457",
												class = "Selector",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "1458",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1459",
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
																							const = 1145103
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
																		id = "1419",
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
																							const = 2
																						},
																						{
																							const = 4
																						},
																						{
																							const = true
																						},
																						{
																							const = false
																						},
																						{
																							const = true
																						},
																						{
																							const = 7
																						},
																						{
																							const = BaseEnum.MoveUpdateLevel.Fast
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
															id = "1460",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1462",
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
																							const = 11451021
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
																		id = "1435",
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
																					id = "1437",
																					class = "DecoratorWeight",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 10
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1441",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "playPhaseAction",
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
																													const = "5"
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
																					id = "1439",
																					class = "DecoratorWeight",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 10
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1444",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "playPhaseAction",
																											params = {
																												{
																													const = "Behav_LoveStart"
																												},
																												{
																													const = "Behav_LoveLoop"
																												},
																												{
																													const = "Behav_LoveEnd"
																												},
																												{
																													const = 5
																												},
																												{
																													const = "5"
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
																					id = "1440",
																					class = "DecoratorWeight",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 10
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1445",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "playPhaseAction",
																											params = {
																												{
																													const = "Behav_CheerStart"
																												},
																												{
																													const = "Behav_CheerLoop"
																												},
																												{
																													const = "Behav_CheerEnd"
																												},
																												{
																													const = 5
																												},
																												{
																													const = "5"
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
															id = "1451",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1464",
																		class = "Or",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "1452",
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
																										const = 11451022
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
																					id = "1467",
																					class = "And",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1465",
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
																													const = 1145103
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
																								id = "1466",
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
																													const = 11451021
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
																			}
																		}
																	}
																},
																{
																	node = {
																		id = "1448",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "leaveTarget",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 10
																						},
																						{
																							const = 4
																						},
																						{
																							const = BaseEnum.SpeedRateType.Mid
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
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

return ST_Monster_AutoCombat_Egg_10451
