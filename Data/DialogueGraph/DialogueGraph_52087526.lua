-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_52087526.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 52087526,
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
			valueIn = {
				entityIdVInput = {
					portId = "Value",
					nodeId = 7
				}
			},
			fields = {
				templateId = 0,
				processingTime = 0,
				playAniType = 2,
				isLooping = false,
				entityType = 0
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
					portId = "Value",
					nodeId = 8
				},
				targetPositionVInput = {
					portId = "OutPosition",
					nodeId = 10
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							outTangent = 0,
							inTangent = 1,
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
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 5,
			valueIn = {
				entityIdVInput = {
					portId = "Value",
					nodeId = 8
				}
			},
			fields = {
				templateId = 0,
				processingTime = 0,
				playAniType = 2,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
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
			kind = 5,
			valueIn = {
				entityIdVInput = {
					portId = "Value",
					nodeId = 7
				}
			},
			fields = {
				templateId = 0,
				processingTime = 0,
				playAniType = 2,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5.5
			},
			flowIn = {
				In = 0
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
		[10] = {
			kind = 43,
			valueIn = {
				dialogsetIDVInput = {
					portId = "Value",
					nodeId = 11
				},
				sceneIDVinput = {
					portId = "Value",
					nodeId = 9
				},
				slotIDVInput = {
					portId = "Value",
					nodeId = 12
				}
			}
		}
	},
	blackboard = {
		BestuckSlotID = 0,
		BestuckID = 0,
		AskhelpID = 0,
		DialogSetID = 0
	}
}
