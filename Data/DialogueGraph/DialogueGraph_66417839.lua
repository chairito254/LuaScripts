-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_66417839.lua

return {
	dialogueId = 66417839,
	schema = 1,
	startNodeId = 2,
	nodes = {
		[2] = {
			kind = 8,
			flowOut = {
				Start = {
					{
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		[3] = {
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 0,
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				cameraPreset = 0
			},
			flowIn = {
				In = 0
			}
		},
		[20] = {
			kind = 9,
			inputs = {
				staticIdVInput = 66416680
			},
			fields = {
				entityType = 2
			}
		}
	}
}
