-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91546640.lua

return {
	schema = 1,
	startNodeId = 3,
	dialogueId = 91546640,
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
						nodeId = 4
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
					toplogoComList = {
						bubble = true,
						alert = true,
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
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 519016604,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				chatType = 3,
				portCount = 1,
				skipTime = 0,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				npcId = 5190166,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 519016605,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				chatType = 3,
				portCount = 1,
				skipTime = 0,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				npcId = 5190166,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 519016606,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				chatType = 3,
				portCount = 2,
				skipTime = 0,
				matchAudioDuration = true,
				duration = 10.5,
				disableCamera = false,
				npcId = 5190166,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 519016607
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 519016609,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				chatType = 3,
				portCount = 1,
				skipTime = 0,
				matchAudioDuration = true,
				duration = 9.12,
				disableCamera = false,
				npcId = 5190166,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
				dialogueIdVInput = 519016610,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				chatType = 3,
				portCount = 1,
				skipTime = 0,
				matchAudioDuration = true,
				duration = 11.75,
				disableCamera = false,
				npcId = 5190166,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 519016608
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 519016611,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				chatType = 3,
				portCount = 1,
				skipTime = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				npcId = 5190166,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
				dialogueIdVInput = 519016612,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				chatType = 3,
				portCount = 1,
				skipTime = 0,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				npcId = 5190166,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 519016613,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				chatType = 3,
				portCount = 1,
				skipTime = 0,
				matchAudioDuration = true,
				duration = 7.12,
				disableCamera = false,
				npcId = 5190166,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 1
					}
				}
			}
		}
	}
}
