-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91029930.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91029930,
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
			kind = 22,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
						callFriends = true,
						bubble = true
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
			kind = 45,
			inputs = {
				timelineResIdVInput = "$P_TL_Water_P15_PutOutToSeaArrive.prefab"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 24
					}
				},
				PreFinish = {
					{
						portId = "In",
						nodeId = 5
					}
				},
				StartPlay = {
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
				portCount = 3
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
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 22,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 52,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-650.44,
					102.692,
					350.064
				},
				rotationVInput = {
					350.753,
					331.976,
					0.008
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91370102
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 60,
				blendTimeVInput = 6,
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-648.1,
					103.1,
					345.3
				},
				rotationVInput = {
					4.5,
					333.352,
					0.008
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91370127
			},
			flowIn = {
				In = 0
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
						nodeId = 18
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 10
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
						nodeId = 12
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 11
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
						nodeId = 13
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 14
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 15
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 16
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
					338.6,
					0
				},
				targetPositionVInput = {
					-648.987,
					101.47,
					346.006
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
				staticIdVInput = 91028816,
				targetEulerAngleVInput = {
					0,
					290.8,
					0
				},
				targetPositionVInput = {
					-648.765,
					101.47,
					348.278
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
				staticIdVInput = 91028814,
				targetEulerAngleVInput = {
					0,
					214.173,
					0
				},
				targetPositionVInput = {
					-649.317,
					101.489,
					349.351
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
				staticIdVInput = 91028818,
				targetEulerAngleVInput = {
					0,
					40.718,
					0
				},
				targetPositionVInput = {
					-650.99,
					101.47,
					348.616
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
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91028818,
				lookAtEntityStaticIdVInput = 91028816
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
						nodeId = 22
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
					-648.1,
					103.1,
					345.3
				},
				rotationVInput = {
					4.5,
					333.352,
					0.008
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91568633
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 2
			},
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 25
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
						nodeId = 26
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 90
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 92
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 6
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
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["1"] = {
					{
						portId = "In",
						nodeId = 30
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				blendTimeVInput = 2,
				cameraMovementFuncVInput = 0,
				cameraMovementModeVInput = 1,
				cameraMovementAxisVInput = {
					1,
					1,
					0
				},
				cameraMovementVectorVInput = {
					-1,
					0,
					-1
				},
				positionVInput = {
					-649.08,
					102.75,
					345.6
				},
				rotationVInput = {
					6.4,
					349.52,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91370228
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				blendTimeVInput = 24,
				cameraMovementFuncVInput = 0,
				cameraMovementModeVInput = 1,
				cameraMovementAxisVInput = {
					1,
					1,
					0
				},
				cameraMovementVectorVInput = {
					-1,
					0,
					-1
				},
				positionVInput = {
					-649.25,
					102.75,
					345.8
				},
				rotationVInput = {
					6.4,
					352.3,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91567598
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516005,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 3.25,
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
						nodeId = 31
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
				["2"] = {
					{
						portId = "Stop",
						nodeId = 89
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516006,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				anim = "Excited_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120101,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				animCfg = {
					"Excited_Start",
					"Excited_Loop",
					"Excited_End",
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
						nodeId = 33
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 87
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516007
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
				dialogueIdVInput = 6516009,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "Talk_Lefthand_Start",
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 9.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
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
						portId = "In",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 65160091,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "Talk_Introduce",
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 9.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				animCfg = {
					[1] = "Talk_Introduce",
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
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 65160092,
				lookAtIdVInput = 5120100,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "EnvBehav_Point",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true,
				duration = 5.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				animCfg = {
					[1] = "EnvBehav_Point",
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
						nodeId = 37
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
						nodeId = 38
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
						nodeId = 39
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 81
					}
				},
				["2"] = {
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
				delayTime = 2
			},
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516010,
				lookAtIdVInput = 5120102,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
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
						nodeId = 73
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 77
					}
				},
				["3"] = {
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
				dialogueIdVInput = 6516011,
				disablePresetLookAtVInput = true,
				lookAtIdVInput = -1,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
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
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 65160110,
				disablePresetLookAtVInput = true,
				lookAtIdVInput = -1,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
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
						portId = "In",
						nodeId = 74
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 44
					}
				},
				ShowFinOut = {
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
				dialogueId = 6516013
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
				dialogueIdVInput = 6516015,
				lookAtIdVInput = 5120101,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
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
						portId = "In",
						nodeId = 46
					}
				},
				ShowFinOut = {
					{
						portId = "Stop",
						nodeId = 73
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516016,
				lookAtIdVInput = 5120102,
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
				npcId = 5120101,
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
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516017,
				lookAtIdVInput = 5120101,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "Behav_DoubtStart",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true,
				duration = 2.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
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
						nodeId = 48
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 72
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
						nodeId = 49
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516018,
				disablePresetLookAtVInput = true,
				lookAtIdVInput = 5120102,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "Emotion_Firm_Start",
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 9.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				animCfg = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End",
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
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516019,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
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
						portId = "In",
						nodeId = 51
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 65160190,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "Emotion_Nod",
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 4.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				animCfg = {
					[1] = "Emotion_Nod",
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
						nodeId = 52
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
						nodeId = 53
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 67
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516020,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 6,
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
						nodeId = 54
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516021,
				lookAtIdVInput = 5120102,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 8.38,
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
						nodeId = 55
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 68
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
						nodeId = 56
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 67
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516022,
				lookAtIdVInput = 5120102,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "Excited_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120101,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				animCfg = {
					"Excited_Start",
					"Excited_Loop",
					"Excited_End",
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
						nodeId = 57
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516023,
				lookAtIdVInput = 5120100,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "Talk",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true,
				duration = 2.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
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
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 66
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516024,
				lookAtIdVInput = 5120102,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "Emotion_Nod",
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				animCfg = {
					[1] = "Emotion_Nod",
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
						nodeId = 59
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
						nodeId = 62
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 60
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
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				cameraMovementFuncVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					2,
					0,
					2
				},
				positionVInput = {
					-650.3,
					102.6,
					349.1
				},
				rotationVInput = {
					-3.24,
					128.53,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				blendTimeVInput = 18,
				cameraMovementFuncVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					2,
					0,
					2
				},
				positionVInput = {
					-650.2,
					102.6,
					349.2
				},
				rotationVInput = {
					-3.24,
					132.6,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91568651
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 65160240,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				anim = "Talk_Shrug_Start",
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
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
						nodeId = 63
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6516025,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 2.75,
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
						nodeId = 64
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
						nodeId = 18
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
					334,
					0
				},
				targetPositionVInput = {
					-650.094,
					101.47,
					347.937
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
			kind = 15,
			inputs = {
				staticIdVInput = 91028816,
				lookAtEntityStaticIdVInput = 91028818
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Praise_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91028816
			},
			fields = {
				templateId = 5120100,
				processingTime = 1.267,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Praise_Start",
					"Praise_Loop",
					"Praise_End"
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
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				blendTimeVInput = 2,
				cameraMovementFuncVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					2,
					0,
					2
				},
				positionVInput = {
					-651.691,
					102.4,
					350.415
				},
				rotationVInput = {
					2.3,
					134.62,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91568339
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 69
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 42,
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				blendTimeVInput = 12,
				cameraMovementFuncVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					2,
					0,
					2
				},
				positionVInput = {
					-651.8,
					102.2,
					350.2
				},
				rotationVInput = {
					-1.4,
					128.3,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91568340
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				cameraMovementFuncVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					2,
					0,
					2
				},
				positionVInput = {
					-650.3,
					102.6,
					349.1
				},
				rotationVInput = {
					-3.24,
					128.53,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91568250
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				blendTimeVInput = 18,
				cameraMovementFuncVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					2,
					0,
					2
				},
				positionVInput = {
					-650.2,
					102.6,
					349.2
				},
				rotationVInput = {
					-3.24,
					132.6,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91568262
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91028816,
				lookAtEntityStaticIdVInput = 91028818
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Relax_Start",
				loopDurationVInput = 6,
				playStartLoopEndVInput = true,
				staticIdVInput = 91028816
			},
			fields = {
				templateId = 5120100,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_Relax_Start",
					"Story_Relax_Loop",
					"Story_Relax_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516012
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 6516014,
				lookAtIdVInput = 5120101,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91028816,
				npcId = 5120100,
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
						portId = "In",
						nodeId = 46
					}
				},
				ShowFinOut = {
					{
						portId = "Stop",
						nodeId = 73
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Righthand",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				templateId = 301,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Talk_Righthand",
					"Talk_Righthand",
					"Talk_Righthand"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91028816
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				cameraMovementFuncVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					2,
					0,
					2
				},
				positionVInput = {
					-651.15,
					101.58,
					351
				},
				rotationVInput = {
					-17.5,
					153.3,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91370229
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 79
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 42,
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				blendTimeVInput = 20,
				cameraMovementFuncVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					2,
					0,
					2
				},
				positionVInput = {
					-651.3,
					101.75,
					350
				},
				rotationVInput = {
					-16.5,
					139.4,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91568107
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementTimeVInput = 24,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementExpVInput = 0,
				cameraMovementFuncVInput = 0,
				cameraMovementModeVInput = 2,
				cameraMovementTypeVInput = 1,
				cameraMovementAxisVInput = {
					1,
					1,
					0
				},
				cameraMovementVectorVInput = {
					1,
					0,
					1
				},
				positionVInput = {
					-655.139,
					103.489,
					361.705
				},
				rotationVInput = {
					13.271,
					341.642,
					0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91567668
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
						nodeId = 82
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 83
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
						nodeId = 85
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
					353.496,
					0
				},
				targetPositionVInput = {
					-650.094,
					101.47,
					347.937
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
				staticIdVInput = 91028816,
				targetEulerAngleVInput = {
					0,
					308.833,
					0
				},
				targetPositionVInput = {
					-649.194,
					101.47,
					348.381
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
				staticIdVInput = 91028814,
				targetEulerAngleVInput = {
					0,
					198.911,
					0
				},
				targetPositionVInput = {
					-649.572,
					101.472,
					349.142
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
				staticIdVInput = 91028818,
				targetEulerAngleVInput = {
					0,
					91.199,
					0
				},
				targetPositionVInput = {
					-650.799,
					101.47,
					348.602
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
						nodeId = 86
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91028818,
				lookAtEntityStaticIdVInput = 91028816
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6516008
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				templateId = 301,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Praise_Start",
				loopDurationVInput = 9,
				playStartLoopEndVInput = true,
				staticIdVInput = 91028816
			},
			fields = {
				templateId = 5120100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Praise_Start",
					"Praise_Loop",
					"Praise_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				autoPathfindingVInput = true,
				maxLimitTimeVInput = 20,
				targetEulerAngleVInput = {
					0,
					338.6,
					0
				},
				targetPositionVInput = {
					-649.614,
					101.47,
					347.338
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "PointTo_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91028816
			},
			fields = {
				templateId = 5120100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"PointTo_Start",
					"PointTo_Loop",
					"PointTo_End"
				}
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
						nodeId = 89
					}
				}
			}
		}
	}
}
