-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91540149.lua

return {
	startNodeId = 1,
	dialogueId = 91540149,
	schema = 1,
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
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 3,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91458193,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					75.6,
					0
				},
				targetPositionVInput = {
					-875.677,
					145.081,
					447.392
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
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1
						},
						{
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0
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
						nodeId = 4,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 3
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
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
			kind = 19,
			inputs = {
				staticIdVInput = 91539564,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					345.346,
					0
				},
				targetPositionVInput = {
					-874.405,
					145.271,
					446.634
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
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1
						},
						{
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0
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
						nodeId = 4,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91539567,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					271.7,
					0
				},
				targetPositionVInput = {
					-873.547,
					145.096,
					447.544
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
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1
						},
						{
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0
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
						nodeId = 4,
						portId = "2"
					}
				}
			}
		}
	}
}
