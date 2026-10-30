-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91050703.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 91050703,
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					toplogoComList = {
						npc = true,
						multiPlayer = true,
						combat = true,
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
						petChat = true
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
						nodeId = 4,
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
						nodeId = 5,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 29,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6517120,
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
				duration = 5.25,
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
						nodeId = 6,
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
						nodeId = 10,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 9,
						portId = "In"
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
					-1336.316,
					103.732,
					1185.452
				},
				rotationVInput = {
					14.713,
					107.864,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 10.66,
				visualizeDOF = false,
				cameraId = 91074633,
				squeezeFactor = 1,
				sensorWidth = 197
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1336.316,
					103.732,
					1185.452
				},
				rotationVInput = {
					15.916,
					109.067,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 10.66,
				visualizeDOF = false,
				cameraId = 91074970,
				squeezeFactor = 1,
				sensorWidth = 197
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91051095,
				staticIdVInput = 91051106
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6517121,
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
				duration = 8.25,
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
						nodeId = 11,
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
						nodeId = 12,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 20,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 22,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 24,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6517122,
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
				duration = 5.5,
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
						nodeId = 13,
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
						nodeId = 14,
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
					-1334.471,
					103.851,
					1180.117
				},
				rotationVInput = {
					6.132,
					357.638,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 480,
				fStop = 4,
				visualizeDOF = false,
				cameraId = 91074639,
				squeezeFactor = 1,
				sensorWidth = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1334.582,
					104.183,
					1180.149
				},
				rotationVInput = {
					9.741,
					359.013,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 480,
				fStop = 4,
				visualizeDOF = false,
				cameraId = 91074972,
				squeezeFactor = 1,
				sensorWidth = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91051106,
				staticIdVInput = 91051252
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91051108,
				staticIdVInput = 91051252
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				fadeDurationVInput = 0,
				staticIdVInput = 91051252,
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 401,
				processingTime = 5.667,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Squat_End",
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				fadeDurationVInput = 0,
				loopDurationVInput = 999,
				staticIdVInput = 91051252,
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 401,
				processingTime = 5.667,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Emotion_Firm_End",
					"IdleRelax",
					"Squat_Start"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 23,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart",
				loopDurationVInput = 5,
				staticIdVInput = 91051242,
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 5120135,
				processingTime = 5.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91051252,
				staticIdVInput = 91051095
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91051100,
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 5120131,
				processingTime = 1.9,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 5,
			inputs = {
				playableStateVInput = "SquatFall_Start",
				loopDurationVInput = 999,
				staticIdVInput = 91051106,
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 401,
				processingTime = 5.667,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"SquatFall_Start",
					"SquatFall_Loop",
					"SquatFall_Loop"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91051106,
				playableStateVInput = "SquatFall_Loop"
			},
			fields = {
				templateId = 401,
				processingTime = 5.667,
				playAniType = 1,
				isLooping = true,
				entityType = 0
			},
			flowIn = {
				In = 0
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
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Crossingarms_Start",
				loopDurationVInput = 10,
				staticIdVInput = 91051095,
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 301,
				processingTime = 5.667,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Talk_Crossingarms_Start",
					"Talk_Crossingarms_Loop",
					"Talk_Crossingarms_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91051108,
				staticIdVInput = 91051095
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1336.111,
					104.215,
					1180.239
				},
				rotationVInput = {
					10.76,
					12.953,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 450,
				fStop = 9.82,
				visualizeDOF = false,
				cameraId = 91074193,
				squeezeFactor = 1,
				sensorWidth = 352
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 33,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1336.001,
					104.122,
					1180.719
				},
				rotationVInput = {
					11.619,
					13.468,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 450,
				fStop = 9.82,
				visualizeDOF = false,
				cameraId = 91074968,
				squeezeFactor = 1,
				sensorWidth = 352
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
		}
	}
}
