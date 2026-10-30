-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91194000.lua

return {
	startNodeId = 1,
	dialogueId = 91194000,
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
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					showHud = true,
					hideInteractionSign = true,
					hideMarkShare = true,
					hideTopLogo = true,
					blockCameraZoom = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					toplogoComList = {
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
						bubble = false,
						alert = true,
						battleRoom = true,
						actionState = true,
						vlog = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 43,
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
						nodeId = 4,
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
						nodeId = 5,
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
						nodeId = 6,
						portId = "In"
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
						nodeId = 8,
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
						nodeId = 125,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 114,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 117,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 120,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 123,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 129,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5150019,
				positionVInput = {
					-983.23,
					115.843,
					338.63
				},
				rotationVInput = {
					0,
					259.61,
					0
				}
			},
			fields = {
				entityId = -1544762423,
				ignoreGravity = true
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
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1544762423,
				speedVInput = 1.25,
				maxLimitTimeVInput = 15,
				targetEulerAngleVInput = {
					0,
					334.695,
					0
				},
				targetPositionVInput = {
					-989.642,
					115.843,
					336.209
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
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							value = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 1,
							weightedMode = 0,
							value = 0,
							outWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["2EntityIDVInput"] = {
					nodeId = 9,
					portId = "EntityID"
				},
				["3EntityIDVInput"] = {
					nodeId = 114,
					portId = "EntityID"
				},
				["4EntityIDVInput"] = {
					nodeId = 117,
					portId = "EntityID"
				},
				["5EntityIDVInput"] = {
					nodeId = 120,
					portId = "EntityID"
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
					nodeId = 12,
					portId = "EntityIDs"
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
			},
			flowOut = {
				Finish = {
					{
						nodeId = 14,
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
						nodeId = 15,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 110,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 100,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 111,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 112,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304521,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1785376654,
				npcId = 5150020
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
						nodeId = 100,
						portId = "StopDof"
					}
				},
				["2"] = {
					{
						nodeId = 98,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 101,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 109,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 106,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 107,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 108,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304522,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 3,
				npcStaticId = -1242944624,
				npcId = 5150018
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
				portCount = 5
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
						nodeId = 96,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 95,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 97,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304523,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 4.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1242944624,
				npcId = 5150018
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
						nodeId = 94,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 86,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 85,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 87,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 88,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304524,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 3,
				npcStaticId = -1,
				npcId = 5150019
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
				portCount = 8
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
						nodeId = 83,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 82,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 85,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304525,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150021
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
						nodeId = 25,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 79,
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
						nodeId = 81,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 76,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 82,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304526,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019
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
						nodeId = 27,
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
						nodeId = 77,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 76,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304527,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018
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
				portCount = 10
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
						nodeId = 71,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 73,
						portId = "StopDof"
					}
				},
				["3"] = {
					{
						nodeId = 74,
						portId = "StopDof"
					}
				},
				["4"] = {
					{
						nodeId = 75,
						portId = "StopDof"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304528,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 8.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018
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
			kind = 2,
			fields = {
				portCount = 10
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
						nodeId = 68,
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
						nodeId = 70,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304529,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 4.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0
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
				portCount = 10
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
						nodeId = 62,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 63,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 67,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 33045391,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 4.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1.5,
				npcStaticId = -1,
				npcId = 0
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
				portCount = 10
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
						nodeId = 57,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3304530,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 5.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0
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
				portCount = 10
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
				},
				["1"] = {
					{
						nodeId = 37,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 46,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 54,
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
				staticIdVInput = 2
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 403,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304531,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				matchAudioDuration = true,
				duration = 9.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5150018
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
			kind = 2,
			fields = {
				portCount = 10
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
						nodeId = 44,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 46,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 53,
						portId = "In"
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
						nodeId = 41,
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
						nodeId = 42,
						portId = "In"
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
						nodeId = 43,
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
						nodeId = 0,
						portId = "End"
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
						nodeId = 45,
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
				playableStateVInput = "Talk_Righthand",
				animationLayerVInput = 4,
				staticIdVInput = -1242944624
			},
			fields = {
				processingTime = 5.367,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018
			},
			flowIn = {
				In = 0,
				Stop = 1
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
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 10
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
						nodeId = 50,
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
						nodeId = 52,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1242944624,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1351528860,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1785376654,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1544762423,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 12,
			flowIn = {
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
						nodeId = 55,
						portId = "In"
					}
				},
				True = {
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
				fovVInput = 30,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.678,
					116.67,
					336.299
				},
				rotationVInput = {
					358.9,
					26.73,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91539657,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
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
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.686,
					116.592,
					336.285
				},
				rotationVInput = {
					357.181,
					26.73,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91569413,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
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
						nodeId = 60,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 58,
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
					-989.739,
					116.59,
					336.193
				},
				rotationVInput = {
					358.9,
					29.881,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91569409,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true
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
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.686,
					116.592,
					336.285
				},
				rotationVInput = {
					357.181,
					29.707,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91569410,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
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
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.739,
					116.665,
					336.193
				},
				rotationVInput = {
					358.9,
					29.881,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91539655,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.678,
					116.67,
					336.299
				},
				rotationVInput = {
					358.9,
					29.881,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91539656,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
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
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-990.961,
					116.659,
					339.157
				},
				rotationVInput = {
					3.669,
					144.534,
					359.946
				}
			},
			fields = {
				focalDistance = 283,
				fStop = 14.28,
				cameraId = 91539649,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 279,
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
				staticIdVInput = -1544762423,
				targetEulerAngleVInput = {
					0,
					241.768,
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
						nodeId = 65,
						portId = "In"
					}
				}
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
					-1036.419,
					120.848,
					319.913
				},
				rotationVInput = {
					14.6,
					188,
					0.067
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91539651,
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 1110081,
				positionVInput = {
					-1050.622,
					116.975,
					288.509
				},
				rotationVInput = {
					0,
					33.775,
					0
				}
			},
			fields = {
				entityId = -371651486,
				ignoreGravity = true
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
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 403,
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
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-991.163,
					116.681,
					339.42
				},
				rotationVInput = {
					3.841,
					142.471,
					359.946
				}
			},
			fields = {
				focalDistance = 283,
				fStop = 14.28,
				cameraId = 91539647,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 279,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 69,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-990.961,
					116.659,
					339.157
				},
				rotationVInput = {
					3.669,
					142.471,
					359.946
				}
			},
			fields = {
				focalDistance = 283,
				fStop = 14.28,
				cameraId = 91539648,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 279,
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
				playableStateVInput = "TalkUpper_Shrug",
				animationLayerVInput = 4,
				staticIdVInput = -1242944624
			},
			fields = {
				processingTime = 2.233,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018
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
					-1013.041,
					118.719,
					318.37
				},
				rotationVInput = {
					16.308,
					249.298,
					0.065
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91213866,
				visualizeDOF = false,
				squeezeFactor = 1,
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
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1014.809,
					118.166,
					317.702
				},
				rotationVInput = {
					16.308,
					249.298,
					0.065
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91423654,
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
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.739,
					116.665,
					336.193
				},
				rotationVInput = {
					358.9,
					29.881,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91539613,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0,
				StopDof = 1
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
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.678,
					116.67,
					336.299
				},
				rotationVInput = {
					358.9,
					29.881,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91539615,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0,
				StopDof = 1
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.686,
					116.592,
					336.285
				},
				rotationVInput = {
					357.181,
					29.707,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91569371,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
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
				playableStateVInput = "EnvBehav_Sing",
				staticIdVInput = -1544762423
			},
			fields = {
				processingTime = 5,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019
			},
			flowIn = {
				In = 0,
				Stop = 1
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
						nodeId = 73,
						portId = "In"
					}
				},
				True = {
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
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.739,
					116.59,
					336.193
				},
				rotationVInput = {
					358.9,
					29.881,
					0.063
				}
			},
			fields = {
				focalDistance = 89,
				fStop = 19.04,
				cameraId = 91569370,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				staticIdVInput = -1544762423
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 174,
					portId = "BoneTransform"
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
				staticIdVInput = -1351528860
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 174,
					portId = "BoneTransform"
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
				fovVInput = 33,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-989.424,
					116.831,
					339.599
				},
				rotationVInput = {
					7.357,
					180.978,
					0.063
				}
			},
			fields = {
				focalDistance = 172,
				fStop = 9.78,
				cameraId = 91539605,
				visualizeDOF = false,
				squeezeFactor = 1.019,
				sensorWidth = 124,
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
				playableStateVInput = "IdleSpecial",
				staticIdVInput = -1351528860
			},
			fields = {
				processingTime = 5.9,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150021
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 33,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-988.452,
					116.845,
					339.373
				},
				rotationVInput = {
					7.185,
					215.7,
					0.063
				}
			},
			fields = {
				focalDistance = 172,
				fStop = 9.78,
				cameraId = 91539599,
				visualizeDOF = false,
				squeezeFactor = 1.019,
				sensorWidth = 124,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 84,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 33,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-988.572,
					116.819,
					339.206
				},
				rotationVInput = {
					7.185,
					215.7,
					0.063
				}
			},
			fields = {
				focalDistance = 172,
				fStop = 9.78,
				cameraId = 91539600,
				visualizeDOF = false,
				squeezeFactor = 1.019,
				sensorWidth = 124,
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
				playableStateVInput = "Behav_Happy",
				staticIdVInput = -1544762423
			},
			fields = {
				processingTime = 6.05,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1242944624,
				lookAtEntityStaticIdVInput = -1544762423
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1544762423,
				lookAtEntityStaticIdVInput = -1242944624
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
						nodeId = 89,
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
						nodeId = 94,
						portId = "StopDof"
					}
				},
				["1"] = {
					{
						nodeId = 90,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 92,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 93,
						portId = "In"
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
					-1054.038,
					147.272,
					296.211
				},
				rotationVInput = {
					0.481,
					230.817,
					0.062
				}
			},
			fields = {
				focalDistance = 227,
				fStop = 5.93,
				cameraId = 91423339,
				visualizeDOF = false,
				squeezeFactor = 1.019,
				sensorWidth = 124,
				recombineQuality = 0,
				openDof = false
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
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1085.762,
					147.051,
					270.353
				},
				rotationVInput = {
					0.31,
					230.817,
					0.062
				}
			},
			fields = {
				focalDistance = 227,
				fStop = 5.93,
				cameraId = 91423357,
				visualizeDOF = false,
				squeezeFactor = 1.019,
				sensorWidth = 124,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -1351528860
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 173,
					portId = "BoneTransform"
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
				staticIdVInput = -1785376654
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 173,
					portId = "BoneTransform"
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
				fovVInput = 40,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-992.704,
					116.308,
					337.779
				},
				rotationVInput = {
					1.513,
					103.795,
					0.062
				}
			},
			fields = {
				focalDistance = 331,
				fStop = 9.61,
				cameraId = 91539570,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = -1242944624
			},
			fields = {
				processingTime = 6.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
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
				playableStateVInput = "Emotion_Shock",
				staticIdVInput = -1242944624
			},
			fields = {
				processingTime = 3.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Cry",
				staticIdVInput = -1351528860
			},
			fields = {
				processingTime = 6.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150021
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1034.636,
					118.042,
					313.851
				},
				rotationVInput = {
					4.003,
					201.6,
					0.062
				}
			},
			fields = {
				focalDistance = 227,
				fStop = 5.93,
				cameraId = 91421823,
				visualizeDOF = false,
				squeezeFactor = 1.019,
				sensorWidth = 124,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 99,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1035.403,
					117.896,
					311.913
				},
				rotationVInput = {
					4.003,
					201.6,
					0.062
				}
			},
			fields = {
				focalDistance = 227,
				fStop = 5.93,
				cameraId = 91539519,
				visualizeDOF = false,
				squeezeFactor = 1.019,
				sensorWidth = 124,
				recombineQuality = 0,
				openDof = false
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
					-992.181,
					115.445,
					337.592
				},
				rotationVInput = {
					346.73,
					82.292,
					0.065
				}
			},
			fields = {
				focalDistance = 172,
				fStop = 7.6,
				cameraId = 91421787,
				visualizeDOF = false,
				squeezeFactor = 1.019,
				sensorWidth = 124,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0,
				StopDof = 1
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
						nodeId = 102,
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
						nodeId = 104,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 97,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 96,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 103,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1544762423,
				lookAtEntityStaticIdVInput = -1242944624
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-993.131,
					116.326,
					337.85
				},
				rotationVInput = {
					2.372,
					99.499,
					0.062
				}
			},
			fields = {
				focalDistance = 331,
				fStop = 9.61,
				cameraId = 91539566,
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
						nodeId = 105,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 12,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-992.704,
					116.308,
					337.779
				},
				rotationVInput = {
					1.341,
					100.013,
					0.062
				}
			},
			fields = {
				focalDistance = 331,
				fStop = 9.61,
				cameraId = 91539569,
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
			kind = 28,
			inputs = {
				staticIdVInput = -1242944624
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1785376654,
				lookAtEntityStaticIdVInput = -1242944624
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -1785376654
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 172,
					portId = "BoneTransform"
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
			kind = 19,
			inputs = {
				staticIdVInput = -1351528860,
				speedVInput = 1.25,
				maxLimitTimeVInput = 15,
				targetEulerAngleVInput = {
					0,
					74.3,
					0
				},
				targetPositionVInput = {
					-991.19,
					115.152,
					336.877
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
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							value = 1,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 1,
							weightedMode = 0,
							value = 1,
							outWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Alert",
				staticIdVInput = -1785376654
			},
			fields = {
				processingTime = 5.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150020
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -1785376654
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1242944624,
				lookAtEntityStaticIdVInput = -1785376654
			},
			flowIn = {
				In = 0
			}
		},
		[114] = {
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5150018,
				positionVInput = {
					-984.18,
					115.37,
					341.28
				},
				rotationVInput = {
					0,
					235.72,
					0
				}
			},
			fields = {
				entityId = -1242944624,
				ignoreGravity = false
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
		[115] = {
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
						nodeId = 116,
						portId = "In"
					}
				}
			}
		},
		[116] = {
			kind = 19,
			inputs = {
				autoPathfindingVInput = true,
				staticIdVInput = -1242944624,
				speedVInput = 1.1,
				maxLimitTimeVInput = 15,
				targetEulerAngleVInput = {
					0,
					231.2,
					0
				},
				targetPositionVInput = {
					-989.06,
					115.51,
					337.902
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
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							value = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							value = 1,
							outWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		[117] = {
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5150020,
				positionVInput = {
					-984.56,
					115.51,
					342.33
				},
				rotationVInput = {
					0,
					236.76,
					0
				}
			},
			fields = {
				entityId = -1785376654,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 118,
						portId = "In"
					}
				}
			}
		},
		[118] = {
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
						nodeId = 119,
						portId = "In"
					}
				}
			}
		},
		[119] = {
			kind = 19,
			inputs = {
				staticIdVInput = -1785376654,
				speedVInput = 1.25,
				maxLimitTimeVInput = 15,
				targetEulerAngleVInput = {
					0,
					217.231,
					0
				},
				targetPositionVInput = {
					-990.298,
					115.52,
					338.324
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
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							value = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							value = 1,
							outWeight = 0
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
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		[120] = {
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5150021,
				positionVInput = {
					-985.2,
					115.152,
					339.83
				},
				rotationVInput = {
					0,
					247.08,
					0
				}
			},
			fields = {
				entityId = -1351528860,
				ignoreGravity = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 121,
						portId = "In"
					}
				}
			}
		},
		[121] = {
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
						nodeId = 122,
						portId = "In"
					}
				}
			}
		},
		[122] = {
			kind = 19,
			inputs = {
				staticIdVInput = -1351528860,
				speedVInput = 1.25,
				maxLimitTimeVInput = 15,
				targetEulerAngleVInput = {
					0,
					256.96,
					0
				},
				targetPositionVInput = {
					-991.19,
					115.152,
					336.877
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
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							value = 1,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 1,
							weightedMode = 0,
							value = 1,
							outWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		[123] = {
			kind = 3,
			inputs = {
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-982.223,
					117.048,
					344.722
				},
				rotationVInput = {
					358.78,
					231.915,
					0.062
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91213716,
				visualizeDOF = false,
				squeezeFactor = 1,
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
						nodeId = 124,
						portId = "In"
					}
				}
			}
		},
		[124] = {
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-986.086,
					117.153,
					341.695
				},
				rotationVInput = {
					358.78,
					231.915,
					0.062
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91213744,
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
		[125] = {
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
						nodeId = 126,
						portId = "In"
					}
				}
			}
		},
		[126] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					250.61,
					0
				},
				targetPositionVInput = {
					-983.6,
					115.17,
					339.61
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
						nodeId = 127,
						portId = "In"
					}
				}
			}
		},
		[127] = {
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
						nodeId = 128,
						portId = "In"
					}
				}
			}
		},
		[128] = {
			kind = 19,
			inputs = {
				autoPathfindingVInput = true,
				staticIdVInput = 2,
				speedVInput = 1.15,
				maxLimitTimeVInput = 15,
				targetEulerAngleVInput = {
					0,
					286.26,
					0
				},
				targetPositionVInput = {
					-989,
					115.41,
					337.13
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
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							value = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							value = 1,
							outWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		[129] = {
			kind = 50,
			inputs = {
				enableFillLightVInput = true,
				fillLightIntensityVInput = 14367
			},
			flowIn = {
				In = 0
			}
		},
		[172] = {
			kind = 17,
			inputs = {
				staticIdVInput = -1242944624
			},
			fields = {
				entityType = 2
			}
		},
		[173] = {
			kind = 17,
			inputs = {
				staticIdVInput = -1544762423
			},
			fields = {
				entityType = 2
			}
		},
		[174] = {
			kind = 17,
			fields = {
				entityType = 0
			}
		}
	}
}
