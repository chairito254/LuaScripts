-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_WolfChaseSheep.lua

local data = {
	behavID = "BP_Wild_GroupBehav_WolfChaseSheep",
	CDAfterEnd = 1,
	roleList = {
		{
			roleType = "role1",
			roleCondition = {
				{
					"petPrototypeId",
					1005100
				}
			}
		},
		{
			notMustNeed = true,
			roleType = "role2",
			roleCondition = {
				{
					"petPrototypeId",
					1026100
				}
			}
		},
		{
			notMustNeed = true,
			roleType = "role3",
			roleCondition = {
				{
					"petPrototypeId",
					1026100
				}
			}
		},
		{
			notMustNeed = true,
			roleType = "role4",
			roleCondition = {
				{
					"petPrototypeId",
					1026100
				}
			}
		},
		{
			notMustNeed = true,
			roleType = "role5",
			roleCondition = {
				{
					"petPrototypeId",
					1026100
				}
			}
		},
		{
			notMustNeed = true,
			roleType = "role6",
			roleCondition = {
				{
					"petPrototypeId",
					1026100
				}
			}
		}
	},
	stageList = {
		{
			timeout = 40,
			functions = {
				{
					para = "GBPMsg_ResPoint01",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					extraPara = {
						tPortId = 1
					},
					role = {
						"role1"
					}
				},
				{
					para = "GBPMsg_ResPoint01",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					extraPara = {
						tPortId = 2
					},
					role = {
						"role2"
					}
				},
				{
					para = "GBPMsg_ResPoint01",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					extraPara = {
						tPortId = 3
					},
					role = {
						"role3"
					}
				},
				{
					para = "GBPMsg_ResPoint01",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					extraPara = {
						tPortId = 4
					},
					role = {
						"role4"
					}
				},
				{
					para = "GBPMsg_ResPoint01",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					extraPara = {
						tPortId = 5
					},
					role = {
						"role5"
					}
				},
				{
					para = "GBPMsg_ResPoint01",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					extraPara = {
						tPortId = 6
					},
					role = {
						"role6"
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
								"",
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
			timeout = -1,
			functions = {
				{
					para = "GBPMsg_ResPoint02",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0.5
						}
					},
					role = {
						"role1"
					}
				},
				{
					para = "GBPMsg_ResPoint03",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"role2"
					}
				},
				{
					para = "GBPMsg_ResPoint04",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0.1
						}
					},
					role = {
						"role3"
					}
				},
				{
					para = "GBPMsg_ResPoint05",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0.2
						}
					},
					role = {
						"role4"
					}
				},
				{
					para = "GBPMsg_ResPoint06",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0.3
						}
					},
					role = {
						"role5"
					}
				},
				{
					para = "GBPMsg_ResPoint07",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0.4
						}
					},
					role = {
						"role6"
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
								"",
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
