-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91034745.lua

return {
	startNodeId = 1,
	dialogueId = 91034745,
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
					blockEvent = true,
					modeType = 2,
					toplogoComList = {
						alert = true,
						petFertility = true,
						petExchange = true,
						photo = true,
						quest = true,
						teamSpeech = true,
						vlog = true,
						actionState = true,
						battleRoom = true,
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 50,
						portId = "In"
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
			kind = 22,
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
						nodeId = 10,
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
						nodeId = 83,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 84,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 85,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 87,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 88,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5160002,
				positionVInput = {
					79.065,
					100.404,
					1156.713
				},
				rotationVInput = {
					0,
					101.5,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -531843579
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -531843579,
				playableStateVInput = "Emotion_Excited_Start"
			},
			fields = {
				templateId = 5160002,
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"",
					"",
					""
				}
			},
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -531843579
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
					25.088,
					0
				},
				targetPositionVInput = {
					79.801,
					100.471,
					1156.181
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
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
						nodeId = 11,
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
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204394,
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
				npcStaticId = -531843579,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 2.88,
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
						nodeId = 13,
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
						nodeId = 14,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				},
				["4"] = {
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
				dialogueIdVInput = 6204395,
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
				npcStaticId = -791334962,
				npcId = 5160003,
				matchAudioDuration = true,
				duration = 3.88,
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
				portCount = 5
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
						nodeId = 80,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204396,
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
				npcStaticId = -531843579,
				npcId = 5160002,
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
						nodeId = 17,
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
						nodeId = 19,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 18,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 78,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0,
					-0.7
				},
				positionVInput = {
					80.213,
					101.828,
					1156.155
				},
				rotationVInput = {
					0.801,
					16.887,
					0.001
				}
			},
			fields = {
				focalDistance = 145,
				fStop = 32,
				cameraId = 91565317,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 176,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204397,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -791334962,
				npcId = 5160003,
				matchAudioDuration = true,
				duration = 3.62,
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
						nodeId = 76,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 77,
						portId = "closeUIFInput"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204398,
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
				npcId = 5160003,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 23,
						portId = "In"
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
				},
				["4"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 76,
						portId = "StopDof"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -531843579,
				animationLayerVInput = 4,
				playableStateVInput = "Emotion_Anger01_Start"
			},
			fields = {
				templateId = 5160002,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204399,
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
				npcStaticId = -531843579,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 6.38,
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
						nodeId = 25,
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
						nodeId = 26,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 6204400,
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
				npcStaticId = -791334962,
				npcId = 5160003,
				matchAudioDuration = true,
				duration = 6.12,
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
						nodeId = 27,
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
						nodeId = 28,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 67,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 68,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 69,
						portId = "StopDof"
					}
				},
				["5"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 71,
						portId = "In"
					}
				},
				["7"] = {
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
				dialogueIdVInput = 6204401,
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
				npcId = 5160004,
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
						nodeId = 65,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 66,
						portId = "StopDof"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204402,
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
				npcId = 5160003,
				matchAudioDuration = true,
				duration = 6.25,
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
						nodeId = 33,
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
						nodeId = 61,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 62,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 63,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -595425872,
				staticIdVInput = -791334962
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204403,
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
				npcStaticId = -791334962,
				npcId = 5160003,
				matchAudioDuration = true,
				duration = 9.12,
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
						nodeId = 34,
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
						nodeId = 35,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 59,
						portId = "In"
					}
				},
				["3"] = {
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
				dialogueIdVInput = 6204404,
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
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.5,
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
						nodeId = 37,
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
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204405,
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
				npcStaticId = -531843579,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 7.5,
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
						nodeId = 38,
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
						nodeId = 41,
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
						nodeId = 40,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 55,
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
					80.213,
					101.828,
					1156.155
				},
				rotationVInput = {
					0.801,
					16.887,
					0.001
				}
			},
			fields = {
				focalDistance = 145,
				fStop = 32,
				cameraId = 91565558,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 176,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0,
				StopDof = 1
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -791334962,
				playableStateVInput = "Talk"
			},
			fields = {
				templateId = 5160003,
				processingTime = 14.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204406,
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
				npcStaticId = -791334962,
				npcId = 5160003,
				matchAudioDuration = true,
				duration = 11.12,
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
						nodeId = 42,
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
						nodeId = 43,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 53,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 54,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 40,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204407,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -531843579,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 2.75,
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
						nodeId = 45,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 52,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 51,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 39,
						portId = "StopDof"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204408,
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
				npcStaticId = -791334962,
				npcId = 5160003,
				matchAudioDuration = true,
				duration = 7,
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
						nodeId = 46,
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
						nodeId = 47,
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
						nodeId = 48,
						portId = "In"
					}
				}
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
						nodeId = 49,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 50,
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
				fovVInput = 30,
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0,
					0.6
				},
				positionVInput = {
					80.303,
					101.854,
					1155.893
				},
				rotationVInput = {
					0.812,
					26.054,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 21.3,
				cameraId = 91565592,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -791334962,
				targetEulerAngleVInput = {
					0,
					56.8,
					0
				},
				targetPositionVInput = {
					80.592,
					100.464,
					1157.521
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -531843579,
				playableStateVInput = "Talk_Cheeksupport"
			},
			fields = {
				templateId = 5160002,
				processingTime = 5.5,
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
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					80.61,
					101.989,
					1156.774
				},
				rotationVInput = {
					12.146,
					270.088,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 21.3,
				cameraId = 91565437,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -791334962,
				staticIdVInput = -531843579
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -531843579,
				playableStateVInput = "Talk_Shrug"
			},
			fields = {
				templateId = 5160002,
				processingTime = 3.733,
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
				lookAtEntityStaticIdVInput = -531843579,
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
					81.246,
					102.148,
					1157.255
				},
				rotationVInput = {
					15.469,
					245.451,
					0.001
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 18.54,
				cameraId = 91422861,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				templateId = 301,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -531843579
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -791334962,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -791334962
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0,
					0.7
				},
				positionVInput = {
					80.213,
					101.828,
					1156.155
				},
				rotationVInput = {
					0.801,
					16.887,
					0.001
				}
			},
			fields = {
				focalDistance = 145,
				fStop = 32,
				cameraId = 91565396,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 176,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -791334962,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				templateId = 5160003,
				processingTime = 2.8,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 3,
			inputs = {
				fovVInput = 24,
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0.7,
					0
				},
				positionVInput = {
					80.888,
					101.04,
					1154.907
				},
				rotationVInput = {
					350.259,
					348.125,
					0.001
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 21.3,
				cameraId = 91565387,
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
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0,
					0.7
				},
				positionVInput = {
					81.057,
					101.873,
					1157.162
				},
				rotationVInput = {
					28.418,
					212.22,
					0.001
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 21.3,
				cameraId = 91422768,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0,
				StopDof = 1
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -595425872,
				staticIdVInput = -791334962
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -791334962,
				staticIdVInput = -595425872
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0,
					0.7
				},
				positionVInput = {
					80.213,
					101.828,
					1156.155
				},
				rotationVInput = {
					0.801,
					16.887,
					0.001
				}
			},
			fields = {
				focalDistance = 145,
				fStop = 32,
				cameraId = 91565331,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 176,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0,
				StopDof = 1
			}
		},
		{
			kind = 5,
			inputs = {
				animationLayerVInput = 4,
				staticIdVInput = -595425872,
				playableStateVInput = "EnvBehav_Confused_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 5
			},
			fields = {
				templateId = 5160004,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"EnvBehav_Confused_Start",
					"EnvBehav_Confused_Loop",
					"EnvBehav_Confused_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -595425872,
				staticIdVInput = -791334962
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -595425872,
				staticIdVInput = -791334962
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0,
					0.7
				},
				positionVInput = {
					80.61,
					101.989,
					1156.774
				},
				rotationVInput = {
					12.146,
					270.088,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 21.3,
				cameraId = 91422741,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -531843579,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -531843579,
				staticIdVInput = -531843579
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					-0.2,
					0
				},
				positionVInput = {
					80.208,
					101.894,
					1153.934
				},
				rotationVInput = {
					4.124,
					352.25,
					0.001
				}
			},
			fields = {
				focalDistance = 331,
				fStop = 32,
				cameraId = 91565328,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0,
				StopDof = 1
			}
		},
		{
			kind = 27,
			fields = {
				uid = 306,
				param = {
					name = "CHARACTER_APPEARANCE_NAME_ANTI",
					title = "",
					style = 0,
					pos = {
						-1000,
						0,
						120
					}
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -791334962,
				speedVInput = 1.063,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					218.712,
					0
				},
				targetPositionVInput = {
					80.604,
					100.462,
					1157.541
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
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							value = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							outWeight = 0,
							weightedMode = 0,
							time = 1,
							value = 1,
							inWeight = 0,
							outTangent = 0,
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
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -791334962,
				playableStateVInput = "Talk"
			},
			fields = {
				templateId = 5160003,
				processingTime = 14.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -531843579,
				playableStateVInput = "Emotion_Amazed"
			},
			fields = {
				templateId = 5160002,
				processingTime = 5,
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
				lookAtEntityStaticIdVInput = -791334962,
				staticIdVInput = -531843579
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -791334962,
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
				slotParamVInput = 5160004,
				positionVInput = {
					80.405,
					100.523,
					1156.122
				},
				rotationVInput = {
					0,
					344.145,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -595425872
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5160005,
				positionVInput = {
					78.626,
					100.353,
					1156.882
				},
				rotationVInput = {
					0,
					46.165,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -687630443
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5160003,
				positionVInput = {
					80.906,
					100.441,
					1158.047
				},
				rotationVInput = {
					0,
					218.459,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -791334962
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 86,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -791334962
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0,
					0.7
				},
				positionVInput = {
					81.605,
					101.955,
					1156.903
				},
				rotationVInput = {
					9.739,
					258.629,
					0.001
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91128823,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
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
				["2"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 90,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -531843579,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -531843579,
				staticIdVInput = -595425872
			},
			flowIn = {
				In = 0
			}
		}
	}
}
