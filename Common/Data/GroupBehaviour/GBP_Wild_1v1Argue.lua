-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_1v1Argue.lua

local data = {
	behavID = "BP_Wild_GroupBehav_1v1Argue",
	CDAfterEnd = 0.1,
	roleList = {
		{
			roleType = "role1",
			roleCondition = {
				{
					"petPrototypeId",
					1002100
				},
				{
					"staticId",
					"and"
				}
			}
		},
		{
			roleType = "role2",
			roleCondition = {
				{
					"petPrototypeId",
					1002400
				},
				{
					"staticId",
					"and"
				}
			}
		}
	},
	stageList = {
		{
			timeout = 20,
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
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_1v1Argue",
								"BP_Wild_GroupBehav_1v1Argue"
							}
						}
					}
				}
			}
		},
		{
			timeout = 25,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_Common01",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"role1"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_Common02",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							5
						}
					},
					role = {
						"role2"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_1v1Argue",
								"BP_Wild_GroupBehav_1v1Argue"
							}
						}
					}
				}
			}
		},
		{
			timeout = 25,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_Common03",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"role1"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_Common04",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							4
						}
					},
					role = {
						"role2"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_1v1Argue",
								"BP_Wild_GroupBehav_1v1Argue"
							}
						}
					}
				}
			}
		},
		{
			timeout = 25,
			functions = {
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_Common01",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"role1"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_Common01",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							5
						}
					},
					role = {
						"role2"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_1v1Argue",
								"BP_Wild_GroupBehav_1v1Argue"
							}
						}
					}
				}
			}
		}
	}
}

return data
