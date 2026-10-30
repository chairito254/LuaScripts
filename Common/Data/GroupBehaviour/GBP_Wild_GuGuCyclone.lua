-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_GuGuCyclone.lua

local data = {
	GroupBehavVisionArea = "visionAreaLow",
	CDAfterEnd = 0,
	minHoldRoleNum = 1,
	behavID = "BP_Wild_GroupBehav_GuGuCyclone",
	roleList = {
		{
			roleType = "Moto",
			roleCondition = {
				{
					"staticId"
				}
			}
		},
		{
			roleType = "Gugu",
			roleCondition = {
				{
					"staticId"
				}
			}
		}
	},
	stageList = {
		{
			timeout = 30,
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
						"Moto"
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
						"Gugu"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GuGuCyclone",
								"BP_Wild_GroupBehav_GuGuCyclone"
							}
						}
					}
				}
			}
		},
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
						"Moto",
						"Gugu"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GuGuCyclone",
								"BP_Wild_GroupBehav_GuGuCyclone"
							}
						}
					}
				}
			}
		},
		{
			timeout = 30,
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
						"Moto",
						"Gugu"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GuGuCyclone",
								"BP_Wild_GroupBehav_GuGuCyclone"
							}
						}
					}
				}
			}
		},
		{
			timeout = 30,
			functions = {
				{
					para = "GBPMsg_Common04",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"Moto",
						"Gugu"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GuGuCyclone",
								"BP_Wild_GroupBehav_GuGuCyclone"
							}
						}
					}
				}
			}
		},
		{
			timeout = 30,
			functions = {
				{
					para = "GBPMsg_Common05",
					func = "sendTrigger_Common",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"Moto",
						"Gugu"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_GuGuCyclone",
								"BP_Wild_GroupBehav_GuGuCyclone"
							}
						}
					}
				}
			}
		}
	}
}

return data
