-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_GlacySleep.lua

local data = {
	minStartRoleNum = 4,
	minHoldRoleNum = 3,
	behavID = "BP_Wild_GroupBehav_GlacySleep",
	CDAfterEnd = 5,
	roleList = {
		{
			roleType = "莹冰龙",
			roleCondition = {
				{
					"horiDistLessThan",
					30
				},
				{
					"petPrototypeId",
					1004302,
					"and"
				}
			}
		},
		{
			roleType = "顽皮鱼1",
			notMustNeed = true,
			roleCondition = {
				{
					"petPrototypeId",
					1004202
				},
				{
					"horiDistLessThan",
					30,
					"and"
				}
			}
		},
		{
			roleType = "顽皮鱼2",
			notMustNeed = true,
			roleCondition = {
				{
					"petPrototypeId",
					1004202
				},
				{
					"horiDistLessThan",
					30,
					"and"
				}
			}
		},
		{
			roleType = "顽皮鱼3",
			notMustNeed = true,
			roleCondition = {
				{
					"petPrototypeId",
					1004202
				},
				{
					"horiDistLessThan",
					30,
					"and"
				}
			}
		}
	},
	stageList = {
		{
			timeout = 60,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonGlacyGoSleep",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"莹冰龙"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonDoPatrol",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"莹冰龙",
						"顽皮鱼1",
						"顽皮鱼2",
						"顽皮鱼3"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonHappy1",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							10
						}
					},
					role = {
						"顽皮鱼1"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"",
								"BP_Wild_GroupBehav_GlacySleep",
								"",
								""
							}
						}
					}
				}
			}
		},
		{
			timeout = 20,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonHappy2",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"顽皮鱼2"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonHappy3",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"顽皮鱼3"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"",
								"",
								"BP_Wild_GroupBehav_GlacySleep",
								"BP_Wild_GroupBehav_GlacySleep"
							}
						}
					}
				}
			}
		},
		{
			timeout = 20,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonHappy",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"顽皮鱼2",
						"顽皮鱼3"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonHappy",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							2
						}
					},
					role = {
						"顽皮鱼1"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"",
								"BP_Wild_GroupBehav_GlacySleep",
								"",
								""
							}
						}
					}
				}
			}
		},
		{
			timeout = 60,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonPlay1",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"顽皮鱼1"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonPlay2",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							2
						}
					},
					role = {
						"顽皮鱼2"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonPlay3",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							4
						}
					},
					role = {
						"顽皮鱼3"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonGlacyWakeUp",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							20
						}
					},
					role = {
						"莹冰龙"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonScare",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							23.84
						}
					},
					role = {
						"顽皮鱼1",
						"顽皮鱼2",
						"顽皮鱼3"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GlacySleep",
								"",
								"",
								""
							}
						}
					}
				}
			}
		},
		{
			timeout = 15,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonCry",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"顽皮鱼1",
						"顽皮鱼2",
						"顽皮鱼3"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonLookAround",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"莹冰龙"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GlacySleep",
								"BP_Wild_GroupBehav_GlacySleep",
								"BP_Wild_GroupBehav_GlacySleep",
								"BP_Wild_GroupBehav_GlacySleep"
							}
						}
					}
				}
			}
		},
		{
			timeout = 60,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonBack1",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"顽皮鱼1"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonBack2",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							1.5
						}
					},
					role = {
						"顽皮鱼2"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonBack3",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							1.5
						}
					},
					role = {
						"顽皮鱼3"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"",
								"BP_Wild_GroupBehav_GlacySleep",
								"BP_Wild_GroupBehav_GlacySleep",
								"BP_Wild_GroupBehav_GlacySleep"
							}
						}
					}
				}
			}
		},
		{
			timeout = 30,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonGlacyGoSleep",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"莹冰龙"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_CommonDoPatrol",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"顽皮鱼1",
						"顽皮鱼2",
						"顽皮鱼3"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GlacySleep",
								"",
								"",
								""
							}
						}
					}
				}
			}
		}
	}
}

return data
