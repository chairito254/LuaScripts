-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90824761.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 90824761,
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
			kind = 5,
			inputs = {
				staticIdVInput = 77239042,
				playableStateVInput = "Story_Talk02"
			},
			fields = {
				templateId = 400129,
				processingTime = 3.2,
				playAniType = 1,
				isLooping = false,
				entityType = 2
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
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.8,
				staticIdVInput = 77239062,
				targetEulerAngleVInput = {
					0,
					300,
					0
				},
				targetPositionVInput = {
					29.775,
					51.841,
					999.601
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							value = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							outWeight = 0,
							weightedMode = 0
						},
						{
							time = 1,
							value = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							outWeight = 0,
							weightedMode = 0
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
