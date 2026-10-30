-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91535450.lua

return {
	dialogueId = 91535450,
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
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 3
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91197886,
				targetEulerAngleVInput = {
					0,
					141.82,
					0
				},
				targetPositionVInput = {
					-923.71,
					439.901,
					-523.28
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							value = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							value = 1,
							time = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
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
						portId = "0",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 2,
				maxAwaitTime = -1
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
			},
			flowOut = {
				Out = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91534473,
				targetEulerAngleVInput = {
					0,
					70.65,
					0
				},
				targetPositionVInput = {
					-918.25,
					439.901,
					-507.24
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							value = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							value = 1,
							time = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
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
						portId = "1",
						nodeId = 4
					}
				}
			}
		}
	}
}
