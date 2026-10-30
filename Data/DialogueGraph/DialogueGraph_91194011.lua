-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91194011.lua

return {
	dialogueId = 91194011,
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
				onSkipStartConnected = true,
				modeInfo = {
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = true,
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
						battleRoom = true,
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
						portId = "In",
						nodeId = 24
					}
				},
				Out = {
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
				portCount = 6
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
						nodeId = 58
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 62
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 64
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 66
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 5
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
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 8
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 50
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 51
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 52
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 55
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 56
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 57
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304570,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 2.5,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 4.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 9
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
						portId = "In",
						nodeId = 10
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 44
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 46
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 49
					}
				},
				["5"] = {
					{
						portId = "Stop",
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304571,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Behav_Alert",
				skipTime = 0.5,
				npcStaticId = -1,
				npcId = 5150020,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				animCfg = {
					[1] = "Behav_Alert",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 11
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
						portId = "In",
						nodeId = 12
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 41
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 42
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304572,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 8.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 13
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
						portId = "In",
						nodeId = 14
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 36
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 37
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 40
					}
				},
				["5"] = {
					{
						portId = "Stop",
						nodeId = 41
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 33045721,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 3.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 15
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 32
					}
				},
				ShowFinOut = {
					{
						portId = "Stop",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304573
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 16
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
						portId = "In",
						nodeId = 17
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 30
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304575,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 18
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
						portId = "In",
						nodeId = 19
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304577,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 5.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 20
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
						portId = "In",
						nodeId = 21
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 25
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 22
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
						portId = "In",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						portId = "In",
						nodeId = 24
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
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 26
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -211008625
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 21,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91517571,
				lookAtEntityStaticIdVInput = -211008625
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91517571,
				lookAtEntityStaticIdVInput = -211008625
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 15,
				staticIdVInput = 91517571,
				playableStateVInput = "Talk_Lefthand_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0.567,
				playAniType = 1,
				aniStateList = {
					"Talk_Lefthand_Start",
					"Talk_Lefthand_Loop",
					"Talk_Lefthand_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304574
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 33
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
						portId = "In",
						nodeId = 34
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 30
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304576,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91517571,
				playableStateVInput = "Talk_Lefthand_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0.567,
				playAniType = 1,
				aniStateList = {
					"Talk_Lefthand_Start",
					"Talk_Lefthand_Loop",
					"Talk_Lefthand_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91517571,
				targetEulerAngleVInput = {
					0,
					134.536,
					0
				}
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 78
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						portId = "In",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -211008625,
				targetEulerAngleVInput = {
					0,
					134.536,
					0
				}
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 79
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1081.615,
					178.85,
					-275.967
				},
				rotationVInput = {
					1.256,
					283.515,
					359.99
				}
			},
			fields = {
				focalDistance = 172,
				fStop = 16.21,
				cameraId = 91521543,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 186,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 39
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1081.836,
					178.845,
					-275.914
				},
				rotationVInput = {
					0.741,
					282.828,
					359.99
				}
			},
			fields = {
				focalDistance = 172,
				fStop = 16.21,
				cameraId = 91521554,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 186,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91517571,
				lookAtEntityStaticIdVInput = -211008625
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91517571,
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
				playAniType = 1,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91517571,
				lookAtEntityStaticIdVInput = -211008625
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Alert",
				staticIdVInput = 91517582
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150020,
				processingTime = 0,
				playAniType = 1
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91517582,
				targetEulerAngleVInput = {
					0,
					134.536,
					0
				}
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 77
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91517587,
				targetEulerAngleVInput = {
					0,
					160.529,
					0
				}
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 77
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1085.828,
					178.681,
					-275.374
				},
				rotationVInput = {
					8.802,
					114.482,
					359.99
				}
			},
			fields = {
				focalDistance = 4105,
				fStop = 32,
				cameraId = 91521439,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 0.1,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1085.828,
					178.681,
					-275.374
				},
				rotationVInput = {
					1.6,
					114.482,
					359.99
				}
			},
			fields = {
				focalDistance = 4105,
				fStop = 32,
				cameraId = 91521517,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 0.1,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 48
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1082.98,
					181.645,
					-277.454
				},
				rotationVInput = {
					0.053,
					125.483,
					359.99
				}
			},
			fields = {
				focalDistance = 4105,
				fStop = 32,
				cameraId = 91521521,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 0.1,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91517589,
				targetEulerAngleVInput = {
					0,
					160.529,
					0
				}
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 77
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91517571,
				playableStateVInput = "Breathless_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
				playAniType = 1,
				aniStateList = {
					"Breathless_Start",
					"Breathless_Loop",
					"Breathless_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
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
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1102.195,
					181.561,
					-263.483
				},
				rotationVInput = {
					25.303,
					102.205,
					359.99
				}
			},
			fields = {
				focalDistance = 2927,
				fStop = 6.77,
				cameraId = 91521388,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 54
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1100.358,
					181.474,
					-260.171
				},
				rotationVInput = {
					22.381,
					112.518,
					359.99
				}
			},
			fields = {
				focalDistance = 2927,
				fStop = 6.77,
				cameraId = 91540141,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91517571,
				lookAtEntityStaticIdVInput = -211008625
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -211008625,
				lookAtEntityStaticIdVInput = 91517571
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1083.278,
					178.747,
					-279.627
				},
				rotationVInput = {
					5.708,
					6.191,
					359.99
				}
			},
			fields = {
				focalDistance = 338,
				fStop = 9.53,
				cameraId = 91540142,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-1082.977,
					177.573,
					-275.372
				},
				rotationVInput = {
					0,
					145.971,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -211008625
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 60
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 61
				}
			},
			fields = {
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 1,
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				cameraPreset = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 59
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 73
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 74
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 75
				},
				["5EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 76
				}
			},
			fields = {
				portCount = 5
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 63
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					145.971,
					0
				},
				targetPositionVInput = {
					-1082.977,
					177.573,
					-275.372
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
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1083.358,
					178.821,
					-280.359
				},
				rotationVInput = {
					5.708,
					6.191,
					359.99
				}
			},
			fields = {
				focalDistance = 338,
				fStop = 9.53,
				cameraId = 91521330,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 67
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
						portId = "In",
						nodeId = 68
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 69
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 70
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 71
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91517571,
				targetEulerAngleVInput = {
					0,
					148.583,
					0
				},
				targetPositionVInput = {
					-1083.57,
					177.6,
					-275.76
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
			kind = 14,
			inputs = {
				staticIdVInput = 91517582,
				targetEulerAngleVInput = {
					0,
					23.069,
					0
				},
				targetPositionVInput = {
					-1083.46,
					177.56,
					-276.91
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
			kind = 14,
			inputs = {
				staticIdVInput = 91517587,
				targetEulerAngleVInput = {
					0,
					321.311,
					0
				},
				targetPositionVInput = {
					-1082.65,
					177.53,
					-276.59
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
			kind = 14,
			inputs = {
				staticIdVInput = 91517589,
				targetEulerAngleVInput = {
					0,
					278.922,
					0
				},
				targetPositionVInput = {
					-1081.93,
					177.53,
					-275.82
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
			kind = 50,
			inputs = {
				enableFillLightVInput = true,
				fillLightIntensityVInput = 13315
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91517571
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91517582
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91517587
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91517589
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91521501
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = -211008625
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91517571
			},
			fields = {
				entityType = 2
			}
		}
	}
}
