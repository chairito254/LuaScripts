-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_76760229.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 76760229,
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
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
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
					toplogoComList = {
						bubble = true,
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
						callFriends = true
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
						nodeId = 0
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
			kind = 34,
			inputs = {
				staticIdVInput = 76707907
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 17
				}
			},
			fields = {
				cameraPreset = 0,
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 0,
				enableGroupLookAt = true,
				enableDefaultLookAt = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 51,
			inputs = {
				triggerIdVInput = 670
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 51,
			inputs = {
				triggerIdVInput = 671
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 15
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005002,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 17
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowStart",
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005003,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 17
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowLoop",
				animCfg = {
					[1] = "EnvBehav_ScreenShowLoop",
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
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005004,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 17
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial",
				animCfg = {
					[1] = "IdleSpecial",
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
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005005,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 17
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowLoop",
				animCfg = {
					[1] = "EnvBehav_ScreenShowLoop",
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
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005007,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowStart",
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005008,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowStart",
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005009,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowStart",
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
						nodeId = 14
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005011,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowStart",
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005021,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowStart",
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005023,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowStart",
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 17,
			inputs = {
				boneNameVInput = "Bip001 Head",
				staticIdVInput = 76707907
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				boneNameVInput = "Bip001 Head",
				staticIdVInput = 76707907
			},
			fields = {
				entityType = 2
			}
		}
	}
}
