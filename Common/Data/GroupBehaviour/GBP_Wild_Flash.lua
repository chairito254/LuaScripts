-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_Flash.lua

local data = {
	behavID = "BP_Wild_GroupBehav_Flash",
	CDAfterEnd = 5,
	roleList = {
		{
			roleType = "role1"
		},
		{
			roleType = "role2"
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
								"BP_Wild_GroupBehav_Flash",
								"BP_Wild_GroupBehav_Flash"
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
					para = "GBPMsg_Common01",
					func = "sendTrigger_Common",
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
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_Flash",
								"BP_Wild_GroupBehav_Flash"
							}
						}
					}
				},
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
						"role2"
					}
				}
			}
		}
	}
}

return data
