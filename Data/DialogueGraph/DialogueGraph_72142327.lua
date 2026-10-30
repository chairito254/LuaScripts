-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72142327.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 72142327,
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 8
				}
			},
			fields = {
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 1,
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				cameraPreset = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FOut = {
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
						nodeId = 5
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 16
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 136
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 135
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
						nodeId = 6
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
						nodeId = 12
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500029,
				positionVInput = {
					44.793,
					58.355,
					1084.458
				},
				rotationVInput = {
					0,
					101.159,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -519591505
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
					nodeId = 141
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 143
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 142
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 144
				},
				["6EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 7
				},
				["7EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 12
				}
			},
			fields = {
				portCount = 7
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Surprise"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 500029,
				processingTime = 4.367
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500030,
				positionVInput = {
					44.793,
					58.355,
					1084.458
				},
				rotationVInput = {
					0,
					101.159,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -762286021
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 12
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 12
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Surprise_Start",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 12
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 500030,
				processingTime = 0.5,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				In = 0
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
						nodeId = 17
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
				reset = false,
				setRotation = true,
				setPosition = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105037,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
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
						nodeId = 59
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 133
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 206105038
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				["3"] = {
					{
						portId = "In",
						nodeId = 57
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 56
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
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 14,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 54
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 49
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 55
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
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 13,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
				portCount = 8
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
						portId = "Stop",
						nodeId = 49
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 47
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 48
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 53
					}
				},
				["5"] = {
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
				dialogueIdVInput = 2061050321,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 28
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 44
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 46
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
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 14,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 30
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 43
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 40
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 44
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
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
				portCount = 8
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
						nodeId = 34
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 40
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 35
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 41
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 42
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
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "0",
						nodeId = 33
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
				["1"] = 0,
				["0"] = 0
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
				openDof = true,
				focalDistance = 196,
				fStop = 13.12,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0
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
						nodeId = 36
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
						nodeId = 37
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
				reset = true,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							weightedMode = 0,
							time = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
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
						nodeId = 38
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
						nodeId = 39
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
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Talk_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 72140969
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400162,
				processingTime = 22,
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
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73601810,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0
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
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400406,
				processingTime = 18.5
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
				openDof = true,
				focalDistance = 223,
				fStop = 7.89,
				cameraId = 73446777,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 117,
				recombineQuality = 0
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
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Righthand",
				staticIdVInput = 72140915
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400129,
				processingTime = 2.5
			},
			flowIn = {
				Stop = 1,
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
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							weightedMode = 0,
							time = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
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
						nodeId = 51
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
						nodeId = 52
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
				openDof = true,
				focalDistance = 195,
				fStop = 15.29,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 145,
				recombineQuality = 0
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Smile_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 72140915
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400129,
				processingTime = 7.967,
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
				openDof = true,
				focalDistance = 196,
				fStop = 13.12,
				cameraId = 73321770,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 58
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 35,
				blendFuncVInput = "Linear",
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
					-0.77,
					-0.001
				}
			},
			fields = {
				openDof = true,
				focalDistance = 196,
				fStop = 13.12,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 206105039
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
						portId = "In",
						nodeId = 61
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 131
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 130
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 129
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 132
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105040,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
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
						nodeId = 64
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 206105042
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
			kind = 7,
			fields = {
				dialogueId = 20610641
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
						nodeId = 66
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 124
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 123
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 126
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 127
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 128
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105044,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 13,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 68
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 122
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 121
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105045,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 70
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 116
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 120
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 117
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 121
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105046,
				lookAtIdVInput = 400129,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 72
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 112
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 114
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105047,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 4,
				portCount = 1
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
				portCount = 8
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
				["2"] = {
					{
						portId = "In",
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105053,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 107
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 76
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
						nodeId = 77
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
						nodeId = 10
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 105
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105054,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 78
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
						nodeId = 79
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105055,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 80
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
						nodeId = 81
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 104
					}
				},
				["2"] = {
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
				dialogueIdVInput = 206105057,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 83
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
						nodeId = 100
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 102
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105058,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 84
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
						nodeId = 85
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 99
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 100
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 101
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105059,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 86
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
						nodeId = 89
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 87
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
					59.8,
					1084.99
				},
				rotationVInput = {
					9.6,
					141.7,
					-0.001
				}
			},
			fields = {
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73329781,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Nod",
				staticIdVInput = 2
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 4,
				processingTime = 3.017
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105060,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 90
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
						nodeId = 93
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 91
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
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					44.837,
					59.884,
					1083.958
				},
				rotationVInput = {
					15.2,
					73.1,
					-0.003
				}
			},
			fields = {
				openDof = true,
				focalDistance = 196,
				fStop = 13.12,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 72138731
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400406,
				processingTime = 7.117,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105061,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 94
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
						nodeId = 97
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 95
					}
				},
				["3"] = {
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
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0
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
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400129,
				processingTime = 3
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105062,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 10,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueId = 206105063
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 21
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
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73329775,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused",
				staticIdVInput = 2
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 4,
				processingTime = 6.433
			},
			flowIn = {
				Stop = 1,
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
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400129,
				processingTime = 3
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Talk_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 72140969
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400162,
				processingTime = 22,
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
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.058,
					59.809,
					1084.726
				},
				rotationVInput = {
					10.4,
					127.1,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 112,
				fStop = 13.12,
				cameraId = 73602011,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 48,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					44.662,
					59.96,
					1084.471
				},
				rotationVInput = {
					7.7,
					17.1,
					-0.003
				}
			},
			fields = {
				openDof = true,
				focalDistance = 140,
				fStop = 13.99,
				cameraId = 73328952,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 308,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 55,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.846,
					59.107,
					1084.9
				},
				rotationVInput = {
					9.5,
					243.8,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 112,
				fStop = 9.78,
				cameraId = 73601615,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 270,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Worried_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 72138731
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400406,
				processingTime = 2.5,
				aniStateList = {
					"Emotion_Worried_Start",
					"Emotion_Worried_Loop",
					"Emotion_Worried_End"
				}
			},
			flowIn = {
				Stop = 1,
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
						portId = "In",
						nodeId = 108
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 13
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 14
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 111
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105054,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 109
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
						nodeId = 110
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 206105056,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 80
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 55,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					45.846,
					59.107,
					1084.9
				},
				rotationVInput = {
					9.5,
					243.8,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 112,
				fStop = 9.78,
				cameraId = 73598781,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 270,
				recombineQuality = 0
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
						nodeId = 113
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
					44.837,
					59.884,
					1083.958
				},
				rotationVInput = {
					15.2,
					73.1,
					-0.003
				}
			},
			fields = {
				openDof = true,
				focalDistance = 168,
				fStop = 13.12,
				cameraId = 73328556,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0
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
						portId = "Stop",
						nodeId = 115
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_GiveSmile_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 4,
				processingTime = 1.7,
				aniStateList = {
					"Story_GiveSmile_Start",
					"Story_GiveSmile_Loop",
					"Story_GiveSmile_End"
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
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					46.286,
					59.75,
					1085.707
				},
				rotationVInput = {
					10.429,
					188.098,
					-0.003
				}
			},
			fields = {
				openDof = true,
				focalDistance = 140,
				fStop = 15.21,
				cameraId = 73328553,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 308,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 72138731,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 118
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
						nodeId = 119
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 72140915,
				staticIdVInput = 2
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
						nodeId = 115
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Greet",
				staticIdVInput = 72138731
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400406,
				processingTime = 4.9
			},
			flowIn = {
				Stop = 1,
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
					44.837,
					59.884,
					1083.958
				},
				rotationVInput = {
					15.2,
					73.1,
					-0.003
				}
			},
			fields = {
				openDof = true,
				focalDistance = 168,
				fStop = 13.12,
				cameraId = 73328222,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Helpless",
				staticIdVInput = 72140915
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400129,
				processingTime = 3.317
			},
			flowIn = {
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
				openDof = true,
				focalDistance = 196,
				fStop = 13.12,
				cameraId = 73321772,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 125
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 20,
				fovVInput = 35,
				blendFuncVInput = "Linear",
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
					-0.77,
					-0.001
				}
			},
			fields = {
				openDof = true,
				focalDistance = 196,
				fStop = 13.12,
				cameraId = 73321773,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 227,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 72140915,
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
				staticIdVInput = 72138731
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think",
				staticIdVInput = 2
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 4,
				processingTime = 13.033
			},
			flowIn = {
				Stop = 1,
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
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400129,
				processingTime = 3
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
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73320997,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0
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
				reset = true,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
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
						nodeId = 134
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 129
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 135
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
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73320967,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0
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
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400129,
				processingTime = 3
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
				openDof = true,
				focalDistance = 108,
				fStop = 13.12,
				cameraId = 73320778,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 238,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[141] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72140915
			},
			fields = {
				entityType = 2
			}
		},
		[142] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[143] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72138731
			},
			fields = {
				entityType = 2
			}
		},
		[144] = {
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
