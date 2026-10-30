-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91046739.lua

return {
	startNodeId = 1,
	dialogueId = 91046739,
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
			kind = 22,
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
					modeType = 2,
					blockCameraZoom = true,
					toplogoComList = {
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
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 62,
						portId = "In"
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
						nodeId = 5,
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
						nodeId = 17,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 13,
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
						nodeId = 15,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 90,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400204,
				positionVInput = {
					-497.306,
					56.848,
					776.997
				},
				rotationVInput = {
					0,
					210,
					0
				}
			},
			fields = {
				entityId = -185065299,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Lefthand",
				animationLayerVInput = 4
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400204,
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
			kind = 28,
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				lookAtEntityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Fragrance",
				staticIdVInput = -185065299
			},
			fields = {
				templateId = 400204,
				processingTime = 9.333,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
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
					-498.821,
					58.566,
					775.672
				},
				rotationVInput = {
					23.341,
					52.941,
					0.002
				}
			},
			fields = {
				focalDistance = 200,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 14.8,
				cameraId = 0,
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
						nodeId = 12,
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
					-498.612,
					58.625,
					775.83
				},
				rotationVInput = {
					23.341,
					52.941,
					0.002
				}
			},
			fields = {
				focalDistance = 200,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 14.8,
				cameraId = 0,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
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
					202.9,
					0
				},
				targetPositionVInput = {
					-497.204,
					56.806,
					778.311
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
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
				lookAtEntityStaticIdVInput = -185065299,
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
				slotParamVInput = 400180,
				positionVInput = {
					-496.563,
					56.84,
					778.027
				},
				rotationVInput = {
					0,
					222.5,
					0
				}
			},
			fields = {
				entityId = -638195812,
				ignoreGravity = false
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
				lookAtEntityStaticIdVInput = -185065299,
				staticIdVInput = -638195812
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 89,
						portId = "In"
					}
				},
				Out = {
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
				portCount = 4
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
				},
				["1"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201204,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400204,
				matchAudioDuration = true,
				duration = 3.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 5,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -185065299
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
				portCount = 4
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
				["3"] = {
					{
						nodeId = 87,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201205,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 7,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 3,
				portCount = 1,
				skipTime = 1,
				npcStaticId = 2
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
						nodeId = 86,
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
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201206,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 6.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 3,
				portCount = 1,
				audioName = "VOX_Chapter01_Velouria_147",
				skipTime = 0,
				npcStaticId = 2
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201207,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 3,
				portCount = 1,
				audioName = "VOX_Chapter01_Velouria_148",
				skipTime = 0,
				npcStaticId = 2
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
				portCount = 4
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
						nodeId = 28,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 85,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					fade = true,
					url = "$UI_Img_ItemView_EnergyLoss.png"
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
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
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201208,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 3,
				portCount = 1,
				audioName = "VOX_Chapter01_Velouria_149",
				skipTime = 0,
				npcStaticId = 2
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201209,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 3,
				portCount = 1,
				audioName = "VOX_Chapter01_Velouria_150",
				skipTime = 0,
				npcStaticId = 2
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
						nodeId = 37,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 28,
						portId = "closeUIFInput"
					}
				},
				["3"] = {
					{
						nodeId = 33,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 36,
						portId = "In"
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
					0,
					"=",
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 35,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				templateId = 301,
				processingTime = 1.4,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
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
				staticIdVInput = 2
			},
			fields = {
				templateId = 401,
				processingTime = 1.4,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -638195812
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201210,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 39,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 84,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201211,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 8.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				portCount = 3
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
						nodeId = 82,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201212,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 43,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 80,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["4"] = {
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
				dialogueIdVInput = 6201213,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400204,
				matchAudioDuration = true,
				duration = 6.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -185065299
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
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 45,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 78,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201214,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 11023300,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 7,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 1.5,
				portCount = 1,
				skipTime = 1,
				npcStaticId = 79229264
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
						nodeId = 47,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 10,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201215,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				audioName = "VOX_Chapter01_Velouria_151",
				skipTime = 0,
				npcStaticId = -1
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201216,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = -1,
				matchAudioDuration = true,
				duration = 8.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				audioName = "VOX_Chapter01_Velouria_152",
				skipTime = 0,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 49,
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
						nodeId = 50,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 76,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201217,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = -1,
				matchAudioDuration = true,
				duration = 4.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				audioName = "VOX_Chapter01_Velouria_153",
				skipTime = 0,
				npcStaticId = -1
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201218,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = -1,
				matchAudioDuration = true,
				duration = 7.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				audioName = "VOX_Chapter01_Velouria_154",
				skipTime = 0,
				npcStaticId = -1
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201219,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = -1,
				matchAudioDuration = true,
				duration = 9.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				audioName = "VOX_Chapter01_Velouria_155",
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 54,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 72,
						portId = "closeUIFInput"
					}
				},
				["2"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 74,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201220,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1.5,
				npcStaticId = 2
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
						nodeId = 58,
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
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-497.268,
					60.316,
					782.005
				},
				rotationVInput = {
					25.575,
					188.388,
					0.002
				}
			},
			fields = {
				focalDistance = 200,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 4,
				cameraId = 91150115,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
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
				blendTimeVInput = 12,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-496.225,
					60.316,
					781.795
				},
				rotationVInput = {
					26.091,
					198.873,
					0.002
				}
			},
			fields = {
				focalDistance = 200,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 4,
				cameraId = 91150116,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201221,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 2.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 2
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201222,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 8.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 2
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
						nodeId = 61,
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
						nodeId = 7,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201223,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400204,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -185065299
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
						nodeId = 63,
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
						nodeId = 65,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 67,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 68,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 0.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 66,
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
			}
		},
		{
			kind = 12,
			inputs = {
				resumeNpcVInput = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 69,
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
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				fovVInput = 36,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-498.434,
					58.656,
					776.05
				},
				rotationVInput = {
					25.232,
					52.082,
					0.002
				}
			},
			fields = {
				focalDistance = 226,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 10,
				cameraId = 91355557,
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
				lookAtEntityStaticIdVInput = -821751045,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					fade = true,
					url = "$UI_Img_ItemView_IreliaSleep.png"
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
				lookAtEntityStaticIdVInput = -821751045,
				staticIdVInput = -185065299
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Arrogant",
				staticIdVInput = -821751045
			},
			fields = {
				templateId = 401059,
				processingTime = 1.4,
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
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-497.972,
					59.256,
					777.855
				},
				rotationVInput = {
					0.308,
					183.059,
					0.002
				}
			},
			fields = {
				focalDistance = 200,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 32,
				cameraId = 91355569,
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
				lookAtEntityStaticIdVInput = -821751045,
				staticIdVInput = -638195812
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -821751045,
				staticIdVInput = 2
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
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					fade = true,
					url = "$UI_Img_ItemView_IreliaWeak.png"
				}
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
					-498.4,
					58.443,
					777.68
				},
				rotationVInput = {
					19.387,
					131.665,
					0.002
				}
			},
			fields = {
				focalDistance = 120,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 32,
				cameraId = 91355551,
				sensorWidth = 167,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 81,
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
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-498.372,
					58.55,
					777.655
				},
				rotationVInput = {
					19.387,
					131.665,
					0.002
				}
			},
			fields = {
				focalDistance = 120,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 32,
				cameraId = 91379449,
				sensorWidth = 167,
				recombineQuality = 0,
				openDof = true
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
					-496.066,
					58.214,
					779.711
				},
				rotationVInput = {
					354.979,
					208.326,
					0.002
				}
			},
			fields = {
				focalDistance = 200,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 9.61,
				cameraId = 91355566,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 83,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-496.155,
					58.345,
					779.548
				},
				rotationVInput = {
					354.979,
					208.326,
					0.002
				}
			},
			fields = {
				focalDistance = 200,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 22,
				cameraId = 0,
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
				lookAtEntityStaticIdVInput = -821751045,
				staticIdVInput = 2
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
					-498.188,
					58.474,
					777.424
				},
				rotationVInput = {
					16.981,
					57.582,
					0.002
				}
			},
			fields = {
				focalDistance = 200,
				squeezeFactor = 1,
				visualizeDOF = false,
				fStop = 21.54,
				cameraId = 91355570,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 401059,
				positionVInput = {
					-498.066,
					56.866,
					775.789
				},
				rotationVInput = {
					0,
					24,
					0
				}
			},
			fields = {
				entityId = -821751045,
				ignoreGravity = false
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
						nodeId = 88,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					url = "$UI_Img_ItemView_IreliaVelouria.png"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -185065299
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400066,
				positionVInput = {
					-497.633,
					56.821,
					777.387
				},
				rotationVInput = {
					0,
					171.6,
					0
				}
			},
			fields = {
				entityId = -996356744,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 91,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -185065299,
				staticIdVInput = -996356744
			},
			flowIn = {
				In = 0
			}
		}
	}
}
