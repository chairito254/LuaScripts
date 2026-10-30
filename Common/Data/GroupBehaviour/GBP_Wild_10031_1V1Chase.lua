-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_10031_1V1Chase.lua

local data = {
	behavID = "BP_Wild_GroupBehav_1v1Chase",
	GroupBehavVisionArea = "visionAreaLow",
	CDAfterEnd = 0,
	roleList = {
		{
			roleType = "role1",
			roleCondition = {
				{
					"staticId"
				}
			}
		},
		{
			roleType = "role2",
			roleCondition = {
				{
					"staticId"
				}
			}
		}
	},
	stageList = {
		{
			timeout = -1,
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
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_1v1Chase",
								"BP_Wild_GroupBehav_1v1Chase"
							}
						}
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
				}
			}
		},
		{
			timeout = -1,
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
						"role1"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_1v1Chase",
								"BP_Wild_GroupBehav_1v1Chase"
							}
						}
					}
				},
				{
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPoint02",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							1
						}
					},
					role = {
						"role2"
					}
				}
			}
		}
	}
}

return data
