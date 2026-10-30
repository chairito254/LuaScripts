-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_82453580.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 82453580,
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
				maxLimitTimeVInput = 10,
				staticIdVInput = 72526864,
				targetEulerAngleVInput = {
					0,
					270,
					0
				},
				targetPositionVInput = {
					-1591.981,
					87.405,
					837.877
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
							inWeight = 0,
							outTangent = 1,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inTangent = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
							inTangent = 1,
							time = 1
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
						nodeId = 7,
						portId = "2"
					}
				},
				Out = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 82423015,
				targetEulerAngleVInput = {
					0,
					340,
					0
				},
				targetPositionVInput = {
					-1592.05,
					87.405,
					836.379
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
							inWeight = 0,
							outTangent = 1,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inTangent = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
							inTangent = 1,
							time = 1
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
						nodeId = 7,
						portId = "1"
					}
				},
				Out = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				maxLimitTimeVInput = 10,
				staticIdVInput = 77979713,
				targetEulerAngleVInput = {
					0,
					100,
					0
				},
				targetPositionVInput = {
					-1593.823,
					87.405,
					837.882
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
							inWeight = 0,
							outTangent = 1,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inTangent = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
							inTangent = 1,
							time = 1
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
						nodeId = 7,
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
				["0"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		}
	}
}
