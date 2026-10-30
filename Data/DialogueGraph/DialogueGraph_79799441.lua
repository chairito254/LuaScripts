-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79799441.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 79799441,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 20610306,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				npcId = -1,
				blackScreenIntervalTime = 2,
				blackScreenPlayType = 0,
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				chatType = 10
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
						nodeId = 4
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 999,
				staticIdVInput = 2,
				playableStateVInput = "CheckGlove_Idle_Start"
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 3,
				processingTime = 0,
				playAniType = 1,
				aniStateList = {
					"CheckGlove_Idle_Start",
					"CheckGlove_Idle_Loop",
					"CheckGlove_Idle_End"
				}
			},
			flowIn = {
				Stop = 1,
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
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 181,
				param = {
					index = 2
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "Stop",
						nodeId = 4
					}
				}
			}
		}
	}
}
