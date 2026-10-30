-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_10431Run.lua

local data = {
	behavID = "BP_Wild_GroupBehav_10431Run",
	GroupBehavVisionArea = "visionAreaDefault",
	CDAfterEnd = 0.1,
	roleList = {
		{
			roleType = "role01",
			roleCondition = {
				{
					"petPrototypeId",
					11043100
				},
				{
					"staticId",
					"and"
				}
			}
		},
		{
			roleType = "role02",
			roleCondition = {
				{
					"petPrototypeId",
					11043100
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
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPoint01",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"role01",
						"role02"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10431Run",
								"BP_Wild_GroupBehav_10431Run",
								"BP_Wild_GroupBehav_10431Run",
								"BP_Wild_GroupBehav_10431Run"
							}
						}
					}
				}
			}
		},
		{
			timeout = 40,
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
						"role01"
					}
				},
				{
					func = "sendTrigger_Common",
					para = "GBPMsg_Common02",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							4
						}
					},
					role = {
						"role02"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10431Run",
								"BP_Wild_GroupBehav_10431Run"
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
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPoint02",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"role01"
					}
				},
				{
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPoint03",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"role02"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10431Run",
								"BP_Wild_GroupBehav_10431Run"
							}
						}
					}
				}
			}
		}
	}
}

return data
