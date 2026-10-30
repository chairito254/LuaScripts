-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91194022.lua

return {
	startNodeId = 1,
	dialogueId = 91194022,
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
				portCount = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 3,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				staticIdVInput = 91202232,
				targetEulerAngleVInput = {
					0,
					88.083,
					0
				},
				targetPositionVInput = {
					-1066.042,
					246.422,
					-378.271
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
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 4,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 5
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0,
				["4"] = 0,
				["3"] = 0
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
				moveTypeVInput = 2,
				staticIdVInput = 91458350,
				targetEulerAngleVInput = {
					0,
					123.47,
					0
				},
				targetPositionVInput = {
					-1065.871,
					246.422,
					-377.485
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
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 4,
						portId = "2"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 3304612,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 6.12,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 3304613,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 2.12,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 4,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				staticIdVInput = 91531236,
				targetEulerAngleVInput = {
					0,
					198.901,
					0
				},
				targetPositionVInput = {
					-1064.72,
					246.42,
					-377.075
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
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 4,
						portId = "3"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				staticIdVInput = 91531239,
				targetEulerAngleVInput = {
					0,
					168.932,
					0
				},
				targetPositionVInput = {
					-1065.414,
					246.425,
					-376.742
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
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 4,
						portId = "4"
					}
				}
			}
		}
	}
}
