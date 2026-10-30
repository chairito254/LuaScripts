-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_80541074.lua

return {
	dialogueId = 80541074,
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
					resetAllActions = true,
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
						nodeId = 113
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
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 12
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
						nodeId = 229
					}
				},
				["10"] = {
					{
						portId = "In",
						nodeId = 238
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 232
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 10
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 233
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 234
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 235
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 236
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 237
					}
				},
				["9"] = {
					{
						portId = "In",
						nodeId = 239
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
						nodeId = 8
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
			kind = 14,
			inputs = {
				targetPositionVInput = {
					-506.72,
					53.192,
					837.079
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 246
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
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-504.065,
					56.302,
					834.504
				},
				rotationVInput = {
					13.235,
					319.672,
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
				cameraId = 86990905
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
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-502.977,
					56.207,
					835.684
				},
				rotationVInput = {
					17.396,
					313.59,
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
				cameraId = 86993736
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400180,
				positionVInput = {
					-507.419,
					53.117,
					836.787
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1242132750
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Shock"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 10
				}
			},
			fields = {
				templateId = 400204,
				processingTime = 1.433,
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
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 10
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
						nodeId = 14
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
						nodeId = 15
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
						nodeId = 16
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 228
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202118,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 2,
				npcId = 0,
				matchAudioDuration = true,
				duration = 9.38,
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
				["2"] = {
					{
						portId = "In",
						nodeId = 225
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 227
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 226
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202119,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
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
						nodeId = 19
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
						nodeId = 20
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 224
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 221
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 222
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 223
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202120,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 7.5,
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
				portCount = 7
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
						nodeId = 218
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 215
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 213
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 214
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 219
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 220
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				lookAtIdVInput = 400204,
				dialogueIdVInput = 6202121,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0.5,
				npcStaticId = -1242132750,
				npcId = 400180,
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
						nodeId = 23
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 210
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6202122
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
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202124,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 6.88,
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
						nodeId = 26
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = false
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
				portCount = 5
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
						nodeId = 28
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 208
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 209
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
					-506.823,
					54.53,
					838.478
				},
				rotationVInput = {
					9.192,
					186.445,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 139,
				fStop = 14.69,
				cameraId = 84420830
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400204,
				dialogueIdVInput = 6202126,
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
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.12,
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
						nodeId = 30
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
						nodeId = 33
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 31
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Introduce"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 229
				}
			},
			fields = {
				templateId = 400204,
				processingTime = 2.667,
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
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-506.879,
					54.506,
					837.033
				},
				rotationVInput = {
					12.286,
					331.862,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 554,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 70,
				fStop = 16.28,
				cameraId = 91398753
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202127,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 9.12,
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
				dialogueIdVInput = 6202128,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
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
						nodeId = 36
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 206
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 207
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				disableLipMotionVInput = true,
				dialogueIdVInput = 6202129,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 7.88,
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
						nodeId = 37
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 203
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6202130
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
						nodeId = 39
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 201
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 199
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 202
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202132,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 5.75,
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
						nodeId = 41
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 198
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202134,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 3.5,
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
						nodeId = 42
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
						nodeId = 44
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
						nodeId = 43
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 196
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 197
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
					-506.749,
					54.57,
					838.663
				},
				rotationVInput = {
					10.224,
					188.164,
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
				fStop = 10.77,
				cameraId = 84406399
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400062,
				dialogueIdVInput = 6202135,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1242132750,
				npcId = 400180,
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
						nodeId = 45
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401077,
				dialogueIdVInput = 6202136,
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
				npcId = 0,
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
						nodeId = 46
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
						nodeId = 47
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 195
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 193
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 194
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202137,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 4.88,
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
						nodeId = 48
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202138,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 9.88,
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
				portCount = 5
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
				["1"] = {
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
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start",
				staticIdVInput = -458113037
			},
			fields = {
				templateId = 401077,
				processingTime = 1.433,
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
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202139,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 2.5,
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
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202140,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 10.5,
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
				portCount = 6
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
						portId = "Stop",
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202141,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 7.25,
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
				portCount = 6
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
						nodeId = 188
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 190
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 191
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 192
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400066,
				dialogueIdVInput = 6202142,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
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
						nodeId = 57
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				lookAtIdVInput = 400066,
				dialogueIdVInput = 6202143,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 7.38,
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 185
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6202144
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
						nodeId = 61
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
						nodeId = 182
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 183
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 184
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Smile01_Start",
				staticIdVInput = -458113037
			},
			fields = {
				templateId = 401077,
				processingTime = 0.767,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202146,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
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
						portId = "0",
						nodeId = 62
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = false
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
				portCount = 4
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202148,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 9.5,
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
						nodeId = 65
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
						nodeId = 66
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 181
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202149,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 4.5,
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
						nodeId = 67
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
						nodeId = 69
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
			kind = 3,
			inputs = {
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-506.771,
					54.206,
					838.384
				},
				rotationVInput = {
					22.428,
					155.677,
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
				fStop = 4.01,
				cameraId = 84431655
			},
			flowIn = {
				In = 0
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
						nodeId = 180
					}
				},
				True = {
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
				defaultSkipBranchVInput = 1,
				lookAtIdVInput = 400062,
				dialogueIdVInput = 6202150,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 2,
				npcId = 100,
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
						portId = "0",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = false
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
			},
			flowOut = {
				Out = {
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
						nodeId = 73
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 179
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6202152
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "0",
						nodeId = 74
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = false
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
						nodeId = 78
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 175
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 176
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 77
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 76
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 177
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 178
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
					-506.648,
					54.707,
					836.248
				},
				rotationVInput = {
					19.505,
					328.252,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 276,
				fStop = 6.5,
				cameraId = 91398822
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Story_Akimbo02_Start"
			},
			fields = {
				templateId = 400204,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_Akimbo02_Start",
					"Story_Akimbo02_Loop",
					"Story_Akimbo02_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400256,
				dialogueIdVInput = 6202154,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
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
						nodeId = 79
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
						nodeId = 80
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400062,
				dialogueIdVInput = 6202155,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				audioName = "VOX_Chapter01_Snowy_021",
				skipTime = 0.5,
				npcStaticId = 2,
				npcId = 400256,
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
						nodeId = 81
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
						nodeId = 83
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 82
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 172
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 173
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 174
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
					-506.896,
					54.495,
					838.109
				},
				rotationVInput = {
					7.301,
					169.428,
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
				fStop = 10.6,
				cameraId = 84432110
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400204,
				dialogueIdVInput = 6202156,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -1,
				npcId = 0,
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
						nodeId = 84
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
						nodeId = 85
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 170
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 171
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202157,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
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
						nodeId = 86
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202158,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 7.88,
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
						nodeId = 87
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
						nodeId = 89
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 88
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 165
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 167
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 168
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 169
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think02"
			},
			fields = {
				templateId = 400204,
				processingTime = 1.433,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Emotion_Think02",
					"Emotion_Think02",
					"Emotion_Think02"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400204,
				dialogueIdVInput = 6202159,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -1242132750,
				npcId = 400180,
				matchAudioDuration = true,
				duration = 5.62,
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
						nodeId = 90
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
						nodeId = 91
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 161
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 162
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 163
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 164
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
						nodeId = 160
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 92
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401077,
				dialogueIdVInput = 6202160,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -1658382425,
				npcId = 200001,
				matchAudioDuration = true,
				duration = 3.88,
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
						nodeId = 94
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 12
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 156
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 157
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 159
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 6202162,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
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
						nodeId = 95
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 152
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6202163
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 96
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
						nodeId = 97
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 151
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401077,
				dialogueIdVInput = 6202165,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 4.5,
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
						nodeId = 98
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
						nodeId = 146
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
						nodeId = 148
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 149
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 150
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 6202167,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
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
						nodeId = 100
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 145
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6202168
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "0",
						nodeId = 101
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = false
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
						nodeId = 103
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 143
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202170,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 8.25,
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
						nodeId = 104
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202171,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 8.25,
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
						nodeId = 105
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
						nodeId = 106
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 136
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 138
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 139
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 140
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 141
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 142
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202172,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -1,
				npcId = 0,
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
						nodeId = 107
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202173,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.88,
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
				portCount = 6
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
						nodeId = 132
					}
				},
				["3"] = {
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
				dialogueIdVInput = 6202174,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 6.5,
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
						nodeId = 110
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
						nodeId = 111
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202175,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 2.25,
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
						nodeId = 112
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
						nodeId = 113
					}
				}
			}
		},
		{
			kind = 10,
			inputs = {
				enableEventVInput = false,
				enableCameraZoomVInput = false,
				showTopLogoVInput = false,
				showAllUIVInput = false,
				endSkipVInput = true,
				enablePlayerMoveVInput = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 115
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 128
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 121,
				param = {
					6202001,
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
					true,
					0
				}
			},
			flowIn = {
				closeUIFInput = 1,
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 116
					}
				}
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
						nodeId = 117
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
						nodeId = 118
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
						nodeId = 124
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
						nodeId = 127
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
				DirectOut = {
					{
						portId = "In",
						nodeId = 121
					}
				},
				Out = {
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
				delayTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 120
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
						portId = "End",
						nodeId = 0
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
						portId = "closeUIFInput",
						nodeId = 115
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
						nodeId = 123
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-505.442,
					54.104,
					833.455
				},
				rotationVInput = {
					354.89,
					337.427,
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
				cameraId = 91398855
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -331017470,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -458113037,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1658382425,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1242132750,
				durationVInput = 0
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
					-602.286,
					56.182,
					819.425
				},
				rotationVInput = {
					358.953,
					82.198,
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
				cameraId = 90837810
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 129
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-602.303,
					57.113,
					819.422
				},
				rotationVInput = {
					358.953,
					82.198,
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
				cameraId = 90837809
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -458113037,
				playableStateVInput = "Emotion_Smile01"
			},
			fields = {
				templateId = 401077,
				processingTime = 1.433,
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
				staticIdVInput = -458113037,
				lookAtEntityStaticIdVInput = -1254236617
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Story_Greet_Start",
				speedVInput = 0.8,
				staticIdVInput = -1242132750,
				loopDurationVInput = 99
			},
			fields = {
				templateId = 400180,
				processingTime = 2.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_Greet_Start",
					"Story_Greet_Loop",
					"Story_Greet_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Story_Akimbo01_Start",
				staticIdVInput = 2,
				loopDurationVInput = 99
			},
			fields = {
				templateId = 403,
				processingTime = 1.7,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-508.631,
					55.14,
					839.536
				},
				rotationVInput = {
					27.314,
					145.932,
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
				cameraId = 84425975
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 135
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-508.758,
					55.257,
					839.723
				},
				rotationVInput = {
					27.314,
					145.932,
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
				cameraId = 91398857
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-514.387,
					62.761,
					837.001
				},
				rotationVInput = {
					11.328,
					356.494,
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
				cameraId = 84425453
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 137
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendFuncVInput = "Linear",
				blendTimeVInput = 6.5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-514.381,
					62.236,
					836.897
				},
				rotationVInput = {
					11.328,
					356.494,
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
				cameraId = 84425454
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
					332.807,
					0
				},
				targetPositionVInput = {
					-506.948,
					53.167,
					837.079
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
			kind = 14,
			inputs = {
				staticIdVInput = -1242132750,
				targetEulerAngleVInput = {
					0,
					347.076,
					0
				},
				targetPositionVInput = {
					-507.441,
					53.115,
					836.767
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
			kind = 14,
			inputs = {
				staticIdVInput = -331017470,
				targetEulerAngleVInput = {
					0,
					321.6,
					0
				},
				targetPositionVInput = {
					-507.557,
					53.075,
					837.449
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
			kind = 14,
			inputs = {
				staticIdVInput = -458113037,
				targetEulerAngleVInput = {
					0,
					335.7,
					0
				},
				targetPositionVInput = {
					-507.396,
					53.097,
					838.146
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
			kind = 14,
			inputs = {
				staticIdVInput = -1658382425,
				targetEulerAngleVInput = {
					0,
					316.1,
					0
				},
				targetPositionVInput = {
					-505.965,
					53.274,
					837.167
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
			kind = 3,
			inputs = {
				fovVInput = 33,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-509.51,
					55.773,
					852.424
				},
				rotationVInput = {
					341.248,
					317.408,
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
				cameraId = 84425316
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 144
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 33,
				blendFuncVInput = "Linear",
				blendTimeVInput = 9,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-510.958,
					55.773,
					851.093
				},
				rotationVInput = {
					341.248,
					317.408,
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
				cameraId = 84425448
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6202169
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 101
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
					-433.692,
					87.7,
					819.371
				},
				rotationVInput = {
					353.494,
					30.899,
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
				cameraId = 91398824
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 147
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-433.872,
					90.769,
					819.07
				},
				rotationVInput = {
					353.494,
					30.899,
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
				cameraId = 91398854
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1242132750,
				lookAtEntityStaticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1658382425,
				lookAtEntityStaticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Laugh",
				animationLayerVInput = 4
			},
			fields = {
				templateId = 400204,
				processingTime = 1.433,
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
				dialogueId = 6202164
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 153
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
						nodeId = 154
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 155
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401077,
				dialogueIdVInput = 6202166,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = 2,
				npcId = 400204,
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
						nodeId = 98
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				templateId = 400204,
				processingTime = 1.433,
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
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-364.883,
					82.855,
					655.74
				},
				rotationVInput = {
					14.005,
					169.6,
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
				cameraId = 91398803
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 158
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendFuncVInput = "Cubic",
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-364.873,
					83.08,
					655.685
				},
				rotationVInput = {
					14.005,
					169.6,
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
				cameraId = 91398804
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				staticIdVInput = -1922153592
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401077,
				dialogueIdVInput = 6202161,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -1658382425,
				npcId = 200001,
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
						nodeId = 93
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -1658382425
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -458113037,
				lookAtEntityStaticIdVInput = -1658382425
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1242132750,
				lookAtEntityStaticIdVInput = -1658382425
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Happy_Start",
				staticIdVInput = -1658382425
			},
			fields = {
				templateId = 400109,
				processingTime = 1.433,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Emotion_Happy_Start",
					"Emotion_Happy_Loop",
					"Emotion_Happy_End"
				}
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
					-506.526,
					54.559,
					839.755
				},
				rotationVInput = {
					11.083,
					188.508,
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
				cameraId = 87464967
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 166
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendTimeVInput = 18.9,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-506.509,
					54.559,
					839.752
				},
				rotationVInput = {
					13.146,
					179.226,
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
				cameraId = 84432162
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				templateId = 400204,
				processingTime = 1.433,
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
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
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
					-506.533,
					54.786,
					836.059
				},
				rotationVInput = {
					18.99,
					328.768,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 276,
				fStop = 6.5,
				cameraId = 84433871
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "TalkUpper_Introduce_Start",
				staticIdVInput = -458113037,
				animationLayerVInput = 4
			},
			fields = {
				templateId = 401077,
				processingTime = 1,
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
				lookAtEntityStaticIdVInput = 2
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
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -627125175
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -458113037,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -331017470,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -458113037,
				targetEulerAngleVInput = {
					0,
					-210.8,
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
				playStartLoopEndVInput = true,
				playableStateVInput = "Idle",
				staticIdVInput = -331017470,
				loopDurationVInput = 99
			},
			fields = {
				templateId = 400066,
				processingTime = 1.433,
				playAniType = 1,
				isLooping = true,
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
			kind = 7,
			fields = {
				dialogueId = 6202153
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 74
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				lookAtIdVInput = 400062,
				dialogueIdVInput = 6202151,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = 2,
				npcId = 100,
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
						portId = "1",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Talk_Shrug_Start",
				staticIdVInput = -458113037,
				animationLayerVInput = 4
			},
			fields = {
				templateId = 401077,
				processingTime = 1.333,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -458113037,
				lookAtEntityStaticIdVInput = 2
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
					-507.25,
					54.556,
					836.988
				},
				rotationVInput = {
					13.099,
					348.482,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 150,
				fStop = 32,
				cameraId = 91398817
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Idle",
				staticIdVInput = -331017470,
				loopDurationVInput = 999
			},
			fields = {
				templateId = 400066,
				processingTime = 1.433,
				playAniType = 1,
				isLooping = true,
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
			kind = 7,
			fields = {
				dialogueId = 6202145
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 186
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
						nodeId = 187
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
						nodeId = 183
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202147,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
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
						portId = "1",
						nodeId = 62
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
					-506.909,
					54.75,
					837.178
				},
				rotationVInput = {
					33.772,
					313.298,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 150,
				fStop = 32,
				cameraId = 91398816
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 189
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-506.844,
					54.615,
					837.116
				},
				rotationVInput = {
					33.772,
					313.298,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 150,
				fStop = 32,
				cameraId = 84407528
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Behav_LoveStart",
				staticIdVInput = -331017470,
				loopDurationVInput = 99
			},
			fields = {
				templateId = 400066,
				processingTime = 1.433,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_LoveStart",
					"Behav_LoveLoop",
					"Behav_LoveEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -458113037,
				targetEulerAngleVInput = {
					0,
					223.183,
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
				staticIdVInput = -331017470,
				lookAtEntityStaticIdVInput = -458113037
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
					-506.879,
					54.506,
					837.033
				},
				rotationVInput = {
					12.286,
					331.862,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 554,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 70,
				fStop = 16.28,
				cameraId = 91398805
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -331017470,
				targetEulerAngleVInput = {
					0,
					99.058,
					0
				},
				targetPositionVInput = {
					-508.246,
					53.083,
					838.091
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
			kind = 26,
			inputs = {
				staticIdVInput = -458113037,
				targetEulerAngleVInput = {
					0,
					-210.8,
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
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Amazed_Start",
				staticIdVInput = 2
			},
			fields = {
				templateId = 301,
				processingTime = 1.433,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Emotion_Amazed_Start",
					"Emotion_Amazed_Loop",
					"Emotion_Amazed_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -458113037
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
					-506.185,
					54.341,
					837.387
				},
				rotationVInput = {
					1.457,
					293.531,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 75,
				fStop = 27.29,
				cameraId = 91398766
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 200
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-506.187,
					54.424,
					837.388
				},
				rotationVInput = {
					357.332,
					290.781,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 75,
				fStop = 27.29,
				cameraId = 91398765
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -458113037,
				targetEulerAngleVInput = {
					0,
					276.6,
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
			kind = 28,
			inputs = {
				staticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6202131
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 204
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
						nodeId = 205
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 201
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 199
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 202
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202133,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
				matchAudioDuration = true,
				duration = 6.88,
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
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Shrug",
				animationLayerVInput = 4
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 229
				}
			},
			fields = {
				templateId = 400204,
				processingTime = 2.233,
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
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-506.823,
					54.53,
					838.478
				},
				rotationVInput = {
					9.192,
					186.445,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 139,
				fStop = 14.69,
				cameraId = 91398754
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				templateId = 301,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -458113037,
				targetEulerAngleVInput = {
					0,
					167.688,
					0
				},
				targetPositionVInput = {
					-507.502,
					53.082,
					838.217
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
			kind = 7,
			fields = {
				dialogueId = 6202123
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 211
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
						nodeId = 212
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6202125,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -458113037,
				npcId = 401077,
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
						portId = "1",
						nodeId = 26
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1242132750,
				lookAtEntityStaticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -458113037,
				lookAtEntityStaticIdVInput = 2
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
					-506.871,
					54.564,
					838.551
				},
				rotationVInput = {
					7.13,
					190.57,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 554,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 70,
				fStop = 16.28,
				cameraId = 91398731
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 216
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
						nodeId = 217
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
					-506.879,
					54.506,
					837.033
				},
				rotationVInput = {
					12.286,
					331.862,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 554,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 70,
				fStop = 16.28,
				cameraId = 87068877
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1242132750,
				lookAtEntityStaticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -458113037,
				targetEulerAngleVInput = {
					0,
					167.688,
					0
				},
				targetPositionVInput = {
					-507.502,
					53.082,
					838.217
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
			kind = 3,
			inputs = {
				fovVInput = 32,
				blendFuncVInput = "Linear",
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-506.627,
					54.768,
					835.613
				},
				rotationVInput = {
					15.724,
					340.8,
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
				cameraId = 84251072
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -331017470,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 4.772,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					165.5,
					0
				},
				targetPositionVInput = {
					-507.924,
					53.137,
					838.263
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
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -458113037,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 4.772,
				targetEulerAngleVInput = {
					0,
					167.688,
					0
				},
				targetPositionVInput = {
					-507.502,
					53.082,
					838.217
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
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1
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
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-507.38,
					54.291,
					845.144
				},
				rotationVInput = {
					9.192,
					0.911,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 554,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 778,
				fStop = 13.02,
				cameraId = 84251066
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -458113037,
				playableStateVInput = "Story_Greet"
			},
			fields = {
				templateId = 401077,
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
			kind = 15,
			inputs = {
				staticIdVInput = -1242132750,
				lookAtEntityStaticIdVInput = -458113037
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Confused_Start",
				staticIdVInput = -1242132750
			},
			fields = {
				templateId = 400180,
				processingTime = 1.5,
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
			kind = 16,
			inputs = {
				slotParamVInput = 401077,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-507.387,
					52.936,
					846.339
				},
				rotationVInput = {
					0,
					197.341,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -458113037
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 231
					}
				}
			}
		},
		[231] = {
			kind = 15,
			inputs = {
				staticIdVInput = -458113037,
				lookAtEntityStaticIdVInput = -1242132750
			},
			flowIn = {
				In = 0
			}
		},
		[232] = {
			kind = 16,
			inputs = {
				slotParamVInput = 200001,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-506.143,
					53.258,
					836.996
				},
				rotationVInput = {
					0,
					316.1,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1658382425
			},
			flowIn = {
				In = 0
			}
		},
		[233] = {
			kind = 16,
			inputs = {
				slotParamVInput = 400066,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-507.79,
					52.947,
					847.036
				},
				rotationVInput = {
					0,
					182.159,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -331017470
			},
			flowIn = {
				In = 0
			}
		},
		[234] = {
			kind = 16,
			inputs = {
				defaultHideVInput = true,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 401059,
				positionVInput = {
					-362.7,
					79,
					650.1
				},
				rotationVInput = {
					0,
					187.3,
					0
				}
			},
			fields = {
				ignoreGravity = true,
				entityId = -1922153592
			},
			flowIn = {
				In = 0
			}
		},
		[235] = {
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_VEG_Env_Common_Lizi_PurpleFlower.prefab",
				postionVInput = {
					-506.709,
					58,
					837.119
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		[236] = {
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_VEG_Env_Common_Lizi_PurpleFlower.prefab",
				postionVInput = {
					-506.709,
					56,
					837.07
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		[237] = {
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_VEG_Env_Common_Lizi_PurpleFlower.prefab",
				postionVInput = {
					-506.709,
					57,
					837.119
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		[238] = {
			kind = 16,
			inputs = {
				defaultHideVInput = true,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400066,
				positionVInput = {
					-508.89,
					54.672,
					839.335
				},
				rotationVInput = {
					0,
					133.654,
					0
				}
			},
			fields = {
				ignoreGravity = true,
				entityId = -1254236617
			},
			flowIn = {
				In = 0
			}
		},
		[239] = {
			kind = 66,
			inputs = {
				resetOnFinishVInput = true
			},
			fields = {
				staticIdList = {
					91072058,
					91154973,
					91350156
				}
			},
			flowIn = {
				In = 0
			}
		},
		[246] = {
			kind = 17,
			fields = {
				entityType = 0
			}
		}
	},
	blackboard = {
		myString = "2",
		Value = "niko"
	}
}
