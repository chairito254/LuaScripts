-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_83742830.lua

return {
	startNodeId = 1,
	dialogueId = 83742830,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304423,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 3,
				portCount = 1,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				audioName = "VOX_Chapter01_Nico_012"
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
				dialogueIdVInput = 3304424,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 3,
				portCount = 1,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 4.25,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				audioName = "VOX_Chapter01_Player_010"
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
