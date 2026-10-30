-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72140975.lua

return {
	dialogueId = 72140975,
	schema = 1,
	startNodeId = 2,
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
			kind = 22,
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
						nodeId = 5
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
						nodeId = 6
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
					355.794,
					0
				},
				targetPositionVInput = {
					45.796,
					58.355,
					1084.063
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
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
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 13
				}
			},
			fields = {
				nodeMode = 1,
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				cameraPreset = 0,
				reactPreset = 0,
				resetOrientation = true
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
						portId = "In",
						nodeId = 19
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 10
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 16
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 15
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 18
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
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"TWIN_PET_CHOICE",
					nil,
					nil,
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
						portId = "In",
						nodeId = 14
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500029,
				positionVInput = {
					44.87,
					58.355,
					1083.855
				},
				rotationVInput = {
					0,
					23.652,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -583789651
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 133
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 135
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 134
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 149
				},
				["6EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 12
				},
				["7EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 14
				}
			},
			fields = {
				portCount = 7
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500030,
				positionVInput = {
					44.87,
					58.355,
					1083.855
				},
				rotationVInput = {
					0,
					23.652,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1384334087
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk",
				staticIdVInput = 72140915
			},
			fields = {
				templateId = 400129,
				processingTime = 36.267,
				playAniType = 1,
				isLooping = false,
				entityType = 2
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
					44.8,
					60.3,
					1082.72
				},
				rotationVInput = {
					9.21,
					6.3,
					-0.001
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
				cameraId = 73282003
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					44.737,
					60.438,
					1078.607
				},
				rotationVInput = {
					9.21,
					5.526,
					-0.001
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
				cameraId = 73281984
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 72140969
			},
			flowIn = {
				In = 0
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
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 20610487,
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
				duration = 3,
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
						nodeId = 21
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
						portId = "In",
						nodeId = 22
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 123
					}
				},
				["2"] = {
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
				dialogueIdVInput = 20610488,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
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
						portId = "In",
						nodeId = 23
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
						portId = "In",
						nodeId = 24
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 121
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 122
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 20610489,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5,
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
						nodeId = 25
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
						nodeId = 26
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 120
					}
				}
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
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 20610490,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
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
						nodeId = 28
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
						nodeId = 29
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 119
					}
				}
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
						portId = "In",
						nodeId = 30
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206104901,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5,
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
				portCount = 2
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
						portId = "In",
						nodeId = 35
					}
				}
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
						portId = "In",
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206104902,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
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
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 20610491,
				lookAtIdVInput = 400129,
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
				duration = 3,
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
						portId = "closeUIFInput",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					url = "$UI_Img_ItemView_Explorer.png"
				}
			},
			flowIn = {
				closeUIFInput = 1,
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 36
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
						portId = "In",
						nodeId = 37
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 117
					}
				},
				["2"] = {
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
				dialogueIdVInput = 20610492,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 4,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 13,
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
						nodeId = 97
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 103
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 109
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 115
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 20610496,
				animCfg = {
					[1] = "Emotion_Confused",
					[2] = {
						[1] = false,
						[2] = 0
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
						nodeId = 39
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
						portId = "In",
						nodeId = 42
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 40
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 41
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.378,
					60.057,
					1085.096
				},
				rotationVInput = {
					8.7,
					33.2,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73309209
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Smile_Start",
				staticIdVInput = 72140915,
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 400129,
				processingTime = 7.967,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 20610500,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
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
						nodeId = 43
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
						nodeId = 44
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
						portId = "In",
						nodeId = 45
					}
				},
				["1"] = {
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
				dialogueIdVInput = 20610501,
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
				duration = 5,
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
				["1"] = {
					{
						portId = "In",
						nodeId = 88
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 94
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 20610502
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
						portId = "In",
						nodeId = 48
					}
				},
				["1"] = {
					{
						portId = "StopDof",
						nodeId = 85
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 84
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 86
					}
				},
				["4"] = {
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
				dialogueIdVInput = 206105031,
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
				duration = 14,
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
						nodeId = 49
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
						portId = "In",
						nodeId = 50
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
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 73
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 81
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105032,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 13,
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
						portId = "In",
						nodeId = 52
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 73
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 74
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 75
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 79
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 2061050321,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
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
						nodeId = 53
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
						portId = "In",
						nodeId = 54
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 71
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 70
					}
				},
				["3"] = {
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
				dialogueIdVInput = 206105033,
				lookAtIdVInput = 400129,
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
				duration = 14,
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
						portId = "In",
						nodeId = 56
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 69
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 66
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 70
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105034,
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
						nodeId = 57
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
						portId = "In",
						nodeId = 58
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
						portId = "Stop",
						nodeId = 66
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 61
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 67
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105035,
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
						portId = "0",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 2
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
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
			kind = 3,
			inputs = {
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.33,
					60.282,
					1081.489
				},
				rotationVInput = {
					10.2,
					-0.77,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 196,
				fStop = 13.12,
				cameraId = 73310772
			},
			flowIn = {
				In = 0
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
						nodeId = 62
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
						nodeId = 63
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 72138731,
				moveTypeVInput = 2,
				targetPositionVInput = {
					49.282,
					58.355,
					1089.478
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
							outTangent = 1,
							inTangent = 0,
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
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
						portId = "In",
						nodeId = 64
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
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isResetValueInput = true,
				staticIdVInput = 72138731
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Talk_Start",
				staticIdVInput = 72140969,
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 400162,
				processingTime = 22,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_Talk_Start",
					"Story_Talk_Loop",
					"Story_Talk_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 72140969
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 72138731
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					44.796,
					60.04,
					1084.515
				},
				rotationVInput = {
					7.96,
					0.3,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73310434
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk",
				staticIdVInput = 72138731
			},
			fields = {
				templateId = 400406,
				processingTime = 18.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 72138731
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
					44.4,
					59.8,
					1083.8
				},
				rotationVInput = {
					7.6,
					70.1,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 117,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 223,
				fStop = 7.89,
				cameraId = 73310128
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Righthand",
				staticIdVInput = 72140915
			},
			fields = {
				templateId = 400129,
				processingTime = 2.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 72140969
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 72140915
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 72140915,
				targetPositionVInput = {
					49.411,
					58.41,
					1091.022
				}
			},
			fields = {
				reset = true,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
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
						portId = "In",
						nodeId = 77
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
						nodeId = 78
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isResetValueInput = true,
				staticIdVInput = 72140915
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 72140915
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 23,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					44.072,
					60.121,
					1083.705
				},
				rotationVInput = {
					6.4,
					28.8,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 145,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 195,
				fStop = 15.29,
				cameraId = 73310031
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 72140969
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 72138731,
				targetEulerAngleVInput = {
					0,
					236.497,
					0
				},
				targetPositionVInput = {
					46.334,
					58.355,
					1084.738
				}
			},
			fields = {
				setPosition = true,
				reset = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Smile01",
				staticIdVInput = 72140915
			},
			fields = {
				templateId = 400129,
				processingTime = 5.4,
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
				playableStateVInput = "Emotion_Think",
				staticIdVInput = 2
			},
			fields = {
				templateId = 4,
				processingTime = 13.033,
				playAniType = 1,
				isLooping = false,
				entityType = 0
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
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.196,
					59.844,
					1084.99
				},
				rotationVInput = {
					13.4,
					137.9,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73309201
			},
			flowIn = {
				StopDof = 1,
				In = 0
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
					45.21,
					60.282,
					1081.489
				},
				rotationVInput = {
					10.2,
					359.23,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 196,
				fStop = 13.12,
				cameraId = 73311145
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 87
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "Linear",
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.5,
					60.282,
					1081.489
				},
				rotationVInput = {
					10.2,
					359.23,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 196,
				fStop = 13.12,
				cameraId = 73311146
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 20610503
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
						portId = "In",
						nodeId = 92
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
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.378,
					60.057,
					1085.096
				},
				rotationVInput = {
					8.7,
					33.2,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73309210
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Smile_Start",
				staticIdVInput = 72140915,
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 400129,
				processingTime = 7.967,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105036,
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
						nodeId = 93
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
						nodeId = 85
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
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Normal",
				staticIdVInput = 72140915
			},
			fields = {
				templateId = 400129,
				processingTime = 3,
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
				playableStateVInput = "Emotion_Think",
				staticIdVInput = 2
			},
			fields = {
				templateId = 4,
				processingTime = 13.033,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 20610494,
				animCfg = {
					[1] = "Emotion_Excited",
					[2] = {
						[1] = false,
						[2] = 0
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
						nodeId = 98
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
						portId = "In",
						nodeId = 99
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 101
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 102
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 20610498,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
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
						portId = "In",
						nodeId = 100
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
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.378,
					60.057,
					1085.096
				},
				rotationVInput = {
					8.7,
					33.2,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73309095
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Normal",
				staticIdVInput = 72140915
			},
			fields = {
				templateId = 400129,
				processingTime = 3,
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
				dialogueId = 20610495,
				animCfg = {
					[1] = "Emotion_Excited",
					[2] = {
						[1] = false,
						[2] = 0
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
						nodeId = 104
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
						portId = "In",
						nodeId = 107
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 105
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 106
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.378,
					60.057,
					1085.096
				},
				rotationVInput = {
					8.7,
					33.2,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73309110
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_FoldArms",
				staticIdVInput = 72140915
			},
			fields = {
				templateId = 400129,
				processingTime = 7.967,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 20610499,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
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
						nodeId = 108
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
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 20610493,
				animCfg = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End",
					{
						[1] = false,
						[2] = 0
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
						nodeId = 110
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
						portId = "In",
						nodeId = 113
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 111
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 112
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.378,
					60.057,
					1085.096
				},
				rotationVInput = {
					8.7,
					33.2,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73320966
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Smile_Start",
				staticIdVInput = 72140915,
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 400129,
				processingTime = 3.067,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 20610497,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
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
						nodeId = 114
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
						nodeId = 44
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
						nodeId = 116
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
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.196,
					59.844,
					1084.99
				},
				rotationVInput = {
					13.4,
					137.9,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73307735
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk",
				staticIdVInput = 72140915
			},
			fields = {
				templateId = 400129,
				processingTime = 36.267,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.378,
					60.057,
					1085.096
				},
				rotationVInput = {
					8.7,
					33.2,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73309092
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					url = "$UI_Img_ItemView_Stronger.png"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					url = "$UI_Img_ItemView_Scholar.png"
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
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.378,
					60.057,
					1085.096
				},
				rotationVInput = {
					8.7,
					33.2,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73306385
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Nod",
				staticIdVInput = 72140915
			},
			fields = {
				templateId = 400129,
				processingTime = 3.017,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.196,
					59.844,
					1084.99
				},
				rotationVInput = {
					13.4,
					137.9,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73305799
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Cheeksupport",
				staticIdVInput = 2
			},
			fields = {
				templateId = 4,
				processingTime = 5.5,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		[133] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72140915
			},
			fields = {
				entityType = 2
			}
		},
		[134] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[135] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72138731
			},
			fields = {
				entityType = 2
			}
		},
		[149] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72140969
			},
			fields = {
				entityType = 2
			}
		}
	}
}
