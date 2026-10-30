-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91526801.lua

return {
	startNodeId = 3,
	dialogueId = 91526801,
	schema = 1,
	nodes = {
		{
			kind = 6,
			fields = {
				retFlag = 1
			},
			flowIn = {
				End = 0
			}
		},
		{
			kind = 6,
			fields = {
				retFlag = 1
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
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideUIWhiteList = {
						[194] = true
					},
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
						nodeId = 113,
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
						nodeId = 6,
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
						nodeId = 7,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 111,
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
						nodeId = 8,
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
						nodeId = 9,
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
						nodeId = 10,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 107,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 108,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 110,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 5613101,
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
				npcStaticId = 91525699,
				npcId = 5220004,
				matchAudioDuration = true,
				duration = 8.62,
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
						nodeId = 11,
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
						nodeId = 12,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 5613102,
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
				duration = 4,
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
				portCount = 3
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
						nodeId = 105,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 5613103,
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
				npcStaticId = 91525699,
				npcId = 0,
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
						portId = "0"
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = true
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 16,
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
						nodeId = 17,
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
						nodeId = 18,
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
						nodeId = 19,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 101,
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
						nodeId = 103,
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
						nodeId = 20,
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
				["1"] = {
					{
						nodeId = 97,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 99,
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
						nodeId = 23,
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 92,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 93,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 95,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 96,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 5613104,
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
				npcId = 5220004,
				matchAudioDuration = true,
				duration = 9.25,
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
						nodeId = 91,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 5613105,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Righthand",
				skipTime = 0,
				npcStaticId = -1723382481,
				npcId = 5220004,
				matchAudioDuration = true,
				duration = 6.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					[1] = "Talk_Righthand",
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
						nodeId = 27,
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
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 10,
			inputs = {
				enablePlayerMoveVInput = false,
				enableEventVInput = false,
				enableCameraZoomVInput = false,
				showTopLogoVInput = false,
				showAllUIVInput = false,
				resumeNearbyMonsterAIVInput = false,
				endSkipVInput = true
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
						nodeId = 30,
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
						nodeId = 31,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 82,
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
						nodeId = 88,
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
						nodeId = 32,
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
						nodeId = 33,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = false
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 83,
			fields = {
				portCount = 3,
				observeId = 11,
				isFreeConfigCluePosition = false,
				cluePositions = {
					{
						0,
						0,
						0
					},
					{
						0,
						0,
						0
					},
					{
						0,
						0,
						0
					}
				}
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
						nodeId = 47,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 51,
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
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 5613108,
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
				duration = 5.75,
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
			kind = 12,
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
			kind = 48,
			flowIn = {
				In = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 33,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Attack01",
				staticIdVInput = -583556326
			},
			fields = {
				templateId = 5220001,
				processingTime = 1.7,
				playAniType = 1,
				isLooping = false,
				entityType = 2
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
						nodeId = 42,
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
			kind = 19,
			inputs = {
				staticIdVInput = -583556326,
				moveTypeVInput = 0,
				moveModeVInput = 1,
				faceMoveDirectionVInput = false,
				targetPositionVInput = {
					-123.998,
					36.022,
					279.524
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1
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
						nodeId = 43,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 2
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				staticIdVInput = -583556326
			},
			fields = {
				templateId = 5220001,
				processingTime = 4.917,
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
				playableStateVInput = "WalkBack",
				staticIdVInput = -583556326
			},
			fields = {
				templateId = 5220001,
				processingTime = 1.1,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
			},
			flowOut = {
				Finish = {
					{
						nodeId = 43,
						portId = "1"
					}
				},
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
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 45,
						portId = "Stop"
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
				},
				["1"] = {
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
				dialogueIdVInput = 5613109,
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
				npcId = 5220004,
				matchAudioDuration = true,
				duration = 4.62,
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
						nodeId = 49,
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Skill_EnergyArray",
				staticIdVInput = -871813240
			},
			fields = {
				templateId = 5220002,
				processingTime = 2.7,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = true,
					showHud = true,
					blockCameraZoom = true,
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
						nodeId = 79,
						portId = "In"
					}
				},
				Out = {
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
				dialogueIdVInput = 5613110,
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
				npcId = 5220004,
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
						nodeId = 53,
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
						nodeId = 54,
						portId = "In"
					}
				},
				["1"] = {
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
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 5613111,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 5,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 0
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
				portCount = 4
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
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 5613112,
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
				npcId = 5220004,
				matchAudioDuration = true,
				duration = 4,
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
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Anger01_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = -1723382481
			},
			fields = {
				playAniType = 1,
				templateId = 5220004,
				processingTime = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Emotion_Anger01_Start",
					"Emotion_Anger01_Loop",
					"Emotion_Anger01_End"
				}
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
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 57,
			valueIn = {
				petEntIdVInput = {
					nodeId = 123,
					portId = "EntityID"
				},
				playerEntIdVInput = {
					nodeId = 122,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 62,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -789359525
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 88,
					portId = "EntityID"
				}
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = -789359525
			},
			fields = {
				playAniType = 1,
				templateId = 5220005,
				processingTime = 1.5,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Emotion_Confused_Start",
					"",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				staticIdVInput = -789359525,
				targetEulerAngleVInput = {
					0,
					59.773,
					0
				},
				targetPositionVInput = {
					-109.19,
					35.974,
					285.44
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1
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
						nodeId = 65,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 2
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
			kind = 19,
			inputs = {
				staticIdVInput = -1723382481,
				targetEulerAngleVInput = {
					0,
					251.209,
					0
				},
				targetPositionVInput = {
					-107.95,
					36.025,
					286.34
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 57,
			valueIn = {
				petEntIdVInput = {
					nodeId = 125,
					portId = "EntityID"
				},
				playerEntIdVInput = {
					nodeId = 124,
					portId = "EntityID"
				}
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
				},
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
				staticIdVInput = -2072212632
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -2072212632,
				targetEulerAngleVInput = {
					0,
					221.914,
					0
				},
				targetPositionVInput = {
					-125.549,
					36.022,
					281.096
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 89,
					portId = "EntityID"
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
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Helpless",
				staticIdVInput = -2072212632
			},
			fields = {
				templateId = 5220006,
				processingTime = 3.233,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -2072212632,
				targetEulerAngleVInput = {
					0,
					97.304,
					0
				},
				targetPositionVInput = {
					-109.77,
					35.974,
					286.64
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1
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
						nodeId = 65,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 7
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
			kind = 22,
			inputs = {
				blendVInput = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 74,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 2,
						portId = "End"
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
					250.66,
					0
				},
				targetPositionVInput = {
					-108.073,
					36.025,
					287.536
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
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1723382481,
				targetEulerAngleVInput = {
					0,
					38.445,
					0
				},
				targetPositionVInput = {
					-125.764,
					36.022,
					279.103
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
						nodeId = 78,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAngleVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-121.5,
					37.936,
					283.156
				},
				rotationVInput = {
					11.892,
					225.86,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91532516,
				visualizeDOF = false
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
				DirectOut = {
					{
						nodeId = 80,
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
					250.66,
					0
				},
				targetPositionVInput = {
					-108.073,
					36.025,
					287.536
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
						nodeId = 1,
						portId = "End"
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
					-120.676,
					38.691,
					284.159
				},
				rotationVInput = {
					17.392,
					225.921,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91531831,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 66,
			inputs = {
				resetOnFinishVInput = true
			},
			fields = {
				staticIdList = {
					[1] = 91292265,
					[2] = 91292333
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
					-120.676,
					38.691,
					284.159
				},
				rotationVInput = {
					17.392,
					225.921,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91531777,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5220001,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-123.822,
					36.022,
					279.525
				},
				rotationVInput = {
					0,
					320.109,
					0
				}
			},
			fields = {
				entityId = -583556326,
				ignoreGravity = false
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
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5220002,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-125.549,
					36.022,
					281.096
				},
				rotationVInput = {
					0,
					132.555,
					0
				}
			},
			fields = {
				entityId = -871813240,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		[87] = {
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 84,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 5220001,
				processingTime = 4.917,
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
				defaultHideVInput = true,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5220005,
				positionVInput = {
					-123.858,
					36.022,
					279.504
				},
				rotationVInput = {
					0,
					234.018,
					0
				}
			},
			fields = {
				entityId = -789359525,
				ignoreGravity = false
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
		[89] = {
			kind = 16,
			inputs = {
				defaultHideVInput = true,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5220006,
				positionVInput = {
					-125.549,
					36.022,
					281.096
				},
				rotationVInput = {
					0,
					221.914,
					0
				}
			},
			fields = {
				entityId = -2072212632,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		[91] = {
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					245.51,
					0
				},
				targetPositionVInput = {
					-100.152,
					37.152,
					290.402
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
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		[92] = {
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Dialogue_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = -1723382481
			},
			fields = {
				playAniType = 1,
				templateId = 5220004,
				processingTime = 2.6,
				isLooping = false,
				entityType = 2,
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
		[93] = {
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementTimeVInput = 10,
				cameraMovementTypeVInput = 2,
				cameraMovementAngleVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					-100.028,
					37.152,
					289.776
				},
				positionVInput = {
					-104.581,
					39.452,
					290.433
				},
				rotationVInput = {
					18.238,
					95.415,
					2
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 238,
				fStop = 12,
				cameraId = 91531249,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 94,
						portId = "StopDof"
					}
				}
			}
		},
		[94] = {
			kind = 3,
			inputs = {
				fovVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-102.285,
					38.43,
					288.705
				},
				rotationVInput = {
					3.64,
					71.38,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 244,
				fStop = 12,
				cameraId = 91531064,
				visualizeDOF = false
			},
			flowIn = {
				In = 0,
				StopDof = 1
			}
		},
		[95] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					71.099,
					0
				},
				targetPositionVInput = {
					-100.824,
					37.152,
					289.527
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
		[96] = {
			kind = 15,
			inputs = {
				staticIdVInput = 91525704,
				lookAtEntityStaticIdVInput = -1723382481
			},
			flowIn = {
				In = 0
			}
		},
		[97] = {
			kind = 27,
			fields = {
				uid = 306,
				param = {
					style = 0,
					title = "CHARACTER_APPEARANCE_DESC_Lei",
					name = "CHARACTER_APPEARANCE_NAME_Lei",
					pos = {
						900,
						-200,
						0
					}
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
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
		[98] = {
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
						nodeId = 97,
						portId = "closeUIFInput"
					}
				}
			}
		},
		[99] = {
			kind = 5,
			inputs = {
				playableStateVInput = "Story_FoldArms_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = -1723382481
			},
			fields = {
				playAniType = 1,
				templateId = 5220004,
				processingTime = 2.167,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_FoldArms_Start",
					"Story_FoldArms_Loop",
					"Story_FoldArms_End"
				}
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
		[100] = {
			kind = 5,
			inputs = {
				playableStateVInput = "Story_FoldArms_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91525704
			},
			fields = {
				playAniType = 1,
				templateId = 5220003,
				processingTime = 2.167,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_FoldArms_Start",
					"Story_FoldArms_Loop",
					"Story_FoldArms_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		[101] = {
			kind = 16,
			inputs = {
				slotParamVInput = 5220004,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-100.028,
					37.152,
					289.776
				},
				rotationVInput = {
					0,
					245.51,
					0
				}
			},
			fields = {
				entityId = -1723382481,
				ignoreGravity = false
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
		[102] = {
			kind = 20,
			inputs = {
				isResetValueInput = true,
				durationVInput = 0.1,
				staticIdVInput = 91525699
			},
			flowIn = {
				In = 0
			}
		},
		[103] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					112.055,
					0
				},
				targetPositionVInput = {
					-104.381,
					37.15,
					290.994
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
		[104] = {
			kind = 5,
			inputs = {
				playableStateVInput = "Lying_End",
				staticIdVInput = 91525699,
				defaultTransStateVInput = "Idle"
			},
			fields = {
				templateId = 5220004,
				processingTime = 2.933,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		[105] = {
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
						nodeId = 15,
						portId = "1"
					}
				}
			}
		},
		[106] = {
			kind = 15,
			inputs = {
				staticIdVInput = 91525704,
				lookAtEntityStaticIdVInput = 91525699
			},
			flowIn = {
				In = 0
			}
		},
		[107] = {
			kind = 3,
			inputs = {
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-102.071,
					39.257,
					291.214
				},
				rotationVInput = {
					28.667,
					109.43,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91531020,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		[108] = {
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 3,
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					71.099,
					0
				},
				targetPositionVInput = {
					-100.77,
					37.208,
					290.094
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
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1
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
						nodeId = 109,
						portId = "In"
					}
				}
			}
		},
		[109] = {
			kind = 19,
			inputs = {
				targetEulerAngleVInput = {
					0,
					71.099,
					0
				},
				targetPositionVInput = {
					-101.432,
					37.208,
					290.174
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 121,
					portId = "EntityID"
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
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		[110] = {
			kind = 15,
			inputs = {
				staticIdVInput = 91525704,
				lookAtEntityStaticIdVInput = 91525699
			},
			flowIn = {
				In = 0
			}
		},
		[111] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					71.099,
					0
				},
				targetPositionVInput = {
					-102.58,
					37.208,
					289.573
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
						nodeId = 112,
						portId = "In"
					}
				}
			}
		},
		[112] = {
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					75.072,
					0
				},
				targetPositionVInput = {
					-103.414,
					37.208,
					289.774
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 121,
					portId = "EntityID"
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
		[113] = {
			kind = 16,
			inputs = {
				slotParamVInput = 5220004,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-100.028,
					37.152,
					289.776
				},
				rotationVInput = {
					0,
					245.51,
					0
				}
			},
			fields = {
				entityId = -1723382481,
				ignoreGravity = false
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
		[114] = {
			kind = 20,
			inputs = {
				isResetValueInput = true,
				durationVInput = 0.1,
				staticIdVInput = 91525699
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
		[115] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					71.099,
					0
				},
				targetPositionVInput = {
					-100.824,
					37.152,
					289.527
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
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		[121] = {
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		[122] = {
			kind = 9,
			inputs = {
				staticIdVInput = -583556326
			},
			fields = {
				entityType = 2
			}
		},
		[123] = {
			kind = 9,
			inputs = {
				staticIdVInput = -789359525
			},
			fields = {
				entityType = 2
			}
		},
		[124] = {
			kind = 9,
			inputs = {
				staticIdVInput = -871813240
			},
			fields = {
				entityType = 2
			}
		},
		[125] = {
			kind = 9,
			inputs = {
				staticIdVInput = -2072212632
			},
			fields = {
				entityType = 2
			}
		}
	}
}
