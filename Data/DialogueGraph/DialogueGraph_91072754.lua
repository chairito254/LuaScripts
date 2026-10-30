-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91072754.lua

return {
	dialogueId = 91072754,
	schema = 1,
	startNodeId = 2,
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					applyStateConflict = true,
					toplogoComList = {
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
						vlog = true,
						teamSpeech = true,
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true
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
						nodeId = 1
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
						nodeId = 5
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 61
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 65
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 68
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 69
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
						nodeId = 6
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
						nodeId = 7
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
						nodeId = 8
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5
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
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				speedVInput = 1.3,
				playableStateVInput = "Story_LookAround02",
				staticIdVInput = 2
			},
			fields = {
				templateId = 403,
				processingTime = 9.767,
				playAniType = 1,
				isLooping = false,
				entityType = 0
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start",
				staticIdVInput = 2
			},
			fields = {
				entityType = 0,
				templateId = 3,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
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
				delayTime = 5
			},
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
						nodeId = 15
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
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6710054,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.88,
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
						nodeId = 16
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
						nodeId = 17
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
						nodeId = 51
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 52
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 53
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 54
					}
				},
				["7"] = {
					{
						portId = "Stop",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6710055,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 5,
				npcStaticId = -1,
				npcId = 5170100,
				matchAudioDuration = true,
				duration = 6.75,
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
						nodeId = 18
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
						nodeId = 19
					}
				},
				["1"] = {
					{
						portId = "closeUIFInput",
						nodeId = 43
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 44
					}
				},
				["5"] = {
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
				dialogueIdVInput = 6710056,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.12,
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
						nodeId = 40
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 39
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 42
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6710057,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5170100,
				matchAudioDuration = true,
				duration = 11.5,
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
						nodeId = 22
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
						nodeId = 23
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
						nodeId = 27
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 39
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6710058,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2.75,
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
						nodeId = 31
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
						portId = "Stop",
						nodeId = 27
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 28
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 30
					}
				}
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
					-158.895,
					25.588,
					276.236
				},
				rotationVInput = {
					4.937,
					152.637,
					0.021
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 131,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 145,
				fStop = 12.69,
				cameraId = 91146138
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
					-158.749,
					25.561,
					275.954
				},
				rotationVInput = {
					4.25,
					153.497,
					0.021
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 131,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 145,
				fStop = 12.69,
				cameraId = 91150111
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start",
				staticIdVInput = 2
			},
			fields = {
				entityType = 0,
				templateId = 4,
				processingTime = 1.967,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Expect",
				entityIdVInput = -1634834815
			},
			fields = {
				activePlayEmotion = true,
				noBlink = true,
				activePlayLip = false
			},
			flowIn = {
				StopEmotion = 1,
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
						portId = "StopEmotion",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 2,
				playableStateVInput = "Talk_Lefthand",
				staticIdVInput = -1634834815
			},
			fields = {
				templateId = 5170100,
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
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 6710059,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5170100,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 33
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
						nodeId = 34
					}
				},
				["1"] = {
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
				dialogueIdVInput = 6710060,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5170100,
				matchAudioDuration = true,
				duration = 7.25,
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
						nodeId = 35
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
						nodeId = 36
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 1,
				playableStateVInput = "Daily_Invite_Start",
				staticIdVInput = -1634834815
			},
			fields = {
				entityType = 2,
				templateId = 5170100,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Daily_Invite_Start",
					"Daily_Invite_Loop",
					"Daily_Invite_End"
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
					-158.759,
					25.593,
					274.542
				},
				rotationVInput = {
					2.3,
					19.11,
					0.02
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 131,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 145,
				fStop = 12.69,
				cameraId = 91149931
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 2,
				playableStateVInput = "Talk_Cheeksupport_Start",
				staticIdVInput = -1634834815
			},
			fields = {
				entityType = 2,
				templateId = 5170100,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Talk_Cheeksupport_Start",
					"Talk_Cheeksupport_Loop",
					"Talk_Cheeksupport_End"
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
					-159.08,
					25.579,
					276.682
				},
				rotationVInput = {
					6.597,
					145.296,
					0.021
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 129,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 6.1,
				cameraId = 91145916
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
				fovVInput = 35,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-158.94,
					25.55,
					276.48
				},
				rotationVInput = {
					7.112,
					146.327,
					0.021
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 129,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 173,
				fStop = 6.1,
				cameraId = 91149939
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Greet02",
				staticIdVInput = 2
			},
			fields = {
				templateId = 3,
				processingTime = 0,
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
			kind = 27,
			fields = {
				uid = 306,
				param = {
					style = 0,
					title = "CHARACTER_APPEARANCE_DESC_XIXI",
					name = "CHARACTER_APPEARANCE_NAME_XIXI",
					pos = {
						1650,
						-200,
						0
					}
				}
			},
			flowIn = {
				closeUIFInput = 1,
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
					-158.852,
					25.552,
					273.638
				},
				rotationVInput = {
					5.6,
					22.93,
					0.02
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 129,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 139,
				fStop = 8.6,
				cameraId = 91145952
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				fovVInput = 35,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-158.755,
					25.572,
					273.909
				},
				rotationVInput = {
					5.6,
					22.93,
					0.02
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 129,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 139,
				fStop = 8.6,
				cameraId = 91149998
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
					-158.984,
					25.391,
					275.859
				},
				rotationVInput = {
					0.468,
					135.104,
					0.02
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 86,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 90,
				fStop = 10.94,
				cameraId = 91145762
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
				fovVInput = 35,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-158.984,
					25.39,
					275.859
				},
				rotationVInput = {
					0.5,
					142.32,
					0.02
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 86,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 90,
				fStop = 10.94,
				cameraId = 91145769
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 3.5,
				staticIdVInput = -1634834815,
				targetEulerAngleVInput = {
					0,
					1.969,
					0
				},
				targetPositionVInput = {
					-158.238,
					24.273,
					274.569
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0,
							outTangent = 1,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							outTangent = 0,
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
						portId = "In",
						nodeId = 49
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
				["1"] = {
					{
						portId = "In",
						nodeId = 43
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial03",
				staticIdVInput = -1634834815
			},
			fields = {
				templateId = 5170100,
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
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					177.558,
					0
				},
				targetPositionVInput = {
					-158.299,
					24.27,
					275.918
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
			kind = 19,
			inputs = {
				staticIdVInput = -722733682,
				targetEulerAngleVInput = {
					0,
					323.299,
					0
				},
				targetPositionVInput = {
					-157.404,
					24.285,
					274.039
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0,
							outTangent = 1,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							outTangent = 0,
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
			kind = 19,
			inputs = {
				staticIdVInput = -2108004219,
				targetEulerAngleVInput = {
					0,
					304.972,
					0
				},
				targetPositionVInput = {
					-156.828,
					24.3,
					274.654
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0,
							outTangent = 1,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							outTangent = 0,
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
			kind = 28,
			inputs = {
				staticIdVInput = -1634834815
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
					-159.793,
					25.651,
					275.965
				},
				rotationVInput = {
					3.67,
					73.26,
					0.02
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 131,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 145,
				fStop = 12.69,
				cameraId = 91145651
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
					-159.385,
					25.625,
					276.088
				},
				rotationVInput = {
					1.951,
					73.603,
					0.02
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 131,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 145,
				fStop = 12.69,
				cameraId = 91145703
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5170100,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-157.829,
					24.263,
					271.574
				},
				rotationVInput = {
					0,
					14.919,
					0
				}
			},
			fields = {
				entityId = -1634834815,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 710026,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-156.375,
					24.24,
					271.416
				},
				rotationVInput = {
					0,
					334.411,
					0
				}
			},
			fields = {
				entityId = -722733682,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 710027,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-155.66,
					24.22,
					271.994
				},
				rotationVInput = {
					0,
					307.639,
					0
				}
			},
			fields = {
				entityId = -2108004219,
				ignoreGravity = false
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
					232.743,
					0
				},
				targetPositionVInput = {
					-158.203,
					24.279,
					276.444
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0,
							outTangent = 1,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							outTangent = 0,
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
						nodeId = 62
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
						nodeId = 63
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
						nodeId = 64
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
					200.22,
					0
				},
				targetPositionVInput = {
					-157.1,
					24.336,
					279.047
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
				delayTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 66
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
					-157.833,
					25.506,
					279.706
				},
				rotationVInput = {
					1.328,
					199.046,
					0.019
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 221,
				fStop = 20.81,
				cameraId = 91149786
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				fovVInput = 40,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-157.686,
					25.535,
					278.115
				},
				rotationVInput = {
					2.4,
					209.188,
					0.019
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 194,
				fStop = 17.46,
				cameraId = 91149787
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 50,
			inputs = {
				fillLightIntensityVInput = 14367,
				enableFillLightVInput = true
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
						nodeId = 70
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 501018,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-160.7,
					24.24,
					274.91
				},
				rotationVInput = {
					0,
					113.57,
					0
				}
			},
			fields = {
				entityId = -1464805727,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		}
	}
}
