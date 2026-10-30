-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91222716.lua

return {
	startNodeId = 1,
	dialogueId = 91222716,
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
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					toplogoComList = {
						petExchange = true,
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
						petFertility = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 3,
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
						nodeId = 4,
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
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91320966,
				isResetValueInput = true,
				durationVInput = 0
			},
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
						nodeId = 7,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 238,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 243,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 248,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 269,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107010,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 242,
					portId = "EntityIDs"
				}
			},
			fields = {
				nodeMode = 1,
				enableGroupLookAt = false,
				enableDefaultLookAt = true,
				cameraPreset = 2,
				resetOrientation = true,
				reactPreset = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FOut = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
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
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 53,
			inputs = {
				cameraMovementTypeVInput = 1,
				cameraIdVInput = 91248148,
				blendFuctionVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
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
			kind = 53,
			inputs = {
				cameraMovementTypeVInput = 1,
				cameraIdVInput = 91248158,
				blendInTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
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
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107055,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 5.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
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
				dialogueIdVInput = 9107056,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 3.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
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
				portCount = 2
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
						nodeId = 237,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107057,
				dialogsetCameraIdVInput = 91248276,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 4.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
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
				portCount = 2
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
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2131311940,
				playableStateVInput = "Daily_Thanks"
			},
			fields = {
				processingTime = 1.767,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200027
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107058,
				dialogsetCameraIdVInput = 91248279,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
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
				portCount = 2
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
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -849169900,
				playableStateVInput = "IdleSpecial03"
			},
			fields = {
				processingTime = 5.733,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200022
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107059,
				dialogsetCameraIdVInput = 91248282,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
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
				portCount = 2
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
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1490126528,
				playableStateVInput = "Daily_Hello"
			},
			fields = {
				processingTime = 2.5,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107060,
				dialogsetCameraIdVInput = 91248309,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 4.19,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
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
				dialogueIdVInput = 9107061,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107062,
				dialogsetCameraIdVInput = 91248321,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
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
						nodeId = 29,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 30,
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
						nodeId = 32,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 230,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -346013045
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 275,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 275,
					portId = "OutPosition"
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
			kind = 14,
			inputs = {
				staticIdVInput = -2131311940
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 274,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 274,
					portId = "OutPosition"
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
			kind = 14,
			inputs = {
				staticIdVInput = -849169900
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 273,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 273,
					portId = "OutPosition"
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
			kind = 14,
			inputs = {
				staticIdVInput = -1490126528
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 276,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 276,
					portId = "OutPosition"
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
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = 91248071
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 238,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
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
				dialogueIdVInput = 9107011,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Amazed",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Amazed",
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
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 53,
			inputs = {
				cameraIdVInput = 91247738,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
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
						nodeId = 37,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 9107012,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -312948930,
				entityIdVInput = -312948930
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 271,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 271,
					portId = "OutPosition"
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -312948930
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 272,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 272,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 229,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107013,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5000038,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Behav_Love",
				skipTime = 2,
				portCount = 1,
				animCfg = {
					[1] = "Behav_Love",
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
						nodeId = 42,
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
						nodeId = 44,
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
			kind = 5,
			inputs = {
				staticIdVInput = -346013045,
				playableStateVInput = "Emotion_Cheer_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 5,
				templateId = 5200028,
				aniStateList = {
					"Emotion_Cheer_Start",
					"Emotion_Cheer_Loop",
					"Emotion_Cheer_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107014,
				dialogsetCameraIdVInput = 91254696,
				lookAtIdVInput = 5000038,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -346013045,
				npcId = 5200028,
				matchAudioDuration = true,
				duration = 4.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Cheer_Loop",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Cheer_Loop",
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
						nodeId = 45,
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
						nodeId = 46,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 228,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107015,
				lookAtIdVInput = 5000038,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -849169900,
				npcId = 5200026,
				matchAudioDuration = true,
				duration = 6.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "TalkUpper_Applaud",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "TalkUpper_Applaud",
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
						nodeId = 49,
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
			kind = 5,
			inputs = {
				staticIdVInput = -2131311940,
				playableStateVInput = "Talk_Cheeksupport_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 4.9,
				templateId = 5200027,
				aniStateList = {
					"Talk_Cheeksupport_Start",
					"Talk_Cheeksupport_Loop",
					"Talk_Cheeksupport_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107016,
				lookAtIdVInput = 5000038,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -2131311940,
				npcId = 5200027,
				matchAudioDuration = true,
				duration = 8.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "TalkUpper_Cheeksupport",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "TalkUpper_Cheeksupport",
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
						nodeId = 50,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107017,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Amazed",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Amazed",
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
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -312948930
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
				staticIdVInput = -1867953040
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 281,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 281,
					portId = "OutPosition"
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
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -1867953040
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
			kind = 53,
			inputs = {
				cameraIdVInput = 91247744,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
						nodeId = 56,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 9107018,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3.88,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1867953040,
				maxLimitTimeVInput = 2
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 282,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 282,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 58,
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
						nodeId = 59,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 227,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107019,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 5200029,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Behav_Love",
				skipTime = 2,
				portCount = 1,
				animCfg = {
					[1] = "Behav_Love",
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
						nodeId = 60,
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
						nodeId = 61,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 226,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107020,
				dialogsetCameraIdVInput = 91254696,
				lookAtIdVInput = 5200029,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -2131311940,
				npcId = 5200027,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "TalkUpper_Applaud",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "TalkUpper_Applaud",
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
						nodeId = 62,
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
						nodeId = 63,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 225,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107021,
				lookAtIdVInput = 5200029,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -346013045,
				npcId = 5200028,
				matchAudioDuration = true,
				duration = 8.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Cheer_Loop",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Cheer_Loop",
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
						nodeId = 64,
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
						nodeId = 65,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 224,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107022,
				lookAtIdVInput = 5200029,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -849169900,
				npcId = 5200026,
				matchAudioDuration = true,
				duration = 9.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "TalkUpper_Confused",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "TalkUpper_Confused",
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
						nodeId = 66,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107023,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 2.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Amazed",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Amazed",
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
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1867953040
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
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -1049775534
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
			kind = 14,
			inputs = {
				staticIdVInput = -1049775534
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 283,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 283,
					portId = "OutPosition"
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
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 53,
			inputs = {
				cameraIdVInput = 91247750,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
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
						nodeId = 72,
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
				dialogueIdVInput = 9107024,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3.38,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1049775534
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 284,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 284,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 74,
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
						nodeId = 75,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 223,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107025,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = 0,
				npcId = 5200025,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 2,
				portCount = 1
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
						nodeId = 77,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 222,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107026,
				dialogsetCameraIdVInput = 91254696,
				lookAtIdVInput = 5200025,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -849169900,
				npcId = 5200026,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Cheer_Loop",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Cheer_Loop",
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
						nodeId = 78,
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
						nodeId = 79,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 221,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107027,
				lookAtIdVInput = 5200025,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -2131311940,
				npcId = 5200027,
				matchAudioDuration = true,
				duration = 6.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "TalkUpper_Applaud",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "TalkUpper_Applaud",
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
						nodeId = 80,
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
						nodeId = 81,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 220,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107028,
				lookAtIdVInput = 5200025,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -346013045,
				npcId = 5200028,
				matchAudioDuration = true,
				duration = 5.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial04",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "IdleSpecial04",
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
						nodeId = 82,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107029,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 9.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
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
			kind = 20,
			inputs = {
				staticIdVInput = -1049775534
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
						nodeId = 85,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 216,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -518094810
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
						nodeId = 87,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 212,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -518094810
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 277,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 277,
					portId = "OutPosition"
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
						nodeId = 88,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 53,
			inputs = {
				cameraMovementTypeVInput = 1,
				cameraIdVInput = 91179500,
				cameraMovementExpVInput = 0.1,
				cameraMovementAngleVInput = 30,
				cameraMovementTimeVInput = 1.5,
				cameraMovementFuncVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0,
					-1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 89,
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
						nodeId = 90,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 208,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -518094810,
				playableStateVInput = "Behav_Alert",
				playStartLoopEndVInput = true,
				loopDurationVInput = 1000
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 4.517,
				templateId = 1003305,
				aniStateList = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 9107052,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 2
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
						nodeId = 207,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9107053
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
						nodeId = 94,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 203,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -518094810,
				playStartLoopEndVInput = true,
				defaultTransStateVInput = "Idle",
				playableStateVInput = "Behav_HappyLoop",
				loopDurationVInput = 5
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 9.367,
				templateId = 1003305,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = 0
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
						nodeId = 96,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 53,
			inputs = {
				cameraIdVInput = 91254696,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 97,
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
						nodeId = 98,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 202,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107031,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -346013045,
				npcId = 5200028,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Shock",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Shock",
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
						nodeId = 99,
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
						nodeId = 101,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 100,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -849169900,
				playableStateVInput = "Emotion_Shock"
			},
			fields = {
				processingTime = 6.233,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200026
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107032,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -849169900,
				npcId = 5200026,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Shock",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Shock",
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
						nodeId = 102,
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
						nodeId = 103,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 201,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107033,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -2131311940,
				npcId = 5200027,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Shock",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Shock",
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
						nodeId = 104,
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
						nodeId = 105,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 200,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107034,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Shock",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Shock",
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
						nodeId = 106,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107035,
				dialogsetCameraIdVInput = 91248321,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 5.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "TalkUpper_Applaud",
				skipTime = 0,
				portCount = 1,
				animCfg = {
					[1] = "TalkUpper_Applaud",
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
						nodeId = 107,
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
						nodeId = 124,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 108,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 112,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -346013045
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 291,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 291,
					portId = "OutPosition"
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
						nodeId = 109,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -2131311940
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 292,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 292,
					portId = "OutPosition"
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
						nodeId = 110,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -849169900
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 293,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 293,
					portId = "OutPosition"
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
						nodeId = 111,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1490126528
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 294,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 294,
					portId = "OutPosition"
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
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -312948930
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 113,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -1867953040
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 114,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -1049775534
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 115,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -518094810
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 116,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -312948930
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 295,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 295,
					portId = "OutPosition"
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
						nodeId = 117,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1867953040
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 296,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 296,
					portId = "OutPosition"
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
						nodeId = 118,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1049775534
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 297,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 297,
					portId = "OutPosition"
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
						nodeId = 119,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -518094810
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 298,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 298,
					portId = "OutPosition"
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
						nodeId = 120,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1256340114
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 307,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 307,
					portId = "OutPosition"
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
						nodeId = 121,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -582139008
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 307,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 307,
					portId = "OutPosition"
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
						nodeId = 122,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -931972559
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 307,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 307,
					portId = "OutPosition"
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
						nodeId = 123,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -525904627
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 307,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 307,
					portId = "OutPosition"
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107051,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 125,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107064,
				dialogsetCameraIdVInput = 91222844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 126,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107065,
				dialogsetCameraIdVInput = 91248276,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 127,
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
						nodeId = 128,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 199,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107066,
				dialogsetCameraIdVInput = 91248276,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -346013045,
				npcId = 5200028,
				matchAudioDuration = true,
				duration = 5.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 9107067,
				dialogsetCameraIdVInput = 91248279,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 130,
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
						nodeId = 132,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 131,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2131311940,
				playableStateVInput = "Emotion_Helpless"
			},
			fields = {
				processingTime = 3.233,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200027
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107068,
				dialogsetCameraIdVInput = 91248279,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -2131311940,
				npcId = 5200027,
				matchAudioDuration = true,
				duration = 5.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Helpless",
				skipTime = 1,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Helpless",
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
						nodeId = 133,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107069,
				dialogsetCameraIdVInput = 91248282,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 134,
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
						nodeId = 135,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 198,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107070,
				dialogsetCameraIdVInput = 91248282,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -849169900,
				npcId = 5200026,
				matchAudioDuration = true,
				duration = 8.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Helpless",
				skipTime = 1,
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Helpless",
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
						nodeId = 136,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107071,
				dialogsetCameraIdVInput = 91248309,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 2.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 137,
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
						nodeId = 138,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 197,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107072,
				dialogsetCameraIdVInput = 91248309,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 9107073,
				dialogsetCameraIdVInput = 91248309,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 140,
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
						nodeId = 141,
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
						nodeId = 154,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -312948930
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 142,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1867953040
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
			kind = 20,
			inputs = {
				staticIdVInput = -1049775534
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 144,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -346013045
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				staticIdVInput = -2131311940
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 146,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -849169900
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1490126528
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 299,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 299,
					portId = "OutPosition"
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
						nodeId = 148,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -518094810
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 300,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 300,
					portId = "OutPosition"
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
						nodeId = 149,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -341274847
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 301,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 301,
					portId = "OutPosition"
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
						nodeId = 150,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1256340114
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 308,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 308,
					portId = "OutPosition"
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
						nodeId = 151,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -582139008
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 308,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 308,
					portId = "OutPosition"
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
						nodeId = 152,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -931972559
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 308,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 308,
					portId = "OutPosition"
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
						nodeId = 153,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -525904627
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 308,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 308,
					portId = "OutPosition"
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
			kind = 53,
			inputs = {
				cameraIdVInput = 91248321,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 155,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107048,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 156,
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
						nodeId = 157,
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
						nodeId = 158,
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
						nodeId = 160,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 159,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 195,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 196,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1490126528,
				lookAtEntityStaticIdVInput = -341274847
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 53,
			inputs = {
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 5,
				cameraIdVInput = 91256185,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					1,
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 161,
						portId = "In"
					}
				}
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
						nodeId = 162,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107074,
				dialogsetCameraIdVInput = 91254963,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 6.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 163,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107036,
				dialogsetCameraIdVInput = 91254963,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 164,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107037,
				dialogsetCameraIdVInput = 91254963,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 165,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 194,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9107038
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 166,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107040,
				dialogsetCameraIdVInput = 91254963,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 8.62,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 3
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
						nodeId = 193,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9107041
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 168,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107043,
				dialogsetCameraIdVInput = 91254963,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 169,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 192,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9107044
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 170,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107046,
				dialogsetCameraIdVInput = 91254963,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 171,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107093,
				dialogsetCameraIdVInput = 91254963,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1
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
						nodeId = 173,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 176,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 186,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 187,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 188,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -1490126528
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 174,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -341274847
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 175,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107075,
				dialogsetCameraIdVInput = 91254968,
				dialogsetCameraBlendInTimeVInput = 1,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 6.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1490126528
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 302,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 302,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 177,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 6,
				maxAwaitTime = -1
			},
			flowIn = {
				["5"] = 0,
				["4"] = 0,
				["3"] = 0,
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 178,
						portId = "In"
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
					178.203,
					0
				},
				targetPositionVInput = {
					52.034,
					40.013,
					460.94
				}
			},
			fields = {
				setRotation = false,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 179,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 7,
				param = {
					snapshot = false,
					photoMode = "dialogue"
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 181,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 180,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 20
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 179,
						portId = "closeUIFInput"
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
						nodeId = 182,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 185,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107077,
				dialogsetCameraIdVInput = 91254968,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 183,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107047,
				dialogsetCameraIdVInput = 91254968,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -341274847,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 184,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9107076,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 5200023,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 3,
				skipTime = 6,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -341274847,
				playableStateVInput = "Emotion_Applaud02_Start",
				playStartLoopEndVInput = true,
				defaultTransStateVInput = "Idle"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 0,
				templateId = 5200023,
				aniStateList = {
					"Emotion_Applaud02_Start",
					"Emotion_Applaud02_Loop",
					"Emotion_Applaud02_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -518094810,
				autoPathfindingVInput = true,
				maxLimitTimeVInput = 3
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 303,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 303,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 177,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -341274847,
				autoPathfindingVInput = true
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 304,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 304,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
				staticIdVInput = -1256340114,
				autoPathfindingVInput = true
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 303,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 303,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 177,
						portId = "2"
					}
				},
				Out = {
					{
						nodeId = 189,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -582139008,
				autoPathfindingVInput = true
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 303,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 303,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 177,
						portId = "3"
					}
				},
				Out = {
					{
						nodeId = 190,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -931972559,
				autoPathfindingVInput = true
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 303,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 303,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 177,
						portId = "4"
					}
				},
				Out = {
					{
						nodeId = 191,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -525904627,
				autoPathfindingVInput = true
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 303,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 303,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 177,
						portId = "5"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9107045
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueId = 9107042
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 168,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9107039
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 166,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -341274847,
				lookAtEntityStaticIdVInput = -1490126528
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			valueIn = {
				entityIdVInput = {
					nodeId = 309,
					portId = "EntityID"
				},
				targetEulerAngleVInput = {
					nodeId = 310,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 310,
					portId = "OutPosition"
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
				staticIdVInput = -1490126528,
				playableStateVInput = "Story_Thankful"
			},
			fields = {
				processingTime = 7.967,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -849169900,
				playableStateVInput = "TalkUpper_Sigh",
				animationLayerVInput = 4
			},
			fields = {
				processingTime = 5.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200022
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -346013045,
				playableStateVInput = "Emotion_Cry_Start",
				playStartLoopEndVInput = true,
				defaultTransStateVInput = "Idle"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 3.433,
				templateId = 5200028,
				aniStateList = {
					"Emotion_Cry_Start",
					"Emotion_Cry_Loop",
					"Emotion_Cry_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Excited",
				entityIdVInput = -341274847
			},
			fields = {
				activePlayEmotion = true,
				noBlink = false,
				activePlayLip = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2131311940,
				playableStateVInput = "Emotion_Shock"
			},
			fields = {
				processingTime = 4.333,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200027
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -346013045,
				playableStateVInput = "Emotion_Shock"
			},
			fields = {
				processingTime = 6.233,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200028
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1256340114,
				playStartLoopEndVInput = true,
				defaultTransStateVInput = "Idle",
				playableStateVInput = "Behav_HappyLoop",
				loopDurationVInput = 5
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 9.367,
				templateId = 1003305,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 204,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -582139008,
				playStartLoopEndVInput = true,
				defaultTransStateVInput = "Idle",
				playableStateVInput = "Behav_HappyLoop",
				loopDurationVInput = 5
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 9.367,
				templateId = 1003305,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 205,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -931972559,
				playStartLoopEndVInput = true,
				defaultTransStateVInput = "Idle",
				playableStateVInput = "Behav_HappyLoop",
				loopDurationVInput = 5
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 9.367,
				templateId = 1003305,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 206,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -525904627,
				playStartLoopEndVInput = true,
				defaultTransStateVInput = "Idle",
				playableStateVInput = "Behav_HappyLoop",
				loopDurationVInput = 5
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 9.367,
				templateId = 1003305,
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
			kind = 7,
			fields = {
				dialogueId = 9107054
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
				staticIdVInput = -1256340114,
				playableStateVInput = "Behav_Alert",
				playStartLoopEndVInput = true,
				loopDurationVInput = 1000
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 4.517,
				templateId = 1003305,
				aniStateList = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 209,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -582139008,
				playableStateVInput = "Behav_Alert",
				playStartLoopEndVInput = true,
				loopDurationVInput = 1000
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 4.517,
				templateId = 1003305,
				aniStateList = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 210,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -931972559,
				playableStateVInput = "Behav_Alert",
				playStartLoopEndVInput = true,
				loopDurationVInput = 1000
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 4.517,
				templateId = 1003305,
				aniStateList = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 211,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -525904627,
				playableStateVInput = "Behav_Alert",
				playStartLoopEndVInput = true,
				loopDurationVInput = 1000
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				processingTime = 4.517,
				templateId = 1003305,
				aniStateList = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1256340114
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 277,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 277,
					portId = "OutPosition"
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
						nodeId = 213,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -582139008
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 277,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 277,
					portId = "OutPosition"
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
						nodeId = 214,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -931972559
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 277,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 277,
					portId = "OutPosition"
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
						nodeId = 215,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -525904627
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 277,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 277,
					portId = "OutPosition"
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
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -1256340114,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 217,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -582139008,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 218,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -931972559,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 219,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -525904627,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -346013045,
				playableStateVInput = "Emotion_Applaud02_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 3.833,
				templateId = 5200028,
				aniStateList = {
					"Emotion_Applaud02_Start",
					"Emotion_Applaud02_Loop",
					"Emotion_Applaud02_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2131311940,
				playableStateVInput = "Emotion_Applaud_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 4.9,
				templateId = 5200027,
				aniStateList = {
					"Emotion_Applaud_Start",
					"Emotion_Applaud_Loop",
					"Emotion_Applaud_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -849169900,
				playableStateVInput = "Emotion_Cheer_End",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 5.5,
				templateId = 5200022,
				aniStateList = {
					"Emotion_Cheer_Start",
					"Emotion_Cheer_Loop",
					"Emotion_Cheer_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1049775534,
				playableStateVInput = "IdleSpecial",
				defaultTransStateVInput = "Idle"
			},
			fields = {
				processingTime = 6.917,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200025
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -849169900,
				playableStateVInput = "Talk_Cheeksupport"
			},
			fields = {
				processingTime = 5.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200022
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -346013045,
				playableStateVInput = "Emotion_Applaud02_Start",
				playStartLoopEndVInput = true,
				defaultTransStateVInput = "Idle"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 5,
				templateId = 5200028,
				aniStateList = {
					"Emotion_Applaud02_Start",
					"Emotion_Applaud02_Loop",
					"Emotion_Applaud02_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2131311940,
				playableStateVInput = "Emotion_Cheer_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 4.9,
				templateId = 5200027,
				aniStateList = {
					"Emotion_Cheer_Start",
					"Emotion_Cheer_Loop",
					"Emotion_Cheer_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1867953040,
				playableStateVInput = "Behav_Love",
				defaultTransStateVInput = "Idle"
			},
			fields = {
				processingTime = 5,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200029
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -849169900,
				playableStateVInput = "Emotion_Applaud_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				processingTime = 3.833,
				templateId = 5200022,
				aniStateList = {
					"Emotion_Applaud_Start",
					"Emotion_Applaud_Loop",
					"Emotion_Applaud_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -312948930,
				playableStateVInput = "IdleSpecial",
				defaultTransStateVInput = "Idle"
			},
			fields = {
				processingTime = 3.967,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5000038
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1867953040
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 231,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1049775534
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 232,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -518094810
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 233,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1256340114
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 234,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -582139008
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 235,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -931972559
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 236,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -525904627
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -346013045,
				playableStateVInput = "Emotion_Amazed"
			},
			fields = {
				processingTime = 5,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200028
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5000038,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 278,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 278,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -312948930,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 239,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200029,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 279,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 279,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -1867953040,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 240,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200025,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 280,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 280,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -1049775534,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 241,
						portId = "In"
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
					178.203,
					0
				},
				targetPositionVInput = {
					52.034,
					40.013,
					460.94
				}
			},
			fields = {
				setRotation = false,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					nodeId = 238,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 239,
					portId = "EntityID"
				},
				["3EntityIDVInput"] = {
					nodeId = 240,
					portId = "EntityID"
				},
				["4EntityIDVInput"] = {
					nodeId = 243,
					portId = "EntityID"
				},
				["5EntityIDVInput"] = {
					nodeId = 244,
					portId = "EntityID"
				},
				["6EntityIDVInput"] = {
					nodeId = 245,
					portId = "EntityID"
				},
				["7EntityIDVInput"] = {
					nodeId = 246,
					portId = "EntityID"
				},
				["8EntityIDVInput"] = {
					nodeId = 247,
					portId = "EntityID"
				}
			},
			fields = {
				portCount = 8
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200028,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 285,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 285,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -346013045,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 244,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200027,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 286,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 286,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -2131311940,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 245,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200022,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 287,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 287,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -849169900,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 246,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200023,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 288,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 288,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -341274847,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 247,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1
			},
			valueIn = {
				positionVInput = {
					nodeId = 290,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 290,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -1490126528,
				ignoreGravity = false
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
						nodeId = 249,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 267,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 268,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PET_BATTLE_TAG",
					nil,
					{
						[1] = 1
					},
					">=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 250,
						portId = "0"
					}
				},
				True = {
					{
						nodeId = 266,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 3,
				maxAwaitTime = -1
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 251,
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
						nodeId = 252,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 265,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PET_BATTLE_TAG",
					nil,
					{
						[1] = 1
					},
					">=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 253,
						portId = "0"
					}
				},
				True = {
					{
						nodeId = 263,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 2,
				maxAwaitTime = -1
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 254,
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
						nodeId = 255,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 257,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 259,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 261,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1036100,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				True = {
					{
						nodeId = 256,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200050,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 289,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 289,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -1256340114,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1036300,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				True = {
					{
						nodeId = 258,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200052,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 289,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 289,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -931972559,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1037100,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				True = {
					{
						nodeId = 260,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200051,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 289,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 289,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -582139008,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1037300,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				True = {
					{
						nodeId = 262,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200053,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 289,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 289,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -525904627,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = false
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 264,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 3
			},
			valueIn = {
				positionVInput = {
					nodeId = 289,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 289,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -518094810,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PET_BATTLE_TAG",
					nil,
					{
						[1] = 1
					},
					">=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 253,
						portId = "1"
					}
				},
				True = {
					{
						nodeId = 263,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 3,
				executeOnce = false
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 264,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PET_BATTLE_TAG",
					nil,
					{
						[1] = 1
					},
					">=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 250,
						portId = "1"
					}
				},
				True = {
					{
						nodeId = 266,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PET_BATTLE_TAG",
					nil,
					{
						[1] = 1
					},
					">=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 250,
						portId = "2"
					}
				},
				True = {
					{
						nodeId = 266,
						portId = "2"
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
						nodeId = 270,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 53,
			inputs = {
				cameraMovementTypeVInput = 1,
				cameraIdVInput = 91254176,
				cameraMovementTimeVInput = 4,
				openDOFVInput = false,
				blendInTimeVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					1,
					0
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247721
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179395
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247762
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247763
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247764
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247765
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179395
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91244132
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91244137
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91244146
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247721
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179395
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247721
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179395
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179745
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179679
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179675
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179760
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247646
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179672
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179745
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179679
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179675
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91179672
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91244132
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91244137
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91244146
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247646
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91254878
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91255451
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91254904
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91255379
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91254902
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91257127
			}
		},
		[307] = {
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91247646
			}
		},
		[308] = {
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91255451
			}
		},
		[309] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[310] = {
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91179394,
				slotIDVInput = 91254878
			}
		}
	}
}
