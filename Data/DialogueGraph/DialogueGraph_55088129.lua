-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_55088129.lua

return {
	dialogueId = 55088129,
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
			kind = 14,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 4
				},
				targetEulerAngleVInput = {
					portId = "Value",
					nodeId = 6
				},
				targetPositionVInput = {
					portId = "Value",
					nodeId = 5
				}
			},
			fields = {
				reset = false,
				setRotation = false,
				setPosition = true
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
		{
			kind = 44,
			fields = {
				variableName = "StaticId"
			}
		},
		{
			kind = 9,
			valueIn = {
				staticIdVInput = {
					portId = "Value",
					nodeId = 3
				}
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "Pos"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "Dir"
			}
		}
	},
	blackboard = {
		StaticId = 0,
		Dir = {
			0,
			0,
			0
		},
		Pos = {
			0,
			0,
			0
		}
	}
}
