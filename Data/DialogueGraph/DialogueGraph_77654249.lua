-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_77654249.lua

return {
	startNodeId = 1,
	dialogueId = 77654249,
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
					hideAllUI = true,
					toplogoComList = {
						petFertility = true,
						petExchange = true,
						petChat = true,
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
						photo = true
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
				portCount = 2
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
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 1,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-140.386,
					108.783,
					668.761
				},
				rotationVInput = {
					13.94,
					169.55,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91375624
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
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-136.794,
					107.262,
					645.863
				},
				rotationVInput = {
					13.768,
					171.956,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90876046
			},
			flowIn = {
				In = 0
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
						nodeId = 72,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 71,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304297,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 0,
				npcId = 400066,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304298,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 0,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 3.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 6
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
				["2"] = {
					{
						nodeId = 50,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 67,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 51,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304299,
				lookAtIdVInput = 2102120001,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 2
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
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304300,
				lookAtIdVInput = 2102120001,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1443996002,
				npcId = 400077,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304301,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400066,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 4
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
						nodeId = 17,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = -1824277951
			},
			fields = {
				templateId = 400204,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -946932827,
				playableStateVInput = "Story_Circle"
			},
			fields = {
				templateId = 400066,
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304302,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
						nodeId = 23,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 22,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 21,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1443996002,
				lookAtEntityStaticIdVInput = -946932827
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -406298660,
				lookAtEntityStaticIdVInput = -946932827
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -946932827,
				playableStateVInput = "Story_Frowning"
			},
			fields = {
				templateId = 400066,
				processingTime = 6.433,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304303,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 4,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400066,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
			kind = 12,
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
						nodeId = 28,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 26,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 30,
						portId = "In"
					}
				}
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
					-136.611,
					104.497,
					629.633
				},
				rotationVInput = {
					17.144,
					46.112,
					0.742
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 300,
				fStop = 10,
				cameraId = 82493328
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1824277951,
				lookAtEntityStaticIdVInput = -946932827
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -946932827,
				targetEulerAngleVInput = {
					0,
					2.006,
					0
				},
				targetPositionVInput = {
					-128.381,
					102.674,
					646.378
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 62108800,
				playableStateVInput = "Story_Circle"
			},
			fields = {
				templateId = 400066,
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
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
				["2"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 33,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1824277951,
				lookAtEntityStaticIdVInput = -406298660
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -406298660,
				lookAtEntityStaticIdVInput = -1824277951
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1443996002,
				lookAtEntityStaticIdVInput = -1824277951
			},
			flowIn = {
				In = 0
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
						nodeId = 35,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 44,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3304305,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1824277951,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 9.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 38,
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
						nodeId = 39,
						portId = "In"
					}
				},
				["1"] = {
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
						nodeId = 40,
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
						nodeId = 41,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = 0
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
						nodeId = 43,
						portId = "In"
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = -1824277951
			},
			fields = {
				templateId = 400204,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -1824277951
			},
			fields = {
				activePlayEmotion = false,
				noBlink = false,
				activePlayLip = true
			},
			flowIn = {
				In = 0,
				StopLip = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 46,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 10
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 45,
						portId = "StopLip"
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
					-135.501,
					103.446,
					629.194
				},
				rotationVInput = {
					21.785,
					34.833,
					0.764
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 320,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 150,
				fStop = 16,
				cameraId = 91377791
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -1443996002
			},
			fields = {
				activePlayEmotion = false,
				noBlink = false,
				activePlayLip = true
			},
			flowIn = {
				In = 0,
				StopLip = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 49,
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
						nodeId = 48,
						portId = "StopLip"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 999,
				playableStateVInput = "IdleSpecial",
				playStartLoopEndVInput = true,
				staticIdVInput = 62108800
			},
			fields = {
				templateId = 400233,
				processingTime = 8.65,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"IdleSpecial",
					"IdleSpecial",
					"IdleSpecial"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.04
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 52,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 62108800,
				targetEulerAngleVInput = {
					0,
					180,
					0
				},
				targetPositionVInput = {
					-135.28,
					102.644,
					627.517
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
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
						nodeId = 66,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 59,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 54,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 62,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 63,
						portId = "In"
					}
				},
				["8"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1824277951,
				maxLimitTimeVInput = 9,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					-152.421,
					0
				},
				targetPositionVInput = {
					-134.119,
					102.674,
					631.282
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
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
						nodeId = 55,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1824277951,
				lookAtEntityStaticIdVInput = 62108800
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1443996002,
				maxLimitTimeVInput = 9,
				targetEulerAngleVInput = {
					0,
					207.579,
					0
				},
				targetPositionVInput = {
					-135.421,
					102.674,
					631.464
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
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
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1443996002,
				lookAtEntityStaticIdVInput = 62108800
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1443996002,
				playableStateVInput = "Story_Greet02"
			},
			fields = {
				templateId = 400077,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -406298660,
				targetEulerAngleVInput = {
					0,
					168.5,
					0
				},
				targetPositionVInput = {
					-135.054,
					102.64,
					634.519
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 60,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -406298660,
				maxLimitTimeVInput = 9,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					195,
					0
				},
				targetPositionVInput = {
					-134.713,
					102.64,
					631.729
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -406298660,
				lookAtEntityStaticIdVInput = 62108800
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0,
				staticIdVInput = -1443996002
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0,
				staticIdVInput = -1824277951
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0,
				staticIdVInput = -406298660
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -946932827,
				maxLimitTimeVInput = 9,
				targetEulerAngleVInput = {
					0,
					207.579,
					0
				},
				targetPositionVInput = {
					-135.003,
					102.674,
					630.052
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0,
				staticIdVInput = -946932827
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
					-136.162,
					104.916,
					625.861
				},
				rotationVInput = {
					10.139,
					29.362,
					0.581
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 320,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 150,
				fStop = 16,
				cameraId = 87407689
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 68,
						portId = "In"
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
					-136.836,
					104.862,
					626.21
				},
				rotationVInput = {
					17.51,
					35.372,
					0.607
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 320,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 150,
				fStop = 16,
				cameraId = 89447819
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 62108800,
				targetEulerAngleVInput = {
					0,
					180,
					0
				},
				targetPositionVInput = {
					-135.29,
					102.64,
					627.54
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 30,
				playableStateVInput = "AI_IdleSpecial01",
				playStartLoopEndVInput = true,
				staticIdVInput = 62108800
			},
			fields = {
				templateId = 400233,
				processingTime = 8.65,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"AI_IdleSpecial01",
					"AI_IdleSpecial01",
					""
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				defaultHideVInput = true,
				positionVInput = {
					-139.516,
					106.446,
					662.545
				},
				rotationVInput = {
					0,
					173.833,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -406298660
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				defaultHideVInput = true,
				slotParamVInput = 400204,
				positionVInput = {
					-134.217,
					102.64,
					632.906
				},
				rotationVInput = {
					0,
					166.167,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1824277951
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				defaultHideVInput = true,
				slotParamVInput = 400077,
				positionVInput = {
					-135.756,
					102.59,
					633.7
				},
				rotationVInput = {
					0,
					50.101,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1443996002
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
			kind = 15,
			inputs = {
				staticIdVInput = -1443996002,
				lookAtEntityStaticIdVInput = 62108800
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				defaultHideVInput = true,
				slotParamVInput = 400066,
				positionVInput = {
					-135.101,
					102.674,
					631.568
				},
				rotationVInput = {
					0,
					173.592,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -946932827
			},
			flowIn = {
				In = 0
			}
		}
	}
}
