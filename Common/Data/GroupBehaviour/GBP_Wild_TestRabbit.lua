-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_TestRabbit.lua

local data = {
	CDAfterEnd = 30,
	minStartRoleNum = 5,
	minHoldRoleNum = 5,
	behavID = "BP_Wild_GroupBehav_1v1Argue",
	roleList = {
		{
			roleType = "role1",
			notMustNeed = true,
			roleCondition = {
				{
					"petPrototypeId",
					10021
				},
				{
					"horiDistLessThan",
					0.5,
					"and"
				},
				{
					"entityTag",
					"TE_Par_Fly",
					"and"
				}
			}
		},
		{
			roleType = "role2",
			roleCondition = {
				{
					"petPrototypeId",
					10021
				}
			}
		},
		{
			roleType = "role3",
			roleCondition = {
				{
					"petPrototypeId",
					10021
				},
				{
					"horiDistMoreThan",
					0.5,
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
					para = "GBPMsg_Common01",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							2
						}
					},
					editorPara = {
						paraName = "GBPMsg_Common",
						paraValue = "01"
					},
					role = {
						"role1",
						"role2",
						"role3"
					}
				},
				{
					func = "goToNextStage",
					para = "",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_XXX",
								"BP_Wild_XXA",
								"BP_Wild_XXB"
							}
						}
					},
					editorPara = {}
				},
				{
					para = "GBPMsg_ResPoint02",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							2
						}
					},
					editorPara = {
						paraName = "GBPMsg_ResPoint",
						paraValue = "02"
					},
					extraPara = {
						tPointId = 1,
						tPortId = 0
					},
					role = {
						"role1",
						"role2",
						"role3"
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
						conditionName = "checkEnvObjChemState",
						conditionParamObject = {
							110252,
							"STATE_AFLAME_KEY"
						}
					},
					editorPara = {}
				}
			}
		}
	}
}

return data
