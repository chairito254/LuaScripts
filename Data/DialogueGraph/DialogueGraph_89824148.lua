-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_89824148.lua

return {
	dialogueId = 89824148,
	schema = "v4",
	startNodeId = 0,
	nodes = {
		[0] = {
			kind = 8,
			flowOut = {
				Start = {
					{
						nodeId = 1,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				modeInfo = {
					exitCatchMode = false,
					resetAllActions = false,
					blockEvent = false,
					modeType = 0,
					blockCameraZoom = false,
					hideTopLogo = false,
					hideMarkShare = false,
					hideInteractionSign = false,
					showHud = false,
					hideAllUI = false,
					disableSpaceFollow = true,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = false
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202016
			},
			fields = {
				duration = 6,
				chatType = 10,
				blackScreenPlayType = 1,
				npcStaticId = 2,
				npcId = 400204
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
				dialogueIdVInput = 6202017
			},
			fields = {
				duration = 4,
				chatType = 10,
				blackScreenPlayType = 1,
				npcStaticId = 2,
				npcId = 400204
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-452.53,
					38.117,
					585.72
				},
				rotationVInput = {
					355.659,
					134.449,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90487893
			},
			flowOut = {
				Finish = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 7,
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-452.539,
					38.28,
					585.728
				},
				rotationVInput = {
					355.659,
					134.449,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 89926602
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 64
		}
	}
}
