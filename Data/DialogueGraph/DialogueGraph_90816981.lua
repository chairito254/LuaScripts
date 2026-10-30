-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90816981.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 90816981,
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					toplogoComList = {
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
						vlog = true,
						teamSpeech = true,
						quest = true,
						photo = true,
						petFertility = true
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
						nodeId = 5
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
						nodeId = 7
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					url = "$UI_Img_ItemView_Home_3.png"
				}
			},
			flowIn = {
				closeUIFInput = 1,
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
						nodeId = 10
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
						nodeId = 66
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 67
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
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
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6510023,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6510024,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
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
				portCount = 7
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
						portId = "closeUIFInput",
						nodeId = 6
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
						nodeId = 64
					}
				},
				["4"] = {
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
				dialogueIdVInput = 6510025,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
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
						nodeId = 16
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 55
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 57
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 58
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6510026,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
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
				portCount = 5
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
						nodeId = 50
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 52
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 53
					}
				},
				["4"] = {
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
				dialogueIdVInput = 6510027,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
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
						nodeId = 46
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 48
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 49
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6510028,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
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
				portCount = 5
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
						nodeId = 42
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 43
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6510029,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
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
				portCount = 3
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
						nodeId = 39
					}
				},
				["2"] = {
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
				dialogueIdVInput = 6510030,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
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
				portCount = 6
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
						nodeId = 38
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 35
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 36
					}
				},
				["5"] = {
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
				dialogueIdVInput = 6510031,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6510035,
				enableFadeInVInput = true,
				enableFadeOutVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2
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
				portCount = 3
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
						nodeId = 33
					}
				},
				["2"] = {
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
				dialogueIdVInput = 6510033,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6510034,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 8.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2
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
						nodeId = 1
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90820276,
				playableStateVInput = "TalkUpper_Like"
			},
			fields = {
				templateId = 990010,
				processingTime = 1.1,
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
				blendFuncVInput = "EaseOut",
				fovVInput = 25,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1.005,
					1.47,
					-52.501
				},
				rotationVInput = {
					8.822,
					53.944,
					0
				}
			},
			fields = {
				focalDistance = 175,
				fStop = 15,
				cameraId = 90964292,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 120,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Firm_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 90820276
			},
			fields = {
				templateId = 990010,
				processingTime = 1.1,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"TalkUpper_Firm_Start",
					"TalkUpper_Firm_Loop",
					"TalkUpper_Firm_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 90820276
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 90925517,
				lookAtEntityStaticIdVInput = 90820276
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					2.423,
					1.251,
					-49.654
				},
				rotationVInput = {
					2.29,
					50.163,
					0
				}
			},
			fields = {
				focalDistance = 175,
				fStop = 15,
				cameraId = 90964293,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 160,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				templateId = 401,
				processingTime = 3,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					0.016,
					1.884,
					-55.864
				},
				rotationVInput = {
					7.791,
					21.973,
					0
				}
			},
			fields = {
				focalDistance = 670,
				fStop = 4,
				cameraId = 91123046,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				fovVInput = 30,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-0.592,
					2.092,
					-55.505
				},
				rotationVInput = {
					8.65,
					29.533,
					0
				}
			},
			fields = {
				focalDistance = 670,
				fStop = 4,
				cameraId = 90919050,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
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
				staticIdVInput = 90925505
			},
			fields = {
				templateId = 990012,
				processingTime = 0.833,
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
				staticIdVInput = 90925505,
				lookAtEntityStaticIdVInput = 90820276
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 90820276
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
					2.973,
					1.29,
					-49.953
				},
				rotationVInput = {
					0.743,
					310.468,
					0
				}
			},
			fields = {
				focalDistance = 88,
				fStop = 16.05,
				cameraId = 90919035,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 167,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					2.356,
					1.331,
					-49.368
				},
				rotationVInput = {
					5.384,
					60.82,
					0
				}
			},
			fields = {
				focalDistance = 120,
				fStop = 25,
				cameraId = 90850860,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 193,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 0.5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					2.485,
					1.316,
					-49.322
				},
				rotationVInput = {
					4.525,
					60.304,
					0
				}
			},
			fields = {
				focalDistance = 120,
				fStop = 25,
				cameraId = 90850877,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 193,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90820276,
				playableStateVInput = "TalkUpper_Smile01"
			},
			fields = {
				templateId = 990010,
				processingTime = 0.833,
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
				staticIdVInput = 90820276,
				lookAtEntityStaticIdVInput = 90925505
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					2.323,
					2.034,
					-50.828
				},
				rotationVInput = {
					26.011,
					355.159,
					0
				}
			},
			fields = {
				focalDistance = 233,
				fStop = 15,
				cameraId = 90850849,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 220,
				recombineQuality = 0,
				openDof = true
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
				fovVInput = 25,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					2.323,
					2.034,
					-50.828
				},
				rotationVInput = {
					28.417,
					355.503,
					0
				}
			},
			fields = {
				focalDistance = 233,
				fStop = 15,
				cameraId = 90936424,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 220,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Confused_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 90925505
			},
			fields = {
				templateId = 990012,
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"TalkUpper_Confused_Start",
					"TalkUpper_Confused_Loop",
					"TalkUpper_Confused_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 90925505,
				lookAtEntityStaticIdVInput = 90925515
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 90925515
			},
			fields = {
				templateId = 990013,
				processingTime = 0.833,
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
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					2.233,
					1.142,
					-48.665
				},
				rotationVInput = {
					3.322,
					155.702,
					0
				}
			},
			fields = {
				focalDistance = 233,
				fStop = 15,
				cameraId = 90850796,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 269,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 56
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					2.259,
					1.028,
					-48.633
				},
				rotationVInput = {
					7.275,
					150.717,
					0
				}
			},
			fields = {
				focalDistance = 233,
				fStop = 15,
				cameraId = 90850814,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 269,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Laugh_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 90925517
			},
			fields = {
				templateId = 990016,
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"TalkUpper_Laugh_Start",
					"TalkUpper_Laugh_Loop",
					"TalkUpper_Laugh_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 90925517,
				lookAtEntityStaticIdVInput = 90925519
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 59
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
						nodeId = 60
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 90925517,
				lookAtEntityStaticIdVInput = 90925505
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 90925519
			},
			fields = {
				templateId = 990039,
				processingTime = 0.833,
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
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-2.884,
					2.453,
					-52.52
				},
				rotationVInput = {
					10.541,
					64.601,
					0
				}
			},
			fields = {
				focalDistance = 672,
				fStop = 4,
				cameraId = 90850282,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 63
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-3.103,
					2.283,
					-52.05
				},
				rotationVInput = {
					9.682,
					68.211,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 90919009,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Firm_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 90925505
			},
			fields = {
				templateId = 990012,
				processingTime = 0.833,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"TalkUpper_Firm_Start",
					"TalkUpper_Firm_Loop",
					"TalkUpper_Firm_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 90925505,
				lookAtEntityStaticIdVInput = 90925517
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 90925517
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 90820276,
				lookAtEntityStaticIdVInput = 90925517
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					41.979,
					0
				},
				targetPositionVInput = {
					2.261,
					0.003,
					-50.385
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
							value = 0,
							outTangent = 1,
							inTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							time = 0
						},
						{
							value = 1,
							outTangent = 0,
							inTangent = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		}
	}
}
