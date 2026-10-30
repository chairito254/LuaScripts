-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_TrickFriend.lua

local data = {
	CDAfterEnd = 0,
	behavID = "BP_Wild_GroupBehav_TrickFriend",
	roleList = {
		{
			roleType = "role1"
		},
		{
			roleType = "role2"
		},
		{
			roleType = "role3"
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
					extraPara = {
						tPortId = 1
					},
					role = {
						"role1"
					}
				},
				{
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPoint01",
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
					func = "sendTrigger_ResPoint",
					para = "GBPMsg_ResPoint01",
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
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd"
					}
				}
			}
		},
		{
			timeout = 20,
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
						"role1",
						"role2",
						"role3"
					}
				},
				{
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd"
					}
				}
			}
		},
		{
			timeout = 20,
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
						"role1",
						"role2",
						"role3"
					}
				},
				{
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd"
					}
				}
			}
		}
	}
}

return data
