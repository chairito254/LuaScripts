-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91527237.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 91527237,
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
		[2] = {
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
		[3] = {
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
		[4] = {
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
						nodeId = 89,
						portId = "In"
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
		[5] = {
			kind = 22,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		[6] = {
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
						nodeId = 7,
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
						nodeId = 80,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 83,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 88,
						portId = "In"
					}
				}
			}
		},
		[7] = {
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
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		[8] = {
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		[9] = {
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
				["2"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				}
			}
		},
		[10] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609021,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 4.75,
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
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		[11] = {
			kind = 27,
			fields = {
				uid = 306,
				param = {
					style = 0,
					name = "CHARACTER_APPEARANCE_NAME_KR",
					title = "CHARACTER_APPEARANCE_DESC_KR",
					pos = {
						1000,
						300,
						0
					}
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 13,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		[12] = {
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
						nodeId = 11,
						portId = "closeUIFInput"
					}
				}
			}
		},
		[13] = {
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
						nodeId = 14,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 70,
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
		[14] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609022,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 11.62,
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
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		[15] = {
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
				["2"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				}
			}
		},
		[16] = {
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		[17] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609023,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1
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
		[18] = {
			kind = 12,
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
		[19] = {
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
						nodeId = 23,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 61,
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
						nodeId = 65,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 21,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 63,
						portId = "In"
					}
				}
			}
		},
		[20] = {
			kind = 5,
			inputs = {
				staticIdVInput = -1841360847,
				playableStateVInput = "Behav_Happy",
				defaultTransStateVInput = "Idle"
			},
			fields = {
				templateId = 5090011,
				processingTime = 0.25,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		[21] = {
			kind = 14,
			inputs = {
				staticIdVInput = -198902549,
				targetEulerAngleVInput = {
					0,
					53.644,
					0
				},
				targetPositionVInput = {
					-58.256,
					39.825,
					516.209
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
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		[22] = {
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Behav_HappyStart",
				staticIdVInput = -198902549,
				defaultTransStateVInput = "Idle"
			},
			fields = {
				templateId = 5090014,
				processingTime = 0.667,
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
		[23] = {
			kind = 4,
			fields = {
				delayTime = 5
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
		[24] = {
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
						nodeId = 25,
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
						nodeId = 60,
						portId = "In"
					}
				}
			}
		},
		[25] = {
			kind = 1,
			inputs = {
				lookAtIdVInput = 5090010,
				dialogueIdVInput = 2609024,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.75,
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
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		[26] = {
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
						nodeId = 27,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 55,
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
		[27] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609025,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		[28] = {
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
						nodeId = 54,
						portId = "In"
					}
				}
			}
		},
		[29] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609026,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		[30] = {
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
						nodeId = 31,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		[31] = {
			kind = 1,
			inputs = {
				lookAtIdVInput = 5090010,
				dialogueIdVInput = 2609027,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
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
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		[32] = {
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
						nodeId = 33,
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
		[33] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609028,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 10.62,
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
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		[34] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609029,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 3.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		[35] = {
			kind = 7,
			fields = {
				dialogueId = 2609030
			},
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
		[36] = {
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
						nodeId = 37,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 50,
						portId = "In"
					}
				}
			}
		},
		[37] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609032,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 9.62,
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
		[38] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609033,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 10.12,
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		[39] = {
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
						nodeId = 40,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 49,
						portId = "In"
					}
				}
			}
		},
		[40] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609034,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		[41] = {
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
						nodeId = 42,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 46,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		[42] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609035,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 3,
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
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		[43] = {
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		[44] = {
			kind = 10,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 45,
						portId = "In"
					}
				}
			}
		},
		[45] = {
			kind = 21,
			inputs = {
				blendTimeVInput = 1.6
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
		},
		[46] = {
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Firm_Start",
				staticIdVInput = -1685107355,
				defaultTransStateVInput = "Idle"
			},
			fields = {
				templateId = 5090010,
				processingTime = 1.967,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
		[47] = {
			kind = 26,
			inputs = {
				staticIdVInput = -1685107355,
				targetEulerAngleVInput = {
					0,
					64,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		[48] = {
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start",
				staticIdVInput = -1685107355,
				defaultTransStateVInput = "Idle"
			},
			fields = {
				templateId = 5090010,
				processingTime = 1.967,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
		[49] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-53.113,
					41,
					520.916
				},
				rotationVInput = {
					359.293,
					219.058,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91536143,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[50] = {
			kind = 5,
			inputs = {
				staticIdVInput = -1685107355,
				playableStateVInput = "Emotion_Nod",
				defaultTransStateVInput = "Idle"
			},
			fields = {
				templateId = 5090010,
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		[51] = {
			kind = 7,
			fields = {
				dialogueId = 2609031
			},
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
		[52] = {
			kind = 5,
			inputs = {
				staticIdVInput = -1685107355,
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 401,
				processingTime = 1.733,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
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
		[53] = {
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Amazed_Start",
				staticIdVInput = 2,
				defaultTransStateVInput = "Idle"
			},
			fields = {
				templateId = 301,
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
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
		[54] = {
			kind = 5,
			inputs = {
				staticIdVInput = -1685107355,
				playableStateVInput = "Talk_Lefthand"
			},
			fields = {
				templateId = 401,
				processingTime = 2.5,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		[55] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-53.05,
					41.78,
					519.617
				},
				rotationVInput = {
					18.589,
					243.171,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 367,
				fStop = 7.29,
				cameraId = 91535690,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		[56] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-53.632,
					41.874,
					519.882
				},
				rotationVInput = {
					21.09,
					232.264,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91535745,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[57] = {
			kind = 5,
			inputs = {
				staticIdVInput = -1685107355,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				templateId = 401,
				processingTime = 1.7,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		[58] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-55.744,
					40.904,
					518.346
				},
				rotationVInput = {
					355.384,
					93.629,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 90,
				fStop = 20.54,
				cameraId = 91536106,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 59,
						portId = "In"
					}
				}
			}
		},
		[59] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-55.744,
					40.904,
					518.346
				},
				rotationVInput = {
					353.837,
					96.551,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 90,
				fStop = 20.54,
				cameraId = 91536128,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[60] = {
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Story_TakeItem",
				defaultTransStateVInput = "Idle"
			},
			fields = {
				templateId = 301,
				processingTime = 2.967,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		[61] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-54.827,
					40.581,
					518.207
				},
				rotationVInput = {
					356.415,
					262.423,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 284,
				fStop = 7.29,
				cameraId = 91536082,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 62,
						portId = "In"
					}
				}
			}
		},
		[62] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-55.036,
					40.546,
					517.832
				},
				rotationVInput = {
					354.181,
					265.345,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 284,
				fStop = 7.29,
				cameraId = 91536100,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[63] = {
			kind = 26,
			inputs = {
				staticIdVInput = -1685107355,
				targetEulerAngleVInput = {
					0,
					64,
					0
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
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		[64] = {
			kind = 5,
			inputs = {
				staticIdVInput = -1685107355,
				playableStateVInput = "Daily_Invite_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 401,
				processingTime = 1.7,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Daily_Invite_Start",
					"Daily_Invite_Loop",
					"Daily_Invite_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		[65] = {
			kind = 5,
			inputs = {
				staticIdVInput = -774824731,
				playableStateVInput = "Behav_Happy",
				defaultTransStateVInput = "IdleSpecial"
			},
			fields = {
				templateId = 5090013,
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		[66] = {
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
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		[67] = {
			kind = 14,
			inputs = {
				staticIdVInput = -1685107355,
				targetEulerAngleVInput = {
					0,
					306.183,
					0
				},
				targetPositionVInput = {
					-57.22,
					39.8,
					517.31
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
						nodeId = 68,
						portId = "In"
					}
				}
			}
		},
		[68] = {
			kind = 28,
			inputs = {
				staticIdVInput = -1685107355
			},
			flowIn = {
				In = 0
			}
		},
		[69] = {
			kind = 5,
			inputs = {
				staticIdVInput = -1685107355,
				playableStateVInput = "Emotion_Firm_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 401,
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
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
		[70] = {
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
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		[71] = {
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -247578202,
				lookAtDurationVInput = 1,
				staticIdVInput = -1685107355
			},
			flowIn = {
				In = 0
			}
		},
		[72] = {
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
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		[73] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				fovVInput = 42,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-44.404,
					42.564,
					504.374
				},
				rotationVInput = {
					349.378,
					329.426,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 894,
				fStop = 3.83,
				cameraId = 91536147,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
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
		[74] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				fovVInput = 42,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-44.404,
					42.564,
					504.374
				},
				rotationVInput = {
					346.972,
					333.207,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 894,
				fStop = 3.83,
				cameraId = 91536151,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[75] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-54.746,
					41.709,
					517.639
				},
				rotationVInput = {
					22.027,
					269.986,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 250,
				fStop = 7.21,
				cameraId = 91535823,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		[76] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-55.466,
					40.995,
					517.766
				},
				rotationVInput = {
					2.603,
					271.017,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 284,
				fStop = 7.29,
				cameraId = 91535895,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[77] = {
			kind = 5,
			inputs = {
				staticIdVInput = -1685107355,
				playableStateVInput = "Talk_Introduce"
			},
			fields = {
				templateId = 401,
				processingTime = 3.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		[78] = {
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = 91522179
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
		[79] = {
			kind = 16,
			inputs = {
				slotParamVInput = 5090010,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-57.22,
					39.8,
					517.31
				},
				rotationVInput = {
					0,
					64,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1685107355
			},
			flowIn = {
				In = 0
			}
		},
		[80] = {
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
						nodeId = 81,
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
		[81] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					248.221,
					0
				},
				targetPositionVInput = {
					-54.823,
					39.802,
					518.376
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
		[82] = {
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					288.881,
					0
				},
				targetPositionVInput = {
					-55.453,
					39.802,
					516.785
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
		[83] = {
			kind = 16,
			inputs = {
				slotParamVInput = 5090011,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-57.12,
					39.802,
					518.86
				},
				rotationVInput = {
					0,
					141.311,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1841360847
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 84,
						portId = "In"
					}
				}
			}
		},
		[84] = {
			kind = 16,
			inputs = {
				slotParamVInput = 5090013,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-58.72,
					39.825,
					517.88
				},
				rotationVInput = {
					0,
					111.985,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -774824731
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
				},
				Out = {
					{
						nodeId = 85,
						portId = "In"
					}
				}
			}
		},
		[85] = {
			kind = 16,
			inputs = {
				slotParamVInput = 5090014,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-58.77,
					39.825,
					516.39
				},
				rotationVInput = {
					0,
					53.644,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -198902549
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 86,
						portId = "In"
					}
				}
			}
		},
		[86] = {
			kind = 5,
			inputs = {
				staticIdVInput = -198902549,
				playableStateVInput = "Behav_SleepLoop",
				defaultTransStateVInput = "Idle"
			},
			fields = {
				templateId = 5090013,
				processingTime = 8.333,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		[87] = {
			kind = 5,
			inputs = {
				staticIdVInput = -774824731,
				playableStateVInput = "IdleSpecial",
				defaultTransStateVInput = "IdleSpecial"
			},
			fields = {
				templateId = 5090013,
				processingTime = 5.283,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		[88] = {
			kind = 16,
			inputs = {
				slotParamVInput = 5120159,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-55.083,
					42.5,
					520.399
				},
				rotationVInput = {
					0,
					319.609,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -247578202
			},
			flowIn = {
				In = 0
			}
		},
		[89] = {
			kind = 13,
			inputs = {
				staticIdVInput = 91525291
			},
			fields = {
				cameraPreset = 0,
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 0,
				enableGroupLookAt = true,
				enableDefaultLookAt = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		}
	}
}
