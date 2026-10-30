-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\GroupBehaviour\\GBP_Wild_10431Carry.lua

local data = {
	GroupBehavVisionArea = "visionAreaLow",
	CDAfterEnd = 0.1,
	behavID = "BP_Wild_GroupBehav_10431Carry",
	roleList = {
		{
			roleType = "领头蚁",
			roleCondition = {
				{
					"staticId"
				}
			}
		},
		{
			roleType = "排第二个",
			roleCondition = {
				{
					"staticId"
				}
			}
		},
		{
			roleType = "排第三个",
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
					para = "GBPMsg_ResPointGO",
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
						"领头蚁"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry"
							}
						}
					}
				},
				{
					para = "GBPMsg_ResPointGO",
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
						"排第二个"
					}
				},
				{
					para = "GBPMsg_ResPointGO",
					func = "sendTrigger_ResPoint",
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
						"排第三个"
					}
				}
			}
		},
		{
			timeout = -1,
			functions = {
				{
					para = "GBPMsg_ResPointDoPatrol1",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"领头蚁"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry"
							}
						}
					}
				},
				{
					para = "GBPMsg_ResPointDoPatrol2",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"排第二个"
					}
				},
				{
					para = "GBPMsg_ResPointDoPatrol3",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"排第三个"
					}
				}
			}
		},
		{
			timeout = -1,
			functions = {
				{
					para = "GBPMsg_ResPointCarry01",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					extraPara = {
						tPortId = 4
					},
					role = {
						"领头蚁"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry"
							}
						}
					}
				},
				{
					para = "GBPMsg_ResPointCarry02",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							4
						}
					},
					extraPara = {
						tPortId = 5
					},
					role = {
						"排第二个"
					}
				},
				{
					para = "GBPMsg_ResPointCarry03",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							8
						}
					},
					extraPara = {
						tPortId = 6
					},
					role = {
						"排第三个"
					}
				}
			}
		},
		{
			timeout = -1,
			functions = {
				{
					para = "GBPMsg_ResPointBack01",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"领头蚁"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry"
							}
						}
					}
				},
				{
					para = "GBPMsg_ResPointBack02",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"排第二个"
					}
				},
				{
					para = "GBPMsg_ResPointBack03",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							0
						}
					},
					role = {
						"排第三个"
					}
				}
			}
		},
		{
			timeout = -1,
			functions = {
				{
					para = "GBPMsg_ResPointDrop01",
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
						"领头蚁"
					}
				},
				{
					para = "",
					func = "goToNextStage",
					condition = {
						conditionName = "behavEnd",
						conditionParamList = {
							{
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry",
								"BP_Wild_GroupBehav_10431Carry"
							}
						}
					}
				},
				{
					para = "GBPMsg_ResPointDrop02",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							3
						}
					},
					extraPara = {
						tPortId = 2
					},
					role = {
						"排第二个"
					}
				},
				{
					para = "GBPMsg_ResPointDrop03",
					func = "sendTrigger_ResPoint",
					condition = {
						conditionName = "delayTime",
						conditionParamObject = {
							6
						}
					},
					extraPara = {
						tPortId = 3
					},
					role = {
						"排第三个"
					}
				}
			}
		}
	}
}

return data
