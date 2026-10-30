-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91459597.lua

return {
	dialogueId = 91459597,
	schema = 1,
	startNodeId = 1,
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
						portId = "In",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = true,
					toplogoComList = {
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
						alert = true,
						battleRoom = true,
						actionState = true,
						vlog = true,
						teamSpeech = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						portId = "In",
						nodeId = 48
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 3
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
						nodeId = 4
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 133
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 145
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 147
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 149
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
						portId = "In",
						nodeId = 5
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 140
				}
			},
			fields = {
				enableDefaultLookAt = true,
				cameraPreset = 2,
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 1,
				enableGroupLookAt = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				portCount = 5
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
						nodeId = 130
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 131
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 132
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 116
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304833,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2.75,
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
						nodeId = 10
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
						portId = "In",
						nodeId = 11
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 121
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 125
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 127
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 128
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 129
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304834,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150021,
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
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 9
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
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 121
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 115
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 122
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 123
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 124
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304835,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
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
						nodeId = 14
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
						portId = "In",
						nodeId = 15
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 113
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 115
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 116
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 117
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 119
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 120
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304836,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
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
						nodeId = 16
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
						nodeId = 17
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 113
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 104
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 114
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304837,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 11.75,
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
				portCount = 5
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
						nodeId = 112
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 111
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304838,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 6.12,
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
				portCount = 6
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
						portId = "Stop",
						nodeId = 104
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 106
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 103
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 105
					}
				},
				["5"] = {
					{
						portId = "Stop",
						nodeId = 111
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304839,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 9.5,
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
				portCount = 5
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
						nodeId = 98
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 100
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 102
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 103
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304840,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
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
						nodeId = 24
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
						nodeId = 25
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 98
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 92
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 99
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304841,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
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
						portId = "In",
						nodeId = 26
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 88
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304842
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 27
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
						nodeId = 28
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 84
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 79
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 86
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 87
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304844,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
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
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 9
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 77
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 79
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 80
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 81
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 82
					}
				},
				["7"] = {
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
				dialogueIdVInput = 3304846,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
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
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 9
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
						nodeId = 75
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304847,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 8,
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
						nodeId = 33
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
						nodeId = 34
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3304848,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
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
						portId = "In",
						nodeId = 35
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 69
					}
				},
				ShowFinOut = {
					{
						portId = "Stop",
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304849
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 5
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
						nodeId = 66
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304851,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 6.25,
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
						nodeId = 38
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
						nodeId = 39
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 64
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 67
					}
				},
				["3"] = {
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
				dialogueIdVInput = 3304853,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2.5,
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
				portCount = 5
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
						portId = "Stop",
						nodeId = 64
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 60
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
				dialogueIdVInput = 3304854,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
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
						nodeId = 42
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
						nodeId = 43
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 60
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 61
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 49
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
						portId = "In",
						nodeId = 44
					}
				}
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
						portId = "In",
						nodeId = 45
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
						portId = "In",
						nodeId = 46
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
						nodeId = 47
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
						portId = "In",
						nodeId = 48
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
						portId = "End",
						nodeId = 0
					}
				}
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
						portId = "In",
						nodeId = 50
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
						portId = "In",
						nodeId = 51
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 52
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 53
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 54
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 55
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 56
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 57
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 58
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -717386088,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1965571706,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1584966993,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -60322647,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91459525,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91459521,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91203642,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91459523,
				durationVInput = 0
			},
			flowIn = {
				In = 0
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
				staticIdVInput = -717386088,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
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
						portId = "In",
						nodeId = 62
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 63
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				staticIdVInput = -1965571706,
				speedVInput = 0.846,
				targetPositionVInput = {
					-900.1,
					378.253,
					-377.34
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
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							inWeight = 0,
							weightedMode = 0,
							time = 1,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
				moveTypeVInput = 2,
				staticIdVInput = -717386088,
				speedVInput = 0.846,
				targetPositionVInput = {
					-900.1,
					378.253,
					-377.34
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
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							inWeight = 0,
							weightedMode = 0,
							time = 1,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
				staticIdVInput = -2123230330,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Excited_Start"
			},
			fields = {
				templateId = 403,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
				entityType = 0,
				aniStateList = {
					"Emotion_Excited_Start",
					"Emotion_Excited_Loop",
					"Emotion_Excited_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -717386088,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
				entityType = 2,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
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
				staticIdVInput = -717386088,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
				entityType = 2,
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
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304850
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 70
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
						nodeId = 71
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
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304852,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 3.25,
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
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -717386088,
				playStartLoopEndVInput = true,
				playableStateVInput = "Disappoint_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
				entityType = 2,
				aniStateList = {
					"Disappoint_Start",
					"Disappoint_Loop",
					"Disappoint_End"
				}
			},
			flowIn = {
				Stop = 1,
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
					-892.774,
					379.443,
					-381.495
				},
				rotationVInput = {
					7.44,
					212.278,
					359.883
				}
			},
			fields = {
				fStop = 32,
				cameraId = 91549041,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 359
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 74
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-893.045,
					379.379,
					-381.924
				},
				rotationVInput = {
					7.268,
					212.279,
					359.883
				}
			},
			fields = {
				fStop = 32,
				cameraId = 91549042,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 359
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -717386088,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
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
		{
			kind = 15,
			inputs = {
				staticIdVInput = -2123230330,
				lookAtEntityStaticIdVInput = -717386088
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 49,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-949.901,
					443.034,
					-355.877
				},
				rotationVInput = {
					58.132,
					294.677,
					359.781
				}
			},
			fields = {
				fStop = 22.47,
				cameraId = 91548996,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 221
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 78
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 49,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-950.9,
					441.266,
					-355.419
				},
				rotationVInput = {
					58.132,
					294.677,
					359.781
				}
			},
			fields = {
				fStop = 22.47,
				cameraId = 91548998,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 221
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -717386088,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
				entityType = 2,
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
				staticIdVInput = -717386088,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Laugh_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
				entityType = 2,
				aniStateList = {
					"Emotion_Laugh_Start",
					"Emotion_Laugh_Loop",
					"Emotion_Laugh_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1584966993,
				lookAtEntityStaticIdVInput = -717386088
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -1584966993
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -2123230330,
				lookAtEntityStaticIdVInput = -1584966993
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 19,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-893.902,
					379.535,
					-382.777
				},
				rotationVInput = {
					4.16,
					205.6,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91549019,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 117,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 85
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 19,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-893.955,
					379.526,
					-382.889
				},
				rotationVInput = {
					4.16,
					205.6,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91549020,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 117,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2123230330,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				templateId = 403,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
				entityType = 0,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304843
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 89
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
						nodeId = 90
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 84
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
						portId = "In",
						nodeId = 86
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 87
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304845,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 6.12,
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
						nodeId = 29
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
						nodeId = 93
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 92
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 87
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -717386088,
				playableStateVInput = "Story_Crossarmtalk"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
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
						portId = "In",
						nodeId = 94
					}
				},
				True = {
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
				fovVInput = 19,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-894.105,
					379.426,
					-385.371
				},
				rotationVInput = {
					358.488,
					345.745,
					359.884
				}
			},
			fields = {
				fStop = 22.47,
				cameraId = 91548970,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 221
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 95
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 19,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-894.156,
					379.432,
					-385.172
				},
				rotationVInput = {
					358.488,
					345.745,
					359.884
				}
			},
			fields = {
				fStop = 22.47,
				cameraId = 91549015,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 221
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 19,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-894.105,
					379.413,
					-385.37
				},
				rotationVInput = {
					1.066,
					345.74,
					359.884
				}
			},
			fields = {
				fStop = 22.47,
				cameraId = 91572141,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 221
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 97
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 19,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-894.16,
					379.409,
					-385.156
				},
				rotationVInput = {
					0.894,
					346.256,
					359.884
				}
			},
			fields = {
				fStop = 22.47,
				cameraId = 91572144,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 112,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 221
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -717386088,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 19,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-893.902,
					379.535,
					-382.777
				},
				rotationVInput = {
					4.16,
					205.6,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91548951,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 117,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 101
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 19,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-893.955,
					379.526,
					-382.889
				},
				rotationVInput = {
					4.16,
					205.6,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91549010,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 117,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2123230330,
				playStartLoopEndVInput = true,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				templateId = 303,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
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
				staticIdVInput = -717386088,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = true,
				entityType = 2,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
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
						portId = "In",
						nodeId = 109
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 107
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
					-894.002,
					379.512,
					-385.396
				},
				rotationVInput = {
					5.829,
					340.585,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91572124,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 198,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 108
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-894.082,
					379.49,
					-385.158
				},
				rotationVInput = {
					5.313,
					341.273,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91572125,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 198,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
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
					-893.889,
					379.514,
					-385.342
				},
				rotationVInput = {
					3.822,
					335.855,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91548936,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 198,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 110
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-894.009,
					379.494,
					-385.076
				},
				rotationVInput = {
					4.165,
					337.401,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91548940,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 198,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -717386088,
				playableStateVInput = "Story_Talk"
			},
			fields = {
				templateId = 5150018,
				processingTime = 3.333,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -717386088,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1584966993,
				playableStateVInput = "EnvBehav_Sing"
			},
			fields = {
				templateId = 5150019,
				processingTime = 5,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2123230330,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Excited_Start"
			},
			fields = {
				templateId = 403,
				processingTime = 5,
				playAniType = 1,
				isLooping = true,
				entityType = 0,
				aniStateList = {
					"Emotion_Excited_Start",
					"Emotion_Excited_Loop",
					"Emotion_Excited_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
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
					-893.552,
					379.518,
					-382.627
				},
				rotationVInput = {
					6.4,
					215.7,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91548904,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 198,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 118
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-893.728,
					379.496,
					-382.896
				},
				rotationVInput = {
					6.572,
					216.387,
					359.884
				}
			},
			fields = {
				fStop = 24.06,
				cameraId = 91548920,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 198,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -2123230330,
				lookAtEntityStaticIdVInput = -717386088
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -60322647,
				playableStateVInput = "Behav_Love"
			},
			fields = {
				templateId = 5150021,
				processingTime = 5.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -2123230330,
				lookAtEntityStaticIdVInput = -1584966993
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -1584966993
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -60322647,
				lookAtEntityStaticIdVInput = -1584966993
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
					-892.774,
					379.443,
					-381.495
				},
				rotationVInput = {
					7.44,
					212.278,
					359.883
				}
			},
			fields = {
				fStop = 32,
				cameraId = 91459692,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 359
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 126
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-893.045,
					379.379,
					-381.924
				},
				rotationVInput = {
					7.268,
					212.279,
					359.883
				}
			},
			fields = {
				fStop = 32,
				cameraId = 91460246,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 359
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -2123230330,
				lookAtEntityStaticIdVInput = -60322647
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -60322647
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1584966993,
				lookAtEntityStaticIdVInput = -60322647
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-876.24,
					389.76,
					-408.805
				},
				rotationVInput = {
					9.4,
					304.913,
					359.881
				}
			},
			fields = {
				fStop = 32,
				cameraId = 91459691,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 387
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -2123230330,
				lookAtEntityStaticIdVInput = -717386088
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -717386088,
				lookAtEntityStaticIdVInput = -2123230330
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
						portId = "In",
						nodeId = 134
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
						portId = "In",
						nodeId = 139
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 135
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 136
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 137
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 138
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 141
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 142
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 143
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 144
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91203642,
				targetEulerAngleVInput = {
					0,
					330.571,
					0
				},
				targetPositionVInput = {
					-893.674,
					378.088,
					-384.652
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91459521,
				targetEulerAngleVInput = {
					0,
					59.823,
					0
				},
				targetPositionVInput = {
					-895.167,
					378.16,
					-383.851
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91459523,
				targetEulerAngleVInput = {
					0,
					299.178,
					0
				},
				targetPositionVInput = {
					-893.533,
					378.163,
					-383.876
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91459525,
				targetEulerAngleVInput = {
					0,
					8.831,
					0
				},
				targetPositionVInput = {
					-894.55,
					378.122,
					-384.388
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-894.387,
					378.18,
					-383.406
				},
				rotationVInput = {
					0,
					192.68,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -2123230330
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 151
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 152
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 153
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 154
				},
				["5EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 139
				}
			},
			fields = {
				portCount = 5
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5150021,
				positionVInput = {
					-893.674,
					378.088,
					-384.652
				},
				rotationVInput = {
					0,
					330.571,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -60322647
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5150020,
				positionVInput = {
					-895.167,
					378.16,
					-383.851
				},
				rotationVInput = {
					0,
					59.823,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1965571706
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5150019,
				positionVInput = {
					-893.533,
					378.163,
					-383.876
				},
				rotationVInput = {
					0,
					299.178,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1584966993
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5150018,
				positionVInput = {
					-894.55,
					378.122,
					-384.388
				},
				rotationVInput = {
					0,
					8.831,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -717386088
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
						portId = "In",
						nodeId = 146
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-876.24,
					391.831,
					-408.805
				},
				rotationVInput = {
					13.284,
					304.913,
					359.881
				}
			},
			fields = {
				fStop = 32,
				cameraId = 91459690,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 387
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
						portId = "In",
						nodeId = 148
					}
				}
			}
		},
		{
			kind = 50,
			inputs = {
				enableFillLightVInput = true,
				fillLightIntensityVInput = 8410
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
						portId = "In",
						nodeId = 150
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
					192.68,
					0
				},
				targetPositionVInput = {
					-894.387,
					378.18,
					-383.406
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = -60322647
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = -1965571706
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = -1584966993
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = -717386088
			},
			fields = {
				entityType = 2
			}
		}
	}
}
