-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91332114.lua

return {
	dialogueId = 91332114,
	schema = 1,
	startNodeId = 1,
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
			kind = 11,
			fields = {
				modeInfo = {
					blockEvent = false,
					modeType = 0,
					blockCameraZoom = false,
					hideTopLogo = false,
					hideMarkShare = false,
					hideInteractionSign = true,
					showHud = false,
					hideAllUI = false,
					disableSpaceFollow = true,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = false,
					exitCatchMode = false,
					resetAllActions = false
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6521009,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 2.5,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
				}
			}
		},
		{
			kind = 10,
			inputs = {
				endSkipVInput = true
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
