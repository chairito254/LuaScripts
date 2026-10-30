-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91046737.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91046737,
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
			kind = 58,
			inputs = {
				waitPlayerIdleVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
						nodeId = 115
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					blockCameraZoom = true,
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
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true
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
						nodeId = 114
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 6
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
						nodeId = 7
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
						nodeId = 8
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 110
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
						portId = "In",
						nodeId = 112
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 113
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
						nodeId = 9
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
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Lefthand",
				staticIdVInput = -2044512716
			},
			fields = {
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400180,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-715.013,
					100.417,
					1637.685
				},
				rotationVInput = {
					0,
					280.53,
					0
				}
			},
			fields = {
				entityId = -1861933095,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 12
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
				dialogueIdVInput = 6201471,
				dialogsetCameraMovementTypeVInput = 2,
				dialogsetCameraMovementTimeVInput = 2,
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
				npcStaticId = -2044512716,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 2.25
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
						nodeId = 15
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
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201472,
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
				npcStaticId = -2044512716,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 8.25
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
						nodeId = 17
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 19
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 108
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
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 46,
			fields = {
				volumeComponentCount = 2,
				volumeParamInfoCount = 2,
				volumeComponents = {
					{
						typeName = "ColorFilterComponent",
						active = false,
						parameters = {
							m_FilterColor = {
								overrideState = true,
								valueType = "color",
								value = {
									r = 0.3764706,
									g = 0.1647059,
									a = 1,
									b = 0.02745098
								}
							},
							m_Brightness = {
								value = 1.5,
								overrideState = true,
								valueType = "float"
							},
							m_Saturation = {
								value = 0.84,
								overrideState = true,
								valueType = "float"
							},
							m_Contrast = {
								value = 1.016,
								overrideState = true,
								valueType = "float"
							},
							m_CullCharacter = {
								value = false,
								overrideState = true,
								valueType = "bool"
							},
							m_ColorFilterAlpha = {
								value = 1,
								overrideState = true,
								valueType = "float"
							}
						}
					},
					{
						typeName = "VignetteComponent",
						active = false,
						parameters = {
							m_VignetteColor = {
								overrideState = true,
								valueType = "color",
								value = {
									r = 0.1019608,
									g = 0.1019608,
									a = 1,
									b = 0.1019608
								}
							},
							m_EdgeWidth = {
								value = 0.488,
								overrideState = true,
								valueType = "float"
							},
							m_EdgeSoftness = {
								value = 0.33,
								overrideState = true,
								valueType = "float"
							},
							m_VignetteAlpha = {
								value = 1,
								overrideState = true,
								valueType = "float"
							},
							m_FisheyeFovDeg = {
								value = 0,
								overrideState = true,
								valueType = "float"
							},
							m_FollowAspect = {
								value = true,
								overrideState = true,
								valueType = "bool"
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "ColorFilterComponent",
						params = {}
					},
					{
						volumeTypeName = "VignetteComponent",
						params = {}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201427,
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
				skipTime = 2,
				npcStaticId = -1,
				npcId = -1,
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
						nodeId = 20
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
						nodeId = 21
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
						portId = "In",
						nodeId = 98
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201474,
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
				skipTime = 1,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 8.88
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
				portCount = 4
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
						nodeId = 86
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
						nodeId = 85
					}
				},
				True = {
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
				dialogueIdVInput = 6201475,
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
				skipTime = 2,
				npcStaticId = -1,
				npcId = 100,
				matchAudioDuration = true,
				duration = 8.38
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
				portCount = 4
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
						nodeId = 84
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201477,
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
				skipTime = 0.3,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 5.5
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
				portCount = 6
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
						nodeId = 82
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 83
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 80
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201478,
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
				npcId = 400062,
				matchAudioDuration = true,
				duration = 10.62
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
				portCount = 4
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
						nodeId = 79
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 81
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 80
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201479,
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
				skipTime = 0.5,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.88
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
				["1"] = {
					{
						portId = "In",
						nodeId = 32
					}
				},
				["2"] = {
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
				dialogueIdVInput = 6201480,
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
				skipTime = 0.3,
				npcStaticId = -1,
				npcId = 400062,
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
						nodeId = 33
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
						nodeId = 34
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201484,
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
				npcId = 400062,
				matchAudioDuration = true,
				duration = 4.25
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
						nodeId = 37
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
			kind = 5,
			inputs = {
				playableStateVInput = "Fragrance_Green",
				staticIdVInput = -2044512716
			},
			fields = {
				processingTime = 9.333,
				playAniType = 1,
				isLooping = true,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				Stop = 1,
				In = 0
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
						nodeId = 40
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 72
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 71
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 74
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
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
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-716.454,
					101.815,
					1634.067
				},
				rotationVInput = {
					4.329,
					11.209,
					-0.001
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91142347,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201485,
				enableFadeInVInput = true,
				enableFadeOutVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 9,
				portCount = 1,
				skipTime = 0.7,
				npcStaticId = -1,
				npcId = 400062,
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
						nodeId = 41
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
						nodeId = 42
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 67
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
						portId = "In",
						nodeId = 70
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 68
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 69
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201486,
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
				npcStaticId = -2044512716,
				npcId = 400204,
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
						nodeId = 43
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
						nodeId = 46
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 44
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 64
					}
				},
				["5"] = {
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
				staticIdVInput = -1861933095,
				playStartLoopEndVInput = true,
				playableStateVInput = "Story_Akimbo01_Start"
			},
			fields = {
				processingTime = 2.733,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400180,
				aniStateList = {
					"Story_Akimbo01_Start",
					"Story_Akimbo01_Loop",
					"Story_Akimbo01_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-718.495,
					102.075,
					1636.796
				},
				rotationVInput = {
					9.486,
					74.636,
					-0.001
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91063723,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201489,
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
				npcStaticId = -1861933095,
				npcId = 400180,
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
						nodeId = 47
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
						nodeId = 48
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
						nodeId = 61
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 62
					}
				},
				["4"] = {
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
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 6201490,
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
				npcStaticId = -2044512716,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 4.75
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
				portCount = 6
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
						nodeId = 50
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 51
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 52
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1861933095,
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Excited_Start"
			},
			fields = {
				processingTime = 2.733,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400180,
				aniStateList = {
					"Emotion_Excited_Start",
					"Emotion_Excited_Loop",
					"Emotion_Excited_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-718.495,
					102.075,
					1636.796
				},
				rotationVInput = {
					9.486,
					74.636,
					-0.001
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91142228,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1861933095,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201491,
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
				npcStaticId = -1861933095,
				npcId = 400180,
				matchAudioDuration = true,
				duration = 10.12
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
						nodeId = 55
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
						portId = "In",
						nodeId = 56
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
						nodeId = 57
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
						nodeId = 58
					}
				},
				["1"] = {
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1861933095,
				staticIdVInput = -2044512716
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-716.097,
					101.75,
					1635.971
				},
				rotationVInput = {
					2.095,
					351.958,
					-0.001
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91142354,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -2044512716,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -2044512716,
				playStartLoopEndVInput = true,
				animationLayerVInput = 4,
				playableStateVInput = "TalkUpper_Cheeksupport_Start"
			},
			fields = {
				processingTime = 1.333,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204,
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
			kind = 28,
			inputs = {
				staticIdVInput = -2044512716
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1861933095,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1861933095,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -2044512716
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 49,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -2044512716,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Lefthand",
				staticIdVInput = -2044512716
			},
			fields = {
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 49,
			valueIn = {
				effectIdVInput = {
					portId = "EffectID",
					nodeId = 108
				},
				generatorIdVInput = {
					portId = "GeneratorID",
					nodeId = 108
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -2044512716,
				isFadeInVInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 73
					}
				}
			}
		},
		{
			kind = 46,
			fields = {
				volumeComponentCount = 1,
				volumeParamInfoCount = 1,
				volumeComponents = {
					{
						typeName = "ColorFilterComponent",
						active = false,
						parameters = {
							m_FilterColor = {
								overrideState = false,
								valueType = "color",
								value = {
									r = 0.3764706,
									g = 0.1647059,
									a = 1,
									b = 0.02745098
								}
							},
							m_Brightness = {
								value = 1,
								overrideState = true,
								valueType = "float"
							},
							m_Saturation = {
								value = 1,
								overrideState = true,
								valueType = "float"
							},
							m_Contrast = {
								value = 1,
								overrideState = true,
								valueType = "float"
							},
							m_CullCharacter = {
								value = false,
								overrideState = true,
								valueType = "bool"
							},
							m_ColorFilterAlpha = {
								value = 1,
								overrideState = true,
								valueType = "float"
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "ColorFilterComponent",
						params = {}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-142.768,
					209.019,
					1611.246
				},
				rotationVInput = {
					40.082,
					321.212,
					359.992
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91142213,
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
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-142.745,
					209.134,
					1611.094
				},
				rotationVInput = {
					39.738,
					326.197,
					359.992
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91142214,
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
			kind = 3,
			inputs = {
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-156.781,
					186.929,
					1648.319
				},
				rotationVInput = {
					347.7,
					176.123,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91140154,
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
						nodeId = 78
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-156.852,
					187.186,
					1647.3
				},
				rotationVInput = {
					348.559,
					174.748,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91141714,
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
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-145.36,
					189.769,
					1637.409
				},
				rotationVInput = {
					349.203,
					254.287,
					-0.006
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91140153,
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
			kind = 5,
			inputs = {
				speedVInput = 0.9,
				playStartLoopEndVInput = true,
				playableStateVInput = "EnvBehav_Firm_Start",
				staticIdVInput = -1455450214
			},
			fields = {
				processingTime = 1.1,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400513,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1455450214,
				targetPositionVInput = {
					-156.326,
					187.408,
					1641.123
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
			kind = 5,
			inputs = {
				playableStateVInput = "Fly_Idle",
				staticIdVInput = -1503234424
			},
			fields = {
				processingTime = 2,
				playAniType = 1,
				isLooping = true,
				entityType = 2,
				templateId = 504001
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_NPC_IrisTectorum_guangqiu_red.prefab",
				postionVInput = {
					-156.236,
					187.939,
					1640.633
				}
			},
			fields = {
				playOne = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1503234424,
				targetEulerAngleVInput = {
					0,
					352.91,
					0
				},
				targetPositionVInput = {
					-155.565,
					186.786,
					1632.058
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201476,
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
				skipTime = 2,
				npcStaticId = -1,
				npcId = 100,
				matchAudioDuration = true,
				duration = 9.75
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
						nodeId = 87
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Skill_Breath",
				staticIdVInput = -1503234424
			},
			fields = {
				processingTime = 4.133,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 504001
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
						nodeId = 91
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 89
					}
				},
				["2"] = {
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
				delayTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 90
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				speedVInput = 1.2,
				staticIdVInput = -1455450214,
				playableStateVInput = "Skill_Charge01"
			},
			fields = {
				processingTime = 3.083,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400513
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 92
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_10025_Skill_Ex_05.prefab",
				postionVInput = {
					-155.73,
					185.24,
					1634.96
				},
				rotationVInput = {
					-18,
					-29,
					0
				}
			},
			fields = {
				playOne = true
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
						nodeId = 94
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_10025_Skill_Ex_05.prefab",
				postionVInput = {
					-155.73,
					185.24,
					1634.96
				},
				rotationVInput = {
					-18,
					-29,
					0
				}
			},
			fields = {
				playOne = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-157.256,
					187.391,
					1642.79
				},
				rotationVInput = {
					346.625,
					163.809,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91063693,
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
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.9
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-155.924,
					188.278,
					1639.82
				},
				rotationVInput = {
					19.155,
					343.369,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91063726,
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
			kind = 20,
			inputs = {
				staticIdVInput = -2044512716
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
						nodeId = 100
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 6,
				fovVInput = 22,
				blendFuncVInput = "EaseOut",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-150.687,
					194.239,
					1626.355
				},
				rotationVInput = {
					23.924,
					333.247,
					359.993
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91140157,
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
						nodeId = 102
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-150.12,
					190,
					1625.212
				},
				rotationVInput = {
					11.205,
					333.936,
					359.993
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91142052,
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
						nodeId = 103
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 504001,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-155.721,
					186.812,
					1630.928
				},
				rotationVInput = {
					0,
					7.9,
					0
				}
			},
			fields = {
				entityId = -1503234424,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 105
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
						portId = "In",
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1503234424,
				targetEulerAngleVInput = {
					0,
					7.9,
					0
				},
				targetPositionVInput = {
					-155.721,
					186.812,
					1630.928
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
						nodeId = 107
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1503234424,
				staticIdVInput = -1455450214
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Item_GodFeather.prefab",
				postionVInput = {
					-143.301,
					208.384,
					1611.791
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-716.097,
					101.75,
					1635.971
				},
				rotationVInput = {
					2.095,
					351.958,
					-0.001
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91142275,
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
			kind = 16,
			inputs = {
				slotParamVInput = 400204,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-716.319,
					100.498,
					1637.75
				},
				rotationVInput = {
					0,
					137.522,
					0
				}
			},
			fields = {
				entityId = -2044512716,
				ignoreGravity = false
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
					-716.397,
					100.259,
					1636.726
				},
				rotationVInput = {
					0,
					349.2,
					0
				}
			},
			fields = {
				entityId = -1700948505,
				ignoreGravity = false
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
					322.458,
					0
				},
				targetPositionVInput = {
					-715.759,
					100.298,
					1637.017
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 133
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
			kind = 16,
			inputs = {
				slotParamVInput = 400513,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-156.326,
					186.613,
					1641.123
				},
				rotationVInput = {
					0,
					182.4,
					0
				}
			},
			fields = {
				entityId = -1455450214,
				ignoreGravity = true
			},
			flowIn = {
				In = 0
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
						nodeId = 55
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-716.454,
					101.815,
					1634.067
				},
				rotationVInput = {
					4.329,
					11.209,
					-0.001
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91391549,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[133] = {
			kind = 17,
			fields = {
				entityType = 0
			}
		}
	}
}
