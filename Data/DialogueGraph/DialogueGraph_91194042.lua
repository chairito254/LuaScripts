-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91194042.lua

return {
	startNodeId = 1,
	dialogueId = 91194042,
	schema = 1,
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
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
						nodeId = 3,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 18,
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
				},
				["1"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 17,
						portId = "Stop"
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
						nodeId = 6,
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
						nodeId = 7,
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
						nodeId = 8,
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
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				modeInfo = {
					blockCameraZoom = false,
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = false,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = false,
					exitCatchMode = false,
					resetAllActions = false,
					blockEvent = false,
					modeType = 1,
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
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 121,
				param = {
					5702057,
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
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 0,
						portId = "End"
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
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -2116628707,
				durationVInput = 0
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
			kind = 20,
			inputs = {
				staticIdVInput = -1767326190,
				durationVInput = 0
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
			kind = 21,
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
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -39815571,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
				playAniType = 1
			},
			flowIn = {
				In = 0,
				Stop = 1
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
						nodeId = 19,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 153,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 162,
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
						nodeId = 20,
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
						nodeId = 21,
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
						nodeId = 22,
						portId = "In"
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
						nodeId = 23,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 147,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304768,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 10.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 143,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 146,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304769
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 6
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
						nodeId = 141,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 140,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304771,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 28,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 140,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 139,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304773,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 11,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 30,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 139,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 133,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304774,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 7.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 32,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 134,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 133,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 132,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304775,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
				portCount = 6
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
						nodeId = 129,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 130,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 132,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304776,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304777,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304778,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
				ShowFinOut = {
					{
						nodeId = 129,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304779
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
						nodeId = 40,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
				dialogueIdVInput = 3304780,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304781,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 43,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 127,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 126,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 39,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304782,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 3.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 2,
			fields = {
				portCount = 13
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 117,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 45,
						portId = "In"
					}
				},
				["10"] = {
					{
						nodeId = 123,
						portId = "In"
					}
				},
				["11"] = {
					{
						nodeId = 125,
						portId = "In"
					}
				},
				["12"] = {
					{
						nodeId = 126,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 107,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 110,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 113,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 115,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 119,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 120,
						portId = "In"
					}
				},
				["8"] = {
					{
						nodeId = 121,
						portId = "In"
					}
				},
				["9"] = {
					{
						nodeId = 122,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304783,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 3.5,
				npcStaticId = 91369730,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 9.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 47,
						portId = "In"
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
						nodeId = 48,
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
						nodeId = 105,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304784,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 11.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
				portCount = 6
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
						nodeId = 104,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 103,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304785,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 10.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 101,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 52,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 99,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 100,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 103,
						portId = "Stop"
					}
				},
				["5"] = {
					{
						nodeId = 98,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304786,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 6.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 53,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 95,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 98,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304787
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
						nodeId = 55,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 90,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304789,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 10.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304791,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 3304792,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 10.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 59,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 93,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304793,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 10.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 60,
						portId = "In"
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
						nodeId = 61,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 91,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 88,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 90,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304794,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 63,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 86,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 85,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 88,
						portId = "Stop"
					}
				},
				["4"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150018,
				dialogueIdVInput = 3304795,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 64,
						portId = "In"
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
						nodeId = 65,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 83,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 82,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 85,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304796,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 66,
						portId = "In"
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
						nodeId = 67,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 80,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 82,
						portId = "Stop"
					}
				},
				["4"] = {
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
				dialogueIdVInput = 3304797,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 68,
						portId = "In"
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
						nodeId = 69,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 79,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 78,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304798,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 70,
						portId = "In"
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
						nodeId = 71,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 76,
						portId = "In"
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
						nodeId = 78,
						portId = "Stop"
					}
				},
				["4"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304799,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 75,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304800
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 73,
						portId = "In"
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
						nodeId = 74,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3304801,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 10.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 5,
			inputs = {
				staticIdVInput = -1767326190,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Laugh_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 14.5,
				playAniType = 1,
				aniStateList = {
					"Emotion_Laugh_Start",
					"Emotion_Laugh_Loop",
					"Emotion_Laugh_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91369730
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -1767326190
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
				staticIdVInput = -1767326190,
				playStartLoopEndVInput = true,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 14.5,
				playAniType = 1,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91369730,
				staticIdVInput = -1767326190
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1767326190,
				staticIdVInput = 91369730
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.613,
					189.759,
					1019.762
				},
				rotationVInput = {
					13.601,
					353.816,
					0
				}
			},
			fields = {
				fStop = 10.77,
				cameraId = 91541366,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 209,
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
						nodeId = 84,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.156,
					189.759,
					1019.811
				},
				rotationVInput = {
					12.398,
					346.081,
					0
				}
			},
			fields = {
				fStop = 10.77,
				cameraId = 91541370,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 209,
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
				staticIdVInput = -2116628707,
				playStartLoopEndVInput = true,
				playableStateVInput = "Behav_CryStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 0.9,
				playAniType = 1,
				aniStateList = {
					"Behav_CryStart",
					"Behav_CryLoop",
					"Behav_CryEnd"
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
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-98.634,
					188.972,
					1022.812
				},
				rotationVInput = {
					5.866,
					270.4,
					0
				}
			},
			fields = {
				fStop = 16.46,
				cameraId = 91541364,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 98,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
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
				blendTimeVInput = 22,
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.047,
					188.93,
					1022.889
				},
				rotationVInput = {
					5.694,
					270.4,
					0
				}
			},
			fields = {
				fStop = 16.46,
				cameraId = 91541365,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 98,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1767326190,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 14.5,
				playAniType = 1,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -2116628707,
				staticIdVInput = -39815571
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.688,
					189.457,
					1022.454
				},
				rotationVInput = {
					3.563,
					340.628,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 91541373,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 139
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 92,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.759,
					189.444,
					1022.658
				},
				rotationVInput = {
					2.875,
					341.143,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 91541374,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 139
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.953,
					189.495,
					1022.378
				},
				rotationVInput = {
					1.5,
					22.74,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91541362,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 111
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 94,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 6,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.906,
					189.492,
					1022.491
				},
				rotationVInput = {
					0.984,
					22.74,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91541363,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 111
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304788
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 96,
						portId = "In"
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
						nodeId = 97,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 90,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304790,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 11,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
				playAniType = 1
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91369730
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91369730,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-100.502,
					189.43,
					1021.161
				},
				rotationVInput = {
					2.6,
					18.74,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91541360,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 102,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-100.385,
					189.414,
					1021.513
				},
				rotationVInput = {
					2.6,
					20.115,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91541361,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1767326190,
				playStartLoopEndVInput = true,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 14.5,
				playAniType = 1,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1767326190,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150018,
				processingTime = 14.5,
				playAniType = 1,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
				playAniType = 1
			},
			flowIn = {
				In = 0,
				Stop = 1
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
						nodeId = 104,
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
						nodeId = 108,
						portId = "In"
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
					-99.613,
					189.759,
					1019.762
				},
				rotationVInput = {
					13.601,
					353.816,
					0
				}
			},
			fields = {
				fStop = 10.77,
				cameraId = 91541357,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 209,
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
						nodeId = 109,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.156,
					189.759,
					1019.811
				},
				rotationVInput = {
					12.398,
					346.081,
					0
				}
			},
			fields = {
				fStop = 10.77,
				cameraId = 91541356,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 209,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166
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
						nodeId = 111,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1767326190,
				speedVInput = 1.25,
				maxLimitTimeVInput = 3,
				targetEulerAngleVInput = {
					0,
					175.419,
					0
				},
				targetPositionVInput = {
					-100.079,
					188.08,
					1023.96
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
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0
						},
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
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
						nodeId = 112,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91369730,
				staticIdVInput = -1767326190
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
						nodeId = 114,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1767326190,
				staticIdVInput = 91369730
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
						nodeId = 116,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -39815571,
				speedVInput = 1.25,
				maxLimitTimeVInput = 3,
				targetEulerAngleVInput = {
					0,
					147.48,
					0
				},
				targetPositionVInput = {
					-100.836,
					188.08,
					1024.128
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
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0
						},
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
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
			kind = 3,
			inputs = {
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.953,
					189.495,
					1022.378
				},
				rotationVInput = {
					1.5,
					22.74,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91541345,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 111
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 118,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 6,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.906,
					189.492,
					1022.491
				},
				rotationVInput = {
					0.984,
					22.74,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91541359,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 111
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
						nodeId = 119,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150018,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-101.337,
					188.08,
					1026.425
				},
				rotationVInput = {
					0,
					149.369,
					0
				}
			},
			fields = {
				entityId = -1767326190,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150020,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-102.617,
					188.08,
					1025.801
				},
				rotationVInput = {
					0,
					135.662,
					0
				}
			},
			fields = {
				entityId = -39815571,
				ignoreGravity = false
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
						nodeId = 124,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1767326190,
				staticIdVInput = 2
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
						nodeId = 105,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2116628707,
				playableStateVInput = "EnvBehav_Sing"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 5,
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
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-98.634,
					188.972,
					1022.812
				},
				rotationVInput = {
					5.866,
					270.4,
					0
				}
			},
			fields = {
				fStop = 16.46,
				cameraId = 91541339,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 98,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 128,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 22,
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-99.047,
					188.93,
					1022.889
				},
				rotationVInput = {
					5.694,
					270.4,
					0
				}
			},
			fields = {
				fStop = 16.46,
				cameraId = 91541338,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 98,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-100.502,
					189.43,
					1021.161
				},
				rotationVInput = {
					2.6,
					18.74,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91541343,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 131,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-100.385,
					189.414,
					1021.513
				},
				rotationVInput = {
					2.6,
					20.115,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91541344,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				isLooping = true,
				entityType = 0,
				templateId = 403,
				processingTime = 14.5,
				playAniType = 1,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
						nodeId = 135,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 137,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-97.942,
					189.451,
					1023.952
				},
				rotationVInput = {
					4.2,
					243.86,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 91576652,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 136,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-98.311,
					189.421,
					1023.756
				},
				rotationVInput = {
					4.2,
					244,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-97.942,
					189.37,
					1023.952
				},
				rotationVInput = {
					4.2,
					244.032,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 91576653,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 138,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-98.307,
					189.363,
					1023.758
				},
				rotationVInput = {
					4.2,
					244,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 91576654,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = true,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-100.502,
					189.43,
					1021.161
				},
				rotationVInput = {
					2.6,
					18.74,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91460231,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 142,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-100.385,
					189.414,
					1021.513
				},
				rotationVInput = {
					2.6,
					20.115,
					0
				}
			},
			fields = {
				fStop = 15.12,
				cameraId = 91541340,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304770
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 144,
						portId = "In"
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
						nodeId = 145,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 141,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 140,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304772,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150024,
				matchAudioDuration = true,
				duration = 8.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 147,
						portId = "Stop"
					}
				},
				["1"] = {
					{
						nodeId = 148,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91369730,
				playableStateVInput = "Talk"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5160003,
				processingTime = 14.5,
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
						nodeId = 149,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 151,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-97.942,
					189.451,
					1023.952
				},
				rotationVInput = {
					4.2,
					243.86,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 91460230,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 150,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-98.311,
					189.421,
					1023.756
				},
				rotationVInput = {
					4.2,
					244,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 91541333,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-97.942,
					189.37,
					1023.952
				},
				rotationVInput = {
					4.2,
					244.032,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 91576645,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 152,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 24,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-98.307,
					189.363,
					1023.758
				},
				rotationVInput = {
					4.2,
					244,
					0
				}
			},
			fields = {
				fStop = 14.12,
				cameraId = 91576646,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 114,
				recombineQuality = 2,
				openDof = true,
				focalDistance = 249
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
						nodeId = 154,
						portId = "In"
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
						nodeId = 156,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 155,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 161,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150019,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-100.961,
					188.539,
					1023.181
				},
				rotationVInput = {
					0,
					68.015,
					0
				}
			},
			fields = {
				entityId = -2116628707,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
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
						nodeId = 157,
						portId = "In"
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
						nodeId = 158,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 165,
					portId = "EntityIDs"
				}
			},
			fields = {
				reactPreset = 0,
				nodeMode = 1,
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				cameraPreset = 2,
				resetOrientation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FOut = {
					{
						nodeId = 159,
						portId = "In"
					}
				}
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
					-100.336,
					189.318,
					1020.074
				},
				rotationVInput = {
					4.985,
					9.11,
					0
				}
			},
			fields = {
				fStop = 32,
				cameraId = 91459997,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 80,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 221
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 160,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 22,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-100.214,
					189.328,
					1020.9
				},
				rotationVInput = {
					2.922,
					7.047,
					0
				}
			},
			fields = {
				fStop = 32,
				cameraId = 91460229,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 166
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91369730,
				targetEulerAngleVInput = {
					0,
					229.55,
					0
				},
				targetPositionVInput = {
					-99.3,
					188.08,
					1023.54
				}
			},
			fields = {
				setRotation = true,
				reset = false,
				setPosition = true
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
						nodeId = 163,
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
					42.323,
					0
				},
				targetPositionVInput = {
					-100.33,
					188.08,
					1022.43
				}
			},
			fields = {
				setRotation = true,
				reset = false,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					nodeId = 164,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 166,
					portId = "EntityID"
				},
				["3EntityIDVInput"] = {
					nodeId = 167,
					portId = "EntityID"
				}
			},
			fields = {
				portCount = 3
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91369730
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = -2116628707
			},
			fields = {
				entityType = 2
			}
		}
	}
}
