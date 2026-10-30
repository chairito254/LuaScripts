-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91190393.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 91190393,
	nodes = {
		[0] = {
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
				retFlag = 2
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
			kind = 11,
			fields = {
				modeInfo = {
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					hideTopLogo = true,
					blockCameraZoom = true,
					hideMarkShare = true,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
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
						bubble = true,
						alert = true,
						actionState = true,
						vlog = true
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
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.15
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
			kind = 4,
			fields = {
				delayTime = 0.1
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
			kind = 2,
			fields = {
				portCount = 7
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["1"] = {
					{
						portId = "In",
						nodeId = 8
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 194
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 192
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 196
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 198
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 199
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
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.2
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
			kind = 83,
			fields = {
				portCount = 3,
				observeId = 6,
				isFreeConfigCluePosition = true,
				cluePositions = {
					{
						-1000,
						700,
						0
					},
					{
						800,
						300,
						0
					},
					{
						0,
						200,
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
						portId = "In",
						nodeId = 181
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 186
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				ErrorOut = {
					{
						portId = "In",
						nodeId = 190
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
						nodeId = 180
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					hideTopLogo = true,
					blockCameraZoom = true,
					hideMarkShare = true,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
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
						bubble = true,
						alert = true,
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
						portId = "In",
						nodeId = 88
					}
				},
				Out = {
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
				portCount = 4
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
						portId = "Stop",
						nodeId = 173
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 177
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 179
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
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120102,
				dialogueIdVInput = 6516280,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516281,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120107,
				matchAudioDuration = true
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516282,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 6.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				anim = "Behav_DoubtStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true,
				animCfg = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd",
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
						nodeId = 18
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 170
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516283
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
				portCount = 3
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
						nodeId = 167
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 169
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516285,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 9.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
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
				portCount = 3
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
						nodeId = 164
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 166
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516287,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 3.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Talk",
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
						nodeId = 23
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
						nodeId = 24
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 157
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 160
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 162
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 65162870,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Skill_Ex",
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Skill_Ex",
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
						nodeId = 25
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
						nodeId = 26
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
						nodeId = 27
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 157
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516288,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 5.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
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
				portCount = 3
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
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 8,
				staticIdVInput = 91029245,
				playableStateVInput = "Skill_Summon"
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 2.5,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 30
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				staticIdVInput = 91029245,
				playableStateVInput = "Behav_Cry"
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 5.333,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91029245,
				lookAtEntityStaticIdVInput = 91029275
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516289,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
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
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
						portId = "In",
						nodeId = 154
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 156
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120104,
				dialogueIdVInput = 6516290,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120101,
				matchAudioDuration = true
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
						nodeId = 151
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516291
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 2
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
						nodeId = 150
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516293,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 10.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
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
			kind = 12,
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
						nodeId = 41
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
						nodeId = 42
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
						portId = "Stop",
						nodeId = 150
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 30
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120104,
				dialogueIdVInput = 6516295,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 9.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1.5,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
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
						nodeId = 142
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 144
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 139
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 145
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				enableFadeInVInput = true,
				enableFadeOutVInput = true,
				dialogueIdVInput = 6516296,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
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
			kind = 12,
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
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120104,
				dialogueIdVInput = 6516297,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 10.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Shrug",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Talk_Shrug",
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
						nodeId = 48
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
						nodeId = 49
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
						nodeId = 50
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 131
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 135
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 138
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 139
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				enableFadeInVInput = true,
				enableFadeOutVInput = true,
				fadeInTimeVInput = 0.2,
				dialogueIdVInput = 6516298,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
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
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120104,
				dialogueIdVInput = 6516299,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 10.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Shrug",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Talk_Shrug",
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
						nodeId = 53
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
						nodeId = 54
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
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516300,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Talk",
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
						nodeId = 56
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 126
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
						nodeId = 57
					}
				},
				["1"] = {
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
				lookAtIdVInput = 5120107,
				dialogueIdVInput = 6516301,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Talk",
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
						nodeId = 58
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120104,
				dialogueIdVInput = 6516302,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 5.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true
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
						nodeId = 60
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 120
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
						portId = "Stop",
						nodeId = 123
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516303,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516304,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516305,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
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
				ShowFinOut = {
					{
						portId = "Stop",
						nodeId = 119
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
						nodeId = 64
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
						nodeId = 65
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 116
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 118
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120104,
				dialogueIdVInput = 6516306,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 9.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Emotion_Shock",
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
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
						portId = "In",
						nodeId = 66
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
						nodeId = 67
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
						nodeId = 68
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
						nodeId = 114
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 115
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
						nodeId = 69
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				lookAtIdVInput = -1,
				dialogueIdVInput = 6516307,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120101,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 70
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 109
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 111
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516308
			},
			flowIn = {
				In = 0
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516310,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 8.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Shrug_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
				animCfg = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End",
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
						nodeId = 72
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
						nodeId = 73
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
						nodeId = 74
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 107
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
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120104,
				dialogueIdVInput = 6516312,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 11.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 75
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516313,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 76
					}
				},
				ShowFinOut = {
					{
						portId = "Stop",
						nodeId = 106
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
						nodeId = 77
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
						nodeId = 100
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 105
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120104,
				dialogueIdVInput = 6516314,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 10.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				lookAtIdVInput = 5120104,
				dialogueIdVInput = 6516315,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
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
						nodeId = 98
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 99
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516316
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 80
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516318,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 6.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 81
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
						nodeId = 82
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
						portId = "In",
						nodeId = 95
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516319,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 65163190,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 84
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 92
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516320
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516321,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 86
					}
				},
				ShowFinOut = {
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
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516322,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 9.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5120104,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 87
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
						nodeId = 88
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
						nodeId = 89
					}
				}
			}
		},
		{
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				staticIdVInput = 91029245,
				playableStateVInput = "Skill_Healing"
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 0.583,
				playAniType = 1,
				isLooping = false
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_SleepStart",
				staticIdVInput = 91029245,
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
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
						nodeId = 93
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 95
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 3,
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-855.8,
					118.947,
					376.3
				},
				rotationVInput = {
					359.854,
					52.8,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576302,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 94
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 24,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856,
					118.8,
					376.1
				},
				rotationVInput = {
					359.2,
					52.8,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576303,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				staticIdVInput = 91029245,
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 0.583,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
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
				fovVInput = 38,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementTimeVInput = 12,
				cameraMovementModeVInput = 1,
				cameraMovementFuncVInput = 3,
				cameraMovementExpVInput = 0,
				cameraMovementAngleVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					-851.77,
					117.75,
					379.34
				},
				positionVInput = {
					-854.5,
					118.85,
					376.7
				},
				rotationVInput = {
					349.6,
					54.8,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
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
				fovVInput = 38,
				blendTimeVInput = 12,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-854.6,
					118.85,
					377.5
				},
				rotationVInput = {
					349.6,
					55.2,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516317
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 80
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
						nodeId = 102
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 100
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 9,
				staticIdVInput = 91029275,
				playableStateVInput = "Story_Thankful_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120100,
				processingTime = 2.333,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Story_Thankful_Start",
					"Story_Thankful_Loop",
					"Story_Thankful_End"
				}
			},
			flowIn = {
				Stop = 1,
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
			kind = 5,
			inputs = {
				staticIdVInput = 91029275,
				playableStateVInput = "Story_Throw"
			},
			fields = {
				entityType = 2,
				templateId = 5120100,
				processingTime = 5.167,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 3,
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-855.8,
					118.947,
					375.8
				},
				rotationVInput = {
					359.854,
					47.4,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576280,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 103
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 24,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-855.75,
					118.947,
					375.75
				},
				rotationVInput = {
					360.5,
					47,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576287,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91029275,
				playableStateVInput = "Story_Throw"
			},
			fields = {
				entityType = 2,
				templateId = 5120100,
				processingTime = 5.167,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				staticIdVInput = 91029245,
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 0.583,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
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
				loopDurationVInput = 99,
				staticIdVInput = 91029245,
				playableStateVInput = "Behav_LoveStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 0.583,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Behav_LoveStart",
					"Behav_LoveLoop",
					"Behav_LoveEnd"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 105
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.3,
					118.6,
					377.9
				},
				rotationVInput = {
					347.8,
					83.4,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576272,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
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
				fovVInput = 32,
				blendTimeVInput = 20,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.3,
					118.55,
					378.1
				},
				rotationVInput = {
					346.5,
					89,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516309
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 110
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120101,
				dialogueIdVInput = 6516311,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 5.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Disappoint_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
				animCfg = {
					"Disappoint_Start",
					"Disappoint_Loop",
					"Disappoint_End",
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
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91029280
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-852.09,
					119.6,
					377.858
				},
				rotationVInput = {
					24.1,
					282.583,
					0.002
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576171,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 113
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendTimeVInput = 16,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-851.7,
					119.4,
					378
				},
				rotationVInput = {
					21,
					282.583,
					0.002
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576175,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91029275,
				lookAtEntityStaticIdVInput = 91029280
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91029280
			},
			fields = {
				duration = 5,
				emojiName = "Sad"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.3,
					118.6,
					377.9
				},
				rotationVInput = {
					347.8,
					83.4,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576148,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 117
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendTimeVInput = 20,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.3,
					118.55,
					378.1
				},
				rotationVInput = {
					346.5,
					89,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576141,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
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
					65.074,
					0
				},
				targetPositionVInput = {
					-854.387,
					117.586,
					376.621
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
				loopDurationVInput = 99,
				staticIdVInput = 91029245,
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 0.583,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
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
				fovVInput = 38,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementTimeVInput = 12,
				cameraMovementModeVInput = 1,
				cameraMovementFuncVInput = 3,
				cameraMovementExpVInput = 0,
				cameraMovementAngleVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					-851.77,
					117.75,
					379.34
				},
				positionVInput = {
					-854.5,
					118.85,
					376.7
				},
				rotationVInput = {
					349.6,
					54.8,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575759,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 121
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 12,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-854.6,
					118.85,
					377.5
				},
				rotationVInput = {
					349.6,
					55.2,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575760,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91029245,
				targetEulerAngleVInput = {
					0,
					-119.3,
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
						portId = "In",
						nodeId = 119
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				staticIdVInput = 91029245,
				playableStateVInput = "Talk"
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 1.067,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-855.511,
					118.947,
					376.308
				},
				rotationVInput = {
					359.854,
					56.3,
					0.003
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575722,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 125
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 3,
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-855.511,
					118.947,
					376.1
				},
				rotationVInput = {
					359.854,
					69.2,
					0.003
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575725,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91029245
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "Stop",
						nodeId = 127
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 129
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				staticIdVInput = 91029280,
				playableStateVInput = "Behav_AngryStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120101,
				processingTime = 1.067,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 128
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				staticIdVInput = 91029280,
				playableStateVInput = "Behav_SleepStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120101,
				processingTime = 1.067,
				playAniType = 1,
				isLooping = false,
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
			kind = 26,
			inputs = {
				staticIdVInput = 91029245,
				targetEulerAngleVInput = {
					0,
					-8.8,
					0
				}
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 237
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 130
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					-8.8,
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
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 132
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-853.054,
					118.738,
					376.085
				},
				rotationVInput = {
					-3.2,
					334.13,
					0.002
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575521,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 133
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 3,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-852.3,
					118.894,
					375.1
				},
				rotationVInput = {
					2.59,
					330.7,
					0.002
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575576,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 134
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 4,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-852.3,
					118.894,
					375.1
				},
				rotationVInput = {
					359.9,
					330.7,
					0.002
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575626,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				staticIdVInput = 91029245,
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 1.067,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 136
					}
				},
				Out = {
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
				loopDurationVInput = 99,
				staticIdVInput = 91029245,
				playableStateVInput = "Behav_AlertStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 1.067,
				playAniType = 1,
				isLooping = false,
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
						portId = "In",
						nodeId = 137
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91029245,
				lookAtEntityStaticIdVInput = 91029275
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
					344.32,
					0
				},
				targetPositionVInput = {
					-853.724,
					117.582,
					376.165
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
				loopDurationVInput = 99,
				staticIdVInput = 91029280,
				playableStateVInput = "Behav_CryStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120101,
				processingTime = 1.067,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Behav_CryStart",
					"Behav_CryLoop",
					"Behav_CryEnd"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 141
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 140
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91029280,
				lookAtEntityStaticIdVInput = 91029275
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91029280,
				targetEulerAngleVInput = {
					0,
					179.4,
					0
				},
				targetPositionVInput = {
					-854.5,
					117.68,
					378.84
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
						nodeId = 127
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 36,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.397,
					118.745,
					377.888
				},
				rotationVInput = {
					355.729,
					84.326,
					0.002
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575266,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 143
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 36,
				blendTimeVInput = 12,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.397,
					118.72,
					377.95
				},
				rotationVInput = {
					351.7,
					85.7,
					0.002
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575427,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91029245,
				targetEulerAngleVInput = {
					0,
					245.1,
					0
				},
				targetPositionVInput = {
					-851.77,
					117.75,
					379.34
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
						nodeId = 135
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Praise_Start",
				staticIdVInput = 91029275,
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120100,
				processingTime = 1.767,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Praise_Start",
					"Praise_Loop",
					"Praise_End"
				}
			},
			flowIn = {
				Stop = 1,
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
			kind = 4,
			fields = {
				delayTime = 0.4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 147
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91029245,
				lookAtEntityStaticIdVInput = 91029275
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 36,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-853.3,
					118.55,
					377.9
				},
				rotationVInput = {
					344.8,
					272.2,
					0.001
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575115,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				fovVInput = 36,
				blendTimeVInput = 24,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-853.1,
					118.5,
					378.2
				},
				rotationVInput = {
					344.6,
					260.9,
					0.001
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91575143,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Disappoint_Start",
				staticIdVInput = 91029275,
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120100,
				processingTime = 3,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Disappoint_Start",
					"Disappoint_Loop",
					"Disappoint_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 145
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516292
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 152
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
						nodeId = 153
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 150
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120101,
				dialogueIdVInput = 6516294,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 10,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
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
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-848.004,
					120.2,
					377.143
				},
				rotationVInput = {
					15.4,
					286.294,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574880,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 155
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 20,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-848.004,
					119.65,
					377.143
				},
				rotationVInput = {
					7.56,
					286.294,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574912,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 99,
				staticIdVInput = 91029280,
				playableStateVInput = "Behav_CryStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120101,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Behav_CryStart",
					"Behav_CryLoop",
					"Behav_CryEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 8,
				staticIdVInput = 91029245,
				playableStateVInput = "Behav_AlertStart",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120104,
				processingTime = 0.7,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 158
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
				["1"] = {
					{
						portId = "In",
						nodeId = 159
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				durationVInput = 0.6,
				staticIdVInput = 91029245,
				targetEulerAngleVInput = {
					0,
					-202,
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
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-854.122,
					118.681,
					376.118
				},
				rotationVInput = {
					345,
					32.864,
					0.001
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574820,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
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
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 12,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-853.958,
					118.55,
					375.972
				},
				rotationVInput = {
					342.3,
					25.3,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574823,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				durationVInput = 0.6,
				staticIdVInput = 91029275,
				targetEulerAngleVInput = {
					0,
					63,
					0
				}
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 235
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 163
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
					nodeId = 235
				}
			},
			fields = {
				reset = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 2,
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.762,
					118.4,
					377.8
				},
				rotationVInput = {
					353.2,
					86.5,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91437954,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 165
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 36,
				blendTimeVInput = 20,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.762,
					118.4,
					377.4
				},
				rotationVInput = {
					351.9,
					76.4,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574697,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91029245,
				targetEulerAngleVInput = {
					0,
					216.44,
					0
				},
				targetPositionVInput = {
					-852.11,
					117.755,
					379.2
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
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 1.5,
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.75,
					118.9,
					377.15
				},
				rotationVInput = {
					2.3,
					88.2,
					359.823
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574557,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 168
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 15,
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856.65,
					118.95,
					377.3
				},
				rotationVInput = {
					2.85,
					89.5,
					359.823
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574580,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 8,
				staticIdVInput = 91029275,
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 5120100,
				processingTime = 1.767,
				playAniType = 1,
				isLooping = false,
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
			kind = 7,
			fields = {
				dialogueId = 6516284
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 171
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
						nodeId = 172
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 167
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 169
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516286,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true
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
			kind = 5,
			inputs = {
				defaultTransStateVInput = "SquatObserve_Loop",
				staticIdVInput = 2,
				playableStateVInput = "SquatObserve_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 999
			},
			fields = {
				entityType = 0,
				templateId = 3,
				processingTime = 3.733,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"SquatObserve_Start",
					"SquatObserve_Loop",
					"SquatObserve_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 176
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 174
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
						nodeId = 175
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 91038738
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				defaultTransStateVInput = 0,
				staticIdVInput = 2,
				playableStateVInput = "Emotion_Think02_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 99
			},
			fields = {
				entityType = 0,
				templateId = 301,
				processingTime = 0.567,
				playAniType = 1,
				isLooping = true,
				aniStateList = {
					"Emotion_Think02_Start",
					"Emotion_Think02_Loop",
					"Emotion_Think02_End"
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
				blendTimeVInput = 2.5,
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-856,
					119,
					375.3
				},
				rotationVInput = {
					3.3,
					58.85,
					359.823
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91570265,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 178
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 20,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-855.7,
					118.75,
					375.2
				},
				rotationVInput = {
					0.67,
					56.94,
					359.823
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574530,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91029275,
				targetEulerAngleVInput = {
					0,
					87.93,
					0
				}
			},
			fields = {
				reset = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91029245,
				lookAtEntityStaticIdVInput = 2
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
						nodeId = 182
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 185
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 651601,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 183
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
						nodeId = 184
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
						portId = "In",
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 1.5,
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-852.34,
					119.415,
					377.476
				},
				rotationVInput = {
					33.888,
					97.223,
					0.005
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576463,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
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
						nodeId = 187
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 189
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 651602,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 188
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
						nodeId = 184
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendTimeVInput = 1.8,
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-852.532,
					118.484,
					377.572
				},
				rotationVInput = {
					354.354,
					97.048,
					0.006
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91576465,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
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
						nodeId = 191
					}
				}
			}
		},
		{
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
						portId = "End",
						nodeId = 1
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
						nodeId = 193
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					28.9,
					0
				}
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 234
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
						nodeId = 173
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-855.4,
					118.3,
					375.4
				},
				rotationVInput = {
					353.7,
					56.7,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574281,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 195
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 36,
				blendTimeVInput = 24,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-855.35,
					118.2,
					375.3
				},
				rotationVInput = {
					356,
					54.5,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91574508,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91029245,
				targetEulerAngleVInput = {
					0,
					216.44,
					0
				},
				targetPositionVInput = {
					-852.11,
					117.755,
					379.2
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
						nodeId = 197
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91029245,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91029278,
				targetEulerAngleVInput = {
					0,
					37.7,
					0
				},
				targetPositionVInput = {
					-853.479,
					117.571,
					375.672
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
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					72.691,
					0
				},
				targetPositionVInput = {
					-854.387,
					117.586,
					376.621
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
						nodeId = 200
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91029280,
				targetEulerAngleVInput = {
					0,
					112.939,
					0
				},
				targetPositionVInput = {
					-854.5,
					117.68,
					378.84
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
		[234] = {
			kind = 17,
			inputs = {
				staticIdVInput = 91038738
			},
			fields = {
				entityType = 2
			}
		},
		[235] = {
			kind = 17,
			inputs = {
				staticIdVInput = 91029245
			},
			fields = {
				entityType = 2
			}
		},
		[237] = {
			kind = 17,
			inputs = {
				staticIdVInput = 91038738
			},
			fields = {
				entityType = 2
			}
		}
	}
}
