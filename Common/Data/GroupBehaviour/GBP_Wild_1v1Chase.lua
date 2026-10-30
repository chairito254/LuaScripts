-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_1v1Chase.lua

local data = {
	behavID = "BP_Wild_GroupBehav_1v1Chase",
	CDAfterEnd = 0.1,
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
					role = {
						"role1",
						"role2"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_1v1Chase",
								"BP_Wild_GroupBehav_1v1Chase"
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
					para = "GBPMsg_ResPoint02",
					func = "sendTrigger_ResPoint",
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
					para = "GBPMsg_ResPoint02",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0.5
						}
					},
					role = {
						"role2"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_1v1Chase",
								"BP_Wild_GroupBehav_1v1Chase"
							}
						}
					}
				}
			}
		}
	}
}

return data
