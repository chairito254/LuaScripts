-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_10291CrossRiver.lua

local data = {
	minStartRoleNum = 2,
	minHoldRoleNum = 1,
	behavID = "BP_Wild_GroupBehav_10291CrossRiver",
	CDAfterEnd = 0,
	roleList = {
		{
			notMustNeed = true,
			roleType = "跳耶1",
			roleCondition = {
				{
					"petPrototypeId",
					10291
				},
				{
					"staticId",
					"and"
				}
			}
		},
		{
			notMustNeed = true,
			roleType = "跳耶2",
			roleCondition = {
				{
					"petPrototypeId",
					10291
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
			timeout = -1,
			functions = {
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10291CrossRiver",
								"BP_Wild_GroupBehav_10291CrossRiver",
								"BP_Wild_GroupBehav_10291CrossRiver"
							}
						}
					}
				},
				{
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPointGO1",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"跳耶1"
					}
				},
				{
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPointGO2",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"跳耶2"
					}
				}
			}
		},
		{
			timeout = -1,
			functions = {
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10291CrossRiver",
								"BP_Wild_GroupBehav_10291CrossRiver",
								"BP_Wild_GroupBehav_10291CrossRiver"
							}
						}
					}
				},
				{
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPointJump",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"跳耶1"
					}
				},
				{
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPointJump",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							11
						}
					},
					role = {
						"跳耶2"
					}
				}
			}
		}
	}
}

return data
