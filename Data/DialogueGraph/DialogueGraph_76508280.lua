-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_76508280.lua

return {
	startNodeId = 1,
	dialogueId = 76508280,
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
						nodeId = 7,
						portId = "In"
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
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 61,
			inputs = {
				abilityIdVInput = 1300080
			},
			valueIn = {
				castEntityIdVInput = {
					nodeId = 10,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			},
			flowOut = {
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
				delayTime = 4
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
						nodeId = 4,
						portId = "Stop"
					}
				},
				["1"] = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 76407431,
				targetEulerAngleVInput = {
					0,
					262.596,
					0
				},
				targetPositionVInput = {
					-470.52,
					61.951,
					830.646
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 10,
					portId = "EntityID"
				}
			},
			fields = {
				setPosition = true,
				reset = true,
				setRotation = false
			},
			flowIn = {
				In = 0
			}
		},
		[10] = {
			kind = 9,
			inputs = {
				staticIdVInput = 74638841
			},
			fields = {
				entityType = 1
			}
		}
	}
}
