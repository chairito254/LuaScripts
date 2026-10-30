-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91506765.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 91506765,
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
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					blockCameraZoom = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					toplogoComList = {
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
						battleRoom = true,
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
						nodeId = 5,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 54,
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
						nodeId = 55,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524215,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5120180,
				matchAudioDuration = true,
				duration = 6.12,
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
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524216,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5120180,
				matchAudioDuration = true,
				duration = 3.5,
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
						nodeId = 7,
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
		{
			kind = 7,
			fields = {
				dialogueId = 6524217
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
						nodeId = 50,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524219,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5120181,
				matchAudioDuration = true,
				duration = 0,
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
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 193,
				param = {
					piecesId = 914003,
					openType = 1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 11,
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
						nodeId = 48,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524220,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5120183,
				matchAudioDuration = true,
				duration = 3.5,
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
						nodeId = 13,
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
						nodeId = 14,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 6524221,
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
						nodeId = 15,
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
						nodeId = 16,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 45,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524222,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5120183,
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
						nodeId = 17,
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
						nodeId = 18,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524223,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.12,
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
						nodeId = 19,
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
						nodeId = 20,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524224,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5120180,
				matchAudioDuration = true,
				duration = 6.25,
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
						nodeId = 21,
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
			kind = 7,
			fields = {
				dialogueId = 6524225
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
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524227,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5120181,
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
						nodeId = 24,
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
						nodeId = 25,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 37,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 6524228,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5120183,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				["0"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 35,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 36,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524229,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5120182,
				matchAudioDuration = true,
				duration = 6.38,
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
						nodeId = 28,
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
						nodeId = 29,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 31,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6524230,
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
						nodeId = 30,
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
						nodeId = 1,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 59,
					portId = "BoneTransform"
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
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-859.6,
					122.21,
					451.15
				},
				rotationVInput = {
					2.107,
					26.671,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 480,
				fStop = 4,
				cameraId = 91540254,
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
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-859.6,
					122.21,
					451.15
				},
				rotationVInput = {
					2.795,
					23.921,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 480,
				fStop = 4,
				cameraId = 91540255,
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
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 91502195
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
				fovVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-855.999,
					121.789,
					458.407
				},
				rotationVInput = {
					355.06,
					173.119,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 452,
				fStop = 24.12,
				cameraId = 91540253,
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
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 91453310
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-857.346,
					122.197,
					457.071
				},
				rotationVInput = {
					20.327,
					58.814,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 172,
				fStop = 24.12,
				cameraId = 91540250,
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
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 91502199
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
			kind = 7,
			fields = {
				dialogueId = 6524226
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 91453210
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 58,
					portId = "BoneTransform"
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
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 91453310
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 57,
					portId = "BoneTransform"
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
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_AlertStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 91453310
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
				aniStateList = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd"
				}
			},
			flowIn = {
				In = 0
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
					-861.766,
					122.982,
					452.774
				},
				rotationVInput = {
					14.655,
					54.689,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 480,
				fStop = 4,
				cameraId = 91540246,
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
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 91502199
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
			kind = 7,
			fields = {
				dialogueId = 6524218
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
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 91453210
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5120180,
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
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-862.004,
					122.609,
					452.177
				},
				rotationVInput = {
					8.123,
					51.767,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 480,
				fStop = 4,
				cameraId = 91540245,
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
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					45.412,
					0
				},
				targetPositionVInput = {
					-857.531,
					120.826,
					455.517
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
							outTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							time = 0,
							inTangent = 0
						},
						{
							outTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0,
							time = 1,
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
			kind = 14,
			inputs = {
				staticIdVInput = 91453210,
				targetEulerAngleVInput = {
					0,
					200.815,
					0
				},
				targetPositionVInput = {
					-855.84,
					120.963,
					458.05
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
			kind = 17,
			inputs = {
				staticIdVInput = 91453310
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91453210
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91502195
			},
			fields = {
				entityType = 2
			}
		}
	}
}
