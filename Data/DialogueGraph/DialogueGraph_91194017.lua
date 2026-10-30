-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91194017.lua

return {
	dialogueId = 91194017,
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
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					toplogoComList = {
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
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
						petExchange = true
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
						nodeId = 25
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
				portCount = 9
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
						nodeId = 89
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 93
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 95
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 97
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 99
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 101
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 103
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 105
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
				portCount = 6
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
						nodeId = 73
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 84
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 85
					}
				},
				["4"] = {
					{
						portId = "Play",
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304594,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false
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
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 9
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
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 73
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 79
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 76
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 78
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 74
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 75
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304595,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 7.12,
				disableCamera = false
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
						nodeId = 13
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 72
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304596,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false
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
						nodeId = 62
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304597
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 15
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
						nodeId = 16
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 57
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 56
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304599,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 10.25,
				disableCamera = false
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
						nodeId = 18
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 53
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 44
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 54
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 55
					}
				},
				["5"] = {
					{
						portId = "Stop",
						nodeId = 56
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304601,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 4.5,
				disableCamera = false
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
						nodeId = 20
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
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 44
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 51
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304603,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150020,
				matchAudioDuration = true,
				duration = 2.12,
				disableCamera = false
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
						nodeId = 22
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 40
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304604,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 23
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
						nodeId = 24
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
						nodeId = 25
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
						portId = "In",
						nodeId = 26
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
						nodeId = 35
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 27
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
						nodeId = 28
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
						nodeId = 29
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
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 32
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 33
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = -1227138715
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = -1685619559
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = -1689206362
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = -405880259
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = 91459204
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 21,
			flowIn = {
				In = 0
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
						nodeId = 36
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
						nodeId = 37
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 50,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1036.065,
					231.293,
					-331.343
				},
				rotationVInput = {
					343.19,
					211.766,
					-0.002
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 32,
				cameraId = 91530119
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
				fovVInput = 50,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1038.348,
					233.134,
					-334.536
				},
				rotationVInput = {
					326.517,
					218.814,
					-0.002
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 32,
				cameraId = 91530120
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1227138715,
				playableStateVInput = "PointTo_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5150018,
				processingTime = 0.667,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"PointTo_Start",
					"PointTo_Loop",
					"PointTo_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -405880259,
				playableStateVInput = "Behav_Happy"
			},
			fields = {
				entityType = 2,
				templateId = 5150020,
				processingTime = 5.25,
				playAniType = 1,
				isLooping = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 50,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1037.962,
					231.821,
					-328.532
				},
				rotationVInput = {
					356.39,
					159.926,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 32,
				cameraId = 91530108
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1685619559,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				entityType = 0,
				templateId = 403,
				processingTime = 3,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1227138715,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				entityType = 2,
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 46
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
						nodeId = 47
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 48
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 49
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -1227138715
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 107
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
			kind = 26,
			inputs = {
				staticIdVInput = -1685619559
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 107
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
			kind = 26,
			inputs = {
				staticIdVInput = -1689206362
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 107
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
			kind = 26,
			inputs = {
				staticIdVInput = 91459204
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 107
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -405880259,
				staticIdVInput = -1227138715
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -405880259,
				staticIdVInput = -1685619559
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1227138715,
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
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
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -405880259,
				targetEulerAngleVInput = {
					0,
					30.314,
					0
				},
				targetPositionVInput = {
					-1039.249,
					230.563,
					-341.061
				}
			},
			fields = {
				setRotation = true,
				reset = false,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1227138715,
				playableStateVInput = "Disappoint_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Disappoint_Start",
					"Disappoint_Loop",
					"Disappoint_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PLAYER_BODY_TYPE",
					1,
					1,
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
						portId = "In",
						nodeId = 58
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 60
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1033.778,
					231.243,
					-331.505
				},
				rotationVInput = {
					2.75,
					221.116,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571297
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1034.042,
					231.225,
					-331.808
				},
				rotationVInput = {
					2.406,
					221.116,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571298
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1033.765,
					231.187,
					-331.512
				},
				rotationVInput = {
					2.75,
					221.116,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571294
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1034.108,
					231.162,
					-331.905
				},
				rotationVInput = {
					0.687,
					223.007,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571295
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304598
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
						nodeId = 64
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 57
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304600,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 9.75,
				disableCamera = false
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
						nodeId = 66
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PLAYER_BODY_TYPE",
					1,
					1,
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
						portId = "In",
						nodeId = 67
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 69
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1036.821,
					231.273,
					-332.787
				},
				rotationVInput = {
					4.984,
					95.123,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571232
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1036.491,
					231.245,
					-332.816
				},
				rotationVInput = {
					4.297,
					93.919,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571257
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1036.657,
					231.214,
					-332.75
				},
				rotationVInput = {
					5.5,
					96.498,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571269
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 70
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1036.334,
					231.181,
					-332.79
				},
				rotationVInput = {
					4.984,
					94.779,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571270
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1227138715,
				playableStateVInput = "Story_Talk"
			},
			fields = {
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1227138715,
				playableStateVInput = "Story_Relax_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Story_Relax_Start",
					"Story_Relax_Loop",
					"Story_Relax_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1685619559,
				playableStateVInput = "Story_TouchMiddle_Start",
				playStartLoopEndVInput = true,
				speedVInput = 1.5
			},
			fields = {
				entityType = 0,
				templateId = 403,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Story_TouchMiddle_Start",
					"Story_TouchMiddle_Loop",
					"Story_TouchMiddle_End"
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
				lookAtEntityStaticIdVInput = -1685619559,
				staticIdVInput = -1227138715
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1227138715,
				staticIdVInput = -1685619559
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 77
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1685619559,
				targetEulerAngleVInput = {
					0,
					252.602,
					0
				},
				targetPositionVInput = {
					-1034.521,
					229.889,
					-332.644
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							time = 0,
							inTangent = 0
						},
						{
							outTangent = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							time = 1,
							inTangent = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1227138715,
				targetEulerAngleVInput = {
					0,
					63.717,
					0
				},
				targetPositionVInput = {
					-1035.615,
					229.935,
					-333.081
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							time = 0,
							inTangent = 0
						},
						{
							outTangent = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							time = 1,
							inTangent = 1
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
						portId = "In",
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PLAYER_BODY_TYPE",
					1,
					1,
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
						portId = "In",
						nodeId = 80
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 82
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1033.778,
					231.243,
					-331.505
				},
				rotationVInput = {
					2.75,
					221.116,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571209
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 81
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1034.042,
					231.225,
					-331.808
				},
				rotationVInput = {
					2.406,
					221.116,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571213
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1033.765,
					231.187,
					-331.512
				},
				rotationVInput = {
					2.75,
					221.116,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571231
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 83
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1034.108,
					231.162,
					-331.905
				},
				rotationVInput = {
					0.687,
					223.007,
					359.991
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.043,
				sensorWidth = 199,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 222,
				fStop = 13.12,
				cameraId = 91571229
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1036.685,
					231.392,
					-332.115
				},
				rotationVInput = {
					11.688,
					116.092,
					359.992
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 276,
				fStop = 8.68,
				cameraId = 91459245
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
						portId = "In",
						nodeId = 86
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
					-1040.055,
					233.847,
					-326.582
				},
				rotationVInput = {
					6.531,
					130.532,
					359.992
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 276,
				fStop = 17.2,
				cameraId = 91543544
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 87
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1040.055,
					233.847,
					-326.582
				},
				rotationVInput = {
					3.5,
					122.27,
					359.992
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 276,
				fStop = 17.2,
				cameraId = 91543545
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				isBGMVInput = true,
				audioEventVInput = "BGM_Scene_PowerfulLand_ConchSong_Fountain"
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = true,
				enableFadeIn = false,
				fadeOutTime = 1
			},
			flowIn = {
				Play = 0
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
						nodeId = 90
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-1034.512,
					229.901,
					-332.647
				},
				rotationVInput = {
					0,
					167.211,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1685619559
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
					nodeId = 90
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 94
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 96
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 98
				}
			},
			fields = {
				portCount = 5
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 91
				}
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
						nodeId = 94
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150021,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1034.038,
					229.93,
					-331.819
				},
				rotationVInput = {
					0,
					180.71,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1689206362
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
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150020,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1035.765,
					230.084,
					-334.377
				},
				rotationVInput = {
					0,
					42.314,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -405880259
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
						nodeId = 98
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150018,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1035.621,
					229.93,
					-333.076
				},
				rotationVInput = {
					0,
					104.653,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1227138715
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 92
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
						nodeId = 100
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
					-1037.319,
					231.539,
					-331.805
				},
				rotationVInput = {
					11.688,
					116.092,
					359.992
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 276,
				fStop = 8.68,
				cameraId = 91459242
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
						nodeId = 102
					}
				}
			}
		},
		{
			kind = 50,
			inputs = {
				fillLightIntensityVInput = 9811,
				enableFillLightVInput = true
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
						nodeId = 104
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
					146.858,
					0
				},
				targetPositionVInput = {
					-1034.424,
					229.901,
					-332.794
				}
			},
			fields = {
				setRotation = true,
				reset = false,
				setPosition = true
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
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91459204,
				targetEulerAngleVInput = {
					0,
					169.52,
					0
				},
				targetPositionVInput = {
					-1034.703,
					230.216,
					-331.766
				}
			},
			fields = {
				setRotation = true,
				reset = false,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = -405880259
			},
			fields = {
				entityType = 2
			}
		}
	}
}
