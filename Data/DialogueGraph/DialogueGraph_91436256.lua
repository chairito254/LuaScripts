-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91436256.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91436256,
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
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 45,
			inputs = {
				timelineResIdVInput = "$P_TL_Water_P6_PourWater_Force.prefab"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				PreFinish = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				StartPlay = {
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
				portCount = 5
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
						nodeId = 6,
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
					228.714,
					0
				},
				targetPositionVInput = {
					57.486,
					305.538,
					-23.484
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
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
						nodeId = 12,
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
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5150019,
				positionVInput = {
					55.508,
					305.867,
					-24.396
				},
				rotationVInput = {
					0,
					231.263,
					0
				}
			},
			fields = {
				ignoreGravity = true,
				entityId = -795604810
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 114,
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
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5160006,
				positionVInput = {
					49.597,
					305.1,
					-29.632
				},
				rotationVInput = {
					0,
					21.088,
					0
				}
			},
			fields = {
				ignoreGravity = true,
				entityId = -1004914539
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 50,
			inputs = {
				fillLightIntensityVInput = 8059,
				enableFillLightVInput = true
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
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					hideMarkShare = true,
					hideInteractionSign = true,
					showHud = true,
					blockCameraZoom = true,
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
						nodeId = 13,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 14,
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
			kind = 22,
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
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
						nodeId = 109,
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
						nodeId = 17,
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
						nodeId = 18,
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
						nodeId = 19,
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
						nodeId = 105,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304717,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
				matchAudioDuration = true,
				duration = 6.12,
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
						nodeId = 20,
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
						nodeId = 21,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 106,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 102,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 104,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 105,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304718,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 6.5,
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 103,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 102,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "TalkCasual"
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 303,
				processingTime = 3.833,
				playAniType = 1
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304719,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.38,
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
						nodeId = 25,
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
						nodeId = 26,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 100,
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
						nodeId = 23,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304720,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304721,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304722,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304723,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
				matchAudioDuration = true,
				duration = 10.25,
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
						nodeId = 30,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 88,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 93,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304724
			},
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
						nodeId = 85,
						portId = "Stop"
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
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304726,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 33,
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
						nodeId = 34,
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
						nodeId = 81,
						portId = "Stop"
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
						nodeId = 82,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5160006,
				dialogueIdVInput = 3304730,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 2.62,
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
						nodeId = 35,
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
						nodeId = 36,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 78,
						portId = "Stop"
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
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304731,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
				matchAudioDuration = true,
				duration = 11.88,
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
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304732,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 33047321,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304733,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
				matchAudioDuration = true,
				duration = 5.75,
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
						nodeId = 40,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 74,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 77,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304734
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
						nodeId = 42,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304736,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304737,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304739,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
				matchAudioDuration = true,
				duration = 9.75,
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
						nodeId = 45,
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
						nodeId = 46,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304740,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
				matchAudioDuration = true,
				duration = 7,
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
						nodeId = 47,
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
						nodeId = 48,
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
						nodeId = 68,
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
						nodeId = 70,
						portId = "Stop"
					}
				},
				["5"] = {
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
				dialogueIdVInput = 3304741,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
				matchAudioDuration = true,
				duration = 10.38,
				disableCamera = false,
				chatType = 3,
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
						nodeId = 63,
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5160006,
				dialogueIdVInput = 3304742,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5150019,
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
						nodeId = 51,
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
						nodeId = 52,
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
				},
				["3"] = {
					{
						nodeId = 59,
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
						nodeId = 53,
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
						nodeId = 54,
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
						nodeId = 13,
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
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = -795604810
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
						nodeId = 58,
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
						nodeId = 60,
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
				staticIdVInput = -795604810,
				playableStateVInput = "Behav_Cry"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 6,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1004914539,
				staticIdVInput = -795604810
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
					54.887,
					306.599,
					-26.72
				},
				rotationVInput = {
					1.009,
					11.94,
					359.991
				}
			},
			fields = {
				openDof = true,
				focalDistance = 167,
				fStop = 29.07,
				cameraId = 91610898,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 101,
				recombineQuality = 0
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
			kind = 3,
			inputs = {
				blendTimeVInput = 9,
				fovVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					54.981,
					306.591,
					-26.276
				},
				rotationVInput = {
					1.009,
					11.94,
					359.991
				}
			},
			fields = {
				openDof = true,
				focalDistance = 167,
				fStop = 29.07,
				cameraId = 91610899,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 101,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1004914539,
				staticIdVInput = -795604810
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
					55.153,
					307.346,
					-27.288
				},
				rotationVInput = {
					350.406,
					246.764,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 415,
				fStop = 9.86,
				cameraId = 91541619,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 285,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					54.454,
					307.477,
					-27.588
				},
				rotationVInput = {
					350.235,
					246.764,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 415,
				fStop = 9.86,
				cameraId = 91541620,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 285,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
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
						nodeId = 69,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 5,
				staticIdVInput = -1004914539
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1004914539,
				speedVInput = 0.5,
				playableStateVInput = "EnvBehave_Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5150022,
				processingTime = 2,
				playAniType = 1
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 9999,
				playableStateVInput = "Behav_SleepStart",
				staticIdVInput = -1004914539,
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150022,
				processingTime = 10.167,
				playAniType = 1,
				aniStateList = {
					"Behav_SleepStart",
					"Behav_SleepLoop",
					"Behav_SleepEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					53,
					307.87,
					-28.624
				},
				rotationVInput = {
					348.344,
					257.25,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 360,
				fStop = 15.37,
				cameraId = 91576512,
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
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					52.507,
					308.025,
					-28.739
				},
				rotationVInput = {
					348.344,
					257.25,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 360,
				fStop = 15.37,
				cameraId = 91576513,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304735
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
						nodeId = 76,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304738,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1004914539,
				playableStateVInput = "IdleSpecial02"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150022,
				processingTime = 10.167,
				playAniType = 1
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -795604810,
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 10.167,
				playAniType = 1,
				aniStateList = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
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
				fovVInput = 17,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					60.037,
					306.568,
					-22.319
				},
				rotationVInput = {
					352.985,
					237.481,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 387,
				fStop = 31.25,
				cameraId = 91576435,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 138,
				recombineQuality = 0
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
				blendTimeVInput = 20,
				fovVInput = 17,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					59.305,
					306.675,
					-22.786
				},
				rotationVInput = {
					352.985,
					237.481,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 387,
				fStop = 31.25,
				cameraId = 91576436,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 138,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1004914539,
				playableStateVInput = "IdleSpecial02"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150022,
				processingTime = 10.167,
				playAniType = 1
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1004914539,
				staticIdVInput = -795604810
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					54.82,
					306.637,
					-27.144
				},
				rotationVInput = {
					1.868,
					10.909,
					359.991
				}
			},
			fields = {
				openDof = true,
				focalDistance = 167,
				fStop = 29.07,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 101,
				recombineQuality = 0
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
				blendTimeVInput = 9,
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					54.889,
					306.625,
					-26.783
				},
				rotationVInput = {
					1.868,
					10.909,
					359.991
				}
			},
			fields = {
				openDof = true,
				focalDistance = 167,
				fStop = 29.07,
				cameraId = 91579330,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 101,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				playableStateVInput = "Emotion_Think_Start",
				staticIdVInput = 2,
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 403,
				processingTime = 4,
				playAniType = 1,
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
				fovVInput = 17,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					60.037,
					306.568,
					-22.319
				},
				rotationVInput = {
					352.985,
					237.481,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 387,
				fStop = 31.25,
				cameraId = 91576432,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 138,
				recombineQuality = 0
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
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 17,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					59.305,
					306.675,
					-22.786
				},
				rotationVInput = {
					352.985,
					237.481,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 387,
				fStop = 31.25,
				cameraId = 91576433,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 138,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304725
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
						nodeId = 90,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 85,
						portId = "Stop"
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
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304727,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 91,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304728,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
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
						nodeId = 92,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304729,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160006,
				matchAudioDuration = true,
				duration = 8.88,
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
						nodeId = 33,
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
						nodeId = 85,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 95,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 94,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1004914539,
				speedVInput = 0.5,
				playableStateVInput = "EnvBehave_Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5150022,
				processingTime = 2,
				playAniType = 1
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
						nodeId = 96,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 98,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					57,
					306.773,
					-24.645
				},
				rotationVInput = {
					356.938,
					18.256,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 112,
				fStop = 15.37,
				cameraId = 91576386,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 150,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 97,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 9,
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					57.076,
					306.786,
					-24.416
				},
				rotationVInput = {
					355.735,
					18.772,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 112,
				fStop = 15.37,
				cameraId = 91576395,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 150,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					57.08,
					306.769,
					-24.752
				},
				rotationVInput = {
					1.407,
					16.29,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 112,
				fStop = 15.37,
				cameraId = 91576411,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 150,
				recombineQuality = 0
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
				blendTimeVInput = 9,
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					57.132,
					306.764,
					-24.558
				},
				rotationVInput = {
					1.407,
					16.29,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 112,
				fStop = 15.37,
				cameraId = 91576414,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 150,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					53,
					307.87,
					-28.624
				},
				rotationVInput = {
					348.344,
					257.25,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 360,
				fStop = 15.37,
				cameraId = 91576396,
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
						nodeId = 101,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					52.507,
					308.025,
					-28.739
				},
				rotationVInput = {
					348.344,
					257.25,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 360,
				fStop = 15.37,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -795604810,
				playableStateVInput = "Behav_Happy"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 6.05,
				playAniType = 1
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					54.164,
					306.773,
					-26.602
				},
				rotationVInput = {
					3.243,
					37.895,
					359.991
				}
			},
			fields = {
				openDof = true,
				focalDistance = 360,
				fStop = 19.3,
				cameraId = 91579298,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 123,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1004914539,
				staticIdVInput = -795604810
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1004914539,
				playableStateVInput = "Behav_Happy"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5160006,
				processingTime = 6.683,
				playAniType = 1
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					53.695,
					306.821,
					-27.298
				},
				rotationVInput = {
					3.243,
					33.941,
					359.991
				}
			},
			fields = {
				openDof = true,
				focalDistance = 360,
				fStop = 19.3,
				cameraId = 91579296,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 123,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 107,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 15,
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					54.164,
					306.773,
					-26.602
				},
				rotationVInput = {
					3.243,
					33.941,
					359.991
				}
			},
			fields = {
				openDof = true,
				focalDistance = 360,
				fStop = 19.3,
				cameraId = 91579297,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 123,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 15,
				fovVInput = 29,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					60.002,
					306.444,
					-22.928
				},
				rotationVInput = {
					350.579,
					242.467,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 581,
				fStop = 32,
				cameraId = 91572957,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 0.1,
				recombineQuality = 0
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
						nodeId = 110,
						portId = "In"
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
					60.478,
					306.355,
					-22.68
				},
				rotationVInput = {
					350.579,
					242.467,
					359.985
				}
			},
			fields = {
				openDof = true,
				focalDistance = 581,
				fStop = 32,
				cameraId = 91572953,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 0.1,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[113] = {
			kind = 9,
			inputs = {
				staticIdVInput = -1004914539
			},
			fields = {
				entityType = 2
			}
		},
		[114] = {
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					nodeId = 113,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 115,
					portId = "EntityID"
				}
			},
			fields = {
				portCount = 2
			}
		},
		[115] = {
			kind = 9,
			inputs = {
				staticIdVInput = -795604810
			},
			fields = {
				entityType = 2
			}
		}
	}
}
