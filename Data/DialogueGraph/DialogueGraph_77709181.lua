-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_77709181.lua

return {
	schema = 1,
	startNodeId = 5,
	dialogueId = 77709181,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 2
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
			kind = 6,
			fields = {
				retFlag = 2
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
						nodeId = 6,
						portId = "In"
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
						nodeId = 163,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 7,
						portId = "In"
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
						nodeId = 8,
						portId = "In"
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
						nodeId = 162,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 9,
						portId = "In"
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
					359.438,
					0
				},
				targetPositionVInput = {
					49.048,
					51.809,
					1027.709
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					19.886,
					0
				},
				targetPositionVInput = {
					49.673,
					51.809,
					1026.909
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					14.497,
					0
				},
				targetPositionVInput = {
					47.948,
					51.766,
					1025.468
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 12,
						portId = "In"
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
						nodeId = 13,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 150,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 153,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 152,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 155,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 161,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707401,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				anim = "TalkUpper_Smile",
				skipTime = 1,
				npcStaticId = 78796613,
				npcId = 401057,
				matchAudioDuration = true,
				duration = 2.12,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "TalkUpper_Smile",
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
						nodeId = 14,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 130,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707402
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 15,
						portId = "In"
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
						nodeId = 127,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 16,
						portId = "In"
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
						nodeId = 125,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 121,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 123,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707404,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 6.19,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 18,
						portId = "In"
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
						nodeId = 19,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 117,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 111,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 112,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 120,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707405,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 401057,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 20,
						portId = "In"
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
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707406,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 0,
				matchAudioDuration = true,
				duration = 7.12,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707407,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.38,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 109,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707409
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 24,
						portId = "In"
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
					hideUIWhiteList = {
						[306] = true
					},
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
						nodeId = 25,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 27,
						portId = "In"
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
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 15
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 3,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707433,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Righthand",
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 401057,
				matchAudioDuration = true,
				duration = 9.25,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "Talk_Righthand",
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
						nodeId = 28,
						portId = "In"
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
						nodeId = 29,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 104,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 105,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 107,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707434,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				anim = "Emotion_Helpless",
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 4.75,
				disableCamera = false,
				chatType = 3,
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
						nodeId = 30,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 102,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707435
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707464,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 3,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 880385,
				matchAudioDuration = true,
				duration = 2.5,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 33,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 34,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707465
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 1,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707466
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 35,
						portId = "In"
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
						nodeId = 36,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 41,
						portId = "In"
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
						nodeId = 37,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707410,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 0,
				npcId = 401057,
				matchAudioDuration = true,
				duration = 9.88,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707411,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Emotion_Smile01",
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 401057,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "Emotion_Smile01",
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707412,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 401057,
				matchAudioDuration = true,
				duration = 5.38,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Nod",
				staticIdVInput = 2
			},
			fields = {
				entityType = 0,
				templateId = 301,
				processingTime = 3,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 16,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					47.811,
					53.454,
					1024.248
				},
				rotationVInput = {
					6.877,
					14.376,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 200,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 436,
				fStop = 10.23,
				cameraId = 91150357
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 42,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 16,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					47.722,
					53.484,
					1024.013
				},
				rotationVInput = {
					6.877,
					14.376,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 360,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91150362
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707467
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 44,
						portId = "In"
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
						nodeId = 45,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 101,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707437,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 401057,
				matchAudioDuration = true,
				duration = 7.75,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 46,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707438,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Lefthand",
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 9.12,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "Talk_Lefthand",
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
						nodeId = 47,
						portId = "In"
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
						nodeId = 48,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 100,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707439,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Goodbye",
				skipTime = 0,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 7.62,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "Talk_Goodbye",
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
						nodeId = 49,
						portId = "In"
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
						nodeId = 50,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 91,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 94,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeInVInput = true,
				dialogueIdVInput = 3707440,
				enableFadeOutVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 3,
				portCount = 1,
				skipTime = 0.5,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 51,
						portId = "In"
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
						nodeId = 52,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 87,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 88,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707443,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707444,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 54,
						portId = "In"
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
						nodeId = 86,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 55,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707445,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410001,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 56,
						portId = "In"
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
						nodeId = 57,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 83,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 84,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707447,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 401057,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707448,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Emotion_ShakeHead",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 7.38,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "Emotion_ShakeHead",
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
						nodeId = 59,
						portId = "In"
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
						nodeId = 60,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 82,
						portId = "In"
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
						nodeId = 80,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707449,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_DoubtStart",
				skipTime = 0,
				npcStaticId = -298310769,
				npcId = 410001,
				matchAudioDuration = true,
				duration = 9.75,
				disableCamera = false,
				chatType = 3,
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
						nodeId = 62,
						portId = "In"
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
						nodeId = 63,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707451,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 64,
						portId = "In"
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
						nodeId = 65,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707452,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 6.12,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 66,
						portId = "In"
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
						nodeId = 67,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707453,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410001,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 68,
						portId = "In"
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
						nodeId = 69,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707454,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.5,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Emotion_Excited_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 0,
				processingTime = 2.167,
				templateId = 301,
				playAniType = 1,
				isLooping = false,
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
			kind = 28,
			inputs = {
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 77239040,
				playableStateVInput = "Emotion_Joy_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				processingTime = 2.167,
				templateId = 400100,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Emotion_Joy_Start",
					"Emotion_Joy_Loop",
					"Emotion_Joy_End"
				}
			},
			flowIn = {
				In = 0
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
						nodeId = 74,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 77239040,
				staticIdVInput = 2
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
					49.873,
					52.93,
					1028.689
				},
				rotationVInput = {
					356.546,
					227.818,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 49,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 138,
				fStop = 5.18,
				cameraId = 91332364
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					49.626,
					52.905,
					1028.879
				},
				rotationVInput = {
					355.343,
					210.458,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 230,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = false,
				focalDistance = 524,
				fStop = 10,
				cameraId = 91332157
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
						nodeId = 78,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					48.601,
					53.355,
					1028.185
				},
				rotationVInput = {
					20.908,
					130.191,
					14.516
				}
			},
			fields = {
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 80,
				spotLightInnerAngle = 20,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 7000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9695471,
					a = 1,
					b = 0.88,
					r = 1
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					48.008,
					53.46,
					1028.208
				},
				rotationVInput = {
					28.516,
					149.194,
					5.917
				}
			},
			fields = {
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 60,
				spotLightInnerAngle = 50,
				radius = 10,
				punctualLightUnit = 1,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 10000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9680967,
					a = 1,
					b = 0.88,
					r = 1
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707450,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_DoubtStart",
				skipTime = 0,
				npcStaticId = -298310769,
				npcId = 410002,
				matchAudioDuration = true,
				duration = 11,
				disableCamera = false,
				chatType = 3,
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
						nodeId = 62,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 20,
				blendTimeVInput = 3.5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.273,
					53.357,
					1029.007
				},
				rotationVInput = {
					13.202,
					144.662,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 63,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 168,
				fStop = 8.92,
				cameraId = 91073880
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -298310769,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -298310769,
				targetEulerAngleVInput = {
					0,
					302.427,
					0
				},
				targetPositionVInput = {
					50.747,
					51.766,
					1026.493
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
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.343,
					52.984,
					1029.304
				},
				rotationVInput = {
					359.623,
					156.007,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 108,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 150,
				fStop = 10.16,
				cameraId = 91332362
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 85,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.433,
					52.991,
					1029.108
				},
				rotationVInput = {
					358.592,
					154.804,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 360,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91332320
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707446,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 410001,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				loopDurationVInput = 1,
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 0,
				processingTime = 1.4,
				templateId = 301,
				playAniType = 1,
				isLooping = false,
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
			kind = 5,
			inputs = {
				staticIdVInput = 77239040,
				loopDurationVInput = 1,
				playableStateVInput = "Emotion_Worried_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				processingTime = 1.4,
				templateId = 401086,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Emotion_Worried_Start",
					"Emotion_Worried_Loop",
					"Emotion_Worried_End"
				}
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
						nodeId = 90,
						portId = "Close"
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					47.946,
					53.459,
					1028.602
				},
				rotationVInput = {
					24.235,
					137.033,
					9.197
				}
			},
			fields = {
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 70,
				spotLightInnerAngle = 30,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 10000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9602462,
					a = 1,
					b = 0.88,
					r = 1
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				Close = 1,
				In = 0
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
						nodeId = 92,
						portId = "In"
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
					47.388,
					53.037,
					1025.905
				},
				rotationVInput = {
					4.54,
					35.976,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 210,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 222,
				fStop = 8.72,
				cameraId = 91073840
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 93,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					47.625,
					53.021,
					1026.135
				},
				rotationVInput = {
					2.306,
					38.04,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 240,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = false,
				focalDistance = 222,
				fStop = 16,
				cameraId = 91332644
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
						nodeId = 95,
						portId = "In"
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
						nodeId = 96,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 98,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					48.041,
					0
				},
				targetPositionVInput = {
					48.312,
					51.809,
					1027.522
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 97,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77239040
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
					50.519,
					51.763,
					1027.925
				},
				rotationVInput = {
					0,
					287.093,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -298310769
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 99,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -298310769
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 77239040,
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				processingTime = 0,
				templateId = 400100,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Emotion_Think_Start",
					"",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_ShakeHead",
				staticIdVInput = 2
			},
			fields = {
				entityType = 0,
				templateId = 301,
				processingTime = 3.067,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707436
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 103,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					35.788,
					0
				},
				targetPositionVInput = {
					48.565,
					51.809,
					1027.516
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
				fovVInput = 17,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.384,
					53.031,
					1031.359
				},
				rotationVInput = {
					0.999,
					169.006,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 60,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 256,
				fStop = 8.08,
				cameraId = 91332694
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 106,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 17,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.331,
					52.987,
					1031.127
				},
				rotationVInput = {
					0.139,
					166.6,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 360,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91332762
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
						nodeId = 108,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 77239040,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707408
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 110,
						portId = "In"
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
					hideUIWhiteList = {
						[306] = true
					},
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
						nodeId = 25,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 36,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 78796613,
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
						nodeId = 113,
						portId = "In"
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
						nodeId = 116,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 114,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 16,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.432,
					53.166,
					1025.605
				},
				rotationVInput = {
					4.436,
					12.245,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 111,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 264,
				fStop = 12,
				cameraId = 91347695
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 115,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 16,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.512,
					53.081,
					1025.214
				},
				rotationVInput = {
					2.374,
					8.807,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 360,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91332520
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
					14.987,
					0
				},
				targetPositionVInput = {
					48.45,
					51.809,
					1027.374
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
			kind = 28,
			inputs = {
				staticIdVInput = 78796613
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 118,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Dialogue",
				staticIdVInput = 78796613
			},
			fields = {
				entityType = 2,
				templateId = 401057,
				processingTime = 3.333,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 119,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 78796613
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 77239040
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 21,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.657,
					53.036,
					1030.65
				},
				rotationVInput = {
					0.827,
					174.163,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 138,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 229,
				fStop = 16.54,
				cameraId = 91332027
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 122,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 21,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.599,
					53.035,
					1030.605
				},
				rotationVInput = {
					1.514,
					172.444,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 360,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91332028
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 77239040,
				staticIdVInput = 78796613
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 124,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 78796613,
				staticIdVInput = 2
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
					24.8,
					0
				},
				targetPositionVInput = {
					48.549,
					51.809,
					1027.817
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 126,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_IntroduceOtherRight"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 179,
					portId = "EntityID"
				}
			},
			fields = {
				entityType = 2,
				templateId = 400100,
				processingTime = 3.633,
				playAniType = 1,
				isLooping = false
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
					359.438,
					0
				},
				targetPositionVInput = {
					49.048,
					51.809,
					1027.709
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 128,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					19.886,
					0
				},
				targetPositionVInput = {
					49.673,
					51.809,
					1026.909
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 129,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					24.8,
					0
				},
				targetPositionVInput = {
					48.21,
					51.809,
					1027.703
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 2,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707403
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 131,
						portId = "In"
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
						nodeId = 132,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 133,
						portId = "In"
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
						nodeId = 4,
						portId = "End"
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
						nodeId = 147,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 134,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 149,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707420,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 0,
				matchAudioDuration = true,
				duration = 6.38,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 135,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 144,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707422
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 136,
						portId = "In"
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
						nodeId = 137,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707425,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "TalkCasual",
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = -1,
				matchAudioDuration = true,
				duration = 8.88,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "TalkCasual",
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
						nodeId = 138,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707426,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Emotion_Smile01",
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 880385,
				matchAudioDuration = true,
				duration = 8.62,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "Emotion_Smile01",
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
						nodeId = 139,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707427,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 880385,
				matchAudioDuration = true,
				duration = 10.5,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 140,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707428,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 880385,
				matchAudioDuration = true,
				duration = 6.75,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 141,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707429,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk",
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 880385,
				matchAudioDuration = true,
				duration = 10.75,
				disableCamera = false,
				chatType = 3,
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
						nodeId = 142,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707430,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Talk_Introduce",
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 401057,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 3,
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
						nodeId = 143,
						portId = "In"
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
						nodeId = 132,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707423
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 145,
						portId = "In"
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
						nodeId = 146,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707424,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Emotion_Nod",
				skipTime = 0,
				npcStaticId = 78796613,
				npcId = 880385,
				matchAudioDuration = true,
				duration = 3.25,
				disableCamera = false,
				chatType = 3,
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
						nodeId = 138,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 19,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					47.889,
					52.996,
					1027.834
				},
				rotationVInput = {
					0.345,
					32.218,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 60,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 256,
				fStop = 8.66,
				cameraId = 91327768
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 148,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 19,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					48.034,
					52.996,
					1027.889
				},
				rotationVInput = {
					0.001,
					29.812,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 360,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91327831
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Smile01",
				staticIdVInput = 78796613
			},
			fields = {
				entityType = 2,
				templateId = 401057,
				processingTime = 6.333,
				playAniType = 1,
				isLooping = false
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
					47.5,
					53.565,
					1024.874
				},
				rotationVInput = {
					11.655,
					21.011,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 100,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = true,
				focalDistance = 350,
				fStop = 4,
				cameraId = 86073718
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 151,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					47.724,
					53.547,
					1025.276
				},
				rotationVInput = {
					12.515,
					19.636,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				sensorWidth = 120,
				visualizeDOF = false,
				squeezeFactor = 1,
				openDof = false,
				focalDistance = 140,
				fStop = 9,
				cameraId = 91273114
			},
			flowIn = {
				In = 0
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
				lookAtEntityStaticIdVInput = 78796613,
				staticIdVInput = 77239040
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 154,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 77239040,
				speedVInput = 0.85,
				targetEulerAngleVInput = {
					0,
					24.8,
					0
				},
				targetPositionVInput = {
					48.204,
					51.809,
					1027.656
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
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							value = 1,
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
						nodeId = 156,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 90,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 157,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 158,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 159,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 160,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					49.37,
					53.339,
					1029.238
				},
				rotationVInput = {
					26.311,
					292.605,
					357.551
				}
			},
			fields = {
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 86,
				spotLightInnerAngle = 56,
				radius = 10,
				punctualLightUnit = 1,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 10000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9470588,
					a = 1,
					b = 0.85,
					r = 1
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					48.444,
					53.425,
					1028.188
				},
				rotationVInput = {
					20.916,
					126.602,
					1.856
				}
			},
			fields = {
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 75,
				spotLightInnerAngle = 20,
				radius = 10,
				punctualLightUnit = 1,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 10000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9455043,
					a = 1,
					b = 0.88,
					r = 1
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					49.376,
					53.107,
					1029.729
				},
				rotationVInput = {
					2.594,
					271.121,
					356.625
				}
			},
			fields = {
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 112,
				spotLightInnerAngle = 48,
				radius = 3,
				punctualLightUnit = 1,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 15000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9512987,
					a = 1,
					b = 0.75,
					r = 1
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					49.022,
					53.056,
					1027.122
				},
				rotationVInput = {
					4.375,
					323.951,
					357.792
				}
			},
			fields = {
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 70,
				spotLightInnerAngle = 15,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 5000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.8860431,
					a = 1,
					b = 1,
					r = 0.6273585
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					49.964,
					53.16,
					1027.401
				},
				rotationVInput = {
					8.51,
					288.798,
					358.031
				}
			},
			fields = {
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 60,
				spotLightInnerAngle = 20,
				radius = 2.95,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 10000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.7606546,
					a = 1,
					b = 1,
					r = 0.6
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Smile"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 204,
					portId = "EntityID"
				}
			},
			fields = {
				noBlink = false,
				activePlayLip = false,
				activePlayEmotion = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5070075,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					48.95,
					54.5,
					1029.6
				},
				rotationVInput = {
					0,
					180,
					0
				}
			},
			fields = {
				ignoreGravity = true,
				entityId = -590926770
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
					359.438,
					0
				},
				targetPositionVInput = {
					49.048,
					51.809,
					1027.709
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 164,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					19.886,
					0
				},
				targetPositionVInput = {
					49.673,
					51.809,
					1026.909
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 165,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					24.8,
					0
				},
				targetPositionVInput = {
					48.21,
					51.809,
					1027.703
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		[179] = {
			kind = 9,
			inputs = {
				staticIdVInput = 77239040
			},
			fields = {
				entityType = 2
			}
		},
		[204] = {
			kind = 17,
			inputs = {
				staticIdVInput = 78796613
			},
			fields = {
				entityType = 2
			}
		}
	},
	blackboard = {}
}
