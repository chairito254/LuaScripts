-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_GlacySleep2.lua

local data = {
	minStartRoleNum = 4,
	minHoldRoleNum = 4,
	behavID = "BP_Wild_GroupBehav_GlacySleep",
	CDAfterEnd = 25,
	roleList = {
		{
			roleType = "Glacy",
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
			roleType = "Pranky1",
			roleCondition = {
				{
					"horiDistLessThan",
					30,
					"and"
				},
				{
					"petPrototypeId",
					1004202,
					"and"
				}
			}
		},
		{
			roleType = "Pranky2",
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
			roleType = "Pranky3",
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
					para = "GBPMsg_CommonGlacyGoSleep",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"Glacy"
					}
				},
				{
					para = "GBPMsg_CommonHappy1",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							15
						}
					},
					role = {
						"Pranky1"
					}
				},
				{
					para = "",
					func = "goToNextStage",
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
					para = "GBPMsg_CommonHappy2",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"Pranky2"
					}
				},
				{
					para = "GBPMsg_CommonHappy3",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"Pranky3"
					}
				},
				{
					para = "",
					func = "goToNextStage",
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
					para = "GBPMsg_CommonHappy",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"Pranky2",
						"Pranky3"
					}
				},
				{
					para = "GBPMsg_CommonHappy",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							2
						}
					},
					role = {
						"Pranky1"
					}
				},
				{
					para = "",
					func = "goToNextStage",
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
					para = "GBPMsg_CommonPlay1",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"Pranky1"
					}
				},
				{
					para = "GBPMsg_CommonPlay2",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							2
						}
					},
					role = {
						"Pranky2"
					}
				},
				{
					para = "GBPMsg_CommonPlay3",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							3
						}
					},
					role = {
						"Pranky3"
					}
				},
				{
					para = "GBPMsg_CommonGlacyWakeUp",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							15
						}
					},
					role = {
						"Glacy"
					}
				},
				{
					para = "",
					func = "goToNextStage",
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
			timeout = 20,
			functions = {
				{
					para = "GBPMsg_CommonCry",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							1
						}
					},
					role = {
						"Pranky1",
						"Pranky2",
						"Pranky3"
					}
				},
				{
					para = "GBPMsg_CommonLookAround",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							5
						}
					},
					role = {
						"Glacy"
					}
				},
				{
					para = "GBPMsg_Common",
					func = "goToNextStage",
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
			timeout = 20,
			functions = {
				{
					para = "GBPMsg_CommonBack1",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"Pranky1"
					}
				},
				{
					para = "GBPMsg_CommonBack2",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							1.5
						}
					},
					role = {
						"Pranky2"
					}
				},
				{
					para = "GBPMsg_CommonBack3",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							1.5
						}
					},
					role = {
						"Pranky3"
					}
				},
				{
					para = "GBPMsg_CommonGlacyGoSleep",
					func = "goToNextStage",
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
			timeout = 15,
			functions = {
				{
					para = "GBPMsg_CommonGlacyGoSleep",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"Glacy"
					}
				},
				{
					para = "",
					func = "goToNextStage",
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
