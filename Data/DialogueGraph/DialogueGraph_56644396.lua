-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_56644396.lua

return {
	dialogueId = 56644396,
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
					applyStateConflict = true,
					hideUIWhiteList = {
						[121] = true
					},
					toplogoComList = {
						npc = true,
						multiPlayer = true,
						combat = true,
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
						petChat = true
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
						nodeId = 165
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
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 12
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 157
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 155
					}
				},
				["10"] = {
					{
						portId = "Play",
						nodeId = 151
					}
				},
				["11"] = {
					{
						portId = "In",
						nodeId = 164
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 5
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 152
					}
				},
				["4"] = {
					{
						portId = "Play",
						nodeId = 163
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 159
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 160
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 162
					}
				},
				["9"] = {
					{
						portId = "In",
						nodeId = 148
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
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707640,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91277991,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3
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
						nodeId = 8
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 150
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 151
					}
				}
			}
		},
		{
			kind = 71,
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
						nodeId = 9
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
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 45,
			inputs = {
				timelineResIdVInput = "$P_TL_Dojo_P1_GriffinAppear.prefab"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				PreFinish = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				Start = {
					{
						portId = "In",
						nodeId = 149
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
						nodeId = 12
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
						portId = "Stop",
						nodeId = 140
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 141
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 142
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 147
					}
				},
				["6"] = {
					{
						portId = "Stop",
						nodeId = 148
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707641,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.88,
				disableCamera = false,
				chatType = 3
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707642,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Confused_Start",
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 3.38,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End",
					{
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
						portId = "In",
						nodeId = 14
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
						nodeId = 15
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 136
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707643,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = 2,
				npcId = 0,
				matchAudioDuration = true,
				duration = 9.38,
				disableCamera = false,
				chatType = 3
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
				portCount = 2
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
						nodeId = 135
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707644,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Talk_Cheeksupport",
				portCount = 2,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 401052,
				matchAudioDuration = true,
				duration = 8.5,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "Talk_Cheeksupport",
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
						portId = "In",
						nodeId = 18
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 132
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707645
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
				portCount = 2
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
						nodeId = 131
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707647,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 6.5,
				disableCamera = false,
				chatType = 3
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
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 122
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 22
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 124
					}
				},
				["3"] = {
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
				dialogueIdVInput = 3707649,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 11.62,
				disableCamera = false,
				chatType = 3
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
				portCount = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 117
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 24
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 116
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 121
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707650,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 6.12,
				disableCamera = false,
				chatType = 3
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707670,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 3
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
						nodeId = 99
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707651,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3
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
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 94
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 29
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707653,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.25,
				disableCamera = false,
				chatType = 3
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
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 91
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 31
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 92
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707654,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Solemn_Start",
				portCount = 1,
				skipTime = 0,
				npcStaticId = -429437529,
				npcId = 410001,
				matchAudioDuration = true,
				duration = 7.25,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					"Emotion_Solemn_Start",
					"Emotion_Solemn_Loop",
					"Emotion_Solemn_End",
					{
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
						portId = "In",
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707655,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410001,
				matchAudioDuration = true,
				duration = 3.25,
				disableCamera = false,
				chatType = 3
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707656,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410001,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707660,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 6.88,
				disableCamera = false,
				chatType = 3
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
						nodeId = 82
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 84
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707661,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Talk_Lefthand",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 72574859,
				npcId = 401052,
				matchAudioDuration = true,
				duration = 4.62,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "Talk_Lefthand",
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
						portId = "In",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707662,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 72574859,
				npcId = 401052,
				matchAudioDuration = true,
				duration = 9.12,
				disableCamera = false,
				chatType = 3
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
						nodeId = 40
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
						nodeId = 41
					}
				},
				True = {
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
				dialogueIdVInput = 3707664,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Behav_HappyStart",
				portCount = 1,
				skipTime = 0,
				npcStaticId = -429437529,
				npcId = 410002,
				matchAudioDuration = true,
				duration = 4.62,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd",
					{
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
						nodeId = 76
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 78
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707665,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 7.12,
				disableCamera = false,
				chatType = 3
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
				portCount = 5
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
						nodeId = 74
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3707666,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 72574859,
				npcId = 401052,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707667,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 401052,
				matchAudioDuration = true,
				duration = 6.12,
				disableCamera = false,
				chatType = 3
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
						nodeId = 48
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 71
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 70
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 72
					}
				},
				["4"] = {
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
				dialogueIdVInput = 3707668,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91277991,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 6.25,
				disableCamera = false,
				chatType = 3
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
				portCount = 3
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
						nodeId = 69
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707669,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = 91277991,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3
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
			kind = 12,
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
			kind = 10,
			inputs = {
				enableEventVInput = false,
				enableCameraZoomVInput = false,
				showTopLogoVInput = false,
				showAllUIVInput = false,
				resumeNearbyMonsterAIVInput = false,
				endSkipVInput = true,
				enablePlayerMoveVInput = false
			},
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
						nodeId = 58
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 54
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 56
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 67
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 68
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
						nodeId = 55
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Daily_Overlook_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 2.067,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 3,
				aniStateList = {
					"Daily_Overlook_Start",
					"Daily_Overlook_Loop",
					"Daily_Overlook_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1562.304,
					91.607,
					802.185
				},
				rotationVInput = {
					9.438,
					71.829,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 4,
				cameraId = 78998071,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 57
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 15
			},
			flowIn = {
				In = 0
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
						nodeId = 66
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
			kind = 57,
			valueIn = {
				petEntIdVInput = {
					portId = "EntityID",
					nodeId = 195
				},
				playerEntIdVInput = {
					portId = "EntityID",
					nodeId = 194
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 60
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
						portId = "In",
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 88261159,
				targetEulerAngleVInput = {
					0,
					65.2,
					0
				},
				targetPositionVInput = {
					-1559.828,
					90.088,
					801.953
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
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
						nodeId = 63
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
						portId = "In",
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91277991
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 38,
			inputs = {
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					75,
					0
				},
				targetPositionVInput = {
					-1558.449,
					90.04,
					802.3
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 200
				}
			},
			fields = {
				finishToSteer = true
			},
			flowIn = {
				In = 0
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91277991,
				playableStateVInput = "Link"
			},
			fields = {
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400100
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 49,
			valueIn = {
				effectIdVInput = {
					portId = "EffectID",
					nodeId = 162
				},
				generatorIdVInput = {
					portId = "GeneratorID",
					nodeId = 162
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 27,
			fields = {
				uid = 121,
				param = {
					3707004,
					0,
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
					},
					true,
					true,
					0
				}
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
					-1544.911,
					82.223,
					806.179
				},
				rotationVInput = {
					10.847,
					91.109,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 4,
				cameraId = 78998075,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Joy_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91277991
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400100,
				aniStateList = {
					"Emotion_Joy_Start",
					"",
					"Emotion_Joy_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					81.83,
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
			kind = 50,
			inputs = {
				fillLightIntensityVInput = 5000,
				enableFillLightVInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -429437529,
				targetEulerAngleVInput = {
					0,
					106.282,
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
					-1558.144,
					91.211,
					803.912
				},
				rotationVInput = {
					355.548,
					71.685,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 32,
				cameraId = 91087702,
				sensorWidth = 0.1,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1758,
				visualizeDOF = false
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
				},
				Out = {
					{
						portId = "StopDof",
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1549.558,
					100.212,
					805.422
				},
				rotationVInput = {
					356.064,
					72.201,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 4,
				cameraId = 91087710,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				visualizeDOF = false
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
					-1559.764,
					91.203,
					802.429
				},
				rotationVInput = {
					1.565,
					59.653,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 21,
				cameraId = 91132602,
				sensorWidth = 196,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				visualizeDOF = false
			},
			flowIn = {
				StopDof = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				animationLayerVInput = 4,
				playableStateVInput = "TalkUpper_PointTo01_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 72574859
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 401052,
				aniStateList = {
					"TalkUpper_PointTo01_Start",
					"TalkUpper_PointTo01_Loop",
					"TalkUpper_PointTo01_End"
				}
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
						portId = "In",
						nodeId = 79
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 80
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1559.795,
					91.536,
					803.259
				},
				rotationVInput = {
					9.727,
					92.128,
					0.407
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 45,
				spotLightInnerAngle = 0,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 30000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.971579
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1557.537,
					91.635,
					802.239
				},
				rotationVInput = {
					23.868,
					319.36,
					352.066
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 40,
				spotLightInnerAngle = 40,
				radius = 1.81,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 100000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.9956264
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707663,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Behav_HappyStart",
				portCount = 1,
				skipTime = 0,
				npcStaticId = -429437529,
				npcId = 410001,
				matchAudioDuration = true,
				duration = 8.62,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd",
					{
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
						portId = "In",
						nodeId = 42
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
					-1561.483,
					91.844,
					802.5
				},
				rotationVInput = {
					20.691,
					62.545,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 12.99,
				cameraId = 91086494,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 220,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 83
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1561.453,
					91.75,
					802.666
				},
				rotationVInput = {
					13.987,
					67.701,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 16,
				cameraId = 91086501,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 72574859,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 85
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Squat_End",
				loopDurationVInput = 999,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 301
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
			kind = 26,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 220
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
						portId = "In",
						nodeId = 87
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Idle",
				loopDurationVInput = 999,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 3,
				playAniType = 1,
				isLooping = true,
				entityType = 0,
				templateId = 301
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -429437529,
				targetEulerAngleVInput = {
					0,
					177.144,
					0
				},
				targetPositionVInput = {
					-1558.029,
					89.979,
					804.108
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 72574859,
				staticIdVInput = -429437529
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 90
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -429437529
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 220
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Solemn_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = -429437529
			},
			fields = {
				processingTime = 1.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 410001,
				aniStateList = {
					"Emotion_Solemn_Start",
					"Emotion_Solemn_Loop",
					"Emotion_Solemn_End"
				}
			},
			flowIn = {
				In = 0
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
					-1558.975,
					90.886,
					802.658
				},
				rotationVInput = {
					15.384,
					38.752,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 12,
				cameraId = 91335030,
				sensorWidth = 99,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 464,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 93
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1559.067,
					90.869,
					802.835
				},
				rotationVInput = {
					13.494,
					44.768,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 6,
				cameraId = 91335028,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
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
					-1555.081,
					91.454,
					802.38
				},
				rotationVInput = {
					10.228,
					281.868,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 12,
				cameraId = 91086405,
				sensorWidth = 99,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 464,
				visualizeDOF = false
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
				fovVInput = 38,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1555.346,
					91.524,
					801.679
				},
				rotationVInput = {
					9.884,
					292.182,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 6,
				cameraId = 91087806,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 197
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 97
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 197
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
						portId = "In",
						nodeId = 98
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Squat_Start",
				loopDurationVInput = 999,
				defaultTransStateVInput = "Squat_Idle",
				staticIdVInput = 2
			},
			fields = {
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 301
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707652,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410002,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 100
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
						nodeId = 94
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 101
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 96
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 112
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707653,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.25,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 102
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
						nodeId = 91
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 103
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
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707657,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Solemn_Start",
				portCount = 1,
				skipTime = 0,
				npcStaticId = -429437529,
				npcId = 410002,
				matchAudioDuration = true,
				duration = 7.25,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					"Emotion_Solemn_Start",
					"Emotion_Solemn_Loop",
					"Emotion_Solemn_End",
					{
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
						portId = "In",
						nodeId = 104
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707658,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410002,
				matchAudioDuration = true,
				duration = 3.25,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 105
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707659,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410002,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3
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
				portCount = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 107
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
						nodeId = 109
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 110
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 111
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1559.603,
					91.174,
					803.023
				},
				rotationVInput = {
					11.677,
					73.345,
					4.404
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 116,
				spotLightInnerAngle = 31,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 25000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 1,
					r = 0.7122642,
					a = 1,
					g = 0.86155
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1557.554,
					92,
					802.307
				},
				rotationVInput = {
					27.993,
					307.647,
					355.849
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 158,
				spotLightInnerAngle = 81,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 20000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 1,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.85,
					r = 1,
					a = 1,
					g = 0.9350333
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1559.582,
					91.589,
					802.428
				},
				rotationVInput = {
					12.995,
					328.847,
					1.103
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 97,
				spotLightInnerAngle = 73,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 40000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.952145
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1560.366,
					92.105,
					805.146
				},
				rotationVInput = {
					36.391,
					168.344,
					357.038
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 65,
				spotLightInnerAngle = 40,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 100000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 1,
					r = 0.6,
					a = 1,
					g = 0.7774448
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1557.554,
					92,
					802.307
				},
				rotationVInput = {
					27.993,
					307.647,
					355.849
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 158,
				spotLightInnerAngle = 81,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 80000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.85,
					r = 1,
					a = 1,
					g = 0.9350333
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
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
						portId = "Close",
						nodeId = 113
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 114
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 115
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1559.509,
					91.895,
					802.697
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 45,
				spotLightInnerAngle = 0,
				radius = 5,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 2,
				isSpot = false,
				isDisk = false,
				intensity = 13000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.9741859
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1556.305,
					91.829,
					803.011
				},
				rotationVInput = {
					19.808,
					275.936,
					358.927
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 160,
				spotLightInnerAngle = 100,
				radius = 25,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 50000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.9520547
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1558.507,
					92.087,
					802.297
				},
				rotationVInput = {
					21.677,
					300.242,
					359.408
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 45,
				spotLightInnerAngle = 0,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 40000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.9690323
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_PointTo02",
				animationLayerVInput = 4,
				staticIdVInput = 91277991
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400100
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -429437529,
				targetEulerAngleVInput = {
					0,
					159.655,
					0
				},
				targetPositionVInput = {
					-1558.272,
					89.979,
					804.301
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 118
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
					272.74,
					0
				},
				targetPositionVInput = {
					-1558.131,
					90.005,
					803.218
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 119
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -429437529
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 120
					}
				}
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
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = 0
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
					-1554.44,
					90.757,
					801.562
				},
				rotationVInput = {
					357.646,
					275.371,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 15.95,
				cameraId = 91132416,
				sensorWidth = 317,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 503,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 123
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 15,
				blendTimeVInput = 12,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1555.525,
					90.818,
					801.981
				},
				rotationVInput = {
					355.755,
					271.761,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 15.95,
				cameraId = 91132470,
				sensorWidth = 317,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 503,
				visualizeDOF = false
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
						portId = "Close",
						nodeId = 125
					}
				},
				["1"] = {
					{
						portId = "Close",
						nodeId = 126
					}
				},
				["2"] = {
					{
						portId = "Close",
						nodeId = 127
					}
				},
				["3"] = {
					{
						portId = "Close",
						nodeId = 128
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1559.608,
					91.773,
					802.32
				},
				rotationVInput = {
					28.063,
					346.104,
					356.538
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 78,
				spotLightInnerAngle = 56,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 100000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.9580972
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1558.366,
					91.989,
					801.616
				},
				rotationVInput = {
					35.396,
					13.291,
					6.846
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 81,
				spotLightInnerAngle = 23,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 160000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.9601531
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1562.194,
					92.684,
					802.408
				},
				rotationVInput = {
					28.969,
					73.274,
					358.195
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 95,
				spotLightInnerAngle = 71,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 122011,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 1,
					r = 0.8,
					a = 1,
					g = 0.9262151
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1559.317,
					91.913,
					803.096
				},
				rotationVInput = {
					35.648,
					195.567,
					357.886
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 72,
				spotLightInnerAngle = 45,
				radius = 3.11,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 8000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.9527687
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
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
						portId = "Close",
						nodeId = 130
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1556.44,
					92.185,
					803.305
				},
				rotationVInput = {
					13.903,
					273.448,
					180.234
				}
			},
			fields = {
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 120,
				spotLightInnerAngle = 50,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 190986,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				color = {
					b = 0.88,
					r = 1,
					a = 1,
					g = 0.9593982
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91277991,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707646
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
				portCount = 2
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
						nodeId = 131
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707648,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "TalkCasual",
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 5.25,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "TalkCasual",
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
						portId = "In",
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 72574859,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 209
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
						portId = "In",
						nodeId = 137
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Shrug_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 303,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 0,
				fovVInput = 36,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1563.372,
					91.084,
					801.405
				},
				rotationVInput = {
					0.396,
					70.138,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 12,
				cameraId = 91086318,
				sensorWidth = 161,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 365,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 139
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 36,
				blendExponentVInput = 0,
				blendTimeVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1562.273,
					90.911,
					801.803
				},
				rotationVInput = {
					358.333,
					69.622,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 4,
				cameraId = 91086502,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 74,
			inputs = {
				maxSpeedVInput = 0.35,
				maxIntensityVInput = 6,
				endPositionVInput = {
					-1465.749,
					60.613,
					800.03
				},
				startPositionVInput = {
					-1574.78,
					90.915,
					801.61
				}
			},
			dynamicInputs = {
				"maxIntensityDVInput",
				"maxSpeedDVInput"
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "PointTo_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 301,
				aniStateList = {
					"PointTo_Start",
					"PointTo_Loop",
					"PointTo_End"
				}
			},
			flowIn = {
				In = 0
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
						nodeId = 143
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 144
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
						nodeId = 146
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -429437529,
				targetEulerAngleVInput = {
					0,
					78.82,
					0
				},
				targetPositionVInput = {
					-1559.207,
					89.99,
					803.823
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
				staticIdVInput = 72574859,
				targetEulerAngleVInput = {
					0,
					79.402,
					0
				},
				targetPositionVInput = {
					-1560.147,
					90.052,
					803.528
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
				staticIdVInput = 91277991,
				targetEulerAngleVInput = {
					0,
					65.2,
					0
				},
				targetPositionVInput = {
					-1559.705,
					90.128,
					802.081
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
				staticIdVInput = 88261159,
				targetEulerAngleVInput = {
					0,
					56.365,
					0
				},
				targetPositionVInput = {
					-1559.652,
					90.037,
					801.503
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
						nodeId = 127
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 126
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
						nodeId = 128
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 113
					}
				}
			}
		},
		{
			kind = 46,
			valueIn = {
				["0"] = {
					portId = "animationCurveVOutput",
					nodeId = 208
				}
			},
			fields = {
				volumeParamInfoCount = 1,
				volumeComponentCount = 1,
				volumeComponents = {
					{
						typeName = "RadialBlurComponent",
						active = false,
						parameters = {
							m_BlurRadius = {
								value = 0.00736,
								overrideState = true,
								valueType = "float"
							},
							m_BlurNoiseMap_TO = {
								overrideState = true,
								valueType = "vector4",
								value = {
									z = 0,
									y = 10,
									x = 0,
									w = 0
								}
							},
							m_ScreenPos = {
								overrideState = true,
								valueType = "vector2",
								value = {
									x = 0.55,
									y = 0.43
								}
							},
							m_BlurRange = {
								value = 1.04,
								overrideState = true,
								valueType = "float"
							},
							m_EdgeSmoothness = {
								value = -0.007,
								overrideState = true,
								valueType = "float"
							},
							m_RingMask = {
								value = 0.99,
								overrideState = false,
								valueType = "float"
							},
							m_ScreenScale = {
								value = 0.355,
								overrideState = true,
								valueType = "float"
							},
							m_BlurRangeEnd = {
								value = 2,
								overrideState = true,
								valueType = "float"
							},
							m_BlurRadiusControll = {
								overrideState = true,
								valueType = "vector2",
								value = {
									x = 1,
									y = 0
								}
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "RadialBlurComponent",
						params = {
							{
								name = "模糊强度",
								paramIndex = 0
							}
						}
					}
				}
			},
			dynamicInputs = {
				"0"
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 72,
			inputs = {
				blendOutTimeVInput = 1
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
			kind = 31,
			inputs = {
				audioEventVInput = "SFX_Story_Wind_Shijiu"
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0
			},
			flowIn = {
				Stop = 1,
				Play = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.75
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 153
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 52,
				blendExponentVInput = 0,
				blendFuncVInput = "EaseIn",
				blendTimeVInput = 7,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1557.744,
					91.439,
					802.936
				},
				rotationVInput = {
					353.97,
					69.65,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				fStop = 4,
				cameraId = 78997207,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 154
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91277991,
				targetEulerAngleVInput = {
					0,
					65.2,
					0
				},
				targetPositionVInput = {
					-1559.82,
					90.04,
					801.96
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
			kind = 4,
			fields = {
				delayTime = 1.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 156
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
						nodeId = 140
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					81.83,
					0
				},
				targetPositionVInput = {
					-1558.05,
					89.97,
					803.53
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 188
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
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							value = 0
						},
						{
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							value = 1
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
						portId = "In",
						nodeId = 158
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					110.4,
					0
				},
				targetPositionVInput = {
					-1559.513,
					89.981,
					804.075
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 193
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
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							value = 0
						},
						{
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							value = 1
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
				staticIdVInput = 91277991,
				targetEulerAngleVInput = {
					0,
					65.84,
					0
				},
				targetPositionVInput = {
					-1559.85,
					89.99,
					801.96
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
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							value = 0
						},
						{
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							value = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 200001,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					portId = "Position",
					nodeId = 196
				},
				rotationVInput = {
					portId = "EulerAngles",
					nodeId = 196
				}
			},
			fields = {
				entityId = -429437529,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 161
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				moveTypeVInput = 2,
				staticIdVInput = -429437529,
				targetEulerAngleVInput = {
					0,
					110.4,
					0
				},
				targetPositionVInput = {
					-1559.513,
					89.981,
					804.075
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
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							value = 0
						},
						{
							inTangent = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							value = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_CutScene_Dojo_P1_GriffinAppear_Rec_hy_feng_1.prefab",
				postionVInput = {
					-1558.751,
					91.837,
					800.49
				}
			},
			fields = {
				playOne = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "SFX_Transition_FirstMeetingWorld"
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
						portId = "In",
						nodeId = 130
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
						portId = "Stop",
						nodeId = 148
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 51
					}
				}
			}
		},
		[188] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[193] = {
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		[194] = {
			kind = 9,
			inputs = {
				staticIdVInput = 91277991
			},
			fields = {
				entityType = 2
			}
		},
		[195] = {
			kind = 9,
			inputs = {
				staticIdVInput = 88261159
			},
			fields = {
				entityType = 2
			}
		},
		[196] = {
			kind = 17,
			fields = {
				entityType = 1
			}
		},
		[197] = {
			kind = 17,
			inputs = {
				staticIdVInput = -429437529
			},
			fields = {
				entityType = 2
			}
		},
		[200] = {
			kind = 9,
			inputs = {
				staticIdVInput = 88261159
			},
			fields = {
				entityType = 2
			}
		},
		[208] = {
			kind = 59,
			fields = {
				animationCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inTangent = 0.02729151,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0.02729151,
							value = 0
						},
						{
							inTangent = 0.01959559,
							time = 0.1743845,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0.01959559,
							value = 0.004759216
						},
						{
							inTangent = 0.02207716,
							time = 0.6939681,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0.02207716,
							value = 0.00406002
						},
						{
							inTangent = -0.0004857607,
							time = 2.026779,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = -0.0004857607,
							value = 0.006079311
						},
						{
							inTangent = -0.01194754,
							time = 3,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = -0.01194754,
							value = 0
						}
					}
				}
			}
		},
		[209] = {
			kind = 17,
			inputs = {
				staticIdVInput = 91277991
			},
			fields = {
				entityType = 2
			}
		},
		[220] = {
			kind = 17,
			inputs = {
				staticIdVInput = 72574859
			},
			fields = {
				entityType = 2
			}
		}
	}
}
