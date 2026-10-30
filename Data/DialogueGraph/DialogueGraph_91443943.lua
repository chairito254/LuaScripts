-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91443943.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91443943,
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
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				modeInfo = {
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
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					toplogoComList = {
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
						petFertility = true,
						petExchange = true
					}
				}
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
			kind = 45,
			inputs = {
				timelineResIdVInput = "$P_TL_Water_P12_FrogAppear.prefab"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				PreFinish = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				Start = {
					{
						nodeId = 73,
						portId = "In"
					}
				},
				StartPlay = {
					{
						nodeId = 74,
						portId = "In"
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
				Out = {
					{
						nodeId = 6,
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
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					toplogoComList = {
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
						petFertility = true,
						petExchange = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 9,
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
						nodeId = 8,
						portId = "In"
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
						nodeId = 0,
						portId = "End"
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
						nodeId = 71,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 61,
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
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.6
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516440,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 2,
				anim = "Talk",
				skipTime = 0,
				npcStaticId = -243585920,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 7.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 13,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 60,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516441
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 6516443,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120105,
				dialogueIdVInput = 6516444,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Lefthand_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 8.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					"Talk_Lefthand_Start",
					"Talk_Lefthand_Loop",
					"Talk_Lefthand_End",
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
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120105,
				dialogueIdVInput = 6516445,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Normal",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					[1] = "Talk_Normal",
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
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120105,
				dialogueIdVInput = 6516446,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Shrug_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 8.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516447,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk",
				skipTime = 0,
				npcStaticId = -243585920,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 7.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516448,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_DoubtStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516449,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_AlertStart",
				skipTime = 0,
				npcStaticId = -243585920,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd",
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
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516450,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_AngryStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 10.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd",
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
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120105,
				dialogueIdVInput = 6516451,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Shrug_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 6.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 23,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516452,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_DoubtStart",
				skipTime = 0,
				npcStaticId = -243585920,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 7.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516453,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_HappyStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120100,
				dialogueIdVInput = 6516454,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 2,
				anim = "Talk",
				skipTime = 0,
				npcStaticId = -243585920,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 26,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 54,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516455
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 6516457,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_LoveStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 10,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					"Behav_LoveStart",
					"Behav_LoveLoop",
					"Behav_LoveEnd",
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
						nodeId = 28,
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
						nodeId = 52,
						portId = "In"
					}
				},
				["1"] = {
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
				lookAtIdVInput = 5120105,
				dialogueIdVInput = 6516458,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_DoubtStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true,
				duration = 5.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120102,
				dialogueIdVInput = 6516459,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_AngryStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 2.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd",
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
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120102,
				dialogueIdVInput = 6516464,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Lefthand",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516465,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_HappyStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true,
				duration = 5.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 33,
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
						nodeId = 46,
						portId = "In"
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
						nodeId = 49,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 50,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				lookAtIdVInput = -1,
				dialogueIdVInput = 6516466,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_CryStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 6.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					"Behav_CryStart",
					"Behav_CryLoop",
					"Behav_CryEnd",
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
						nodeId = 35,
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
						nodeId = 40,
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
						nodeId = 38,
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				lookAtIdVInput = 5120105,
				dialogueIdVInput = 6516467,
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
				npcId = 5120101,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0
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
				delayTime = 0.4
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
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 20,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					257.8,
					0
				},
				targetPositionVInput = {
					-823.37,
					110.6,
					519.69
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0
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
						nodeId = 44,
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
						nodeId = 45,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				blendTimeVInput = 1.5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-808.556,
					112.008,
					519.907
				},
				rotationVInput = {
					11.261,
					277.945,
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
				cameraId = 91559528,
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
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				autoPathfindingVInput = true,
				staticIdVInput = 91029199,
				moveTypeVInput = 2,
				targetPositionVInput = {
					-812.214,
					110.463,
					519.87
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 64,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
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
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					-60.1,
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
			kind = 26,
			inputs = {
				staticIdVInput = 91029197,
				targetEulerAngleVInput = {
					0,
					-60.1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 66,
					portId = "EntityID"
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
				staticIdVInput = 91029195,
				targetEulerAngleVInput = {
					0,
					-60.1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 62,
					portId = "EntityID"
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
				fovVInput = 38,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-812.6,
					111.812,
					518.5
				},
				rotationVInput = {
					9.2,
					50.87,
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
				cameraId = 91580173,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-812.3,
					111.6,
					518.6
				},
				rotationVInput = {
					4.9,
					46.9,
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
				cameraId = 91580187,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516456
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
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120102,
				dialogueIdVInput = 6516460,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_LoveStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 7.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					"Behav_LoveStart",
					"Behav_LoveLoop",
					"Behav_LoveEnd",
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
						nodeId = 56,
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
						nodeId = 52,
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
				lookAtIdVInput = 5120105,
				dialogueIdVInput = 6516461,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_DoubtStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
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
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120102,
				dialogueIdVInput = 6516462,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_AlertStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 4.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd",
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
						nodeId = 59,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5120102,
				dialogueIdVInput = 6516463,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 69,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_AngryStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120105,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				animCfg = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd",
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
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516442
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
						nodeId = 62,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 66,
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
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5120100,
				positionVInput = {
					-809.295,
					110.637,
					519.412
				},
				rotationVInput = {
					0,
					349.48,
					0
				}
			},
			fields = {
				entityId = -2045710405,
				ignoreGravity = false
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
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = 91029195
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5120101,
				positionVInput = {
					-808.347,
					110.818,
					520.114
				},
				rotationVInput = {
					0,
					323.855,
					0
				}
			},
			fields = {
				entityId = -1212271447,
				ignoreGravity = false
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
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = 91029199
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5120102,
				positionVInput = {
					-811.126,
					110.63,
					520.694
				},
				rotationVInput = {
					0,
					42.5,
					0
				}
			},
			fields = {
				entityId = -1497645804,
				ignoreGravity = false
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
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = 91029197
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
					15.4,
					0
				},
				targetPositionVInput = {
					-810.521,
					110.512,
					519.523
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5120105,
				positionVInput = {
					-809.56,
					110.78,
					521.97
				},
				rotationVInput = {
					0,
					192.68,
					0
				}
			},
			fields = {
				entityId = -1549679576,
				ignoreGravity = false
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
			kind = 20,
			inputs = {
				staticIdVInput = 91029168,
				durationVInput = 0,
				isResetValueInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-810,
					112.134,
					518.87
				},
				rotationVInput = {
					17.224,
					5.4,
					-0.004
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91559520,
				visualizeDOF = false
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
				fovVInput = 38,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-810.2,
					112.2,
					517.3
				},
				rotationVInput = {
					13.7,
					7.39,
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
				cameraId = 91559522,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 23,
			flowIn = {
				In = 0
			}
		}
	}
}
