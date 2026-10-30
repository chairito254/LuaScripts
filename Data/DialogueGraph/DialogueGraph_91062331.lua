-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91062331.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 91062331,
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
						portId = "In",
						nodeId = 3
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
						portId = "In",
						nodeId = 4
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
						portId = "In",
						nodeId = 5
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 99
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
						portId = "In",
						nodeId = 6
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
						portId = "In",
						nodeId = 7
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
						battleRoom = true,
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
						portId = "End",
						nodeId = 1
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 8
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
						portId = "In",
						nodeId = 9
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 92
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 93
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 95
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 94
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 97
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 98
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
					350.108,
					0
				},
				targetPositionVInput = {
					298.661,
					154.889,
					936.04
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
						portId = "In",
						nodeId = 10
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
						portId = "In",
						nodeId = 11
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
						portId = "In",
						nodeId = 12
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518160,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
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
						portId = "In",
						nodeId = 13
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
						portId = "In",
						nodeId = 14
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 90
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518161,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 15
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
						portId = "In",
						nodeId = 16
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 86
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 87
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 89
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
						portId = "In",
						nodeId = 85
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518162,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 18
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
						portId = "In",
						nodeId = 19
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 82
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 83
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518164,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 20
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
						portId = "In",
						nodeId = 21
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 69
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518165,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
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
						portId = "In",
						nodeId = 22
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
						portId = "In",
						nodeId = 23
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 79
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 81
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518166,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 24
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
						portId = "In",
						nodeId = 25
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 78
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 80
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 79
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518167,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 26
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
						portId = "In",
						nodeId = 27
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 77
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518168,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 28
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
						portId = "In",
						nodeId = 29
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 73
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 74
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 76
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 77
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518169,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 30
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
						portId = "In",
						nodeId = 31
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 66
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518170,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3.88,
				disableCamera = false,
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
						portId = "In",
						nodeId = 32
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
						portId = "In",
						nodeId = 33
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 67
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 69
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518171,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 11,
				disableCamera = false,
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
						portId = "In",
						nodeId = 34
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
						portId = "In",
						nodeId = 35
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 66
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518172,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
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
						portId = "In",
						nodeId = 36
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
						portId = "In",
						nodeId = 37
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 63
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 62
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518173,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 2,
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
						portId = "In",
						nodeId = 38
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
						portId = "In",
						nodeId = 39
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518174,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 40
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
						portId = "In",
						nodeId = 41
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 61
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 62
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518175,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 42
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
						portId = "In",
						nodeId = 43
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 60
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518176,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 44
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
						portId = "In",
						nodeId = 45
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518177,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 46
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
						portId = "In",
						nodeId = 47
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 56
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 57
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518178,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
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
						portId = "In",
						nodeId = 48
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
						portId = "In",
						nodeId = 49
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 55
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518179,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 91061323,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 50
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
						portId = "In",
						nodeId = 51
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
						portId = "In",
						nodeId = 52
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
						portId = "In",
						nodeId = 53
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
						portId = "In",
						nodeId = 54
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
			},
			flowOut = {
				DirectOut = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91061323,
				playableStateVInput = "TalkCasual",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				aniStateList = {
					"TalkCasual",
					"TalkCasual",
					"TalkCasual"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Daily_Accept_Invite_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 1.733,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				aniStateList = {
					"Daily_Accept_Invite_Start",
					"Daily_Accept_Invite_End",
					"Idle"
				}
			},
			flowIn = {
				In = 0
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
					301.12,
					159.909,
					941.857
				},
				rotationVInput = {
					35.835,
					209.02,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 557,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 800,
				fStop = 8.49,
				cameraId = 91137755
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 58
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
					301.62,
					160.622,
					942.753
				},
				rotationVInput = {
					35.796,
					208.962,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 557,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 800,
				fStop = 8.49,
				cameraId = 91103738
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91061323,
				playableStateVInput = "Story_GiveSmile_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				aniStateList = {
					"Story_GiveSmile_Start",
					"Story_GiveSmile_Loop",
					"Story_GiveSmile_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Emotion_Nod",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 1.733,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				aniStateList = {
					"Emotion_Nod",
					"Emotion_Nod",
					"Emotion_Nod"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Normal",
				staticIdVInput = 91061323
			},
			fields = {
				processingTime = 0.833,
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
				playableStateVInput = "Hit_L",
				staticIdVInput = 91061323
			},
			fields = {
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401
			},
			flowIn = {
				Stop = 1,
				In = 0
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
					301.841,
					155.533,
					933.618
				},
				rotationVInput = {
					356.473,
					313.183,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 194,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 228,
				fStop = 16.24,
				cameraId = 91103711
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 64
					}
				}
			}
		},
		{
			kind = 56,
			fields = {
				shakeType = 1,
				cameraShakeItem = {
					flags = 0,
					shakeRadius = -1,
					decayTime = 1,
					sustainTime = 0.1,
					attackTime = 0.2,
					holdForever = false,
					playSpace = 0,
					shakeType = 1,
					shakeFrequency = 6,
					shakeDissipation = 28,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								time = 0,
								value = 1
							},
							{
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								time = 1,
								value = 1
							}
						}
					},
					shakePos = {
						0,
						0,
						0
					},
					noisePosAmplitudes = {
						0,
						0,
						0
					},
					noiseRotAmplitudes = {
						0.5,
						0.5,
						0.5
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								time = 0,
								value = 1
							},
							{
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								time = 1,
								value = 1
							}
						}
					},
					noisePosSeeds = {
						0,
						0,
						0
					},
					noiseRotSeeds = {
						0,
						0,
						0
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
				staticIdVInput = 91061325,
				animationLayerVInput = 4,
				playableStateVInput = "Behav_AlertEnd"
			},
			fields = {
				processingTime = 2.917,
				playAniType = 1,
				isLooping = false,
				entityType = 1,
				templateId = 1032400
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Lefthand",
				staticIdVInput = 91061323
			},
			fields = {
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401
			},
			flowIn = {
				Stop = 1,
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
					297.01,
					166.669,
					935.641
				},
				rotationVInput = {
					341.522,
					26.771,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 250,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 300,
				fStop = 16,
				cameraId = 91103331
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					289.471,
					178.555,
					922.471
				},
				rotationVInput = {
					333.959,
					26.084,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 250,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 300,
				fStop = 16,
				cameraId = 91103338
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91061325,
				playableStateVInput = "EnvBehav_Dance_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 3.833,
				playAniType = 1,
				isLooping = false,
				entityType = 1,
				templateId = 1032400,
				aniStateList = {
					"EnvBehav_Dance_Start",
					"EnvBehav_Dance_Loop",
					"EnvBehav_Dance_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "Play",
						nodeId = 70
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Emotion_Parmon_10324_Love"
			},
			fields = {
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0,
				enableFadeOut = false
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91061325
			},
			flowIn = {
				In = 0
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
					302.804,
					155.599,
					934.771
				},
				rotationVInput = {
					358.367,
					297.046,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 417,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 534,
				fStop = 7.57,
				cameraId = 91103396
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Lefthand",
				staticIdVInput = 2
			},
			fields = {
				processingTime = 1.733,
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
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					299.195,
					156.176,
					937.229
				},
				rotationVInput = {
					3.032,
					209.18,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 194,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 117,
				fStop = 16.24,
				cameraId = 91101798
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 75
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
					299.195,
					156.176,
					937.229
				},
				rotationVInput = {
					5.094,
					209.009,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 194,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 117,
				fStop = 16.24,
				cameraId = 91103667
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91061323,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91061323,
				playableStateVInput = "Emotion_Firm_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 1.733,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
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
				playableStateVInput = "Talk_Righthand",
				staticIdVInput = 91061323
			},
			fields = {
				processingTime = 3.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 91061323
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91061325,
				staticIdVInput = 91061323
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91061323,
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 3.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 401,
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
			kind = 3,
			inputs = {
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					300.082,
					156.005,
					936.334
				},
				rotationVInput = {
					359.227,
					301,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 216,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 200,
				fStop = 17.68,
				cameraId = 91103172
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 84
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 26,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					300.082,
					156.005,
					936.334
				},
				rotationVInput = {
					359.055,
					299.453,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 216,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 200,
				fStop = 17.68,
				cameraId = 91103180
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6518163,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
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
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy",
				staticIdVInput = -732648942
			},
			fields = {
				processingTime = 3.667,
				playAniType = 1,
				isLooping = false,
				entityType = 1,
				templateId = 1037100
			},
			flowIn = {
				In = 0
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
					299.984,
					157.41,
					940.164
				},
				rotationVInput = {
					24.333,
					202.6,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 183,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 300,
				fStop = 6.9,
				cameraId = 91103097
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 88
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
					300.067,
					157.45,
					940.242
				},
				rotationVInput = {
					23.99,
					201.913,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 183,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 300,
				fStop = 6.9,
				cameraId = 91103070
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Nod",
				staticIdVInput = 2
			},
			fields = {
				processingTime = 1.733,
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
				playableStateVInput = "Behav_Love",
				staticIdVInput = 91061325
			},
			fields = {
				processingTime = 5.75,
				playAniType = 1,
				isLooping = false,
				entityType = 1,
				templateId = 1032400
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Introduce",
				staticIdVInput = 91061323
			},
			fields = {
				processingTime = 3.833,
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 200001,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					299.328,
					154.869,
					936.33
				},
				rotationVInput = {
					0,
					309.711,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -732648942
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 91061323
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					300.547,
					155.75,
					934.904
				},
				rotationVInput = {
					357.164,
					312,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 216,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 200,
				fStop = 17.68,
				cameraId = 91101670
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 26,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					300.962,
					155.848,
					934.527
				},
				rotationVInput = {
					359.398,
					313.204,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 216,
				recombineQuality = 0,
				openDof = true,
				visualizeDOF = false,
				focalDistance = 200,
				fStop = 17.68,
				cameraId = 91102991
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 50,
			inputs = {
				fillLightIntensityVInput = 8000,
				enableFillLightVInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91061325,
				targetEulerAngleVInput = {
					0,
					140,
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
			kind = 14,
			inputs = {
				staticIdVInput = 91061323,
				targetEulerAngleVInput = {
					0,
					169.714,
					0
				},
				targetPositionVInput = {
					298.67,
					154.865,
					937.5
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
		}
	}
}
