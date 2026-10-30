-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91111467.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91111467,
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
			kind = 81,
			inputs = {
				waitDestroyVInput = true,
				uidVInput = 421
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
						portId = "In",
						nodeId = 33
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 13,
			inputs = {
				staticIdVInput = 91110932
			},
			fields = {
				resetOrientation = false,
				reactPreset = 3,
				nodeMode = 0,
				enableGroupLookAt = true,
				enableDefaultLookAt = false,
				cameraPreset = 2
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
						nodeId = 6
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
						nodeId = 8
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Idle"
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1001100,
				processingTime = 2.667,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 60,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
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
				dialogsetCameraIdVInput = 91304615,
				dialogueIdVInput = 9103039,
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
				anim = "Daily_Thanks",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 3.5,
				animCfg = {
					[1] = "Daily_Thanks",
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
						nodeId = 14
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
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 91304615,
				dialogueIdVInput = 9103040,
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
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 5.62
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
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "closeUIFInput",
						nodeId = 14
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					url = "$UI_Help_60107.png",
					fade = true
				}
			},
			flowIn = {
				closeUIFInput = 1,
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9103010,
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
				npcId = 5000040,
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
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9103012,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 4
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
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9103041,
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
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 2.88
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
						portId = "closeUIFInput",
						nodeId = 20
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					url = "$UI_Help_60111.png",
					fade = true
				}
			},
			flowIn = {
				closeUIFInput = 1,
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 91304609,
				dialogueIdVInput = 9103042,
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
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 3.25
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
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 91304609,
				dialogueIdVInput = 9103043,
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
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 12
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
			kind = 7,
			fields = {
				dialogueId = 9103044
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 91304615,
				dialogueIdVInput = 9103045,
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
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 7.12
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
				dialogueIdVInput = 9103046,
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
				anim = "Talk_Cheeksupport",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 26
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9103047,
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
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 12
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
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 91304609,
				dialogueIdVInput = 9103048,
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
				anim = "Emotion_ShakeHead",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 3.25,
				animCfg = {
					[1] = "Emotion_ShakeHead",
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
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9103049
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 91304615,
				dialogueIdVInput = 9103050,
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
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 12
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 9103051,
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
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 11
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 9103052,
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
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 2.75
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
				dialogsetCameraIdVInput = 91304609,
				dialogueIdVInput = 9103053,
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
				anim = "Story_Greet02",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5000040,
				matchAudioDuration = true,
				duration = 5.75,
				animCfg = {
					[1] = "Story_Greet02",
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
						nodeId = 33
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
		}
	}
}
