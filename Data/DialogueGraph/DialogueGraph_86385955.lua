-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_86385955.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 86385955,
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
			kind = 38,
			inputs = {
				maxLimitTimeVInput = 6,
				entityIdVInput = 2,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					300.957,
					0
				},
				targetPositionVInput = {
					-0.444,
					60.293,
					1077.23
				}
			},
			fields = {
				finishToSteer = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 49,
					portId = "EntityID"
				}
			},
			fields = {
				cameraPreset = 0,
				resetOrientation = true,
				reactPreset = 2,
				nodeMode = 0,
				enableGroupLookAt = true,
				enableDefaultLookAt = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FOut = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507001,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 2,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 11,
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
						nodeId = 7,
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
						nodeId = 8,
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
						nodeId = 9,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507002,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 1,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3,
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
				portCount = 3
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
				["2"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 72808087,
				playableStateVInput = "Talk_Shrug",
				playStartLoopEndVInput = true,
				loopDurationVInput = 60,
				fadeDurationVInput = 0.5
			},
			fields = {
				entityType = 2,
				templateId = 400132,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Talk_Shrug",
					"Talk_Shrug",
					"Talk_Shrug"
				}
			},
			flowIn = {
				In = 0
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
						nodeId = 13,
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
						nodeId = 14,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 46,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507003,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 2,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 15,
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
						nodeId = 16,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 45,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507004,
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
						nodeId = 17,
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
						nodeId = 18,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507005,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
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
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507006,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 14,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507007,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
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
						nodeId = 21,
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
						nodeId = 22,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 41,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507008,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 1,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 18,
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
						nodeId = 23,
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 25,
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
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507009,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
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
						nodeId = 28,
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
						nodeId = 29,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6507010,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 11,
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
						nodeId = 30,
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
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 10,
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
					6.697,
					65.354,
					1075.585
				},
				rotationVInput = {
					25.346,
					285.641,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 300,
				fStop = 12,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
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
				blendTimeVInput = 10,
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					7.101,
					65.532,
					1075.759
				},
				rotationVInput = {
					25.346,
					282.203,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 300,
				fStop = 12,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
			},
			flowIn = {
				In = 0
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
						nodeId = 35,
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
						nodeId = 36,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 39,
						portId = "In"
					}
				},
				["2"] = {
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
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1.347,
					61.659,
					1077.91
				},
				rotationVInput = {
					7.126,
					128.88,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 133,
				fStop = 12,
				cameraId = 88646015,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 37,
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
					-1.347,
					61.659,
					1077.91
				},
				rotationVInput = {
					7.126,
					128.88,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 133,
				fStop = 12,
				cameraId = 88653021,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Crossingarms_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 11,
				staticIdVInput = 72808087
			},
			fields = {
				entityType = 2,
				templateId = 400132,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Talk_Crossingarms_Start",
					"Talk_Crossingarms_Loop",
					"Talk_Crossingarms_Loop"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2.5
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Amazed_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2,
				fadeDurationVInput = 0.5
			},
			fields = {
				entityType = 0,
				templateId = 401,
				processingTime = 5,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Emotion_Amazed_Start",
					"Emotion_Amazed_Loop",
					"Emotion_Amazed_End"
				}
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
					1.135,
					61.455,
					1077.28
				},
				rotationVInput = {
					358.36,
					276.703,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 7.4,
				cameraId = 88643449,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Give_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 18,
				staticIdVInput = 72808087
			},
			fields = {
				entityType = 2,
				templateId = 400132,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Story_Give_Start",
					"Story_Give_Loop",
					"Story_Give_Loop"
				}
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
					6.697,
					65.354,
					1075.585
				},
				rotationVInput = {
					25.346,
					285.641,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 300,
				fStop = 12,
				cameraId = 88642538,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 44,
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
					7.101,
					65.532,
					1075.759
				},
				rotationVInput = {
					25.346,
					282.203,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 300,
				fStop = 12,
				cameraId = 88642944,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
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
					-1.649,
					61.992,
					1078.877
				},
				rotationVInput = {
					14.689,
					152.085,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 133,
				fStop = 12,
				cameraId = 88640687,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
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
					-0.096,
					61.596,
					1077.73
				},
				rotationVInput = {
					354.75,
					277.562,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 133,
				fStop = 12,
				cameraId = 88623810,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
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
					-1.649,
					61.992,
					1078.877
				},
				rotationVInput = {
					14.689,
					152.085,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 133,
				fStop = 12,
				cameraId = 88600120,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 130
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Confused",
				staticIdVInput = 2,
				fadeDurationVInput = 0.5
			},
			fields = {
				entityType = 0,
				templateId = 401,
				processingTime = 4.5,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 72808087
			},
			fields = {
				entityType = 2
			}
		}
	}
}
