-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_52159976.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 52159976,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 0
			},
			flowIn = {
				End = 0
			}
		},
		{
			kind = 8,
			flowOut = {
				Start = {
					{
						portId = "In",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 9
				},
				targetPositionVInput = {
					portId = "OutPosition",
					nodeId = 5
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							value = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							outTangent = 0,
							inTangent = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "SceneID"
			}
		},
		{
			kind = 43,
			valueIn = {
				dialogsetIDVInput = {
					portId = "Value",
					nodeId = 6
				},
				sceneIDVinput = {
					portId = "Value",
					nodeId = 4
				},
				slotIDVInput = {
					portId = "Value",
					nodeId = 7
				}
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "DialogSetID"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "SlotID"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "StaticID"
			}
		},
		{
			kind = 9,
			valueIn = {
				staticIdVInput = {
					portId = "Value",
					nodeId = 8
				}
			},
			fields = {
				entityType = 2
			}
		}
	},
	blackboard = {
		SceneID = 3000,
		StaticID = 0,
		SlotID = 0,
		DialogSetID = 0
	}
}
