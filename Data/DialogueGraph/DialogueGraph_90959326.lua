-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90959326.lua

return {
	startNodeId = 1,
	dialogueId = 90959326,
	schema = "v4",
	nodes = {
		[0] = {
			kind = 6,
			flowIn = {
				End = true
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
				In = true
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
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709105
			},
			fields = {
				chatType = 6,
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isResetValueInput = true,
				durationVInput = 1
			},
			flowIn = {
				In = true
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
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				targetEulerAngleVInput = {
					0,
					60,
					0
				},
				targetPositionVInput = {
					37.436,
					100.448,
					874.375
				}
			},
			fields = {
				reset = true,
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							value = 0,
							time = 0,
							inTangent = 0,
							outTangent = 1,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							value = 1,
							time = 1,
							inTangent = 1,
							outTangent = 0,
							weightedMode = 0
						}
					}
				}
			},
			flowIn = {
				In = true
			}
		}
	}
}
