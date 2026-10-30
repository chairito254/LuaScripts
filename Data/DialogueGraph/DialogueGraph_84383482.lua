-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_84383482.lua

return {
	dialogueId = 84383482,
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
					hideMarkShare = true,
					hideInteractionSign = false,
					toplogoComList = {
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
						alert = true,
						chat = true,
						callFriends = true,
						bubble = true
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
						nodeId = 50
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
				portCount = 3
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
						nodeId = 78
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 84
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
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3710160,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 5,
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
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3710161,
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
				duration = 3,
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
						nodeId = 9
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710162
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
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3710165,
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
				duration = 5,
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
						nodeId = 11
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 75
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710166
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 3710168,
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
				npcId = -1,
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
						portId = "In",
						nodeId = 72
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 73
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 74
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3710169,
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
				duration = 4,
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
						nodeId = 15
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710170
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 3710172,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 5,
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
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3710173,
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
				duration = 4,
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
						nodeId = 18
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 70
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710174
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
						nodeId = 21
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 20
					}
				}
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
					-1433.67,
					86.118,
					580.646
				},
				rotationVInput = {
					17.504,
					338.446,
					-0.002
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 84824345,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
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
						nodeId = 69
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 22
					}
				}
			}
		},
		{
			kind = 57,
			valueIn = {
				petEntIdVInput = {
					portId = "EntityID",
					nodeId = 83
				},
				playerEntIdVInput = {
					portId = "EntityID",
					nodeId = 82
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					222.203,
					0
				},
				targetPositionVInput = {
					-1435.451,
					82.959,
					592.604
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 83
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
						nodeId = 24
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
						nodeId = 68
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 57,
			inputs = {
				switchToPetVInput = false
			},
			valueIn = {
				petEntIdVInput = {
					portId = "EntityID",
					nodeId = 83
				},
				playerEntIdVInput = {
					portId = "EntityID",
					nodeId = 82
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				portCount = 6
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
						portId = "In",
						nodeId = 63
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 29
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 64
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 65
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 66
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
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3710176,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2.8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 30
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
						portId = "In",
						nodeId = 31
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
						nodeId = 32
					}
				},
				["3"] = {
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
				delayTime = 1.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 33
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
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3710177,
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
				duration = 4,
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
						nodeId = 35
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710178
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3710180,
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
				npcId = -1,
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
						portId = "In",
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3710181,
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
				npcId = -1,
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
						portId = "In",
						nodeId = 38
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
						nodeId = 39
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 60
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3710182,
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
						nodeId = 40
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
			kind = 7,
			fields = {
				dialogueId = 3710183
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
				portCount = 2
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
						nodeId = 58
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3710185,
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
				npcId = -1,
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
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3710186,
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
				duration = 6,
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 57
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710187
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
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3710189,
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
				duration = 8,
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 56
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710190
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3710192,
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
				npcId = -1,
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
						portId = "In",
						nodeId = 48
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3710193,
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
				duration = 6,
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 55
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710194
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
				portCount = 4
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
				["3"] = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3710196,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5
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
				delayTime = 1
			},
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
			kind = 21,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710195
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
			kind = 7,
			fields = {
				dialogueId = 3710191
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
			kind = 7,
			fields = {
				dialogueId = 3710188
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
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1394.419,
					25.038,
					497.351
				},
				rotationVInput = {
					357.565,
					267.114,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 84827105,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710184
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
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1394.419,
					25.038,
					497.351
				},
				rotationVInput = {
					357.565,
					273.2,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 84827108,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710179
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
			kind = 3,
			inputs = {
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1394.419,
					25.038,
					497.351
				},
				rotationVInput = {
					357.565,
					267.114,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 84827095,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					216.844,
					0
				},
				targetPositionVInput = {
					-1438.584,
					82.568,
					588.888
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 83
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
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							outWeight = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							outWeight = 0,
							time = 1
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
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-1399.36,
					24.14,
					496.769
				},
				rotationVInput = {
					0,
					304.812,
					0
				}
			},
			fields = {
				entityId = -1160100547,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 3,
				positionVInput = {
					-1400.61,
					24.224,
					497.612
				},
				rotationVInput = {
					0,
					123.13,
					0
				}
			},
			fields = {
				entityId = -1272504769,
				ignoreGravity = false
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
						nodeId = 67
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "FallLoop_FromRun",
				staticIdVInput = -845045647
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 500157,
				processingTime = 1,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 82
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Link"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 82
				}
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 3,
				processingTime = 1.667,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3710175
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
			kind = 7,
			fields = {
				dialogueId = 3710171
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 16
					}
				}
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
					-1434.104,
					84.148,
					592.964
				},
				rotationVInput = {
					0.315,
					268.1,
					-0.002
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 84661832,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 82
				},
				faceTransVInput = {
					portId = "BoneTrans",
					nodeId = 83
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
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 83
				},
				faceTransVInput = {
					portId = "BoneTrans",
					nodeId = 82
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
			kind = 7,
			fields = {
				dialogueId = 3710167
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueId = 3710163
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 3710164,
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
				npcId = -1,
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
						nodeId = 10
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
						nodeId = 79
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
						nodeId = 80
					}
				}
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
						nodeId = 81
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
				["2"] = {
					{
						portId = "In",
						nodeId = 82
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 83
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-1435.451,
					82.959,
					592.604
				},
				rotationVInput = {
					0,
					222.203,
					0
				}
			},
			fields = {
				entityId = -1855385500,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 3,
				positionVInput = {
					-1436.93,
					83.265,
					593.69
				},
				rotationVInput = {
					0,
					210.869,
					0
				}
			},
			fields = {
				entityId = -845045647,
				ignoreGravity = false
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
						nodeId = 85
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
					-1426.828,
					85.742,
					597.106
				},
				rotationVInput = {
					358.94,
					234.627,
					-0.003
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 84657677,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
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
				fovVInput = 40,
				blendTimeVInput = 60,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1427.673,
					85.752,
					598.354
				},
				rotationVInput = {
					2.722,
					224.36,
					-0.003
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90836316,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		}
	}
}
