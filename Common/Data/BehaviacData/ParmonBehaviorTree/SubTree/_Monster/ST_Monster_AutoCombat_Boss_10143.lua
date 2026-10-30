-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Monster\\ST_Monster_AutoCombat_Boss_10143.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_10143 = {
	behavior = {
		version = 116,
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/_Monster/ST_Monster_AutoCombat_Boss_10143",
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				type = "float",
				value = "0",
				name = "disToTgtForSkillMon",
				const = 0
			},
			{
				type = "float",
				value = "0",
				name = "goBackDist",
				const = 0
			},
			{
				type = "int",
				value = "0",
				name = "tPlayer",
				const = 0
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
						id = "864",
						class = "Action",
						properties = {
							{
								Method = {
									func = "castSkill",
									params = {
										{
											field = "selfId"
										},
										{
											const = 11430104
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
						id = "1637",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "atkCd"
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
									id = "1597",
									class = "Selector",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "1655",
												class = "IfElse",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "1657",
															class = "And",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1656",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					func = "getDistByPos",
																					params = {
																						{
																							field = "bornPos"
																						},
																						{
																							const = false
																						},
																						{
																							field = "selfId"
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
																		id = "1658",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					func = "getDistByPos",
																					params = {
																						{
																							field = "bornPos"
																						},
																						{
																							const = false
																						},
																						{
																							field = "selfId"
																						}
																					}
																				}
																			},
																			{
																				Opr = {
																					func = "getDistByPos",
																					params = {
																						{
																							field = "bornPos"
																						},
																						{
																							const = false
																						},
																						{
																							field = "tPlayer"
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
															id = "1659",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "castSkill",
																		params = {
																			{
																				field = "tPlayer"
																			},
																			{
																				const = 11430109
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
													},
													{
														node = {
															id = "1665",
															class = "DecoratorAlwaysFailure",
															properties = {
																{
																	DecorateWhenChildEnds = "false"
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1660",
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
												id = "1640",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "1873",
															class = "And",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1872",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Greater"
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
																					const = 0.4
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		id = "1639",
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
																}
															}
														}
													},
													{
														node = {
															id = "1641",
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
																				field = "tgt"
																			},
																			{
																				const = 11430105
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
															id = "1642",
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
																				const = 11430105
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
															id = "1672",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1670",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Less"
																			},
																			{
																				Opl = {
																					func = "getEntityCacheValue",
																					params = {
																						{
																							const = "BulblyDeath"
																						}
																					}
																				}
																			},
																			{
																				Opr = {
																					const = 5
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		id = "1667",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "sendMessageToTrigger",
																					params = {
																						{
																							field = "selfId"
																						},
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
												id = "1673",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "1679",
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
															id = "1674",
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
																				field = "tgt"
																			},
																			{
																				const = 114301051
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
															id = "1675",
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
																				const = 114301051
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
															id = "1678",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1677",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Less"
																			},
																			{
																				Opl = {
																					func = "getEntityCacheValue",
																					params = {
																						{
																							const = "BulblyDeath"
																						}
																					}
																				}
																			},
																			{
																				Opr = {
																					const = 5
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		id = "1676",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "sendMessageToTrigger",
																					params = {
																						{
																							field = "selfId"
																						},
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
												id = "1598",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "1594",
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
																				field = "tgt"
																			},
																			{
																				const = 11430107
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
															id = "1600",
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
																				const = 2114303
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
															id = "1638",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1635",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "1633",
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
																					id = "1632",
																					class = "Assignment",
																					properties = {
																						{
																							CastRight = "false"
																						},
																						{
																							Opl = {
																								field = "atkCd"
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
																		id = "1616",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "1617",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "Less"
																						},
																						{
																							Opl = {
																								field = "atkCd"
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
																					id = "1618",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1599",
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
																													const = 11430107
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
																								id = "1619",
																								class = "Compute",
																								properties = {
																									{
																										Operator = "Add"
																									},
																									{
																										Opl = {
																											field = "atkCd"
																										}
																									},
																									{
																										Opr1 = {
																											field = "atkCd"
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					id = "1622",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1624",
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
																													field = "tgt"
																												},
																												{
																													const = 11430108
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
																								id = "1621",
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
																													const = 11430108
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
																								id = "1623",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "atkCd"
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
													}
												}
											}
										},
										{
											node = {
												id = "873",
												class = "Selector",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "149",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "143",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					field = "battlestage"
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
																		id = "136",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "137",
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
																										const = 0
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
																					id = "156",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "166",
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
																								id = "167",
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
																								id = "172",
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
																								id = "1115",
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
																								id = "1117",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "1118",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														field = "distToTgtForSkill"
																													}
																												},
																												{
																													Opr = {
																														field = "maxKeepBoxDist"
																													}
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "1116",
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
																																field = "bestKeepBoxDist"
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
																											id = "1170",
																											class = "Selector",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "1173",
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
																																	id = "1172",
																																	class = "DecoratorWeight",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				field = "attackWeight"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1182",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1181",
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
																																												const = "enterCombat"
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
																																					},
																																					{
																																						node = {
																																							id = "1184",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "765",
																																										class = "Selector",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "767",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "860",
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
																																																					const = 2114303
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
																																																id = "173",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "175",
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
																																																			id = "177",
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
																																																						id = "913",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "914",
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
																																																														const = 11430202
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
																																																						id = "190",
																																																						class = "DecoratorWeight",
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
																																																									id = "1682",
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
																																																														const = 11430114
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
																																																						id = "284",
																																																						class = "DecoratorWeight",
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
																																																									id = "285",
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
																																																														const = 11430301
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
																																																				}
																																																			}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "286",
																																																			class = "IfElse",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "288",
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
																																																						id = "287",
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
																																																									id = "291",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "928",
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
																																																																	const = 11430111
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
																																																									id = "1685",
																																																									class = "DecoratorWeight",
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
																																																												id = "1689",
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
																																																																	const = 11430202
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
																																																									id = "1686",
																																																									class = "DecoratorWeight",
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
																																																												id = "1688",
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
																																																																	const = 11430114
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
																																																									id = "1687",
																																																									class = "DecoratorWeight",
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
																																																												id = "1690",
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
																																																																	const = 11430301
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
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					node = {
																																																						id = "1691",
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
																																																									id = "1700",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 3
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1762",
																																																												class = "Sequence",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															id = "1701",
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
																																																																				const = 11430401
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
																																																															id = "1763",
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
																																																							},
																																																							{
																																																								node = {
																																																									id = "1699",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1692",
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
																																																																	const = 11430111
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
																																																									id = "1693",
																																																									class = "DecoratorWeight",
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
																																																												id = "1697",
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
																																																																	const = 11430202
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
																																																									id = "1694",
																																																									class = "DecoratorWeight",
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
																																																												id = "1696",
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
																																																																	const = 11430114
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
																																																									id = "1695",
																																																									class = "DecoratorWeight",
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
																																																												id = "1698",
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
																																																																	const = 11430301
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
																																													id = "874",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {
																																														{
																																															precondition = true,
																																															transition = false,
																																															id = "876",
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
																																																				field = "selfId"
																																																			},
																																																			{
																																																				const = 2114303
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
																																																	Phase = "Enter"
																																																}
																																															}
																																														}
																																													},
																																													children = {
																																														{
																																															node = {
																																																id = "775",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "776",
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
																																																			id = "1084",
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
																																																						id = "1085",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "938",
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
																																																														const = 11430201
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
																																																						id = "1086",
																																																						class = "DecoratorWeight",
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
																																																									id = "1197",
																																																									class = "Sequence",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1087",
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
																																																										},
																																																										{
																																																											node = {
																																																												id = "1626",
																																																												class = "Action",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "playAction",
																																																															params = {
																																																																{
																																																																	const = "Behav_Happy"
																																																																},
																																																																{
																																																																	const = -1
																																																																},
																																																																{
																																																																	const = ""
																																																																},
																																																																{
																																																																	const = false
																																																																},
																																																																{
																																																																	const = false
																																																																},
																																																																{
																																																																	const = 0
																																																																},
																																																																{
																																																																	const = BaseEnum.AIAnimationRootMotionType.Default
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
																																																			id = "786",
																																																			class = "IfElse",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "788",
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
																																																						id = "1705",
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
																																																									id = "789",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 3
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "800",
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
																																																																	const = 11430112
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
																																																									id = "1703",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1704",
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
																																																																	const = 11430201
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
																																																									id = "790",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "791",
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
																																																																	const = 11430115
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
																																																									id = "811",
																																																									class = "DecoratorWeight",
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
																																																												id = "1200",
																																																												class = "Sequence",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															id = "939",
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
																																																													},
																																																													{
																																																														node = {
																																																															id = "1199",
																																																															class = "Action",
																																																															properties = {
																																																																{
																																																																	Method = {
																																																																		func = "playAction",
																																																																		params = {
																																																																			{
																																																																				const = "Behav_Happy"
																																																																			},
																																																																			{
																																																																				const = -1
																																																																			},
																																																																			{
																																																																				const = ""
																																																																			},
																																																																			{
																																																																				const = false
																																																																			},
																																																																			{
																																																																				const = false
																																																																			},
																																																																			{
																																																																				const = 0
																																																																			},
																																																																			{
																																																																				const = BaseEnum.AIAnimationRootMotionType.Default
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
																																																						id = "782",
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
																																																									id = "793",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 4
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1716",
																																																												class = "Sequence",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															id = "943",
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
																																																																				const = 11430401
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
																																																															id = "1717",
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
																																																							},
																																																							{
																																																								node = {
																																																									id = "1707",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 3
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1706",
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
																																																																	const = 11430112
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
																																																									id = "1709",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1708",
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
																																																																	const = 11430201
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
																																																									id = "1711",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1710",
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
																																																																	const = 11430115
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
																																																									id = "1715",
																																																									class = "DecoratorWeight",
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
																																																												id = "1714",
																																																												class = "Sequence",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															id = "1713",
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
																																																													},
																																																													{
																																																														node = {
																																																															id = "1712",
																																																															class = "Action",
																																																															properties = {
																																																																{
																																																																	Method = {
																																																																		func = "playAction",
																																																																		params = {
																																																																			{
																																																																				const = "Behav_Happy"
																																																																			},
																																																																			{
																																																																				const = -1
																																																																			},
																																																																			{
																																																																				const = ""
																																																																			},
																																																																			{
																																																																				const = false
																																																																			},
																																																																			{
																																																																				const = false
																																																																			},
																																																																			{
																																																																				const = 0
																																																																			},
																																																																			{
																																																																				const = BaseEnum.AIAnimationRootMotionType.Default
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
																																								},
																																								{
																																									node = {
																																										id = "1191",
																																										class = "IfElse",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1192",
																																													class = "Condition",
																																													properties = {
																																														{
																																															Operator = "Equal"
																																														},
																																														{
																																															Opl = {
																																																func = "checkIsBossAI"
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
																																													id = "1189",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1187",
																																																class = "Compute",
																																																properties = {
																																																	{
																																																		Operator = "Add"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "sideWalkWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr1 = {
																																																			field = "sideWalkWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr2 = {
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
																																																id = "1186",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "attackWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			const = 125
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
																																													id = "1188",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1185",
																																																class = "Compute",
																																																properties = {
																																																	{
																																																		Operator = "Add"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "sideWalkWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr1 = {
																																																			field = "sideWalkWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr2 = {
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
																																																id = "1702",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "attackWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			const = 125
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
																																	id = "1171",
																																	class = "DecoratorWeight",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				field = "sideWalkWeight"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1174",
																																				class = "False",
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
																														id = "1141",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "1149",
																																	class = "IfElse",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1148",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "checkIsBossAI"
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
																																				id = "1147",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1146",
																																							class = "Compute",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "attackWeight"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "attackWeight"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 175
																																									}
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "1145",
																																							class = "Assignment",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "sideWalkWeight"
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
																																				id = "1144",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1143",
																																							class = "Compute",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "attackWeight"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "attackWeight"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 150
																																									}
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "1142",
																																							class = "Assignment",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "sideWalkWeight"
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
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	id = "1137",
																																	class = "Selector",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1138",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1134",
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
																																							id = "1136",
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
																																							id = "1139",
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
																																							id = "1169",
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
																																							id = "1132",
																																							class = "Selector",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "1140",
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
																																												ResultResumeOption = "BT_ResumeSelf"
																																											}
																																										},
																																										attachments = {},
																																										children = {}
																																									}
																																								},
																																								{
																																									node = {
																																										id = "1130",
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
																																															field = "goBackDist"
																																														},
																																														{
																																															const = 2
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
																																				id = "1129",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1128",
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
																																										id = "1124",
																																										class = "DecoratorWeight",
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
																																													id = "1125",
																																													class = "False",
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
																																										id = "1122",
																																										class = "DecoratorWeight",
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
																																													id = "1123",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1121",
																																																class = "Condition",
																																																properties = {
																																																	{
																																																		Operator = "Equal"
																																																	},
																																																	{
																																																		Opl = {
																																																			func = "hasAnimState",
																																																			params = {
																																																				{
																																																					const = "Skill_Halo"
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
																																																id = "1120",
																																																class = "Selector",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "1150",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Less"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getTimerValue",
																																																						params = {
																																																							{
																																																								const = "Skill_Halo"
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
																																																			id = "1151",
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
																																																								const = "Skill_Halo"
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
																																																id = "1152",
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
																																																					const = false
																																																				},
																																																				{
																																																					const = 0.8
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
																																																id = "1153",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Skill_Halo"
																																																				},
																																																				{
																																																					const = -1
																																																				},
																																																				{
																																																					const = ""
																																																				},
																																																				{
																																																					const = false
																																																				},
																																																				{
																																																					const = false
																																																				},
																																																				{
																																																					const = 0
																																																				},
																																																				{
																																																					const = BaseEnum.AIAnimationRootMotionType.Default
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
																																																id = "1154",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "startTimer",
																																																			params = {
																																																				{
																																																					const = "Skill_Halo"
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
																																							id = "1157",
																																							class = "IfElse",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "1158",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Equal"
																																											},
																																											{
																																												Opl = {
																																													field = "canWalkLeftOrRight"
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
																																										id = "1163",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {
																																											{
																																												precondition = true,
																																												transition = false,
																																												id = "109",
																																												class = "Precondition",
																																												effector = false,
																																												properties = {
																																													{
																																														BinaryOperator = "And"
																																													},
																																													{
																																														Operator = "Greater"
																																													},
																																													{
																																														Opl = {
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
																																													},
																																													{
																																														Opr2 = {
																																															field = "minAttackDist"
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
																																													id = "1165",
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
																																																		const = 1.2
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
																																								},
																																								{
																																									node = {
																																										id = "1167",
																																										class = "Selector",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1155",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1119",
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
																																																id = "1127",
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
																																																			field = "minKeepBoxDist"
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "1166",
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
																																																			field = "bestKeepBoxDist"
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
																																																id = "1126",
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
																																																					field = "goBackDist"
																																																				},
																																																				{
																																																					const = 1.5
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
																																											},
																																											{
																																												node = {
																																													id = "1168",
																																													class = "Action",
																																													properties = {
																																														{
																																															Method = {
																																																func = "playAction",
																																																params = {
																																																	{
																																																		const = "Skill_Halo"
																																																	},
																																																	{
																																																		const = -1
																																																	},
																																																	{
																																																		const = ""
																																																	},
																																																	{
																																																		const = false
																																																	},
																																																	{
																																																		const = false
																																																	},
																																																	{
																																																		const = 0
																																																	},
																																																	{
																																																		const = BaseEnum.AIAnimationRootMotionType.Default
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
																					id = "157",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "953",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "skillCd"
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
																								id = "138",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "battlestage"
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
																			}
																		}
																	}
																}
															}
														}
													},
													{
														node = {
															id = "681",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
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
																					field = "battlestage"
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
																		id = "1203",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "1204",
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
																										const = 0
																									}
																								}
																							}
																						},
																						{
																							Opr = {
																								const = 0.3
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "1205",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1206",
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
																								id = "1207",
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
																								id = "1208",
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
																								id = "1209",
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
																								id = "1211",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "1212",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														field = "distToTgtForSkill"
																													}
																												},
																												{
																													Opr = {
																														field = "maxKeepBoxDist"
																													}
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "1210",
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
																																field = "bestKeepBoxDist"
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
																											id = "1267",
																											class = "Selector",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "1270",
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
																																	id = "1269",
																																	class = "DecoratorWeight",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				field = "attackWeight"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1273",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1274",
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
																																												const = "enterCombat"
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
																																					},
																																					{
																																						node = {
																																							id = "1275",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "960",
																																										class = "Selector",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "961",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "963",
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
																																																					const = 2114303
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
																																																id = "962",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "964",
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
																																																			id = "967",
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
																																																						id = "966",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "985",
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
																																																														const = 11430101
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
																																																						id = "1720",
																																																						class = "DecoratorWeight",
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
																																																									id = "1719",
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
																																																														const = 11430301
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
																																																						id = "968",
																																																						class = "DecoratorWeight",
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
																																																									id = "1718",
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
																																																														const = 11430114
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
																																																						id = "1583",
																																																						class = "DecoratorWeight",
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
																																																									id = "1582",
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
																																																														const = 11430111
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
																																																						id = "969",
																																																						class = "DecoratorWeight",
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
																																																									id = "1108",
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
																																																														const = 11430202
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
																																																				}
																																																			}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "974",
																																																			class = "IfElse",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "975",
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
																																																						id = "1735",
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
																																																									id = "1725",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1724",
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
																																																																	const = 11430101
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
																																																									id = "1732",
																																																									class = "DecoratorWeight",
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
																																																												id = "1733",
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
																																																																	const = 11430301
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
																																																									id = "1731",
																																																									class = "DecoratorWeight",
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
																																																												id = "1730",
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
																																																																	const = 11430114
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
																																																									id = "1727",
																																																									class = "DecoratorWeight",
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
																																																												id = "1726",
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
																																																																	const = 11430202
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
																																																									id = "1728",
																																																									class = "DecoratorWeight",
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
																																																												id = "1729",
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
																																																																	const = 11430111
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
																																																									id = "981",
																																																									class = "DecoratorWeight",
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
																																																												id = "977",
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
																																																																	const = 11430102
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
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					node = {
																																																						id = "1740",
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
																																																									id = "1064",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 3
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1764",
																																																												class = "Sequence",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															id = "1065",
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
																																																																				const = 11430401
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
																																																															id = "1765",
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
																																																							},
																																																							{
																																																								node = {
																																																									id = "1761",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 3
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1760",
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
																																																																	const = 11430115
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
																																																									id = "1742",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1741",
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
																																																																	const = 11430101
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
																																																									id = "1749",
																																																									class = "DecoratorWeight",
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
																																																												id = "1750",
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
																																																																	const = 11430301
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
																																																									id = "1748",
																																																									class = "DecoratorWeight",
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
																																																												id = "1747",
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
																																																																	const = 11430114
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
																																																									id = "1744",
																																																									class = "DecoratorWeight",
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
																																																												id = "1743",
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
																																																																	const = 11430202
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
																																																									id = "1745",
																																																									class = "DecoratorWeight",
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
																																																												id = "1746",
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
																																																																	const = 11430111
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
																																																									id = "1752",
																																																									class = "DecoratorWeight",
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
																																																												id = "1751",
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
																																																																	const = 11430102
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
																																													id = "1006",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {
																																														{
																																															precondition = true,
																																															transition = false,
																																															id = "876",
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
																																																				field = "selfId"
																																																			},
																																																			{
																																																				const = 2114303
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
																																																	Phase = "Enter"
																																																}
																																															}
																																														}
																																													},
																																													children = {
																																														{
																																															node = {
																																																id = "1012",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "1013",
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
																																																			id = "1039",
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
																																																						id = "1040",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1030",
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
																																																														const = 11430201
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
																																																						id = "1753",
																																																						class = "DecoratorWeight",
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
																																																									id = "1759",
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
																																																														const = 11430112
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
																																																						id = "1290",
																																																						class = "DecoratorWeight",
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
																																																									id = "1291",
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
																																																				}
																																																			}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "1019",
																																																			class = "IfElse",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "1021",
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
																																																						id = "1020",
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
																																																									id = "1767",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 3
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1766",
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
																																																																	const = 11430112
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
																																																									id = "1769",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1768",
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
																																																																	const = 11430201
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
																																																									id = "1771",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1770",
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
																																																																	const = 11430115
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
																																																									id = "1774",
																																																									class = "DecoratorWeight",
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
																																																												id = "1775",
																																																												class = "Sequence",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															id = "1773",
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
																																																													},
																																																													{
																																																														node = {
																																																															id = "1772",
																																																															class = "Action",
																																																															properties = {
																																																																{
																																																																	Method = {
																																																																		func = "playAction",
																																																																		params = {
																																																																			{
																																																																				const = "Behav_Happy"
																																																																			},
																																																																			{
																																																																				const = -1
																																																																			},
																																																																			{
																																																																				const = ""
																																																																			},
																																																																			{
																																																																				const = false
																																																																			},
																																																																			{
																																																																				const = false
																																																																			},
																																																																			{
																																																																				const = 0
																																																																			},
																																																																			{
																																																																				const = BaseEnum.AIAnimationRootMotionType.Default
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
																																																						id = "1017",
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
																																																									id = "1786",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 4
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1788",
																																																												class = "Sequence",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															id = "1787",
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
																																																																				const = 11430401
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
																																																															id = "1789",
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
																																																							},
																																																							{
																																																								node = {
																																																									id = "1777",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 3
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1776",
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
																																																																	const = 11430112
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
																																																									id = "1779",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1778",
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
																																																																	const = 11430201
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
																																																									id = "1781",
																																																									class = "DecoratorWeight",
																																																									properties = {
																																																										{
																																																											DecorateWhenChildEnds = "false"
																																																										},
																																																										{
																																																											Weight = {
																																																												const = 2
																																																											}
																																																										}
																																																									},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1780",
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
																																																																	const = 11430115
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
																																																									id = "1785",
																																																									class = "DecoratorWeight",
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
																																																												id = "1784",
																																																												class = "Sequence",
																																																												properties = {},
																																																												attachments = {},
																																																												children = {
																																																													{
																																																														node = {
																																																															id = "1783",
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
																																																													},
																																																													{
																																																														node = {
																																																															id = "1782",
																																																															class = "Action",
																																																															properties = {
																																																																{
																																																																	Method = {
																																																																		func = "playAction",
																																																																		params = {
																																																																			{
																																																																				const = "Behav_Happy"
																																																																			},
																																																																			{
																																																																				const = -1
																																																																			},
																																																																			{
																																																																				const = ""
																																																																			},
																																																																			{
																																																																				const = false
																																																																			},
																																																																			{
																																																																				const = false
																																																																			},
																																																																			{
																																																																				const = 0
																																																																			},
																																																																			{
																																																																				const = BaseEnum.AIAnimationRootMotionType.Default
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
																																								},
																																								{
																																									node = {
																																										id = "1281",
																																										class = "IfElse",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1282",
																																													class = "Condition",
																																													properties = {
																																														{
																																															Operator = "Equal"
																																														},
																																														{
																																															Opl = {
																																																func = "checkIsBossAI"
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
																																													id = "1279",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1277",
																																																class = "Compute",
																																																properties = {
																																																	{
																																																		Operator = "Add"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "sideWalkWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr1 = {
																																																			field = "sideWalkWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr2 = {
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
																																																id = "1276",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "attackWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			const = 125
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
																																													id = "1278",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1272",
																																																class = "Compute",
																																																properties = {
																																																	{
																																																		Operator = "Add"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "sideWalkWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr1 = {
																																																			field = "sideWalkWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr2 = {
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
																																																id = "1280",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "attackWeight"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			const = 125
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
																																	id = "1268",
																																	class = "DecoratorWeight",
																																	properties = {
																																		{
																																			DecorateWhenChildEnds = "false"
																																		},
																																		{
																																			Weight = {
																																				field = "sideWalkWeight"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1271",
																																				class = "False",
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
																														id = "1238",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "1245",
																																	class = "IfElse",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1266",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "checkIsBossAI"
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
																																				id = "1244",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1243",
																																							class = "Compute",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "attackWeight"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "attackWeight"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 175
																																									}
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "1242",
																																							class = "Assignment",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "sideWalkWeight"
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
																																				id = "1241",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1240",
																																							class = "Compute",
																																							properties = {
																																								{
																																									Operator = "Add"
																																								},
																																								{
																																									Opl = {
																																										field = "attackWeight"
																																									}
																																								},
																																								{
																																									Opr1 = {
																																										field = "attackWeight"
																																									}
																																								},
																																								{
																																									Opr2 = {
																																										const = 150
																																									}
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "1239",
																																							class = "Assignment",
																																							properties = {
																																								{
																																									CastRight = "false"
																																								},
																																								{
																																									Opl = {
																																										field = "sideWalkWeight"
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
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	id = "1234",
																																	class = "Selector",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1235",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1231",
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
																																							id = "1233",
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
																																							id = "1236",
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
																																							id = "1264",
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
																																							id = "1229",
																																							class = "Selector",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "1232",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1237",
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
																																										id = "1230",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1227",
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
																																																		field = "goBackDist"
																																																	},
																																																	{
																																																		const = 2
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
																																		},
																																		{
																																			node = {
																																				id = "1226",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1225",
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
																																										id = "1221",
																																										class = "DecoratorWeight",
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
																																													id = "1222",
																																													class = "False",
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
																																										id = "1219",
																																										class = "DecoratorWeight",
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
																																													id = "1220",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1218",
																																																class = "Condition",
																																																properties = {
																																																	{
																																																		Operator = "Equal"
																																																	},
																																																	{
																																																		Opl = {
																																																			func = "hasAnimState",
																																																			params = {
																																																				{
																																																					const = "Skill_Halo"
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
																																																id = "1217",
																																																class = "Selector",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "1246",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Less"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getTimerValue",
																																																						params = {
																																																							{
																																																								const = "Skill_Halo"
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
																																																			id = "1247",
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
																																																								const = "Skill_Halo"
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
																																																id = "1248",
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
																																																					const = false
																																																				},
																																																				{
																																																					const = 0.8
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
																																																id = "1265",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Skill_Halo"
																																																				},
																																																				{
																																																					const = -1
																																																				},
																																																				{
																																																					const = ""
																																																				},
																																																				{
																																																					const = false
																																																				},
																																																				{
																																																					const = false
																																																				},
																																																				{
																																																					const = 0
																																																				},
																																																				{
																																																					const = BaseEnum.AIAnimationRootMotionType.Default
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
																																																id = "1249",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "startTimer",
																																																			params = {
																																																				{
																																																					const = "Skill_Halo"
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
																																							id = "1252",
																																							class = "IfElse",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "1253",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Equal"
																																											},
																																											{
																																												Opl = {
																																													field = "canWalkLeftOrRight"
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
																																										id = "1258",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {
																																											{
																																												precondition = true,
																																												transition = false,
																																												id = "109",
																																												class = "Precondition",
																																												effector = false,
																																												properties = {
																																													{
																																														BinaryOperator = "And"
																																													},
																																													{
																																														Operator = "Greater"
																																													},
																																													{
																																														Opl = {
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
																																													},
																																													{
																																														Opr2 = {
																																															field = "minAttackDist"
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
																																													id = "1260",
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
																																																		const = 1.2
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
																																								},
																																								{
																																									node = {
																																										id = "1262",
																																										class = "Selector",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1250",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1216",
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
																																																id = "1224",
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
																																																			field = "minKeepBoxDist"
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "1261",
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
																																																			field = "bestKeepBoxDist"
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
																																																id = "1223",
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
																																																					field = "goBackDist"
																																																				},
																																																				{
																																																					const = 1.5
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
																																											},
																																											{
																																												node = {
																																													id = "1263",
																																													class = "Action",
																																													properties = {
																																														{
																																															Method = {
																																																func = "playAction",
																																																params = {
																																																	{
																																																		const = "Skill_Halo"
																																																	},
																																																	{
																																																		const = -1
																																																	},
																																																	{
																																																		const = ""
																																																	},
																																																	{
																																																		const = false
																																																	},
																																																	{
																																																		const = false
																																																	},
																																																	{
																																																		const = 0
																																																	},
																																																	{
																																																		const = BaseEnum.AIAnimationRootMotionType.Default
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
																					id = "1214",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1215",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "skillCd"
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
																								id = "1213",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "battlestage"
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
															id = "1354",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "1364",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					field = "battlestage"
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
																		id = "1356",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "1357",
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
																					id = "1358",
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
																					id = "1359",
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
																					id = "1360",
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
																					id = "1362",
																					class = "IfElse",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "1363",
																								class = "Condition",
																								properties = {
																									{
																										Operator = "GreaterEqual"
																									},
																									{
																										Opl = {
																											field = "distToTgtForSkill"
																										}
																									},
																									{
																										Opr = {
																											field = "maxKeepBoxDist"
																										}
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								id = "1361",
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
																													field = "bestKeepBoxDist"
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
																								id = "1353",
																								class = "Selector",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "1418",
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
																														id = "1417",
																														class = "DecoratorWeight",
																														properties = {
																															{
																																DecorateWhenChildEnds = "false"
																															},
																															{
																																Weight = {
																																	field = "attackWeight"
																																}
																															}
																														},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "1421",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1422",
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
																																									const = "enterCombat"
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
																																		},
																																		{
																																			node = {
																																				id = "1423",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1375",
																																							class = "Selector",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "1397",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1378",
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
																																																		const = 2114303
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
																																													id = "1377",
																																													class = "IfElse",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1395",
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
																																																id = "1800",
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
																																																			id = "1791",
																																																			class = "DecoratorWeight",
																																																			properties = {
																																																				{
																																																					DecorateWhenChildEnds = "false"
																																																				},
																																																				{
																																																					Weight = {
																																																						const = 2
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "1790",
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
																																																											const = 11430101
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
																																																			id = "1798",
																																																			class = "DecoratorWeight",
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
																																																						id = "1799",
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
																																																											const = 11430301
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
																																																			id = "1797",
																																																			class = "DecoratorWeight",
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
																																																						id = "1796",
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
																																																											const = 11430114
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
																																																			id = "1794",
																																																			class = "DecoratorWeight",
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
																																																						id = "1795",
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
																																																											const = 11430111
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
																																																			id = "1793",
																																																			class = "DecoratorWeight",
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
																																																						id = "1792",
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
																																																											const = 11430202
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
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "1385",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "1384",
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
																																																			id = "1813",
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
																																																						id = "1802",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1801",
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
																																																														const = 11430101
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
																																																						id = "1809",
																																																						class = "DecoratorWeight",
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
																																																									id = "1810",
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
																																																														const = 11430301
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
																																																						id = "1808",
																																																						class = "DecoratorWeight",
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
																																																									id = "1807",
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
																																																														const = 11430114
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
																																																						id = "1804",
																																																						class = "DecoratorWeight",
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
																																																									id = "1803",
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
																																																														const = 11430202
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
																																																						id = "1805",
																																																						class = "DecoratorWeight",
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
																																																									id = "1806",
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
																																																														const = 11430111
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
																																																						id = "1812",
																																																						class = "DecoratorWeight",
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
																																																									id = "1811",
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
																																																														const = 11430102
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
																																																				}
																																																			}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "1814",
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
																																																						id = "1831",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 3
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1830",
																																																									class = "Sequence",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1815",
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
																																																																	const = 11430401
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
																																																												id = "1832",
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
																																																				},
																																																				{
																																																					node = {
																																																						id = "1828",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 3
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1829",
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
																																																														const = 11430115
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
																																																						id = "1827",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1826",
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
																																																														const = 11430101
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
																																																						id = "1822",
																																																						class = "DecoratorWeight",
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
																																																									id = "1823",
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
																																																														const = 11430301
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
																																																						id = "1821",
																																																						class = "DecoratorWeight",
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
																																																									id = "1820",
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
																																																														const = 11430114
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
																																																						id = "1817",
																																																						class = "DecoratorWeight",
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
																																																									id = "1816",
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
																																																														const = 11430202
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
																																																						id = "1818",
																																																						class = "DecoratorWeight",
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
																																																									id = "1819",
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
																																																														const = 11430111
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
																																																						id = "1825",
																																																						class = "DecoratorWeight",
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
																																																									id = "1824",
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
																																																														const = 11430102
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
																																										id = "1835",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {
																																											{
																																												precondition = true,
																																												transition = false,
																																												id = "876",
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
																																																	field = "selfId"
																																																},
																																																{
																																																	const = 2114303
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
																																														Phase = "Enter"
																																													}
																																												}
																																											}
																																										},
																																										children = {
																																											{
																																												node = {
																																													id = "1833",
																																													class = "IfElse",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1834",
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
																																																id = "1836",
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
																																																			id = "1837",
																																																			class = "DecoratorWeight",
																																																			properties = {
																																																				{
																																																					DecorateWhenChildEnds = "false"
																																																				},
																																																				{
																																																					Weight = {
																																																						const = 2
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "1841",
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
																																																											const = 11430201
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
																																																			id = "1840",
																																																			class = "DecoratorWeight",
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
																																																						id = "1842",
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
																																																											const = 11430112
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
																																																			id = "1838",
																																																			class = "DecoratorWeight",
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
																																																						id = "1839",
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
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "1843",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "1844",
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
																																																			id = "1854",
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
																																																						id = "1846",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 3
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1845",
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
																																																														const = 11430112
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
																																																						id = "1848",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1847",
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
																																																														const = 11430201
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
																																																						id = "1850",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1849",
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
																																																														const = 11430115
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
																																																						id = "1852",
																																																						class = "DecoratorWeight",
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
																																																									id = "1853",
																																																									class = "Sequence",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1851",
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
																																																										},
																																																										{
																																																											node = {
																																																												id = "1855",
																																																												class = "Action",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "playAction",
																																																															params = {
																																																																{
																																																																	const = "Behav_Happy"
																																																																},
																																																																{
																																																																	const = -1
																																																																},
																																																																{
																																																																	const = ""
																																																																},
																																																																{
																																																																	const = false
																																																																},
																																																																{
																																																																	const = false
																																																																},
																																																																{
																																																																	const = 0
																																																																},
																																																																{
																																																																	const = BaseEnum.AIAnimationRootMotionType.Default
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
																																																			id = "1870",
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
																																																						id = "1866",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 4
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1868",
																																																									class = "Sequence",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1867",
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
																																																																	const = 11430401
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
																																																												id = "1869",
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
																																																				},
																																																				{
																																																					node = {
																																																						id = "1857",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 3
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1856",
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
																																																														const = 11430112
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
																																																						id = "1859",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1858",
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
																																																														const = 11430201
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
																																																						id = "1861",
																																																						class = "DecoratorWeight",
																																																						properties = {
																																																							{
																																																								DecorateWhenChildEnds = "false"
																																																							},
																																																							{
																																																								Weight = {
																																																									const = 2
																																																								}
																																																							}
																																																						},
																																																						attachments = {},
																																																						children = {
																																																							{
																																																								node = {
																																																									id = "1860",
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
																																																														const = 11430115
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
																																																						id = "1865",
																																																						class = "DecoratorWeight",
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
																																																									id = "1864",
																																																									class = "Sequence",
																																																									properties = {},
																																																									attachments = {},
																																																									children = {
																																																										{
																																																											node = {
																																																												id = "1863",
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
																																																										},
																																																										{
																																																											node = {
																																																												id = "1862",
																																																												class = "Action",
																																																												properties = {
																																																													{
																																																														Method = {
																																																															func = "playAction",
																																																															params = {
																																																																{
																																																																	const = "Behav_Happy"
																																																																},
																																																																{
																																																																	const = -1
																																																																},
																																																																{
																																																																	const = ""
																																																																},
																																																																{
																																																																	const = false
																																																																},
																																																																{
																																																																	const = false
																																																																},
																																																																{
																																																																	const = 0
																																																																},
																																																																{
																																																																	const = BaseEnum.AIAnimationRootMotionType.Default
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
																																					},
																																					{
																																						node = {
																																							id = "1429",
																																							class = "IfElse",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "1430",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Equal"
																																											},
																																											{
																																												Opl = {
																																													func = "checkIsBossAI"
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
																																										id = "1427",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1425",
																																													class = "Compute",
																																													properties = {
																																														{
																																															Operator = "Add"
																																														},
																																														{
																																															Opl = {
																																																field = "sideWalkWeight"
																																															}
																																														},
																																														{
																																															Opr1 = {
																																																field = "sideWalkWeight"
																																															}
																																														},
																																														{
																																															Opr2 = {
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
																																													id = "1424",
																																													class = "Assignment",
																																													properties = {
																																														{
																																															CastRight = "false"
																																														},
																																														{
																																															Opl = {
																																																field = "attackWeight"
																																															}
																																														},
																																														{
																																															Opr = {
																																																const = 125
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
																																										id = "1426",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1420",
																																													class = "Compute",
																																													properties = {
																																														{
																																															Operator = "Add"
																																														},
																																														{
																																															Opl = {
																																																field = "sideWalkWeight"
																																															}
																																														},
																																														{
																																															Opr1 = {
																																																field = "sideWalkWeight"
																																															}
																																														},
																																														{
																																															Opr2 = {
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
																																													id = "1428",
																																													class = "Assignment",
																																													properties = {
																																														{
																																															CastRight = "false"
																																														},
																																														{
																																															Opl = {
																																																field = "attackWeight"
																																															}
																																														},
																																														{
																																															Opr = {
																																																const = 125
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
																														id = "1416",
																														class = "DecoratorWeight",
																														properties = {
																															{
																																DecorateWhenChildEnds = "false"
																															},
																															{
																																Weight = {
																																	field = "sideWalkWeight"
																																}
																															}
																														},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "1419",
																																	class = "False",
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
																											id = "1313",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "1320",
																														class = "IfElse",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "1322",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "checkIsBossAI"
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
																																	id = "1319",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1318",
																																				class = "Compute",
																																				properties = {
																																					{
																																						Operator = "Add"
																																					},
																																					{
																																						Opl = {
																																							field = "attackWeight"
																																						}
																																					},
																																					{
																																						Opr1 = {
																																							field = "attackWeight"
																																						}
																																					},
																																					{
																																						Opr2 = {
																																							const = 175
																																						}
																																					}
																																				},
																																				attachments = {},
																																				children = {}
																																			}
																																		},
																																		{
																																			node = {
																																				id = "1317",
																																				class = "Assignment",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "sideWalkWeight"
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
																																	id = "1316",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1315",
																																				class = "Compute",
																																				properties = {
																																					{
																																						Operator = "Add"
																																					},
																																					{
																																						Opl = {
																																							field = "attackWeight"
																																						}
																																					},
																																					{
																																						Opr1 = {
																																							field = "attackWeight"
																																						}
																																					},
																																					{
																																						Opr2 = {
																																							const = 150
																																						}
																																					}
																																				},
																																				attachments = {},
																																				children = {}
																																			}
																																		},
																																		{
																																			node = {
																																				id = "1314",
																																				class = "Assignment",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "sideWalkWeight"
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
																															}
																														}
																													}
																												},
																												{
																													node = {
																														id = "1309",
																														class = "Selector",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "1310",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1306",
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
																																				id = "1308",
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
																																				id = "1311",
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
																																				id = "1321",
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
																																				id = "1304",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1307",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "1312",
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
																																							id = "1305",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "1302",
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
																																															field = "goBackDist"
																																														},
																																														{
																																															const = 2
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
																															},
																															{
																																node = {
																																	id = "1330",
																																	class = "Selector",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "1329",
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
																																							id = "1327",
																																							class = "DecoratorWeight",
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
																																										id = "1328",
																																										class = "False",
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
																																							id = "1325",
																																							class = "DecoratorWeight",
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
																																										id = "1326",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1324",
																																													class = "Condition",
																																													properties = {
																																														{
																																															Operator = "Equal"
																																														},
																																														{
																																															Opl = {
																																																func = "hasAnimState",
																																																params = {
																																																	{
																																																		const = "Skill_Halo"
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
																																													id = "1323",
																																													class = "Selector",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "1331",
																																																class = "Condition",
																																																properties = {
																																																	{
																																																		Operator = "Less"
																																																	},
																																																	{
																																																		Opl = {
																																																			func = "getTimerValue",
																																																			params = {
																																																				{
																																																					const = "Skill_Halo"
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
																																																id = "1332",
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
																																																					const = "Skill_Halo"
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
																																													id = "1333",
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
																																																		const = false
																																																	},
																																																	{
																																																		const = 0.8
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
																																													id = "1335",
																																													class = "Action",
																																													properties = {
																																														{
																																															Method = {
																																																func = "playAction",
																																																params = {
																																																	{
																																																		const = "Skill_Halo"
																																																	},
																																																	{
																																																		const = -1
																																																	},
																																																	{
																																																		const = ""
																																																	},
																																																	{
																																																		const = false
																																																	},
																																																	{
																																																		const = false
																																																	},
																																																	{
																																																		const = 0
																																																	},
																																																	{
																																																		const = BaseEnum.AIAnimationRootMotionType.Default
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
																																													id = "1334",
																																													class = "Action",
																																													properties = {
																																														{
																																															Method = {
																																																func = "startTimer",
																																																params = {
																																																	{
																																																		const = "Skill_Halo"
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
																																				id = "1341",
																																				class = "IfElse",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "1342",
																																							class = "Condition",
																																							properties = {
																																								{
																																									Operator = "Equal"
																																								},
																																								{
																																									Opl = {
																																										field = "canWalkLeftOrRight"
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
																																							id = "1347",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {
																																								{
																																									precondition = true,
																																									transition = false,
																																									id = "109",
																																									class = "Precondition",
																																									effector = false,
																																									properties = {
																																										{
																																											BinaryOperator = "And"
																																										},
																																										{
																																											Operator = "Greater"
																																										},
																																										{
																																											Opl = {
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
																																										},
																																										{
																																											Opr2 = {
																																												field = "minAttackDist"
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
																																										id = "1349",
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
																																															const = 1.2
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
																																					},
																																					{
																																						node = {
																																							id = "1351",
																																							class = "Selector",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "1339",
																																										class = "Sequence",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "1336",
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
																																													id = "1338",
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
																																																field = "minKeepBoxDist"
																																															}
																																														}
																																													},
																																													attachments = {},
																																													children = {}
																																												}
																																											},
																																											{
																																												node = {
																																													id = "1350",
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
																																																field = "bestKeepBoxDist"
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
																																													id = "1337",
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
																																																		field = "goBackDist"
																																																	},
																																																	{
																																																		const = 1.5
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
																																								},
																																								{
																																									node = {
																																										id = "1352",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "playAction",
																																													params = {
																																														{
																																															const = "Skill_Halo"
																																														},
																																														{
																																															const = -1
																																														},
																																														{
																																															const = ""
																																														},
																																														{
																																															const = false
																																														},
																																														{
																																															const = false
																																														},
																																														{
																																															const = 0
																																														},
																																														{
																																															const = BaseEnum.AIAnimationRootMotionType.Default
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

return ST_Monster_AutoCombat_Boss_10143
