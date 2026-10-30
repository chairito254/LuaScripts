-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91093710.lua

return {
	startNodeId = 2,
	dialogueId = 91093710,
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
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 24,
			inputs = {
				switchToPlayerVInput = true
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					toplogoComList = {
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
						actionState = true,
						vlog = true,
						teamSpeech = true,
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true
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
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 13,
			inputs = {
				staticIdVInput = 2
			},
			fields = {
				cameraPreset = 2,
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 1,
				enableGroupLookAt = false,
				enableDefaultLookAt = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 7
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
				},
				["1"] = {
					{
						nodeId = 92,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 86,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 88,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 82,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 91,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518082,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 2,
			fields = {
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 84,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 82,
						portId = "closeUIFInput"
					}
				},
				["5"] = {
					{
						nodeId = 83,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518083,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 10,
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
						nodeId = 11,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 80,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518084,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 78,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 79,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"TWIN_PET_CHOICE",
					nil,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 76,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518085,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 200001,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 61,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518087,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 19,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 68,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518088,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 21,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 60,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 61,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 62,
						portId = "Play"
					}
				},
				["4"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518089,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3.38,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 59,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518090,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"TWIN_PET_CHOICE",
					nil,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 53,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 25,
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
						nodeId = 26,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 52,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518091,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 27,
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
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518093,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 30,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 50,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 49,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518094,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 45,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 46,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 47,
						portId = "Stop"
					}
				},
				["4"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 49,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518095,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 33,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 34,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 37,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 39,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518096,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 35,
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
						nodeId = 36,
						portId = "In"
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
						nodeId = 1,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					298.013,
					155.346,
					931.019
				},
				rotationVInput = {
					355.591,
					7.567,
					0
				}
			},
			fields = {
				fStop = 12.71,
				cameraId = 91095853,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 244,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 330
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					297.868,
					155.282,
					931.049
				},
				rotationVInput = {
					353.7,
					8.943,
					0
				}
			},
			fields = {
				fStop = 12.71,
				cameraId = 91099952,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 244,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 91061323,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 2.533,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91061325,
				staticIdVInput = 91061323
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 42,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 91061323
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 91061325,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120153,
				processingTime = 2.533,
				aniStateList = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					297.523,
					156.525,
					938.524
				},
				rotationVInput = {
					13.963,
					148.859,
					0
				}
			},
			fields = {
				fStop = 27.37,
				cameraId = 91095846,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 277,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Emotion_ShakeHead"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 2.533
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 91061325,
				playableStateVInput = "EnvBehav_Dance_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120153,
				processingTime = 2.533,
				aniStateList = {
					"EnvBehav_Dance_Start",
					"EnvBehav_Dance_Loop",
					"EnvBehav_Dance_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 91061323,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 2.533,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					299.194,
					156.06,
					936.019
				},
				rotationVInput = {
					0.394,
					328.614,
					0
				}
			},
			fields = {
				fStop = 15.07,
				cameraId = 91095840,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 260,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 172
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91061323
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1708561934,
				playableStateVInput = "Story_ShakeHead"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 1,
				templateId = 1036100,
				processingTime = 2
			},
			flowIn = {
				In = 0
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
						nodeId = 54,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 55,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518092,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1708561934,
				playableStateVInput = "Story_ShakeHead"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 1,
				templateId = 1036100,
				processingTime = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					297.206,
					155.08,
					932.152
				},
				rotationVInput = {
					351.391,
					14.337,
					0
				}
			},
			fields = {
				fStop = 15.07,
				cameraId = 91095821,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 260,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 278
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					297.206,
					155.08,
					932.152
				},
				rotationVInput = {
					345.891,
					20.353,
					0
				}
			},
			fields = {
				fStop = 15.07,
				cameraId = 91128136,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 260,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 278
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91061323,
				playableStateVInput = "Talk_Lefthand"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 2.533
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Emotion_PlayerBoy_Annoy_01_01"
			},
			fields = {
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 999,
				fadeDurationVInput = 1,
				staticIdVInput = 91061325,
				speedVInput = 1.5,
				playableStateVInput = "EnvBehav_Blame"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120153,
				processingTime = 2.533
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91061323,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 3
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10324_Attack_H"
			},
			fields = {
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 63,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 64,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Emotion_PlayerBoy_Surprise_01_02"
			},
			fields = {
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91061325
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					317.942,
					153.785,
					905.285
				},
				rotationVInput = {
					354.4,
					327.583,
					0
				}
			},
			fields = {
				fStop = 7.83,
				cameraId = 91095797,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 726,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 2750
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 56,
			fields = {
				shakeType = 1,
				cameraShakeItem = {
					shakeFrequency = 6,
					shakeDissipation = 28,
					playSpace = 0,
					shakeType = 1,
					decayTime = 1,
					holdForever = false,
					shakeRadius = -1,
					flags = 0,
					sustainTime = 0.1,
					attackTime = 0.2,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								time = 0,
								inTangent = 0,
								outTangent = 0,
								value = 1
							},
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								time = 1,
								inTangent = 0,
								outTangent = 0,
								value = 1
							}
						}
					},
					shakePos = {
						0,
						0,
						0
					},
					noisePosAmplitudes = {
						0,
						0,
						0
					},
					noiseRotAmplitudes = {
						0.5,
						0.5,
						0.5
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								time = 0,
								inTangent = 0,
								outTangent = 0,
								value = 1
							},
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								time = 1,
								inTangent = 0,
								outTangent = 0,
								value = 1
							}
						}
					},
					noisePosSeeds = {
						0,
						0,
						0
					},
					noiseRotSeeds = {
						0,
						0,
						0
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 91061323,
				loopDurationVInput = 999,
				playableStateVInput = "Story_SquatWatch_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 2.533,
				aniStateList = {
					"Story_SquatWatch_Start",
					"Story_SquatWatch_Loop",
					"Squat_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					306.367,
					156.489,
					931.418
				},
				rotationVInput = {
					2.515,
					304.503,
					0
				}
			},
			fields = {
				fStop = 15.07,
				cameraId = 91131474,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 260,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 400
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					303.529,
					155.339,
					934.075
				},
				rotationVInput = {
					354.722,
					298.466,
					0
				}
			},
			fields = {
				fStop = 15.07,
				cameraId = 91099627,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 260,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 300
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					303.529,
					155.339,
					934.075
				},
				rotationVInput = {
					352.831,
					294.513,
					0
				}
			},
			fields = {
				fStop = 15.07,
				cameraId = 91128122,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 260,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 300
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91061323
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 200001,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					299.862,
					154.796,
					933.72
				},
				rotationVInput = {
					0,
					341.731,
					0
				}
			},
			fields = {
				entityId = -1708561934,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 74,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1708561934,
				targetEulerAngleVInput = {
					0,
					339.231,
					0
				},
				targetPositionVInput = {
					298.799,
					154.885,
					935.656
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							time = 0,
							inTangent = 0,
							outTangent = 1,
							value = 0
						},
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							time = 1,
							inTangent = 1,
							outTangent = 0,
							value = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						nodeId = 75,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1708561934,
				playableStateVInput = "Emotion_Surprise"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 1,
				templateId = 1036100,
				processingTime = 4.367
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518086,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 200001,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Common_Parmon_Switch.prefab",
				postionVInput = {
					299.862,
					154.796,
					933.72
				},
				rotationVInput = {
					0,
					341.731,
					0
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "SFX_Combat_10222_Skill_Spark_Start"
			},
			fields = {
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 91061323,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 1.733,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				animationLayerVInput = 4,
				staticIdVInput = 2,
				playableStateVInput = "TalkUpper_Confused"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 4.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 27,
			fields = {
				uid = 306,
				param = {
					title = "CHARACTER_APPEARANCE_DESC_XIAOCHEN",
					name = "CHARACTER_APPEARANCE_NAME_XIAOCHEN",
					pos = {
						-800,
						200,
						0
					}
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91061323,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					299.043,
					156.415,
					938.926
				},
				rotationVInput = {
					10.528,
					183.408,
					0
				}
			},
			fields = {
				fStop = 18,
				cameraId = 91095768,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 150,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 170
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 85,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					299.38,
					156.342,
					939.366
				},
				rotationVInput = {
					9.84,
					191.831,
					0
				}
			},
			fields = {
				fStop = 18,
				cameraId = 91097288,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 150,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 170
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					299.967,
					155.969,
					936.277
				},
				rotationVInput = {
					355.602,
					302.725,
					0
				}
			},
			fields = {
				fStop = 15.07,
				cameraId = 91095745,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 260,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 172
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 87,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					299.967,
					155.969,
					936.277
				},
				rotationVInput = {
					357.492,
					306.162,
					0
				}
			},
			fields = {
				fStop = 15.07,
				cameraId = 91096079,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 260,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 172
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					326.342,
					0
				},
				targetPositionVInput = {
					299.344,
					154.865,
					936.045
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 91061325
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 90,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 999,
				staticIdVInput = 91061325,
				playableStateVInput = "Behav_HappyEnd"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120153,
				processingTime = 3.333
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 50,
			inputs = {
				fillLightIntensityVInput = 8000,
				enableFillLightVInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91061323
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 93,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				animationLayerVInput = 4,
				staticIdVInput = 91061323,
				playableStateVInput = "TalkUpper_Apologize"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 3.833
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 94,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 91061323
			},
			flowIn = {
				In = 0
			}
		}
	}
}
