-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_60862739.lua

return {
	startNodeId = 1,
	dialogueId = 60862739,
	schema = 1,
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
			kind = 11,
			fields = {
				modeInfo = {
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
					blockEvent = true,
					modeType = 2,
					toplogoComList = {
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
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true
					}
				}
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
			kind = 19,
			inputs = {
				targetEulerAngleVInput = {
					0,
					14.962,
					0
				},
				targetPositionVInput = {
					-1134.17,
					91.653,
					657.556
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 50,
					portId = "EntityID"
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
							outTangent = 1,
							inTangent = 0,
							weightedMode = 0,
							value = 0,
							time = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							weightedMode = 0,
							value = 1,
							time = 1
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
						nodeId = 4,
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
						nodeId = 6,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 49,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1135.887,
					91.246,
					664.659
				},
				rotationVInput = {
					6.875,
					181.856,
					0.001
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 0,
				fStop = 4,
				cameraId = 91113683,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002714,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 201401,
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
						nodeId = 7,
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
						nodeId = 9,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1130.753,
					94.669,
					655.543
				},
				rotationVInput = {
					10.485,
					301.489,
					0.001
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 0,
				fStop = 4,
				cameraId = 91114112,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002715,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 201401,
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
						nodeId = 10,
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
						nodeId = 12,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1136.773,
					96.308,
					652.715
				},
				rotationVInput = {
					16.157,
					1.822,
					0.001
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 0,
				fStop = 4,
				cameraId = 91114228,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002716,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 201401,
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
						nodeId = 13,
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
						nodeId = 14,
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
						nodeId = 38,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 46,
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
						nodeId = 15,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 16,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 33,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					nodeId = 63,
					portId = "EntityID"
				}
			},
			fields = {
				emojiName = "Happy",
				duration = 5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 63,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1026100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyEnd"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 63,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1026100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 19,
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
						nodeId = 21,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002717,
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
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 5,
				portCount = 1
			},
			flowIn = {
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
						nodeId = 22,
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 38,
			inputs = {
				maxLimitTimeVInput = 1,
				targetEulerAngleVInput = {
					0,
					78.221,
					0
				},
				targetPositionVInput = {
					-1137.117,
					90.376,
					659.995
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 60,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 38,
			inputs = {
				maxLimitTimeVInput = 1,
				targetEulerAngleVInput = {
					0,
					-15.21,
					0
				},
				targetPositionVInput = {
					-1134.192,
					91.634,
					657.463
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 63,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true
			},
			flowIn = {
				In = 0
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
					-1133.234,
					91.898,
					665.363
				},
				rotationVInput = {
					3.782,
					196.122,
					0.001
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 0,
				fStop = 4,
				cameraId = 91116093,
				visualizeDOF = false,
				squeezeFactor = 1
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
						nodeId = 27,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 70002718,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 201401,
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
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002719,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 201401,
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
						nodeId = 29,
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
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 2
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
			kind = 10,
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
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyLoop",
				playStartLoopEndVInput = true,
				loopDurationVInput = 4
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 60,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 16.583,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 201401,
				aniStateList = {
					"Behav_HappyLoop",
					"Behav_HappyLoop",
					"Behav_HappyLoop"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002704,
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
				duration = 8.5,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 35,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 36,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					nodeId = 57,
					portId = "EntityID"
				}
			},
			fields = {
				emojiName = "Happy",
				duration = 5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 51,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1026100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyEnd"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 52,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1026100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
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
						nodeId = 39,
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
			kind = 29,
			valueIn = {
				entityIdVInput = {
					nodeId = 59,
					portId = "EntityID"
				}
			},
			fields = {
				emojiName = "Happy",
				duration = 5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 53,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1026100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyEnd"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 54,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1026100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
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
						nodeId = 43,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					nodeId = 58,
					portId = "EntityID"
				}
			},
			fields = {
				emojiName = "Happy",
				duration = 5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 55,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1026100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 45,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyEnd"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 56,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1026100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1139.534,
					93.364,
					648.883
				},
				rotationVInput = {
					0.003,
					3.228,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 0,
				fStop = 4,
				cameraId = 80243533,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				playStartLoopEndVInput = true,
				loopDurationVInput = 4
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 62,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 16.583,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 201401,
				aniStateList = {
					"IdleSpecial",
					"IdleSpecial",
					"IdleSpecial"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_DoubtLoop",
				playStartLoopEndVInput = true,
				loopDurationVInput = 4
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 61,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 16.583,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 201401,
				aniStateList = {
					"Behav_DoubtLoop",
					"Behav_DoubtLoop",
					"Behav_DoubtLoop"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "EnvBehav_ScreenShowLoop",
				playStartLoopEndVInput = true,
				loopDurationVInput = 5
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 60,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 16.583,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 201401,
				aniStateList = {
					"EnvBehav_ScreenShowLoop",
					"EnvBehav_ScreenShowLoop",
					"EnvBehav_ScreenShowLoop"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 51200254
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 51200254
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 51200249
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 51200249
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 51200185
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 51200185
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 51200254
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 51200185
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 51200249
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 51200254
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 51200249
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 51200185
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			fields = {
				entityType = 1
			}
		}
	}
}
