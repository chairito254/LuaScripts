-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_73144572.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 73144572,
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 113
				}
			},
			fields = {
				enableGroupLookAt = false,
				enableDefaultLookAt = true,
				cameraPreset = 0,
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 1
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
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
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
						portId = "End",
						nodeId = 0
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
						portId = "In",
						nodeId = 5
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
						nodeId = 6
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
						nodeId = 7
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 109
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 110
					}
				}
			}
		},
		{
			kind = 24,
			inputs = {
				switchToPetVInput = true,
				switchToLocomotionVInput = true
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
						nodeId = 12
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 9
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 107
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 108
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
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
			kind = 3,
			inputs = {
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-226.696,
					98.217,
					718.663
				},
				rotationVInput = {
					9.595,
					98.721,
					0
				}
			},
			fields = {
				fStop = 16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 150
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-225.538,
					98.018,
					718.485
				},
				rotationVInput = {
					9.767,
					98.721,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 271
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
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
			kind = 23,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 3801442,
				defaultSkipBranchVInput = 1,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 0,
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801443
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
						nodeId = 105
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801445,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 5.62,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801448,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 18,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801449,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 20
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
						nodeId = 104
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801450,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 3.62,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 22
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
						nodeId = 23
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 103
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801451,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 3.25,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 25
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 102
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 4709214,
				defaultSkipBranchVInput = 1,
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
				npcId = 500079,
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
						portId = "In",
						nodeId = 26
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 101
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801452
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 3801454,
				defaultSkipBranchVInput = 1,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 28
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 100
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801455
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
				dialogueIdVInput = 3801457,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 17,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 30
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
						nodeId = 31
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 99
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801458,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801460,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 10.75,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801461,
				defaultSkipBranchVInput = 1,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 34
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 98
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801462
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 2
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
						nodeId = 97
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801464,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_ITEMS",
					913195,
					nil,
					">=",
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
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 4709216
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 39
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 4709217,
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
				npcId = 500079,
				matchAudioDuration = true,
				duration = 3.12,
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
						portId = "In",
						nodeId = 40
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 4709218,
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
				npcId = 500079,
				matchAudioDuration = true,
				duration = 2,
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
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 4709215,
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
				npcId = 500080,
				matchAudioDuration = true,
				duration = 2.12,
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
						portId = "In",
						nodeId = 43
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
						nodeId = 44
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 94
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
				dialogueIdVInput = 3801473,
				defaultSkipBranchVInput = 1,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 6.25,
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
						portId = "In",
						nodeId = 45
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 93
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801474
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 46
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
						portId = "In",
						nodeId = 47
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
						nodeId = 48
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
						nodeId = 49
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 92
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 90
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
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
			kind = 23,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 3
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 52
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 54
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-227.241,
					99.052,
					719.715
				},
				rotationVInput = {
					32.8,
					238.054,
					0
				}
			},
			fields = {
				fStop = 16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 150
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-228.588,
					98.435,
					718.857
				},
				rotationVInput = {
					31.425,
					236.85,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 91393832,
				visualizeDOF = false,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 271
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					233.447,
					0
				},
				targetPositionVInput = {
					-230.648,
					95.485,
					717.4
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
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							outTangent = 0,
							inTangent = 1,
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
						nodeId = 56
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
						nodeId = 57
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 86
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3801476,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
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
						portId = "In",
						nodeId = 58
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801477,
				defaultSkipBranchVInput = 1,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 7.75,
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
						portId = "In",
						nodeId = 59
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 85
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801478
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 60
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
						nodeId = 61
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
						nodeId = 62
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 84
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
						nodeId = 66
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
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Behav_Happy"
			},
			fields = {
				templateId = 1032100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 72890041,
				playableStateVInput = "Behav_Happy"
			},
			fields = {
				templateId = 500079,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
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
						nodeId = 67
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3801480,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 5.38,
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
						nodeId = 69
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
						nodeId = 70
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
						portId = "In",
						nodeId = 82
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801481,
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
				npcId = -1,
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
						portId = "In",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801641,
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
				npcId = 400253,
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
						portId = "In",
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801642,
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
				npcId = 400253,
				matchAudioDuration = true,
				duration = 11.25,
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
						portId = "In",
						nodeId = 73
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
						nodeId = 74
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3801482,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 75
					}
				}
			}
		},
		{
			kind = 65,
			inputs = {
				zoomVInput = 0.6,
				controlRotationVInput = {
					15.018,
					312.045,
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 12,
			inputs = {
				resumeNpcVInput = false
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
						nodeId = 79
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 72890041,
				durationVInput = 0.3
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-231.212,
					96.567,
					717.903
				},
				rotationVInput = {
					13.72,
					205.051,
					0
				}
			},
			fields = {
				fStop = 16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 150
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 81
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-231.355,
					96.484,
					717.596
				},
				rotationVInput = {
					13.72,
					205.051,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 271
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -1810115976,
				playableStateVInput = "Emotion_Smile_Start"
			},
			fields = {
				processingTime = 3.433,
				templateId = 400253,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Emotion_Smile_Start",
					"Emotion_Smile_Loop",
					"Emotion_Smile_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1810115976,
				playableStateVInput = "Talk_Shrug"
			},
			fields = {
				templateId = 400253,
				processingTime = 3.433,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					215.288,
					0
				},
				targetPositionVInput = {
					-229.939,
					95.444,
					716.74
				}
			},
			fields = {
				reset = false,
				setRotation = false,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801479
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				playStartLoopEndVInput = true,
				staticIdVInput = -1810115976,
				playableStateVInput = "Daily_Thanks_Start"
			},
			fields = {
				processingTime = 0,
				templateId = 400253,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Daily_Thanks_Start",
					"Daily_Thanks_Loop",
					"Daily_Thanks_End"
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
				fovVInput = 46,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-229.905,
					97.405,
					720.445
				},
				rotationVInput = {
					17.845,
					205.911,
					0
				}
			},
			fields = {
				fStop = 16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 150
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 89
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-230.107,
					97.256,
					720.029
				},
				rotationVInput = {
					17.845,
					205.911,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 91393831,
				visualizeDOF = false,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 271
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400253,
				positionVInput = {
					-232.051,
					95.06,
					716.378
				},
				rotationVInput = {
					0,
					48.879,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1810115976
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 72890041,
				targetEulerAngleVInput = {
					0,
					53.158,
					0
				},
				targetPositionVInput = {
					-231.87,
					94.986,
					714.939
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
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					233.447,
					0
				},
				targetPositionVInput = {
					-229.795,
					95.485,
					718.033
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
			kind = 7,
			fields = {
				dialogueId = 3801475
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 46
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-225.538,
					98.018,
					718.485
				},
				rotationVInput = {
					9.767,
					98.721,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 271
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 72890041,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				processingTime = 0,
				templateId = 500079,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-225.077,
					97.452,
					718.455
				},
				rotationVInput = {
					3.597,
					111.11,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 91393830,
				visualizeDOF = false,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 271
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 72890041,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				processingTime = 0,
				templateId = 500079,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801463
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial02",
				staticIdVInput = 72890041,
				loopDurationVInput = 50
			},
			fields = {
				templateId = 500079,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801456
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
			kind = 7,
			fields = {
				dialogueId = 3801453
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-225.538,
					98.018,
					718.485
				},
				rotationVInput = {
					9.767,
					98.721,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 271
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-225.077,
					97.452,
					718.455
				},
				rotationVInput = {
					3.597,
					111.11,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 91393829,
				visualizeDOF = false,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 271
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendExponentVInput = 0,
				fovVInput = 46,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-225.077,
					97.452,
					718.455
				},
				rotationVInput = {
					358.269,
					81.03,
					0.001
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 91393828,
				visualizeDOF = false,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 271
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 72890041,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				processingTime = 0,
				templateId = 500079,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801444
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
			kind = 5,
			inputs = {
				staticIdVInput = 72890041,
				playableStateVInput = "Behav_Happy"
			},
			fields = {
				templateId = 500079,
				processingTime = 0,
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
				staticIdVInput = 72890045,
				playableStateVInput = "Idle"
			},
			fields = {
				templateId = 500190,
				processingTime = 4,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					114.82,
					0
				},
				targetPositionVInput = {
					-223.253,
					96.762,
					718.708
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 111
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
				staticIdVInput = 72890041,
				targetEulerAngleVInput = {
					0,
					293.569,
					0
				},
				targetPositionVInput = {
					-221.601,
					96.869,
					718.009
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
			kind = 17,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 72890041
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
					nodeId = 112
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 114
				}
			},
			fields = {
				portCount = 2
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		}
	}
}
