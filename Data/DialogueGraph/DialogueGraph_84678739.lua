-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_84678739.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 84678739,
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
			kind = 27,
			fields = {
				uid = 193,
				param = {
					piecesId = 913173,
					openType = 0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
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
				dialogueIdVInput = 3710340,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 2,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"QUEST_STATE",
					3710001,
					nil,
					">=",
					4
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 0,
						portId = "End"
					}
				},
				True = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 121,
				param = {
					3710001,
					0,
					{
						0,
						0,
						0
					},
					{
						0,
						0,
						0
					},
					{
						0,
						0,
						0
					},
					true,
					true
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		}
	}
}
