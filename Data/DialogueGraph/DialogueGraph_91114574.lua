-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91114574.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91114574,
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
			kind = 25,
			fields = {
				condition = {
					"FINISH_GUIDE",
					1100,
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
						nodeId = 3
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 40,
			inputs = {
				guideIdVInput = 1100
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
						nodeId = 5
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
						nodeId = 23
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
						nodeId = 7
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
						nodeId = 62
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 63
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 66
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 67
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
						nodeId = 59
					}
				},
				True = {
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
				dialogueIdVInput = 3707524,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410001,
				matchAudioDuration = true,
				duration = 9.75,
				disableCamera = false
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
						nodeId = 10
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
						nodeId = 53
					}
				},
				["3"] = {
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
				dialogueIdVInput = 3707526,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Story_Talk04",
				skipTime = 0,
				npcStaticId = -218710061,
				npcId = 400129,
				matchAudioDuration = true,
				duration = 7.75,
				disableCamera = false,
				animCfg = {
					[1] = "Story_Talk04",
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
				portCount = 3
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
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707527,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91114225,
				npcId = 400129,
				matchAudioDuration = true,
				duration = 8.25,
				disableCamera = false
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707528,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Story_Talk03",
				skipTime = 0,
				npcStaticId = 91114225,
				npcId = 400129,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				animCfg = {
					[1] = "Story_Talk03",
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
						nodeId = 43
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3707529,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Emotion_Nod",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.5,
				disableCamera = false,
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
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707530,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 10,
				disableCamera = false
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
				portCount = 4
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
						nodeId = 37
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707531,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Emotion_Nod",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400129,
				matchAudioDuration = true,
				duration = 5.25,
				disableCamera = false,
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
						nodeId = 19
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
						nodeId = 20
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 30
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 32
					}
				},
				["3"] = {
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
				dialogueIdVInput = 3707532,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Emotion_Helpless",
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 401086,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false,
				animCfg = {
					[1] = "Emotion_Helpless",
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
						nodeId = 21
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
						nodeId = 22
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 25
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707533,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 401052,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false
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
			kind = 10,
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
			kind = 21,
			inputs = {
				blendTimeVInput = 2.5
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
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 26
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 76707208,
				staticIdVInput = 77239040
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 76707208
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 81
				}
			},
			flowIn = {
				In = 0
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
					49.735,
					60.12,
					1062.642
				},
				rotationVInput = {
					9.46,
					323.822,
					0
				}
			},
			fields = {
				fStop = 6,
				cameraId = 91192859,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 150,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 392
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
				blendTimeVInput = 20,
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					49.623,
					60.12,
					1062.562
				},
				rotationVInput = {
					9.46,
					325.025,
					0
				}
			},
			fields = {
				fStop = 10,
				cameraId = 91192882,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 214,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 420
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91114225
			},
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
			kind = 19,
			inputs = {
				staticIdVInput = 91114225,
				targetEulerAngleVInput = {
					0,
					187.96,
					0
				},
				targetPositionVInput = {
					49.71,
					58.4,
					1080.76
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
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
			kind = 3,
			inputs = {
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					49.872,
					60.712,
					1070.018
				},
				rotationVInput = {
					17.023,
					221.034,
					0
				}
			},
			fields = {
				fStop = 10,
				cameraId = 91179175,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 214,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 420
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					50.12,
					60.74,
					1069.914
				},
				rotationVInput = {
					16.335,
					223.612,
					0
				}
			},
			fields = {
				fStop = 14,
				cameraId = 91165066,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 160,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 173
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 77239040
			},
			valueIn = {
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 81
				}
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 77239040
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 81
				}
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 77239040,
				staticIdVInput = 76707208
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -218710061,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400129,
				processingTime = 2
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
						nodeId = 39
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 77239040
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 76707208
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 77239040
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 86
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 42
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 77239040
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 62
				}
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
					46.21,
					60.255,
					1060.784
				},
				rotationVInput = {
					8.05,
					3.322,
					0
				}
			},
			fields = {
				fStop = 8,
				cameraId = 91165065,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 320,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 640
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				blendTimeVInput = 20,
				fovVInput = 28,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					46.323,
					60.244,
					1060.666
				},
				rotationVInput = {
					7.878,
					2.634,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91179147,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 77239040
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 87
				}
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
			kind = 4,
			fields = {
				delayTime = 0.75
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 77239040
			},
			valueIn = {
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 87
				}
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 76707208
			},
			valueIn = {
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 87
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 49
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 77239040
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 62
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 87
				}
			},
			flowIn = {
				In = 0
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
					47.598,
					59.68,
					1066.464
				},
				rotationVInput = {
					351.411,
					357.512,
					0
				}
			},
			valueIn = {
				dofTargetVInput = {
					portId = "BoneTransform",
					nodeId = 79
				}
			},
			fields = {
				fStop = 12,
				cameraId = 91165042,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 110,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 120
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 51
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					47.7,
					59.68,
					1066.471
				},
				rotationVInput = {
					351.068,
					353.731,
					0
				}
			},
			fields = {
				fStop = 14,
				cameraId = 91179195,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 160,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 173
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91114225,
				playableStateVInput = "Story_Talk04"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400129,
				processingTime = 2.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					49.559,
					60.408,
					1069.529
				},
				rotationVInput = {
					14.788,
					223.544,
					0
				}
			},
			fields = {
				fStop = 8,
				cameraId = 91179132,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 380
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				blendTimeVInput = 20,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					49.84,
					60.091,
					1069.365
				},
				rotationVInput = {
					9.975,
					229.904,
					0
				}
			},
			fields = {
				fStop = 8,
				cameraId = 91179183,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 380
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 77239040
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 76707208
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 58
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91114225,
				staticIdVInput = 77239040
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 62
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707525,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410002,
				matchAudioDuration = true,
				duration = 11.25,
				disableCamera = false
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
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.277,
					60.355,
					1065.791
				},
				rotationVInput = {
					25.789,
					272.944,
					0
				}
			},
			fields = {
				fStop = 8,
				cameraId = 91165051,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 100,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 160
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
				blendTimeVInput = 20,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.345,
					60.331,
					1066.064
				},
				rotationVInput = {
					25.617,
					266.927,
					0
				}
			},
			fields = {
				fStop = 8,
				cameraId = 91179186,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 380
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
					45.247,
					58.4,
					1066.218
				},
				rotationVInput = {
					0,
					77.829,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1078002317
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 62
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 86
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
				delayTime = 1
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
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 86
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 62
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					276.081,
					0
				},
				targetPositionVInput = {
					47.898,
					58.392,
					1066.701
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
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					23.484,
					0
				},
				targetPositionVInput = {
					46.611,
					58.39,
					1065.7
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
		[79] = {
			kind = 17,
			inputs = {
				staticIdVInput = 91114225,
				boneNameVInput = "Bn_Eye_up_L"
			},
			fields = {
				entityType = 2
			}
		},
		[81] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[86] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[87] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	},
	blackboard = {
		myBoolean = false
	}
}
