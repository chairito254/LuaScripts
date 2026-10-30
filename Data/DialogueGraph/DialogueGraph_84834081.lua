-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_84834081.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 84834081,
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
						portId = "Play",
						nodeId = 3
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "BGM_Scene_ArgentStrait_Song"
			},
			fields = {
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0,
				enableFadeOut = false
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 99999
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
		}
	}
}
