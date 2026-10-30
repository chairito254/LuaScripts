-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79795548.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 79795548,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304134,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304135,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		}
	}
}
