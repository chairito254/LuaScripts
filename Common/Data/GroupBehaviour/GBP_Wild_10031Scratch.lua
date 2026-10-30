-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_10031Scratch.lua

local data = {
	minHoldRoleNum = 1,
	behavID = "BP_Wild_GroupBehav_10031Scratch",
	GroupBehavVisionArea = "visionAreaLow",
	CDAfterEnd = 2,
	minStartRoleNum = 1,
	roleList = {
		{
			roleType = "螳螂",
			roleCondition = {
				{
					"petPrototypeId",
					1003100
				}
			}
		}
	},
	stageList = {
		{
			timeout = -1,
			functions = {
				{
					para = "GBPMsg_ResPointManitisGoScratch",
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
						"螳螂"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10031Scratch"
							}
						}
					}
				}
			}
		}
	}
}

return data
