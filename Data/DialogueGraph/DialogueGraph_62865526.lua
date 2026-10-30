-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_62865526.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 62865526,
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
				dialogueIdVInput = 3704015,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 10,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false
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
			kind = 12,
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
						nodeId = 5,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 42,
			inputs = {
				npcIdVInput = 400079,
				npcCallVInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3704011,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3704012,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 55,
			inputs = {
				npcCallVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Start = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		}
	}
}
