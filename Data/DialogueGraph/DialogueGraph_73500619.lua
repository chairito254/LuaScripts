-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_73500619.lua

return {
	dialogueId = 73500619,
	schema = 1,
	startNodeId = 1,
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
			kind = 19,
			inputs = {
				speedVInput = 1.25,
				moveTypeVInput = 2,
				staticIdVInput = 72084386,
				targetEulerAngleVInput = {
					0,
					44.6,
					0
				},
				targetPositionVInput = {
					-1752.252,
					94.47,
					639.532
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
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
		}
	}
}
