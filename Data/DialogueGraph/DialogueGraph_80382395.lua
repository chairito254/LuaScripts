-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_80382395.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 80382395,
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
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 24,
			inputs = {
				switchToPlayerVInput = true,
				switchToLocomotionVInput = true
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
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					hideUIWhiteList = {
						[121] = true
					},
					toplogoComList = {
						chat = true,
						callFriends = true,
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
						combat = true
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
						nodeId = 141
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
						nodeId = 6
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
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 76,
			flowIn = {
				In = 0
			},
			flowOut = {
				fOutput = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 46,
			valueIn = {
				["1"] = {
					portId = "animationCurveVOutput",
					nodeId = 145
				}
			},
			fields = {
				volumeComponentCount = 1,
				volumeParamInfoCount = 1,
				volumeComponents = {
					{
						active = false,
						typeName = "VignetteComponent",
						parameters = {
							m_VignetteColor = {
								valueType = "color",
								overrideState = true,
								value = {
									b = 0,
									g = 0,
									r = 0,
									a = 1
								}
							},
							m_EdgeWidth = {
								value = 0.37,
								valueType = "float",
								overrideState = true
							},
							m_EdgeSoftness = {
								value = 0.3,
								valueType = "float",
								overrideState = true
							},
							m_VignetteAlpha = {
								value = 1,
								valueType = "float",
								overrideState = true
							},
							m_FisheyeFovDeg = {
								value = 0,
								valueType = "float",
								overrideState = true
							},
							m_FollowAspect = {
								value = true,
								valueType = "bool",
								overrideState = true
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "VignetteComponent",
						params = {
							{
								name = "宽度",
								paramIndex = 1
							}
						}
					}
				}
			},
			dynamicInputs = {
				"1"
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
			kind = 2,
			fields = {
				portCount = 9
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 15
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 12
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 14
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 137
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 138
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 139
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 140
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-365.743,
					84.29,
					933.697
				},
				rotationVInput = {
					354.7,
					216.133,
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
				cameraId = 91095591
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
				fovVInput = 31,
				blendExponentVInput = 3,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-365.223,
					84.357,
					931.776
				},
				rotationVInput = {
					356.625,
					239.786,
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
				cameraId = 91095600
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 200001,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-367.091,
					83.621,
					929.704
				},
				rotationVInput = {
					0,
					-68.39,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -754854593
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
			kind = 15,
			inputs = {
				staticIdVInput = 90836997,
				lookAtEntityStaticIdVInput = 79229255
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
					352.84,
					0
				},
				targetPositionVInput = {
					-367.474,
					83.674,
					929.619
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 144
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
						nodeId = 16
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
						nodeId = 17
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 136
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906234,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400204,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = 79229255
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
						nodeId = 19
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 134
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 135
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400180,
				dialogueIdVInput = 3906235,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				portCount = 7
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
						nodeId = 132
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 133
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906236,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400180,
				matchAudioDuration = true,
				duration = 2.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 79229259
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
				portCount = 7
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
				["2"] = {
					{
						portId = "In",
						nodeId = 127
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 125
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 126
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 130
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 131
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906237,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400180,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 79229259
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
				portCount = 5
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
						nodeId = 120
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 122
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 123
					}
				},
				["4"] = {
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
				dialogueIdVInput = 3906327,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 117
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3906328
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
				portCount = 2
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906330,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400204,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 79229255
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
				portCount = 11
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
						nodeId = 31
					}
				},
				["10"] = {
					{
						portId = "In",
						nodeId = 116
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 33
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
						nodeId = 34
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 37
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 39
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 40
					}
				},
				["9"] = {
					{
						portId = "In",
						nodeId = 115
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906332,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 10.12,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-367.144,
					85.454,
					931.125
				},
				rotationVInput = {
					17.389,
					231.775,
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
				cameraId = 90443927
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendExponentVInput = 3,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-367.104,
					85.291,
					931.156
				},
				rotationVInput = {
					17.389,
					231.775,
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
				cameraId = 90448123
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 79229259
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79229255,
				lookAtEntityStaticIdVInput = 79229259
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					-57.12,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						portId = "In",
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk",
				staticIdVInput = 2
			},
			fields = {
				templateId = 4,
				processingTime = 14.167,
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
			kind = 26,
			inputs = {
				staticIdVInput = 79229255,
				targetEulerAngleVInput = {
					0,
					135.7,
					0
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 79229259
			},
			fields = {
				processingTime = 14.167,
				templateId = 400077,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79229259,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
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
						nodeId = 41
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
						nodeId = 42
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-369.62,
					84.613,
					927.86
				},
				rotationVInput = {
					347.137,
					31.286,
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
				cameraId = 90832021
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendExponentVInput = 3,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-369.821,
					84.337,
					927.246
				},
				rotationVInput = {
					347.309,
					29.567,
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
				cameraId = 90832020
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906333,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400180,
				matchAudioDuration = true,
				duration = 4.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 79229259
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
						nodeId = 46
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 110
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
						portId = "In",
						nodeId = 113
					}
				},
				["4"] = {
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
				dialogueIdVInput = 3906208,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				dialogueIdVInput = 3906209,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 50
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 49
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
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 109
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-367.935,
					84.759,
					929.976
				},
				rotationVInput = {
					351.889,
					306.03,
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
				cameraId = 91095861
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 3906212,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400204,
				matchAudioDuration = true,
				duration = 5.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				portCount = 5
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
						nodeId = 52
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 104
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
						portId = "In",
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-366.043,
					85.898,
					929.827
				},
				rotationVInput = {
					353.488,
					337.274,
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
				cameraId = 90832030
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906213,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 4.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				dialogueIdVInput = 3906214,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 10.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 103
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 56
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 101
					}
				},
				["3"] = {
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
				dialogueIdVInput = 3906215,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 3.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				portCount = 3
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
						nodeId = 58
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 100
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906216,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906217,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-367.768,
					84.991,
					929.915
				},
				rotationVInput = {
					9.421,
					265.808,
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
				cameraId = 90445593
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906218,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400180,
				matchAudioDuration = true,
				duration = 10.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 79229259
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
						nodeId = 98
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906220,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 13,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906222,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 69
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
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-366.304,
					85.783,
					930.43
				},
				rotationVInput = {
					345.934,
					333.876,
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
				cameraId = 90832027
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 29,
				blendExponentVInput = 3,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-366.257,
					85.874,
					930.433
				},
				rotationVInput = {
					347.653,
					333.876,
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
				cameraId = 90832028
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906223,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 401059,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906224,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 401059,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				dialogueIdVInput = 3906225,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 401059,
				matchAudioDuration = true,
				duration = 11.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 74
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
						nodeId = 97
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-367.909,
					85.019,
					930.915
				},
				rotationVInput = {
					3.921,
					256.354,
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
				cameraId = 90832032
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 3906226,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400204,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 79229255
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
						nodeId = 77
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 76
					}
				},
				["2"] = {
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
				fovVInput = 25,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-365.904,
					86.006,
					930.267
				},
				rotationVInput = {
					354.003,
					326.102,
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
				cameraId = 90832025
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906227,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 401059,
				matchAudioDuration = true,
				duration = 7.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906228,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 401059,
				matchAudioDuration = true,
				duration = 11,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 81
					}
				},
				["1"] = {
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
				fovVInput = 38,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-367.974,
					84.922,
					930.785
				},
				rotationVInput = {
					359.795,
					266.496,
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
				cameraId = 91095805
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 3906229,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400204,
				matchAudioDuration = true,
				duration = 3.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 79229255
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
				portCount = 4
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
						nodeId = 95
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906230,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 401059,
				matchAudioDuration = true,
				duration = 10,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906238,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 401059,
				matchAudioDuration = true,
				duration = 6.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
						nodeId = 86
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
						nodeId = 87
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
						nodeId = 88
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 93
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 94
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
						nodeId = 89
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
						nodeId = 90
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 23,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 27,
			inputs = {
				closeUIWhenFinishVInput = false
			},
			fields = {
				uid = 121,
				param = {
					3906022,
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
					true
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 92
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
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-370.126,
					85.447,
					926.444
				},
				rotationVInput = {
					6,
					35.877,
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
				cameraId = 91167646
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
					35.877,
					0
				},
				targetPositionVInput = {
					-367.83,
					83.647,
					929.619
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 147
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
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-365.904,
					86.006,
					930.267
				},
				rotationVInput = {
					354.003,
					326.102,
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
				cameraId = 91095807
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_DoubtStart",
				speedVInput = 0.8,
				staticIdVInput = 79229264,
				loopDurationVInput = 66,
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 2.333,
				templateId = 400515,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 79229255
			},
			fields = {
				processingTime = 1.433,
				templateId = 400204,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 3,
			inputs = {
				fovVInput = 42,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-365.491,
					87.046,
					931.876
				},
				rotationVInput = {
					40.585,
					247.721,
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
				cameraId = 90832029
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 50,
				blendExponentVInput = 3,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-367.804,
					84.889,
					930.849
				},
				rotationVInput = {
					30.907,
					296.92,
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
				cameraId = 91118509
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 90836997,
				lookAtEntityStaticIdVInput = 79229255
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 79229264
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				durationVInput = 1,
				targetEulerAngleVInput = {
					0,
					35.8,
					0
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
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-367.665,
					85.512,
					930.805
				},
				rotationVInput = {
					29.704,
					268.73,
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
				cameraId = 90832017
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 79229255,
				durationVInput = 1,
				targetEulerAngleVInput = {
					0,
					-305.7,
					0
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
				staticIdVInput = 79229255,
				lookAtEntityStaticIdVInput = 79229264
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79229259,
				lookAtEntityStaticIdVInput = 79229264
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 79229255,
				targetEulerAngleVInput = {
					0,
					-244.5,
					0
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
				staticIdVInput = 79229255,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Introduce",
				staticIdVInput = 79229255
			},
			fields = {
				templateId = 4,
				processingTime = 3.833,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					-5.825,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						portId = "In",
						nodeId = 111
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Lefthand",
				staticIdVInput = 2
			},
			fields = {
				templateId = 4,
				processingTime = 2.5,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 79229264
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79229255,
				lookAtEntityStaticIdVInput = 79229264
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 79229255,
				durationVInput = 1,
				targetEulerAngleVInput = {
					0,
					-305.7,
					0
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
			kind = 14,
			inputs = {
				staticIdVInput = 79229264,
				targetEulerAngleVInput = {
					0,
					214.3,
					0
				},
				targetPositionVInput = {
					-366.88,
					83.945,
					931.91
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					352.84,
					0
				},
				targetPositionVInput = {
					-367.83,
					83.674,
					929.619
				}
			},
			fields = {
				setRotation = false,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3906329
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
						nodeId = 119
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906331,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400204,
				matchAudioDuration = true,
				duration = 5.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 79229255
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
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-364.613,
					87.723,
					932.201
				},
				rotationVInput = {
					37.491,
					244.799,
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
				cameraId = 90441949
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 121
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendExponentVInput = 3,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-364.668,
					87.776,
					932.487
				},
				rotationVInput = {
					37.835,
					243.596,
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
				cameraId = 90832019
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				durationVInput = 1,
				targetEulerAngleVInput = {
					0,
					35.8,
					0
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
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 79229264
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79229264,
				lookAtEntityStaticIdVInput = 79229259
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Crossingarms_Start",
				animationLayerVInput = 4,
				staticIdVInput = 79229259,
				loopDurationVInput = 99,
				playOnEntityVInput = true,
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 1.5,
				templateId = 400180,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"TalkUpper_Crossingarms_Start",
					"TalkUpper_Crossingarms_Loop",
					"TalkUpper_Crossingarms_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 79229255,
				targetEulerAngleVInput = {
					0,
					-305.7,
					0
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
				staticIdVInput = 79229255,
				lookAtEntityStaticIdVInput = 79229264
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 128
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -754854593,
				targetEulerAngleVInput = {
					0,
					25.557,
					0
				},
				targetPositionVInput = {
					-367.091,
					83.621,
					929.704
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
						nodeId = 129
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -754854593,
				lookAtEntityStaticIdVInput = 79229264
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79229259,
				lookAtEntityStaticIdVInput = 79229264
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendExponentVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-367.667,
					84.831,
					929.982
				},
				rotationVInput = {
					358.688,
					261.271,
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
				cameraId = 91095755
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playOnEntityVInput = true,
				playableStateVInput = "Talk_Righthand",
				staticIdVInput = 79229259,
				loopDurationVInput = 99
			},
			fields = {
				templateId = 400180,
				processingTime = 1.667,
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
				staticIdVInput = 79229259,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79229255,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79229259,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_DoubtStart",
				speedVInput = 0.8,
				staticIdVInput = 79229264,
				loopDurationVInput = 999,
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 2.333,
				templateId = 400515,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 15,
			inputs = {
				staticIdVInput = 79229255,
				lookAtEntityStaticIdVInput = 79229259
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79229259,
				lookAtEntityStaticIdVInput = 79229255
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playOnEntityVInput = true,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start",
				staticIdVInput = 79229255
			},
			fields = {
				processingTime = 1.433,
				templateId = 400204,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 50,
			inputs = {
				enableFillLightVInput = true,
				fillLightIntensityVInput = 10000
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 27,
			inputs = {
				closeUIWhenFinishVInput = false
			},
			fields = {
				uid = 121,
				param = {
					3906022,
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
					true
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 92
					}
				}
			}
		},
		[144] = {
			kind = 17,
			fields = {
				entityType = 0
			}
		},
		[145] = {
			kind = 59,
			fields = {
				animationCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0.006666677,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							value = 0.9999999
						},
						{
							time = 0.2912598,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							value = 0.9981155
						},
						{
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = -1,
							inTangent = -1,
							value = 0
						}
					}
				}
			}
		},
		[147] = {
			kind = 17,
			fields = {
				entityType = 0
			}
		}
	}
}
