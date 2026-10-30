-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_GroupBehav_10042Sleep.lua

local data = {
	minStartRoleNum = 3,
	minHoldRoleNum = 3,
	behavID = "BP_Wild_GroupBehav_10042Sleep",
	GroupBehavVisionArea = "visionAreaDefault",
	CDAfterEnd = 10,
	roleList = {
		{
			roleType = "冰莹龙",
			roleCondition = {
				{
					"petPrototypeId",
					1004302
				}
			}
		},
		{
			roleType = "顽皮鱼1",
			roleCondition = {
				{
					"petPrototypeId",
					1004202
				}
			}
		},
		{
			roleType = "顽皮鱼2",
			roleCondition = {
				{
					"petPrototypeId",
					1004202
				}
			}
		},
		{
			roleType = "顽皮鱼3",
			roleCondition = {
				{
					"petPrototypeId",
					1004202
				}
			}
		}
	},
	stageList = {
		{
			timeout = -1,
			functions = {
				{
					para = "GBPMsg_CommonHappyChase",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"冰莹龙",
						"顽皮鱼1",
						"顽皮鱼2",
						"顽皮鱼3"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10042Sleep",
								"BP_Wild_GroupBehav_10042Sleep",
								"BP_Wild_GroupBehav_10042Sleep",
								"BP_Wild_GroupBehav_10042Sleep"
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
					para = "GBPMsg_CommonWakeUp",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"冰莹龙",
						"顽皮鱼1",
						"顽皮鱼2",
						"顽皮鱼3"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10042Sleep",
								"BP_Wild_GroupBehav_10042Sleep",
								"BP_Wild_GroupBehav_10042Sleep",
								"BP_Wild_GroupBehav_10042Sleep"
							}
						}
					}
				}
			}
		}
	}
}

return data
