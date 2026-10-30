-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_GuGuSlide.lua

local data = {
	behavID = "BP_Wild_GroupBehav_GuGuSlide",
	CDAfterEnd = 0,
	minStartRoleNum = 3,
	minHoldRoleNum = 3,
	roleList = {
		{
			roleType = "GUGU_1",
			roleCondition = {
				{
					"petPrototypeId",
					1045100
				},
				{
					"staticId",
					"and"
				}
			}
		},
		{
			roleType = "GUGU_2",
			roleCondition = {
				{
					"petPrototypeId",
					1045100
				},
				{
					"staticId",
					"and"
				}
			}
		},
		{
			roleType = "GUGU_3",
			roleCondition = {
				{
					"petPrototypeId",
					1045100
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
			timeout = 30,
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
						"GUGU_1"
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
						"GUGU_2"
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
						"GUGU_3"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GuGuSlide",
								"BP_Wild_GroupBehav_GuGuSlide",
								"BP_Wild_GroupBehav_GuGuSlide"
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
					para = "GBPMsg_Common02",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"GUGU_1",
						"GUGU_2",
						"GUGU_3"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GuGuSlide",
								"BP_Wild_GroupBehav_GuGuSlide",
								"BP_Wild_GroupBehav_GuGuSlide"
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
					para = "GBPMsg_Common03",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"GUGU_1",
						"GUGU_2",
						"GUGU_3"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GuGuSlide",
								"BP_Wild_GroupBehav_GuGuSlide",
								"BP_Wild_GroupBehav_GuGuSlide"
							}
						}
					}
				}
			}
		}
	}
}

return data
