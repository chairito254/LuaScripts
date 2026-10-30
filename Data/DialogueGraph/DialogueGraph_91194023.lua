-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91194023.lua

return {
	startNodeId = 1,
	dialogueId = 91194023,
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
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					toplogoComList = {
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
						petExchange = true,
						petChat = true,
						npc = true,
						multiPlayer = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 47,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 3,
						portId = "In"
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
						nodeId = 4,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 156,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 152,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 154,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 160,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 162,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 164,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 166,
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
						nodeId = 5,
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
						nodeId = 6,
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
						nodeId = 7,
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
						nodeId = 8,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 142,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 151,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 150,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304614,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 8.62,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 134,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 138,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304616
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
						nodeId = 11,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 132,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 131,
						portId = "In"
					}
				},
				["3"] = {
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
				dialogueIdVInput = 3304618,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 9.88,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 12,
						portId = "In"
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
						nodeId = 13,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 129,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 128,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 130,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304620,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				portCount = 8
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
				},
				["1"] = {
					{
						nodeId = 122,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 128,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 33046201,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5150020,
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
						nodeId = 16,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 118,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 121,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304621
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 17,
						portId = "In"
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
						nodeId = 18,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 113,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 111,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 105,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 112,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304623,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 11.25,
				disableCamera = false,
				chatType = 3
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
						nodeId = 20,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 96,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 103,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 104,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 105,
						portId = "Stop"
					}
				},
				["5"] = {
					{
						nodeId = 106,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304625,
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
				duration = 7.5,
				disableCamera = false,
				chatType = 3
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
						nodeId = 22,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 96,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 94,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 97,
						portId = "In"
					}
				},
				["4"] = {
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
				dialogueIdVInput = 3304626,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 10.5,
				disableCamera = false,
				chatType = 3
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 95,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304627,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
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
						nodeId = 25,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 93,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 94,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304628
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 26,
						portId = "In"
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
						nodeId = 27,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 90,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 91,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 92,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304630,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 11.12,
				disableCamera = false,
				chatType = 3
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
				portCount = 8
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
				},
				["1"] = {
					{
						nodeId = 90,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 82,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304631,
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
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 11.38,
				disableCamera = false,
				chatType = 3
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
						nodeId = 31,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 81,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 74,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 78,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 79,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 80,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304632,
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
				npcId = 5150018,
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
						nodeId = 32,
						portId = "In"
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
						nodeId = 33,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 75,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 74,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 71,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 76,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304633,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 3.88,
				disableCamera = false,
				chatType = 3
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
						nodeId = 35,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 69,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 70,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 71,
						portId = "Stop"
					}
				},
				["4"] = {
					{
						nodeId = 63,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304634,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
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
						nodeId = 36,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304634
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 37,
						portId = "In"
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
						nodeId = 38,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 63,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304637,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 8.5,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 39,
						portId = "In"
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
						nodeId = 40,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 62,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304639,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3
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
						nodeId = 42,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 57,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 59,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 60,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304640,
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
				npcId = 5150019,
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
						nodeId = 43,
						portId = "In"
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
						nodeId = 44,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 48,
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
						nodeId = 45,
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
						nodeId = 46,
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
						nodeId = 47,
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
						nodeId = 49,
						portId = "In"
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
						nodeId = 50,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 51,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 52,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 53,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 54,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 55,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 56,
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
			kind = 20,
			inputs = {
				staticIdVInput = -1688240079,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91202232,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91458350,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91531236,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91531239,
				durationVInput = 0
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
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1063.568,
					247.889,
					-379.909
				},
				rotationVInput = {
					9.932,
					313.94,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193,
				fStop = 11.95,
				cameraId = 91540330,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "EnvBehav_Sing",
				staticIdVInput = 91531236
			},
			fields = {
				templateId = 5150019,
				processingTime = 5,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Love",
				staticIdVInput = 91531239
			},
			fields = {
				templateId = 5150021,
				processingTime = 5.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91531236,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91531236,
				staticIdVInput = -1688240079
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91202232,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Laugh_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
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
			kind = 5,
			inputs = {
				loopDurationVInput = 10,
				playStartLoopEndVInput = true,
				playableStateVInput = "Talk_Shrug_Start",
				staticIdVInput = 91202232
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304635
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
						nodeId = 68,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 63,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304638,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 7.75,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				staticIdVInput = 91202232,
				playStartLoopEndVInput = true,
				playableStateVInput = "PointTo_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
				aniStateList = {
					"PointTo_Start",
					"PointTo_Loop",
					"PointTo_End"
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
				playableStateVInput = "Behav_Happy",
				staticIdVInput = 91531236
			},
			fields = {
				templateId = 5150019,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1688240079,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				templateId = 403,
				processingTime = 5,
				playAniType = 1,
				entityType = 0,
				isLooping = false,
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
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1063.568,
					247.889,
					-379.909
				},
				rotationVInput = {
					9.932,
					304.549,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193,
				fStop = 11.95,
				cameraId = 91540328,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91202232,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
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
			kind = 5,
			inputs = {
				staticIdVInput = 91458350,
				playStartLoopEndVInput = true,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				templateId = 5150020,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
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
				fovVInput = 40,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1063.568,
					247.889,
					-379.909
				},
				rotationVInput = {
					9.932,
					313.94,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193,
				fStop = 11.95,
				cameraId = 91540326,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
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
					-1063.568,
					247.889,
					-379.909
				},
				rotationVInput = {
					9.932,
					304.549,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193,
				fStop = 11.95,
				cameraId = 91540324,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Amazed",
				staticIdVInput = -1688240079
			},
			fields = {
				templateId = 403,
				processingTime = 5,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Talk",
				staticIdVInput = 91202232
			},
			fields = {
				templateId = 5150018,
				processingTime = 3.333,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
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
						nodeId = 83,
						portId = "In"
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
						nodeId = 84,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 80,
						portId = "In"
					}
				}
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
						nodeId = 85,
						portId = "In"
					}
				},
				True = {
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
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1065.834,
					247.75,
					-377.171
				},
				rotationVInput = {
					3.4,
					180.963,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 193,
				fStop = 11.95,
				cameraId = 91540317,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 86,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1065.838,
					247.735,
					-377.434
				},
				rotationVInput = {
					2.541,
					179.416,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91540355,
				visualizeDOF = false
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
					-1065.834,
					247.75,
					-377.171
				},
				rotationVInput = {
					5.463,
					181.822,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 0,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 88,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1065.819,
					247.743,
					-377.456
				},
				rotationVInput = {
					5.978,
					180.103,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91571551,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91202232,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 3.333,
				playAniType = 1,
				entityType = 2,
				isLooping = true,
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
			kind = 26,
			inputs = {
				staticIdVInput = 91458350
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 172,
					portId = "BoneTransform"
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304629
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 10,
				staticIdVInput = 91202232,
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
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1688240079,
				playStartLoopEndVInput = true,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				templateId = 403,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 0,
				isLooping = false,
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
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
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
						nodeId = 99,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 101,
						portId = "In"
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
					-1064.529,
					247.824,
					-379.653
				},
				rotationVInput = {
					4.98,
					303.06,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 0,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 100,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1064.774,
					247.798,
					-379.492
				},
				rotationVInput = {
					4.808,
					304.951,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 0,
				visualizeDOF = false
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
					-1064.526,
					247.726,
					-379.662
				},
				rotationVInput = {
					4.98,
					303.06,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 0,
				visualizeDOF = false
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
				fovVInput = 28,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1064.781,
					247.719,
					-379.544
				},
				rotationVInput = {
					3.777,
					305.81,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 0,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91202232,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Laugh_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91202232,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
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
						nodeId = 107,
						portId = "In"
					}
				},
				True = {
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
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1065.834,
					247.75,
					-377.171
				},
				rotationVInput = {
					3.4,
					180.963,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 0,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				fovVInput = 28,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1065.838,
					247.735,
					-377.434
				},
				rotationVInput = {
					2.541,
					179.416,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 0,
				visualizeDOF = false
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
					-1065.834,
					247.75,
					-377.171
				},
				rotationVInput = {
					5.463,
					181.822,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 0,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 110,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1065.819,
					247.743,
					-377.456
				},
				rotationVInput = {
					5.978,
					180.103,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 0,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1688240079,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				templateId = 403,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 0,
				isLooping = false,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
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
						nodeId = 114,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 116,
						portId = "In"
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
					-1064.529,
					247.824,
					-379.653
				},
				rotationVInput = {
					4.98,
					303.06,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91540308,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 115,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1064.774,
					247.798,
					-379.492
				},
				rotationVInput = {
					4.808,
					304.951,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91540315,
				visualizeDOF = false
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
					-1064.526,
					247.726,
					-379.662
				},
				rotationVInput = {
					4.98,
					303.06,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91571544,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 117,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1064.781,
					247.719,
					-379.544
				},
				rotationVInput = {
					3.777,
					305.81,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91571545,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304622
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 119,
						portId = "In"
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
						nodeId = 120,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 113,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 111,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 103,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 112,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304624,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 3
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
						nodeId = 123,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 122,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 111,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91458350,
				playStartLoopEndVInput = true,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				templateId = 5150020,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
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
						nodeId = 124,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 126,
						portId = "In"
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
					-1065.834,
					247.75,
					-377.171
				},
				rotationVInput = {
					3.4,
					180.963,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91540307,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 125,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1065.838,
					247.735,
					-377.434
				},
				rotationVInput = {
					2.541,
					179.416,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91540323,
				visualizeDOF = false
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
					-1065.834,
					247.75,
					-377.171
				},
				rotationVInput = {
					5.463,
					181.822,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91571518,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 127,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1065.819,
					247.743,
					-377.456
				},
				rotationVInput = {
					5.978,
					180.103,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 143,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 138,
				fStop = 21.39,
				cameraId = 91571533,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91202232,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Talk",
				staticIdVInput = 91202232
			},
			fields = {
				templateId = 5150018,
				processingTime = 3.333,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 129,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91202232,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				entityType = 2,
				isLooping = false,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304617
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 135,
						portId = "In"
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
						nodeId = 136,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 132,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 131,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 137,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304619,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 10.38,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
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
						nodeId = 149,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 142,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 139,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 140,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 141,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 144,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 143,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1688240079,
				targetEulerAngleVInput = {
					0,
					332.031,
					0
				},
				targetPositionVInput = {
					-1065.566,
					246.424,
					-379.207
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							time = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							weightedMode = 0
						},
						{
							time = 1,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							weightedMode = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1688240079,
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91202232,
				staticIdVInput = -1688240079
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Righthand",
				staticIdVInput = 91202232
			},
			fields = {
				templateId = 5150018,
				processingTime = 5.367,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91202232,
				targetEulerAngleVInput = {
					0,
					154.828,
					0
				},
				targetPositionVInput = {
					-1066.039,
					246.422,
					-378.269
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							time = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							weightedMode = 0
						},
						{
							time = 1,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							weightedMode = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						nodeId = 132,
						portId = "In"
					}
				}
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
						nodeId = 145,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 147,
						portId = "In"
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
					-1063.82,
					247.946,
					-380.118
				},
				rotationVInput = {
					10.824,
					306.841,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 248,
				fStop = 21.39,
				cameraId = 91540304,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 146,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1064.034,
					247.894,
					-379.957
				},
				rotationVInput = {
					10.652,
					306.841,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 248,
				fStop = 21.39,
				cameraId = 91540322,
				visualizeDOF = false
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
					-1063.805,
					247.964,
					-380.129
				},
				rotationVInput = {
					12.027,
					305.81,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 248,
				fStop = 21.39,
				cameraId = 91571341,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 148,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1064.137,
					247.877,
					-379.889
				},
				rotationVInput = {
					11.34,
					305.81,
					359.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 191,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 248,
				fStop = 21.39,
				cameraId = 91571342,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91458350
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 173,
					portId = "BoneTransform"
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
			kind = 28,
			inputs = {
				staticIdVInput = 91202232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1068.306,
					249.137,
					-378.276
				},
				rotationVInput = {
					31.971,
					90.994,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 276,
				fStop = 9.19,
				cameraId = 91571325,
				visualizeDOF = false
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
						nodeId = 153,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91202232,
				targetEulerAngleVInput = {
					0,
					88.083,
					0
				},
				targetPositionVInput = {
					-1066.042,
					246.422,
					-378.271
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
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 155,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91458350,
				targetEulerAngleVInput = {
					0,
					123.47,
					0
				},
				targetPositionVInput = {
					-1065.871,
					246.422,
					-377.485
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
				delayTime = 0.5
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-1065.565,
					246.424,
					-379.203
				},
				rotationVInput = {
					0,
					54.286,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1688240079
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
					nodeId = 159,
					portId = "EntityIDs"
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
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					nodeId = 157,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 168,
					portId = "EntityID"
				},
				["3EntityIDVInput"] = {
					nodeId = 169,
					portId = "EntityID"
				},
				["4EntityIDVInput"] = {
					nodeId = 170,
					portId = "EntityID"
				},
				["5EntityIDVInput"] = {
					nodeId = 171,
					portId = "EntityID"
				}
			},
			fields = {
				portCount = 5
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
						nodeId = 161,
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
					-1068.292,
					249.124,
					-377.797
				},
				rotationVInput = {
					31.627,
					97.182,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 276,
				fStop = 9.19,
				cameraId = 91540299,
				visualizeDOF = false
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
						nodeId = 163,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91531236,
				targetEulerAngleVInput = {
					0,
					198.901,
					0
				},
				targetPositionVInput = {
					-1064.72,
					246.42,
					-377.075
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
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 165,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91531239,
				targetEulerAngleVInput = {
					0,
					168.932,
					0
				},
				targetPositionVInput = {
					-1065.414,
					246.425,
					-376.742
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
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 167,
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
					332.031,
					0
				},
				targetPositionVInput = {
					-1065.566,
					246.424,
					-379.207
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
				staticIdVInput = 91458350
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91202232
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91531236
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91531239
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = -1688240079
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			fields = {
				entityType = 0
			}
		}
	}
}
