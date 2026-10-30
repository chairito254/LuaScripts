-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91046710.lua

return {
	startNodeId = 1,
	dialogueId = 91046710,
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					blockEvent = true,
					toplogoComList = {
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
						combat = true,
						chat = true
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
						nodeId = 4,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 6,
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
			}
		},
		{
			kind = 24,
			inputs = {
				switchToWalkVInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 22,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 7,
						portId = "In"
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
						nodeId = 21,
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
						nodeId = 10,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 19,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400180,
				positionVInput = {
					-941.5,
					102.743,
					1208.241
				},
				rotationVInput = {
					356.923,
					275.45,
					0.04
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1844855171
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1845592235,
				staticIdVInput = -1844855171
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 200001,
				positionVInput = {
					-941.809,
					102.558,
					1209.313
				},
				rotationVInput = {
					0,
					239.4,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1987334321
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
					-939.424,
					104.055,
					1210.646
				},
				rotationVInput = {
					6.141,
					229.637,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-939.683,
					104.019,
					1210.426
				},
				rotationVInput = {
					6.141,
					229.637,
					0
				}
			},
			fields = {
				cameraId = 91355464,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
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
					255.7,
					0
				},
				targetPositionVInput = {
					-941.33,
					102.347,
					1208.77
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1845592235,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400204,
				positionVInput = {
					-942.674,
					102.632,
					1208.494
				},
				rotationVInput = {
					0,
					63.8,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1845592235
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -1845592235
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 201405,
				positionVInput = {
					-872.662,
					102.389,
					1230.968
				},
				rotationVInput = {
					0,
					347.32,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -2053031080
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyLoop",
				loopDurationVInput = 3,
				staticIdVInput = -2053031080
			},
			fields = {
				templateId = 201405,
				processingTime = 2.817,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 201365,
				positionVInput = {
					-871.707,
					102.409,
					1231.037
				},
				rotationVInput = {
					0,
					347.32,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1236217022
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyLoop",
				loopDurationVInput = 3,
				staticIdVInput = -1236217022
			},
			fields = {
				templateId = 5070017,
				processingTime = 4.883,
				playAniType = 1,
				isLooping = true,
				entityType = 2
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
						nodeId = 22,
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
			},
			flowOut = {
				Out = {
					{
						nodeId = 24,
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
						nodeId = 25,
						portId = "In"
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
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201340,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 8.62,
				npcStaticId = -1845592235,
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
						nodeId = 27,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 170,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201341
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 5
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
						nodeId = 31,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
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
					-941.704,
					104.132,
					1209.682
				},
				rotationVInput = {
					4.937,
					220.183,
					0
				}
			},
			fields = {
				cameraId = 91067954,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 100,
				fStop = 7.18
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				blendTimeVInput = 9.3,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-941.895,
					104.106,
					1209.47
				},
				rotationVInput = {
					4.594,
					221.043,
					0
				}
			},
			fields = {
				cameraId = 91067990,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 90,
				fStop = 26.98
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Thankful_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = -1845592235
			},
			fields = {
				entityType = 2,
				templateId = 400204,
				processingTime = 1.5,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Story_Thankful_Start",
					"Story_Thankful_Loop",
					"Story_Thankful_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201343,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 4.38,
				npcStaticId = -1845592235,
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
						nodeId = 33,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				executeOnce = false,
				portCount = 2
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 6201345,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 10.5,
				npcStaticId = -1845592235,
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
						nodeId = 169,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201346,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 10,
				npcStaticId = -1845592235,
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
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201347,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 7.38,
				npcStaticId = -1845592235,
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
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201348,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 11.5,
				npcStaticId = -1845592235,
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201349,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 7.62,
				npcStaticId = -1845592235,
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
						nodeId = 40,
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
						nodeId = 42,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Introduce",
				loopDurationVInput = 4,
				staticIdVInput = -1845592235
			},
			fields = {
				templateId = 400204,
				processingTime = 1.5,
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
				dialogueIdVInput = 6201350,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 8.25,
				npcStaticId = -1845592235,
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
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201351,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 5.12,
				npcStaticId = -1845592235,
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
						nodeId = 44,
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
						nodeId = 46,
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
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-939.683,
					104.019,
					1210.426
				},
				rotationVInput = {
					6.141,
					229.637,
					0
				}
			},
			fields = {
				cameraId = 91355465,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201352,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 10.88,
				npcStaticId = -1845592235,
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
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraMovementTypeVInput = 2,
				dialogsetCameraMovementTimeVInput = 2,
				dialogueIdVInput = 6201353,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 2,
				npcStaticId = -1845592235,
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
						nodeId = 48,
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
						nodeId = 51,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 49,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 168,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-941.261,
					104.027,
					1209.406
				},
				rotationVInput = {
					1.359,
					235.556,
					0
				}
			},
			fields = {
				cameraId = 91064179,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 11.77
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 50,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 6,
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-941.242,
					104.027,
					1209.378
				},
				rotationVInput = {
					1.359,
					235.556,
					0
				}
			},
			fields = {
				cameraId = 91301543,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 11.77
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201354,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 7.12,
				npcStaticId = -1845592235,
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
						nodeId = 52,
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
						nodeId = 53,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 57,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 163,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 164,
						portId = "In"
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
						nodeId = 54,
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
						nodeId = 55,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 46,
			fields = {
				volumeComponentCount = 2,
				volumeParamInfoCount = 2,
				volumeComponents = {
					{
						active = false,
						typeName = "ColorFilterComponent",
						parameters = {
							m_FilterColor = {
								valueType = "color",
								overrideState = true,
								value = {
									g = 0.1647059,
									b = 0.02745098,
									r = 0.3764706,
									a = 1
								}
							},
							m_Brightness = {
								valueType = "float",
								value = 1.5,
								overrideState = true
							},
							m_Saturation = {
								valueType = "float",
								value = 0.84,
								overrideState = true
							},
							m_Contrast = {
								valueType = "float",
								value = 1.016,
								overrideState = true
							},
							m_CullCharacter = {
								valueType = "bool",
								value = false,
								overrideState = true
							},
							m_ColorFilterAlpha = {
								valueType = "float",
								value = 1,
								overrideState = true
							}
						}
					},
					{
						active = false,
						typeName = "VignetteComponent",
						parameters = {
							m_VignetteColor = {
								valueType = "color",
								overrideState = true,
								value = {
									g = 0.1019608,
									b = 0.1019608,
									r = 0.1019608,
									a = 1
								}
							},
							m_EdgeWidth = {
								valueType = "float",
								value = 0.488,
								overrideState = true
							},
							m_EdgeSoftness = {
								valueType = "float",
								value = 0.33,
								overrideState = true
							},
							m_VignetteAlpha = {
								valueType = "float",
								value = 1,
								overrideState = true
							},
							m_FisheyeFovDeg = {
								valueType = "float",
								value = 0,
								overrideState = true
							},
							m_FollowAspect = {
								valueType = "bool",
								value = true,
								overrideState = true
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "ColorFilterComponent",
						params = {}
					},
					{
						volumeTypeName = "VignetteComponent",
						params = {}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-936.786,
					104.351,
					1214.768
				},
				rotationVInput = {
					15.004,
					276.514,
					0.003
				}
			},
			fields = {
				cameraId = 91135425,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201427,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = -1,
				matchAudioDuration = true,
				skipTime = 2,
				duration = 4,
				npcStaticId = -1,
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 3,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 58,
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
						nodeId = 59,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 160,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 161,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 162,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201356,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400062,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 8.62,
				npcStaticId = -1,
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
						nodeId = 60,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201357,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400062,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 10.25,
				npcStaticId = -1,
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
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201358,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400062,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 9.25,
				npcStaticId = -1,
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
						nodeId = 62,
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
						nodeId = 63,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 158,
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
						nodeId = 157,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201359,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 100,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 9.88,
				npcStaticId = -1,
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
						nodeId = 65,
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
						nodeId = 66,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 152,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 153,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 155,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 156,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201361,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 0,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 6.38,
				npcStaticId = -1,
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
						nodeId = 67,
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
						nodeId = 70,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 147,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 68,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 149,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 150,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 151,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Item_GodFeather.prefab",
				postionVInput = {
					-942.674,
					103.724,
					1208.494
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
			kind = 49,
			valueIn = {
				effectIdVInput = {
					nodeId = 68,
					portId = "EffectID"
				},
				generatorIdVInput = {
					nodeId = 68,
					portId = "GeneratorID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201362,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400062,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 5.88,
				npcStaticId = -1,
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
						nodeId = 71,
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
						nodeId = 72,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 74,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 140,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 46,
			fields = {
				volumeComponentCount = 1,
				volumeParamInfoCount = 1,
				volumeComponents = {
					{
						active = false,
						typeName = "ColorFilterComponent",
						parameters = {
							m_FilterColor = {
								valueType = "color",
								overrideState = false,
								value = {
									g = 0.1647059,
									b = 0.02745098,
									r = 0.3764706,
									a = 1
								}
							},
							m_Brightness = {
								valueType = "float",
								value = 1,
								overrideState = true
							},
							m_Saturation = {
								valueType = "float",
								value = 1,
								overrideState = true
							},
							m_Contrast = {
								valueType = "float",
								value = 1,
								overrideState = true
							},
							m_CullCharacter = {
								valueType = "bool",
								value = false,
								overrideState = true
							},
							m_ColorFilterAlpha = {
								valueType = "float",
								value = 1,
								overrideState = true
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "ColorFilterComponent",
						params = {}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201363,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 1,
				duration = 4,
				npcStaticId = -1,
				chatType = 5,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 15,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 75,
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
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201377,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 2,
				npcStaticId = -1845592235,
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
						nodeId = 77,
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
						nodeId = 78,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 137,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 139,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201379,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 0,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 8.12,
				npcStaticId = -1,
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
						nodeId = 79,
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
						nodeId = 80,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 134,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 135,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201380,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 8.62,
				npcStaticId = -1844855171,
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
						nodeId = 81,
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
						nodeId = 82,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 133,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 132,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201502,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 8.62,
				npcStaticId = -1844855171,
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
						nodeId = 83,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201503,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 0,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 2.38,
				npcStaticId = -1,
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
						nodeId = 84,
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
						nodeId = 85,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 131,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 132,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201504,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 6.5,
				npcStaticId = -1844855171,
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
						nodeId = 86,
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
						nodeId = 87,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 130,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201381,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 8.12,
				npcStaticId = -1844855171,
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
						nodeId = 88,
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
						nodeId = 89,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 126,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 127,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 128,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 129,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201382,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 6,
				npcStaticId = -1845592235,
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
						nodeId = 90,
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
						nodeId = 92,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 91,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 124,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 125,
						portId = "In"
					}
				}
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
					-942.74,
					103.75,
					1208.719
				},
				rotationVInput = {
					34.846,
					59.64,
					0
				}
			},
			fields = {
				cameraId = 91064215,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
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
						nodeId = 123,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 93,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6201383,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 200001,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 4.25,
				npcStaticId = -1987334321,
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
						nodeId = 94,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				executeOnce = false,
				portCount = 2
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 95,
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
						nodeId = 96,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 122,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201385,
				defaultSkipBranchVInput = 1,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 5.62,
				npcStaticId = -1844855171,
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
						nodeId = 97,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 119,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201386
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 98,
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
						nodeId = 99,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 118,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201388,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 4.62,
				npcStaticId = -1844855171,
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
						nodeId = 100,
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
						nodeId = 101,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 116,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 113,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201391,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 7.25,
				npcStaticId = -1844855171,
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
						nodeId = 102,
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
						nodeId = 103,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 114,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201392,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 6,
				npcStaticId = -1844855171,
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
						nodeId = 104,
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
						nodeId = 106,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 105,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 112,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 113,
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
					-943.967,
					104.461,
					1209.876
				},
				rotationVInput = {
					13.875,
					123.067,
					0
				}
			},
			fields = {
				cameraId = 91355488,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201393,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 3.38,
				npcStaticId = -1844855171,
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
						nodeId = 107,
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
						nodeId = 108,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 10,
			inputs = {
				resumeNearbyMonsterAIVInput = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 109,
						portId = "In"
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
						nodeId = 110,
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
						nodeId = 111,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Firm_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 8,
				staticIdVInput = -1844855171
			},
			fields = {
				entityType = 2,
				templateId = 400077,
				processingTime = 0.933,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -1844855171
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-876.016,
					102.099,
					1235.352
				},
				rotationVInput = {
					347.76,
					136.55,
					0.002
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 115,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-875.431,
					102.219,
					1235.901
				},
				rotationVInput = {
					349.823,
					141.191,
					0.002
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-875.383,
					105.259,
					1224.666
				},
				rotationVInput = {
					14.575,
					21.73,
					0.002
				}
			},
			fields = {
				cameraId = 91064229,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 117,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-874.37,
					105.259,
					1224.263
				},
				rotationVInput = {
					14.575,
					21.73,
					0.002
				}
			},
			fields = {
				cameraId = 91135627,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Lefthand",
				loopDurationVInput = 99,
				staticIdVInput = -1844855171
			},
			fields = {
				templateId = 400077,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201387
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 120,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201389,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 4.38,
				npcStaticId = -1844855171,
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
						nodeId = 121,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201390,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400180,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 5.12,
				npcStaticId = -1844855171,
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
						nodeId = 100,
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
					-943.967,
					104.461,
					1209.876
				},
				rotationVInput = {
					13.875,
					123.067,
					0
				}
			},
			fields = {
				cameraId = 91355483,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6201384,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 200001,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 6.12,
				npcStaticId = -1987334321,
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
						nodeId = 94,
						portId = "1"
					}
				}
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1844855171,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-941.585,
					104.271,
					1209.949
				},
				rotationVInput = {
					10.641,
					216.304,
					0
				}
			},
			fields = {
				cameraId = 91135616,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -1845592235,
				facialEmotionVInput = "Smile"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true,
				noBlink = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				speedVInput = 0.8,
				playableStateVInput = "Talk_Introduce",
				loopDurationVInput = 4,
				staticIdVInput = -1845592235
			},
			fields = {
				templateId = 400204,
				processingTime = 2.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1844855171,
				staticIdVInput = -1987334321
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Lefthand",
				loopDurationVInput = 99,
				staticIdVInput = -1844855171
			},
			fields = {
				templateId = 400077,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2
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
					-941.995,
					104.077,
					1208.648
				},
				rotationVInput = {
					8.031,
					124.442,
					0
				}
			},
			fields = {
				cameraId = 91135671,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Joy_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 99,
				staticIdVInput = -1844855171
			},
			fields = {
				entityType = 2,
				templateId = 400077,
				processingTime = 5.45,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Emotion_Joy_Start",
					"Emotion_Joy_Loop",
					"Emotion_Joy_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -1844855171
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = false,
				noBlink = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -1844855171
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 136,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1844855171,
				staticIdVInput = 2
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
					-944.003,
					104.289,
					1209.899
				},
				rotationVInput = {
					13.875,
					123.067,
					0
				}
			},
			fields = {
				cameraId = 91355470,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 138,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-943.967,
					104.461,
					1209.876
				},
				rotationVInput = {
					13.875,
					123.067,
					0
				}
			},
			fields = {
				cameraId = 91355469,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				animationLayerVInput = 4,
				playableStateVInput = "TalkUpper_Crossingarms",
				loopDurationVInput = 3,
				staticIdVInput = 2
			},
			fields = {
				templateId = 4002,
				processingTime = 5.167,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 141,
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
						nodeId = 142,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 144,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 145,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -1845592235
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 143,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				speedVInput = 0.8,
				playableStateVInput = "Talk_Lefthand",
				loopDurationVInput = 4,
				staticIdVInput = -1845592235
			},
			fields = {
				templateId = 400204,
				processingTime = 0.8,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -1844855171
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
					-939.359,
					104.305,
					1210.41
				},
				rotationVInput = {
					12.157,
					232.387,
					0
				}
			},
			fields = {
				cameraId = 91355449,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 146,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-939.347,
					104.235,
					1210.419
				},
				rotationVInput = {
					12.157,
					232.387,
					0
				}
			},
			fields = {
				cameraId = 91355450,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
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
					-939.754,
					104.454,
					1210.722
				},
				rotationVInput = {
					13.188,
					228.949,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 148,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 6,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-939.729,
					104.312,
					1210.745
				},
				rotationVInput = {
					13.188,
					228.949,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
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
			kind = 28,
			inputs = {
				staticIdVInput = -1987334321
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = 2
			},
			fields = {
				entityType = 0,
				templateId = 4002,
				processingTime = 5.45,
				playAniType = 1,
				isLooping = false,
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
				playableStateVInput = "EnvBehav_Expect_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 99,
				staticIdVInput = -96986888
			},
			fields = {
				entityType = 2,
				templateId = 400513,
				processingTime = 5.45,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"",
					"",
					""
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
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-939.31,
					103.706,
					1213.414
				},
				rotationVInput = {
					3.517,
					342.614,
					0.003
				}
			},
			fields = {
				cameraId = 91135448,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 154,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-939.074,
					103.574,
					1213.505
				},
				rotationVInput = {
					2.829,
					331.441,
					0.003
				}
			},
			fields = {
				cameraId = 91135452,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -96986888,
				durationVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 49,
			valueIn = {
				effectIdVInput = {
					nodeId = 163,
					portId = "EffectID"
				},
				generatorIdVInput = {
					nodeId = 163,
					portId = "GeneratorID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201360,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 100,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 9.12,
				npcStaticId = -1,
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
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-937.394,
					103.699,
					1213.778
				},
				rotationVInput = {
					334.983,
					353.27,
					0.003
				}
			},
			fields = {
				cameraId = 91135446,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 159,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				fovVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-937.408,
					103.757,
					1213.903
				},
				rotationVInput = {
					333.608,
					353.785,
					0.003
				}
			},
			fields = {
				cameraId = 91301825,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1844855171
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1845592235
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 12,
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-937.154,
					104.195,
					1214.853
				},
				rotationVInput = {
					12.942,
					276.342,
					0.003
				}
			},
			fields = {
				cameraId = 91135424,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Item_GodFeather.prefab",
				postionVInput = {
					-937.491,
					104.136,
					1214.771
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
						nodeId = 165,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400501,
				positionVInput = {
					-939.991,
					102.347,
					1215.299
				},
				rotationVInput = {
					0,
					113.437,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -96986888
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 166,
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
						nodeId = 167,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 152,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -96986888,
				durationVInput = 3
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				speedVInput = 0.8,
				playableStateVInput = "Fragrance",
				loopDurationVInput = 4,
				staticIdVInput = -1845592235
			},
			fields = {
				templateId = 400204,
				processingTime = 9.333,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 99,
				staticIdVInput = -1845592235
			},
			fields = {
				entityType = 2,
				templateId = 400204,
				processingTime = 1.5,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201342
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 171,
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
						nodeId = 172,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201344,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				npcId = 400204,
				matchAudioDuration = true,
				skipTime = 0,
				duration = 2.5,
				npcStaticId = -1845592235,
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
						nodeId = 33,
						portId = "1"
					}
				}
			}
		}
	}
}
