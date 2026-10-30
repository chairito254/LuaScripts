-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_74405735.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 74405735,
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
						nodeId = 2,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				targetPositionVInput = {
					-1242.552,
					100.772,
					962.403
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 4,
					portId = "EntityID"
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
							time = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							weightedMode = 0,
							value = 0
						},
						{
							time = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							weightedMode = 0,
							value = 1
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
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 1.2,
				staticIdVInput = 56459932
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 56459932
			},
			fields = {
				entityType = 2
			}
		}
	}
}
