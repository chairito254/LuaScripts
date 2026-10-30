-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_LoveAndKiss.lua

local data = {
	behavID = "BP_Wild_GroupBehav_LoveAndKiss",
	CDAfterEnd = 10,
	roleList = {
		{
			roleType = "love1",
			roleCondition = {
				{
					"petPrototypeId",
					1017100
				},
				{
					"horiDistMoreThan",
					0.3
				}
			}
		},
		{
			roleType = "love2",
			roleCondition = {
				{
					"petPrototypeId",
					1017100
				},
				{
					"horiDistLessThan",
					0.3,
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
					para = "GBPMsg_Common02",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"love2"
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
					role = {
						"love1"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_LoveAndKiss",
								"BP_Wild_GroupBehav_LoveAndKiss"
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
					para = "GBPMsg_Common03",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"love1",
						"love2"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_LoveAndKiss",
								"BP_Wild_GroupBehav_LoveAndKiss"
							}
						}
					}
				}
			}
		}
	}
}

return data
