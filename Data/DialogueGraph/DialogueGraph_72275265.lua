-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72275265.lua

return {
	startNodeId = 1,
	dialogueId = 72275265,
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
			kind = 34,
			inputs = {
				staticIdVInput = 72275263
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				staticIdVInput = 72275263,
				moveTypeVInput = 2
			},
			valueIn = {
				targetEulerAngleVInput = {
					portId = "OutEulerAngle",
					nodeId = 4
				},
				targetPositionVInput = {
					portId = "OutPosition",
					nodeId = 4
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FinishOut = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 43,
			inputs = {
				slotIDVInput = 72275274,
				sceneIDVinput = 412,
				dialogsetIDVInput = 72275272
			}
		}
	}
}
