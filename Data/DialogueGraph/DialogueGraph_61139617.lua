-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_61139617.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 61139617,
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					toplogoComList = {
						vlog = true,
						petFertility = true,
						petExchange = true,
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = false,
						callFriends = true,
						bubble = false,
						alert = true,
						quest = true,
						teamSpeech = true,
						photo = true,
						battleRoom = true,
						actionState = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 0,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-916.917,
					105.316,
					1245.78
				},
				rotationVInput = {
					16.653,
					43.124,
					0.004
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91175324,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70001805,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70001806,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 1
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
