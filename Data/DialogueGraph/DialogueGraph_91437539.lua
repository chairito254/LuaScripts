-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91437539.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91437539,
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
					blockCameraZoom = true,
					hideTopLogo = true,
					toplogoComList = {
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
						chat = false,
						callFriends = true,
						bubble = false,
						alert = true,
						battleRoom = true,
						actionState = true
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
						nodeId = 64
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
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 4
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 156
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 158
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
						nodeId = 5
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
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 161
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
						nodeId = 8
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
						nodeId = 9
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
						nodeId = 10
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
						nodeId = 11
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 155
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 153
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150020,
				dialogueIdVInput = 3304806,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 4.25
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
				portCount = 6
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
				["2"] = {
					{
						portId = "In",
						nodeId = 151
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 153
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 154
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150018,
				dialogueIdVInput = 3304807,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150020,
				matchAudioDuration = true,
				duration = 2
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
				portCount = 6
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
						nodeId = 152
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 151
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 146
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150018,
				dialogueIdVInput = 3304808,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 4.38
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
				portCount = 6
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
						portId = "In",
						nodeId = 148
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 142
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 146
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 147
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150020,
				dialogueIdVInput = 3304809,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 6
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
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 141
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304810
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 19
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
						nodeId = 20
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 138
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
						nodeId = 137
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 132
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150020,
				dialogueIdVInput = 3304811,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 3,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 8
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
						nodeId = 22
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 128
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 122
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 127
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150020,
				dialogueIdVInput = 3304812,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 6.62
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
						nodeId = 24
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 124
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 121
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 122
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 123
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304813,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.38
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
						nodeId = 26
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 119
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 117
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 121
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304814,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150021,
				matchAudioDuration = true,
				duration = 2
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
						nodeId = 28
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 118
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 116
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 117
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304815,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 7.38
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
				portCount = 6
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
						portId = "Stop",
						nodeId = 116
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 113
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304816,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 5.25
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
				portCount = 6
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
						portId = "Stop",
						nodeId = 113
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 112
					}
				},
				["3"] = {
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
				lookAtIdVInput = 5150019,
				dialogueIdVInput = 3304817,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 4.88
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
				portCount = 6
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
				["2"] = {
					{
						portId = "In",
						nodeId = 110
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 112
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150021,
				dialogueIdVInput = 3304818,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 10.38
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
						nodeId = 36
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 108
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 111
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 110
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304819,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150021,
				matchAudioDuration = true,
				duration = 2
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
						nodeId = 38
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 103
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 109
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 108
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304820,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 2
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
						nodeId = 101
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 102
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304821
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 6
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
						nodeId = 97
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 98
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 94
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150021,
				dialogueIdVInput = 3304823,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 6.62
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
				portCount = 6
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
						nodeId = 96
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 94
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 92
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 95
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304824,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150020,
				matchAudioDuration = true,
				duration = 2
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
				portCount = 6
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
						nodeId = 93
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 92
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304825,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 2.25
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
				portCount = 6
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 90
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 47
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 89
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Shrug_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91442949
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0.833,
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
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150019,
				dialogueIdVInput = 3304826,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 2.5
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
						nodeId = 50
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
						nodeId = 88
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304827,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 5.12
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
						nodeId = 52
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
						portId = "Stop",
						nodeId = 87
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150019,
				dialogueIdVInput = 3304828,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 6.12
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 53
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
						nodeId = 54
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 80
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 84
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 85
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304829,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150020,
				matchAudioDuration = true,
				duration = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 55
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
						nodeId = 56
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
						nodeId = 57
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
						nodeId = 77
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
						nodeId = 58
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
						nodeId = 59
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 68
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 69
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 70
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 71
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 74
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 72
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 73
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304830,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 9.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 60
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
						nodeId = 61
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 65
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 67
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
						nodeId = 62
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
						nodeId = 63
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
						nodeId = 64
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
						portId = "End",
						nodeId = 0
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
						nodeId = 66
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
			kind = 12,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.3,
				staticIdVInput = 91442949
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.3,
				staticIdVInput = 91442959
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.3,
				staticIdVInput = 91442966
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.3,
				staticIdVInput = 91442970
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				animationLayerVInput = 4,
				staticIdVInput = 2,
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 403,
				processingTime = 2.233,
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
			kind = 28,
			inputs = {
				staticIdVInput = 2
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
						nodeId = 75
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 76
					}
				}
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
					-1232.42,
					119.711,
					103.851
				},
				rotationVInput = {
					0.393,
					330.96,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 111,
				fStop = 17.12,
				cameraId = 91444893,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 104
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
					-1232.591,
					119.63,
					103.77
				},
				rotationVInput = {
					2.9,
					345.86,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 111,
				fStop = 17.12,
				cameraId = 91569591,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 104
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91442949,
				staticIdVInput = 2
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
						portId = "In",
						nodeId = 79
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91442949,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					192.16,
					0
				},
				targetPositionVInput = {
					-1240.59,
					120.368,
					82.03
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
							value = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0,
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
				playableStateVInput = "Behav_Happy",
				staticIdVInput = 91442959
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150020,
				processingTime = 5.25
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91442959,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					192.16,
					0
				},
				targetPositionVInput = {
					-1240.59,
					120.368,
					82.03
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
							value = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0,
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
			kind = 19,
			inputs = {
				staticIdVInput = 91442966,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					192.16,
					0
				},
				targetPositionVInput = {
					-1240.59,
					120.368,
					82.03
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
							value = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0,
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
			kind = 19,
			inputs = {
				staticIdVInput = 91442970,
				targetEulerAngleVInput = {
					0,
					192.16,
					0
				},
				targetPositionVInput = {
					-1240.59,
					120.368,
					82.03
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
							value = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0,
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
				playableStateVInput = "Disappoint_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91442949
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0.833,
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
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1229.812,
					119.368,
					105.565
				},
				rotationVInput = {
					2.112,
					237.111,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 14.71,
				cameraId = 91539717,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 236
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 86
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
					-1230.04,
					119.358,
					105.418
				},
				rotationVInput = {
					2.112,
					237.111,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 14.71,
				cameraId = 91539723,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 236
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy",
				staticIdVInput = 91442970
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 6.05
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Love",
				staticIdVInput = 91442966
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150021,
				processingTime = 5.5
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "EnvBehav_Sad",
				staticIdVInput = 91442970
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 5.3
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 34,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.91,
					119.5,
					100.389
				},
				rotationVInput = {
					7.097,
					358.641,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 14.71,
				cameraId = 91539712,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 236
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 18,
				fovVInput = 34,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.926,
					119.418,
					101.049
				},
				rotationVInput = {
					5.206,
					359.327,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 14.71,
				cameraId = 91539713,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 236
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Cry",
				staticIdVInput = 91442959
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150020,
				processingTime = 6
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1231.529,
					119.905,
					104.612
				},
				rotationVInput = {
					22.3,
					231.8,
					0.067
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91539707,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 92
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Shock",
				staticIdVInput = 91442949
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91442959
			},
			fields = {
				emojiName = "Cry",
				duration = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1231.529,
					119.905,
					104.612
				},
				rotationVInput = {
					23.77,
					228.541,
					0.067
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91539706,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 92
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think_Start",
				animationLayerVInput = 4,
				staticIdVInput = 2,
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 403,
				processingTime = 2.233,
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
						nodeId = 99
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 100
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.627,
					102.781
				},
				rotationVInput = {
					0.84,
					353.691,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91539701,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.6,
					102.781
				},
				rotationVInput = {
					1.8,
					352.96,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91569586,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304822
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 97
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 105
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 103
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 104
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Cry",
				staticIdVInput = 91442970
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 6
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91442959
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 165
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
						nodeId = 107
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.6,
					102.781
				},
				rotationVInput = {
					3.3,
					350.6,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91569562,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.627,
					102.781
				},
				rotationVInput = {
					0.84,
					350.2,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91539702,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Cry",
				staticIdVInput = 91442966
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150021,
				processingTime = 6.667
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1230.814,
					119.229,
					103.926
				},
				rotationVInput = {
					2.628,
					255.1,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 255,
				fStop = 11.7,
				cameraId = 91539698,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 183
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Lefthand",
				loopDurationVInput = 10,
				staticIdVInput = 91442949
			},
			fields = {
				playAniType = 1,
				isLooping = true,
				entityType = 2,
				templateId = 5150018,
				processingTime = 3.333
			},
			flowIn = {
				Stop = 1,
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
					-1230.814,
					119.229,
					103.926
				},
				rotationVInput = {
					2.628,
					259.113,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 255,
				fStop = 11.7,
				cameraId = 91539699,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 183
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
				staticIdVInput = 91442949
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
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
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				staticIdVInput = 91442970
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 4.65
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 34,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.91,
					119.5,
					100.389
				},
				rotationVInput = {
					7.097,
					358.641,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 14.71,
				cameraId = 91539696,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 236
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 115
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 34,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.926,
					119.418,
					101.049
				},
				rotationVInput = {
					5.206,
					359.327,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 14.71,
				cameraId = 91539697,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 236
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy",
				staticIdVInput = 91442970
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 6.05
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				staticIdVInput = 91442966
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150021,
				processingTime = 5.9
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1230.814,
					119.229,
					103.926
				},
				rotationVInput = {
					2.628,
					255.1,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 255,
				fStop = 11.7,
				cameraId = 91539694,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 183
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
					-1230.6,
					119.24,
					103.962
				},
				rotationVInput = {
					2.972,
					260.661,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 255,
				fStop = 11.7,
				cameraId = 91444620,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 183
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 120
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1230.814,
					119.229,
					103.926
				},
				rotationVInput = {
					2.628,
					259.113,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 255,
				fStop = 11.7,
				cameraId = 91539692,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 183
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				animationLayerVInput = 4,
				staticIdVInput = 2,
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 403,
				processingTime = 2.233,
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
				playableStateVInput = "Talk_Shrug_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91442949
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91442966,
				lookAtDurationVInput = 2,
				staticIdVInput = 2
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
						nodeId = 125
					}
				},
				True = {
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
				blendTimeVInput = 3,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.627,
					102.781
				},
				rotationVInput = {
					0.84,
					350.2,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91539685,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.6,
					102.781
				},
				rotationVInput = {
					1.8,
					349.32,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91569548,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				lookAtDurationVInput = 2,
				staticIdVInput = 91442949
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
						nodeId = 130
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 129
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.6,
					102.781
				},
				rotationVInput = {
					1.8,
					352.96,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91569546,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.627,
					102.781
				},
				rotationVInput = {
					0.84,
					350.2,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91569578,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Shock",
				staticIdVInput = 91442949
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0
			},
			flowIn = {
				Stop = 1,
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
						portId = "In",
						nodeId = 133
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
						nodeId = 134
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
						portId = "Stop",
						nodeId = 131
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1231.529,
					119.905,
					104.612
				},
				rotationVInput = {
					23.77,
					228.541,
					0.067
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91444548,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 92
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91442959
			},
			fields = {
				emojiName = "Angry",
				duration = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 136
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Angry",
				staticIdVInput = 91442959
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150020,
				processingTime = 5.083
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Shrug",
				staticIdVInput = 2
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 403,
				processingTime = 3.733
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
						nodeId = 139
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 140
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.627,
					102.781
				},
				rotationVInput = {
					0.84,
					353.691,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91539684,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.6,
					102.781
				},
				rotationVInput = {
					1.8,
					352.96,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91569545,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
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
						nodeId = 143
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 142
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91442949
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
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
						nodeId = 144
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 145
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.627,
					102.781
				},
				rotationVInput = {
					0.84,
					350.2,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91539683,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.6,
					102.781
				},
				rotationVInput = {
					1.8,
					349.32,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91569541,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "EnvBehav_Confused",
				staticIdVInput = 91442970
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 3.733
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91442949,
				staticIdVInput = 2
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
						nodeId = 150
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 149
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.6,
					102.781
				},
				rotationVInput = {
					1.8,
					352.96,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91443878,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.203,
					119.627,
					102.781
				},
				rotationVInput = {
					0.84,
					353.691,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 13.78,
				cameraId = 91569535,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 154
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Angry",
				staticIdVInput = 91442959
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150020,
				processingTime = 5.083
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 33,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1231.523,
					119.24,
					104.209
				},
				rotationVInput = {
					8.128,
					233.164,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 118,
				fStop = 13.78,
				cameraId = 91539673,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 140
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Laugh_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91442949,
				speedVInput = 1.5
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 0,
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
			kind = 3,
			inputs = {
				fovVInput = 33,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1231.523,
					119.24,
					104.209
				},
				rotationVInput = {
					10.706,
					225.26,
					0.061
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 118,
				fStop = 13.78,
				cameraId = 91443377,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 140
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 12,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1232.626,
					119.339,
					100.985
				},
				rotationVInput = {
					5.044,
					349.146,
					359.946
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 11.95,
				cameraId = 91539671,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 301
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
						nodeId = 157
					}
				}
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
					-1232.495,
					119.401,
					100.301
				},
				rotationVInput = {
					5.044,
					349.146,
					359.946
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 11.95,
				cameraId = 91443325,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 301
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
						portId = "In",
						nodeId = 159
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
					201.43,
					0
				},
				targetPositionVInput = {
					-1232.81,
					118.37,
					104.72
				}
			},
			fields = {
				setPosition = true,
				setRotation = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91442949
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 160
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 162
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 163
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 164
				}
			},
			fields = {
				portCount = 4
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91442970
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91442959
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91442966
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91442949
			},
			fields = {
				entityType = 2
			}
		}
	}
}
