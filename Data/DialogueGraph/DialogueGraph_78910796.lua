-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_78910796.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 78910796,
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
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "JumpSpray"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 4
				}
			},
			fields = {
				entityType = 2,
				templateId = 401056,
				processingTime = 0.75,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	}
}
