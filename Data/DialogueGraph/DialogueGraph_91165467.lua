-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91165467.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91165467,
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
			kind = 58,
			inputs = {
				waitPlayerIdleVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				modeInfo = {
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = false,
					hideTopLogo = false,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = false,
					hideAllUI = false,
					disableSpaceFollow = true,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = false,
					exitCatchMode = false,
					resetAllActions = true
				}
			},
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
			kind = 5,
			inputs = {
				playableStateVInput = "Float_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 301,
				aniStateList = {
					"Float_Start",
					"Float_Idle",
					"Float_End"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		}
	}
}
