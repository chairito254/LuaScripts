-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_73378228.lua

return {
	startNodeId = 1,
	dialogueId = 73378228,
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
			kind = 62,
			inputs = {
				characterStateVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 8,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Mimicry_End"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1020100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1020100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		[8] = {
			kind = 9,
			fields = {
				entityType = 1
			}
		}
	}
}
