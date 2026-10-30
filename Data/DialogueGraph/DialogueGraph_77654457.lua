-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_77654457.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 77654457,
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
						nodeId = 2,
						portId = "In"
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
						nodeId = 3,
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
					hideTopLogo = true,
					toplogoComList = {
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
						alert = true,
						actionState = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 0,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 4,
						portId = "In"
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
						nodeId = 5,
						portId = "In"
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
						nodeId = 88,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 14,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 18,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 86,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 11021200,
				positionVInput = {
					-131.82,
					105.815,
					662.264
				},
				rotationVInput = {
					4.136,
					147,
					359.613
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1832497471
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 9,
				playableStateVInput = "Behav_AngryStart",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400233,
				processingTime = 0.833,
				aniStateList = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 14,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 86,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Skill_Ex"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 11021200,
				processingTime = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 14,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.573,
					106.395,
					658.395
				},
				rotationVInput = {
					8.204,
					13.924,
					359.576
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 320,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 16,
				cameraId = 82611910
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400066,
				positionVInput = {
					-131.683,
					105.29,
					660.171
				},
				rotationVInput = {
					0,
					358.592,
					0
				}
			},
			fields = {
				ignoreGravity = true,
				entityId = -1231905536
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Circle"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 14,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400066,
				processingTime = 1
			},
			flowIn = {
				In = 0
			}
		},
		[17] = {
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Circle"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 14,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400066,
				processingTime = 1
			},
			flowIn = {
				In = 0
			}
		},
		[18] = {
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400204,
				positionVInput = {
					-130.948,
					105.292,
					660.05
				},
				rotationVInput = {
					0,
					333.696,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1616311219
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		[19] = {
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 18,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204,
				processingTime = 0,
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
		[20] = {
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
						nodeId = 19,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		[21] = {
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
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		[22] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304306,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = 2,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 4.88,
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
						nodeId = 23,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 80,
						portId = "In"
					}
				}
			}
		},
		[23] = {
			kind = 7,
			fields = {
				dialogueId = 3304307
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
		[24] = {
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
						nodeId = 25,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		[25] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.69,
					106.392,
					661.409
				},
				rotationVInput = {
					358.983,
					344.816,
					0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 72,
				fStop = 16,
				cameraId = 91523837
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		[26] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.632,
					106.498,
					661.419
				},
				rotationVInput = {
					353.826,
					348.082,
					0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 72,
				fStop = 16,
				cameraId = 91523838
			},
			flowIn = {
				In = 0
			}
		},
		[27] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304309,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 3.5,
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
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		[28] = {
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
						nodeId = 30,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		[29] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.49,
					106.576,
					661.662
				},
				rotationVInput = {
					15.404,
					216.383,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 80,
				fStop = 16,
				cameraId = 87832424
			},
			flowIn = {
				In = 0
			}
		},
		[30] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304311,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400066,
				matchAudioDuration = true,
				duration = 2,
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
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		[31] = {
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
						nodeId = 32,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		[32] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304312,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 3.75,
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
						nodeId = 33,
						portId = "In"
					}
				}
			}
		},
		[33] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304313,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400066,
				matchAudioDuration = true,
				duration = 2,
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
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		[34] = {
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
						nodeId = 35,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 78,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 7,
						portId = "Stop"
					}
				}
			}
		},
		[35] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304314,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 2,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = false,
				duration = 6.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 4
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
						nodeId = 44,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 52,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		[36] = {
			kind = 7,
			fields = {
				dialogueId = 3304315
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		[37] = {
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
						nodeId = 38,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				}
			}
		},
		[38] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304318,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 9.5,
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		[39] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304319,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 7.62,
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
						nodeId = 40,
						portId = "0"
					}
				}
			}
		},
		[40] = {
			kind = 30,
			fields = {
				executeOnce = false,
				portCount = 3
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		[41] = {
			kind = 48,
			flowIn = {
				In = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 42,
						portId = "In"
					}
				}
			}
		},
		[42] = {
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
						nodeId = 43,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		[43] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304136,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = false,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 4
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
						nodeId = 44,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 52,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		[44] = {
			kind = 7,
			fields = {
				dialogueId = 3304316
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 45,
						portId = "In"
					}
				}
			}
		},
		[45] = {
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
						nodeId = 46,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		[46] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304320,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 9.62,
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
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		[47] = {
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
						nodeId = 50,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		[48] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				fovVInput = 50,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-145.277,
					115.386,
					647.714
				},
				rotationVInput = {
					353.046,
					261.317,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 1500,
				fStop = 16,
				cameraId = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 49,
						portId = "In"
					}
				}
			}
		},
		[49] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				fovVInput = 50,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-145.77,
					115.386,
					650.943
				},
				rotationVInput = {
					353.046,
					261.317,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 1500,
				fStop = 16,
				cameraId = 91328609
			},
			flowIn = {
				In = 0
			}
		},
		[50] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304321,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 10.88,
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
						nodeId = 40,
						portId = "1"
					}
				}
			}
		},
		[51] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.49,
					106.576,
					661.662
				},
				rotationVInput = {
					15.404,
					216.383,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 80,
				fStop = 16,
				cameraId = 91523853
			},
			flowIn = {
				In = 0
			}
		},
		[52] = {
			kind = 7,
			fields = {
				dialogueId = 3304317
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		[53] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304322,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
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
						nodeId = 54,
						portId = "In"
					}
				}
			}
		},
		[54] = {
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
						nodeId = 55,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		[55] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304323,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 10.62,
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
						nodeId = 40,
						portId = "2"
					}
				}
			}
		},
		[56] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-130.759,
					106.786,
					659.018
				},
				rotationVInput = {
					10.928,
					359.362,
					359.599
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 16,
				cameraId = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		[57] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-129.548,
					106.992,
					658.578
				},
				rotationVInput = {
					13.774,
					330.211,
					359.446
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 228,
				fStop = 16,
				cameraId = 0
			},
			flowIn = {
				In = 0
			}
		},
		[58] = {
			kind = 7,
			fields = {
				dialogueId = 3907914
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 59,
						portId = "In"
					}
				}
			}
		},
		[59] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304325,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400066,
				matchAudioDuration = true,
				duration = 2,
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
						nodeId = 60,
						portId = "In"
					}
				}
			}
		},
		[60] = {
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
						nodeId = 62,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		[61] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.49,
					106.576,
					661.662
				},
				rotationVInput = {
					15.404,
					216.383,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 80,
				fStop = 16,
				cameraId = 90858714
			},
			flowIn = {
				In = 0
			}
		},
		[62] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304326,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 5.38,
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
						nodeId = 63,
						portId = "In"
					}
				}
			}
		},
		[63] = {
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
						nodeId = 64,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		[64] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304327,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400066,
				matchAudioDuration = true,
				duration = 2,
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
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		[65] = {
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
						nodeId = 66,
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
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		[66] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304328,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 5.88,
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
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		[67] = {
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 68,
						portId = "In"
					}
				}
			}
		},
		[68] = {
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
						nodeId = 69,
						portId = "In"
					}
				}
			}
		},
		[69] = {
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
						nodeId = 70,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		[70] = {
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
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		[71] = {
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
						nodeId = 72,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		[72] = {
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = 0
			}
		},
		[73] = {
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
						nodeId = 74,
						portId = "In"
					}
				}
			}
		},
		[74] = {
			kind = 21,
			flowIn = {
				In = 0
			}
		},
		[75] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.332,
					106.371,
					661.263
				},
				rotationVInput = {
					348.749,
					334.197,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 150,
				fStop = 16,
				cameraId = 82708992
			},
			flowIn = {
				In = 0
			}
		},
		[76] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.632,
					106.498,
					661.419
				},
				rotationVInput = {
					353.826,
					348.082,
					0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 72,
				fStop = 16,
				cameraId = 91524173
			},
			flowIn = {
				In = 0
			}
		},
		[77] = {
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				staticIdVInput = -1832497471
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 11021200,
				processingTime = 0
			},
			flowIn = {
				In = 0
			}
		},
		[78] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.632,
					106.498,
					661.419
				},
				rotationVInput = {
					353.826,
					348.082,
					0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 72,
				fStop = 16,
				cameraId = 91328606
			},
			flowIn = {
				In = 0
			}
		},
		[79] = {
			kind = 14,
			inputs = {
				staticIdVInput = -1231905536,
				targetEulerAngleVInput = {
					0,
					358.592,
					0
				},
				targetPositionVInput = {
					-132.07,
					105.92,
					660.866
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
		[80] = {
			kind = 7,
			fields = {
				dialogueId = 3304308
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		[81] = {
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
						nodeId = 82,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 84,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		[82] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.69,
					106.392,
					661.409
				},
				rotationVInput = {
					358.983,
					344.816,
					0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 72,
				fStop = 16,
				cameraId = 91523845
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 83,
						portId = "In"
					}
				}
			}
		},
		[83] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-131.632,
					106.498,
					661.419
				},
				rotationVInput = {
					353.826,
					348.082,
					0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 72,
				fStop = 16,
				cameraId = 91523841
			},
			flowIn = {
				In = 0
			}
		},
		[84] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304310,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 2,
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
						nodeId = 85,
						portId = "In"
					}
				}
			}
		},
		[85] = {
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
						nodeId = 30,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		[86] = {
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400077,
				positionVInput = {
					-129.728,
					105.086,
					660.343
				},
				rotationVInput = {
					355.848,
					330.386,
					0.144
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -56660020
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 87,
						portId = "In"
					}
				}
			}
		},
		[87] = {
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
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		[88] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					335.099,
					0
				},
				targetPositionVInput = {
					-130.358,
					105.417,
					660.346
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 93,
					portId = "EntityID"
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
		[89] = {
			kind = 50,
			inputs = {
				enableFillLightVInput = true,
				fillLightIntensityVInput = 8500
			},
			flowIn = {
				In = 0
			}
		},
		[93] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	},
	blackboard = {
		myBoolean3 = false,
		myBoolean2 = false,
		myBoolean1 = false
	}
}
