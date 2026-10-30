-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91062329.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 91062329,
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					blockEvent = true,
					modeType = 2,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					blockCameraZoom = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					toplogoComList = {
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
						chat = true,
						callFriends = true,
						bubble = false
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 107,
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
						nodeId = 6,
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
						nodeId = 94,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 97,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 99,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 102,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 104,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeInVInput = true,
				dialogueIdVInput = 6518120,
				enableFadeOutVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0.5,
				npcStaticId = -1,
				npcId = 5120150,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				portCount = 1
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
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518121,
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
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				portCount = 1
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
						nodeId = 10,
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
				dialogueIdVInput = 6518122,
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
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				portCount = 1
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
				portCount = 5
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
						nodeId = 85,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 86,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 92,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeInVInput = true,
				dialogueIdVInput = 6518123,
				enableFadeOutVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				portCount = 1
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
						nodeId = 84,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518124,
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
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518125,
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
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				portCount = 1
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
						nodeId = 17,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 74,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 78,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 83,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeInVInput = true,
				dialogueIdVInput = 6518126,
				enableFadeOutVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				portCount = 1
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518127,
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
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						nodeId = 21,
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
						nodeId = 22,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 64,
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
						portId = "In"
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
						nodeId = 72,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518128,
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
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						nodeId = 24,
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
						nodeId = 61,
						portId = "In"
					}
				},
				True = {
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
				portCount = 2
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
						nodeId = 60,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518129,
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
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						nodeId = 28,
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
						nodeId = 58,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518131,
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
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				portCount = 2
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
						nodeId = 55,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6518132
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
						nodeId = 32,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 50,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 44,
						portId = "In"
					}
				},
				["3"] = {
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
				delayTime = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 33,
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
						nodeId = 34,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 6518134,
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
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						nodeId = 41,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 42,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518135,
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
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6518136
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
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
			kind = 7,
			fields = {
				dialogueId = 6518137
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Firm_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 5,
				staticIdVInput = 91061323
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 1.733,
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
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 5,
				staticIdVInput = 91061323
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 1.733,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
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
				fovVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					301.984,
					155.758,
					933.722
				},
				rotationVInput = {
					359.54,
					312.757,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 298,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 376,
				fStop = 15.41,
				cameraId = 91101429,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Sleep_End",
				staticIdVInput = -714866297,
				loopDurationVInput = 5
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 1,
				templateId = 1037100,
				processingTime = 2.85
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 45,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.75,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 3.8,
				staticIdVInput = -714866297,
				targetEulerAngleVInput = {
					0,
					342.897,
					0
				},
				targetPositionVInput = {
					298.593,
					153.847,
					927.317
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
							outTangent = 1,
							inTangent = 0,
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
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
						nodeId = 46,
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
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -714866297,
				targetEulerAngleVInput = {
					0,
					296.482,
					0
				},
				targetPositionVInput = {
					300.887,
					154.863,
					936.521
				}
			},
			fields = {
				setRotation = true,
				reset = false,
				setPosition = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				staticIdVInput = -714866297,
				targetEulerAngleVInput = {
					0,
					-90.3,
					0
				},
				targetPositionVInput = {
					299.677,
					154.865,
					936.671
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
							outTangent = 1,
							inTangent = 0,
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
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
			kind = 3,
			inputs = {
				fovVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					299.379,
					154.971,
					927.907
				},
				rotationVInput = {
					12.453,
					209.246,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 298,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 320,
				fStop = 16,
				cameraId = 91101369,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Squat_End",
				staticIdVInput = 2,
				loopDurationVInput = 5
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 2.7
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 3.8,
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					358,
					0
				},
				targetPositionVInput = {
					297.234,
					153.598,
					926.394
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
							outTangent = 1,
							inTangent = 0,
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
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
						nodeId = 52,
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
						nodeId = 53,
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
					346.117,
					0
				},
				targetPositionVInput = {
					299.338,
					154.865,
					935.14
				}
			},
			fields = {
				setRotation = true,
				reset = false,
				setPosition = true
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
			kind = 19,
			inputs = {
				speedVInput = 0.75,
				maxLimitTimeVInput = 10,
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					346.117,
					0
				},
				targetPositionVInput = {
					299.171,
					154.871,
					935.818
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
							outTangent = 1,
							inTangent = 0,
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
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
			kind = 7,
			fields = {
				dialogueId = 6518133
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
			kind = 26,
			inputs = {
				staticIdVInput = 91061325,
				targetEulerAngleVInput = {
					0,
					107.861,
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
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_AngryEnd",
				staticIdVInput = 91061325,
				loopDurationVInput = 999
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 1,
				templateId = 1032400,
				processingTime = 1.167
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Greet_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91061323
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 0,
				templateId = 401,
				processingTime = 2,
				aniStateList = {
					"Story_Greet_Start",
					"Story_Greet_Loop",
					"Story_Greet_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					305.108,
					152.698,
					898.953
				},
				rotationVInput = {
					354.227,
					348.447,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 518,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 3422,
				fStop = 10.69,
				cameraId = 91100638,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Emotion_Parmon_10361_Sleep"
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0
			},
			flowIn = {
				Play = 0
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
						nodeId = 62,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 63,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518130,
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
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Emotion_Parmon_10371_Sleep"
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					305.633,
					166.874,
					928.141
				},
				rotationVInput = {
					56.556,
					249.017,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 274,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 1150,
				fStop = 5.72,
				cameraId = 91100364,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				fovVInput = 15,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					305.886,
					166.791,
					927.828
				},
				rotationVInput = {
					56.556,
					249.017,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 274,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 1150,
				fStop = 5.72,
				cameraId = 91100592,
				visualizeDOF = false
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
						nodeId = 67,
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
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "SitOnGround_Sleep_Loop",
				staticIdVInput = 2,
				loopDurationVInput = 5
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 0,
				templateId = 401,
				processingTime = 3.367
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Sleep_Loop",
				staticIdVInput = -714866297,
				loopDurationVInput = 5
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				templateId = 1037100,
				processingTime = 1.933
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
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = -1848770319
			},
			fields = {
				emojiName = "Sleep",
				duration = 5
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
				staticIdVInput = 91061323
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 3.367,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
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
						nodeId = 72,
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
						nodeId = 75,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91061325,
				targetEulerAngleVInput = {
					0,
					186,
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
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_AngryLoop",
				staticIdVInput = 91061325,
				loopDurationVInput = 999
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				templateId = 1032400,
				processingTime = 3.4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 77,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Emotion_Parmon_10324_Angry"
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0
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
						nodeId = 79,
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
					295.516,
					155.474,
					933.297
				},
				rotationVInput = {
					355.913,
					29.806,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 596,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 617,
				fStop = 12.47,
				cameraId = 91128567,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 80,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					295.861,
					155.379,
					932.916
				},
				rotationVInput = {
					354.691,
					22.931,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 596,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 617,
				fStop = 12.47,
				cameraId = 91128568,
				visualizeDOF = false
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
						nodeId = 82,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "SFX_UI_TimePass02"
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Dialogue_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 999,
				staticIdVInput = 91061323
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 3.367,
				aniStateList = {
					"Story_Dialogue_Start",
					"Story_Dialogue_Loop",
					"Story_Dialogue_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 5,
				staticIdVInput = 91061323
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 3.367,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
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
						nodeId = 83,
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
						nodeId = 87,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_SleepLoop",
				staticIdVInput = 91061325,
				loopDurationVInput = 999
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 1,
				templateId = 1032400,
				processingTime = 6.367
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 88,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Emotion_Parmon_10324_Sleep"
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0
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
						nodeId = 90,
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
					299.163,
					155.712,
					932.911
				},
				rotationVInput = {
					357.3,
					347,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 500,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 500,
				fStop = 7,
				cameraId = 91128560,
				visualizeDOF = false
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
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					299.163,
					155.712,
					932.911
				},
				rotationVInput = {
					357.3,
					353,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 500,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 500,
				fStop = 7,
				cameraId = 91128563,
				visualizeDOF = false
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
						nodeId = 93,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "SFX_UI_TimePass02"
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0
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
						nodeId = 95,
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
					300.371,
					155.749,
					935.982
				},
				rotationVInput = {
					354.035,
					306.269,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 15,
				cameraId = 91100151,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 96,
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
					300.371,
					155.749,
					935.982
				},
				rotationVInput = {
					353.519,
					302.623,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 15,
				cameraId = 91128536,
				visualizeDOF = false
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
						nodeId = 98,
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
					358,
					0
				},
				targetPositionVInput = {
					297.319,
					153.08,
					924.2
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
						nodeId = 100,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 200001,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					298.027,
					153,
					924.21
				},
				rotationVInput = {
					0,
					116,
					0
				}
			},
			fields = {
				entityId = -714866297,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 101,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5120159,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					297.987,
					152.8,
					923.78
				},
				rotationVInput = {
					0,
					105.647,
					0
				}
			},
			fields = {
				entityId = -1848770319,
				ignoreGravity = false
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
						nodeId = 103,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "SFX_UI_TimePass02"
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 50,
			inputs = {
				enableFillLightVInput = true,
				fillLightIntensityVInput = 8000
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
						nodeId = 106,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Dialogue_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 999,
				staticIdVInput = 91061323
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 3.367,
				aniStateList = {
					"Story_Dialogue_Start",
					"Story_Dialogue_Loop",
					"Story_Dialogue_End"
				}
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
					346.117,
					0
				},
				targetPositionVInput = {
					299.171,
					154.871,
					935.818
				}
			},
			fields = {
				setRotation = true,
				reset = false,
				setPosition = true
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
		}
	}
}
