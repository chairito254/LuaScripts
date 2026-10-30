-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91558175.lua

return {
	schema = 1,
	startNodeId = 12,
	dialogueId = 91558175,
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
						nodeId = 13,
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
						nodeId = 14,
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
						nodeId = 15,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 360,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3000100
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 16,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 299,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3000101
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 238,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3000102
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 18,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 177,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3000103
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 19,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 116,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3003104
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 81,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 20,
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
					hideMarkShare = false,
					hideInteractionSign = true,
					toplogoComList = {
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
						battleRoom = true,
						actionState = true,
						vlog = true,
						teamSpeech = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 9,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 21,
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
						nodeId = 22,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 74,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 75,
						portId = "In"
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
						nodeId = 23,
						portId = "In"
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
				DirectOut = {
					{
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527089,
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
				duration = 0,
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
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527090,
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
				duration = 3.12,
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
						nodeId = 26,
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
			kind = 7,
			fields = {
				dialogueId = 6527091
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 27,
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
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527093,
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
				duration = 5,
				disableCamera = false,
				chatType = 10,
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
						nodeId = 30,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6527094,
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
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
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 32,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 68,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527095,
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
				duration = 5,
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
						nodeId = 34,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527096,
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
				duration = 0,
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
						nodeId = 35,
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
						nodeId = 36,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527097,
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
				duration = 9.5,
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
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527098,
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
				duration = 3,
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
						nodeId = 38,
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
						nodeId = 39,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527099,
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
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527100,
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
				duration = 6.25,
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
						nodeId = 42,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 59,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 61,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 62,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527101,
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
						nodeId = 43,
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
						nodeId = 44,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 6527102,
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
				duration = 9.12,
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
						nodeId = 45,
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
						nodeId = 46,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527103,
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
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527104,
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
				duration = 5.75,
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
						nodeId = 54,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 6527105,
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
				duration = 3.62,
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
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527106,
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
				duration = 10.25,
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
						nodeId = 52,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527107,
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
				duration = 4.75,
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
						nodeId = 53,
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
						nodeId = 8,
						portId = "End"
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
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 5.44
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_AlertStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 2,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 303,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_LoveStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -778952768,
				staticIdVInput = -669799096
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					6.516,
					323.308,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 281,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 60,
						portId = "In"
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					4.797,
					326.058,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 365,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -669799096,
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 63,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -989505828,
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 7.22
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Think02_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1,
				aniStateList = {
					"Emotion_Think02_Start",
					"Emotion_Think02_Loop",
					"Emotion_Think02_End"
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
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				playAniType = 1,
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
			kind = 20,
			inputs = {
				durationVInput = 0.5,
				staticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990094,
				positionVInput = {
					-1066.51,
					102.22,
					558.08
				},
				rotationVInput = {
					0,
					98.922,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -778952768
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527092
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 27,
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
					269.1,
					0
				},
				targetPositionVInput = {
					-1064.756,
					102.115,
					557.934
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
						nodeId = 73,
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
					303.89,
					0
				},
				targetPositionVInput = {
					-1060.408,
					102.001,
					553.586
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
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					-1071.67,
					102.22,
					557.82
				},
				rotationVInput = {
					0,
					87.98,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
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
					64.07,
					122.757,
					688.887
				},
				rotationVInput = {
					7.891,
					113.022,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 645,
				fStop = 5.44
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
				fovVInput = 35,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					63.385,
					122.943,
					686.34
				},
				rotationVInput = {
					9.266,
					101.677,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					-1063.62,
					102.22,
					558.76
				},
				rotationVInput = {
					0,
					233.13,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 78,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					-1063.69,
					102.22,
					559.36
				},
				rotationVInput = {
					0,
					218.689,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					-1063.43,
					102.22,
					557.6
				},
				rotationVInput = {
					0,
					305.335,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 80,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					-1063.13,
					102.22,
					556.62
				},
				rotationVInput = {
					0,
					321.311,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					hideMarkShare = false,
					hideInteractionSign = true,
					toplogoComList = {
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
						battleRoom = true,
						actionState = true,
						vlog = true,
						teamSpeech = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 11,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 82,
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
						nodeId = 83,
						portId = "In"
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
						nodeId = 84,
						portId = "In"
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
				DirectOut = {
					{
						nodeId = 85,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527089,
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
				duration = 0,
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
						nodeId = 86,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527090,
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
				duration = 3.12,
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
						nodeId = 87,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 115,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527091
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 88,
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
						nodeId = 89,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527093,
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
				duration = 5,
				disableCamera = false,
				chatType = 10,
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
						nodeId = 90,
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
						nodeId = 91,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6527094,
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
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
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 92,
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
						nodeId = 93,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527095,
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
				duration = 5,
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
						nodeId = 94,
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
						nodeId = 95,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527096,
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
				duration = 0,
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
						nodeId = 96,
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
						nodeId = 97,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527097,
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
				duration = 9.5,
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
						nodeId = 98,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527098,
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
				duration = 3,
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
						nodeId = 99,
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
						nodeId = 100,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527099,
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
						nodeId = 101,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527100,
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
				duration = 6.25,
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
						nodeId = 102,
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
						nodeId = 103,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527101,
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
						nodeId = 104,
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
						nodeId = 105,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527102,
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
				duration = 9.12,
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
						nodeId = 106,
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
						nodeId = 107,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527103,
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
						nodeId = 108,
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
						nodeId = 109,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527104,
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
				duration = 5.75,
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
						nodeId = 110,
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
						nodeId = 111,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527105,
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
				duration = 3.62,
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
						nodeId = 112,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527106,
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
				duration = 10.25,
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
						nodeId = 113,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527107,
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
				duration = 4.75,
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
						nodeId = 114,
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
						nodeId = 10,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527092
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 88,
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
					hideMarkShare = false,
					hideInteractionSign = true,
					toplogoComList = {
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
						battleRoom = true,
						actionState = true,
						vlog = true,
						teamSpeech = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 7,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 117,
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
						nodeId = 118,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 168,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 172,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 174,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 175,
						portId = "In"
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
						nodeId = 119,
						portId = "In"
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
				DirectOut = {
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
				dialogueIdVInput = 6527089,
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
				duration = 0,
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
						nodeId = 121,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527090,
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
				duration = 3.12,
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
						nodeId = 122,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 167,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527091
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 123,
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
						nodeId = 124,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527093,
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
				duration = 5,
				disableCamera = false,
				chatType = 10,
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
						nodeId = 125,
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
						nodeId = 126,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 165,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6527094,
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
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
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 127,
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
						nodeId = 128,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 164,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527095,
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
				duration = 5,
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
						nodeId = 129,
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
						nodeId = 130,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 163,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527096,
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
				duration = 0,
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
						nodeId = 131,
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
						nodeId = 132,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 161,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 162,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527097,
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
				duration = 9.5,
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
						nodeId = 133,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527098,
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
				duration = 3,
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
						nodeId = 134,
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
						nodeId = 135,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 160,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527099,
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
						nodeId = 136,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527100,
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
				duration = 6.25,
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
						nodeId = 137,
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
						nodeId = 138,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 155,
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527101,
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
						nodeId = 139,
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
						nodeId = 140,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 154,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527102,
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
				duration = 9.12,
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
						nodeId = 141,
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
						nodeId = 142,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 153,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527103,
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
						nodeId = 143,
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
						nodeId = 144,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 152,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527104,
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
				duration = 5.75,
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
						nodeId = 145,
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
						nodeId = 146,
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
						nodeId = 151,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527105,
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
				duration = 3.62,
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
						nodeId = 147,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527106,
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
				duration = 10.25,
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
						nodeId = 148,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527107,
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
				duration = 4.75,
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
						nodeId = 149,
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
						nodeId = 6,
						portId = "End"
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
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 5.44
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_AlertStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 2,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 303,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_LoveStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -778952768,
				staticIdVInput = -669799096
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					6.516,
					323.308,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 281,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 156,
						portId = "In"
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					4.797,
					326.058,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 365,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -669799096,
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 159,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -989505828,
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 7.22
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Think02_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1,
				aniStateList = {
					"Emotion_Think02_Start",
					"Emotion_Think02_Loop",
					"Emotion_Think02_End"
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
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				playAniType = 1,
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
			kind = 20,
			inputs = {
				durationVInput = 0.5,
				staticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 166,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990094,
				positionVInput = {
					76.399,
					119.713,
					683.195
				},
				rotationVInput = {
					0,
					310.45,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -778952768
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527092
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 123,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					72.89,
					119.713,
					684.95
				},
				rotationVInput = {
					0,
					84.316,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 169,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					72.63,
					119.713,
					684.4
				},
				rotationVInput = {
					0,
					69.608,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 170,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					73.33,
					119.713,
					686.04
				},
				rotationVInput = {
					0,
					156.931,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 171,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					73.58,
					119.713,
					687.03
				},
				rotationVInput = {
					0,
					173.133,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
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
					119.725,
					0
				},
				targetPositionVInput = {
					72.564,
					119.71,
					685.959
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
						nodeId = 173,
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
					154.877,
					0
				},
				targetPositionVInput = {
					73.26,
					119.439,
					688.476
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
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					79.151,
					119.713,
					681.703
				},
				rotationVInput = {
					0,
					301.914,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
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
					64.07,
					122.757,
					688.887
				},
				rotationVInput = {
					7.891,
					113.022,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 645,
				fStop = 5.44
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 176,
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
					63.385,
					122.943,
					686.34
				},
				rotationVInput = {
					9.266,
					101.677,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					hideMarkShare = false,
					hideInteractionSign = true,
					toplogoComList = {
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
						battleRoom = true,
						actionState = true,
						vlog = true,
						teamSpeech = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 5,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 178,
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
						nodeId = 179,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 229,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 233,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 235,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 236,
						portId = "In"
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
						nodeId = 180,
						portId = "In"
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
				DirectOut = {
					{
						nodeId = 181,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527089,
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
				duration = 0,
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
						nodeId = 182,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527090,
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
				duration = 3.12,
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
						nodeId = 183,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 228,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527091
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 184,
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
						nodeId = 185,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527093,
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
				duration = 5,
				disableCamera = false,
				chatType = 10,
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
						nodeId = 186,
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
						nodeId = 187,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 226,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6527094,
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
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
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 188,
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
						nodeId = 189,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 225,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527095,
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
				duration = 5,
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
						nodeId = 190,
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
						nodeId = 191,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 224,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527096,
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
				duration = 0,
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
						nodeId = 192,
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
						nodeId = 193,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 222,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 223,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527097,
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
				duration = 9.5,
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
						nodeId = 194,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527098,
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
				duration = 3,
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
						nodeId = 195,
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
						nodeId = 196,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 221,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527099,
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
						nodeId = 197,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527100,
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
				duration = 6.25,
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
						nodeId = 198,
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
						nodeId = 199,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 216,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 218,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 219,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527101,
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
						nodeId = 200,
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
						nodeId = 201,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 215,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527102,
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
				duration = 9.12,
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
						nodeId = 202,
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
						nodeId = 203,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 214,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527103,
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
						nodeId = 204,
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
						nodeId = 205,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 213,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527104,
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
				duration = 5.75,
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
						nodeId = 206,
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
						nodeId = 207,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 211,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 212,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527105,
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
				duration = 3.62,
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
						nodeId = 208,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527106,
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
				duration = 10.25,
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
						nodeId = 209,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527107,
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
				duration = 4.75,
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
						nodeId = 210,
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
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 5.44
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_AlertStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 2,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 303,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_LoveStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -778952768,
				staticIdVInput = -669799096
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					6.516,
					323.308,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 281,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 217,
						portId = "In"
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					4.797,
					326.058,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 365,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -669799096,
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 220,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -989505828,
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 7.22
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Think02_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1,
				aniStateList = {
					"Emotion_Think02_Start",
					"Emotion_Think02_Loop",
					"Emotion_Think02_End"
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
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				playAniType = 1,
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
			kind = 20,
			inputs = {
				durationVInput = 0.5,
				staticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 227,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990094,
				positionVInput = {
					76.399,
					119.713,
					683.195
				},
				rotationVInput = {
					0,
					310.45,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -778952768
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527092
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 184,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					72.89,
					119.713,
					684.95
				},
				rotationVInput = {
					0,
					84.316,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 230,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					72.63,
					119.713,
					684.4
				},
				rotationVInput = {
					0,
					69.608,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 231,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					73.33,
					119.713,
					686.04
				},
				rotationVInput = {
					0,
					156.931,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 232,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					73.58,
					119.713,
					687.03
				},
				rotationVInput = {
					0,
					173.133,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
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
					119.725,
					0
				},
				targetPositionVInput = {
					72.564,
					119.71,
					685.959
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
						nodeId = 234,
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
					154.877,
					0
				},
				targetPositionVInput = {
					73.26,
					119.439,
					688.476
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
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					79.151,
					119.713,
					681.703
				},
				rotationVInput = {
					0,
					301.914,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
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
					64.07,
					122.757,
					688.887
				},
				rotationVInput = {
					7.891,
					113.022,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 645,
				fStop = 5.44
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 237,
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
					63.385,
					122.943,
					686.34
				},
				rotationVInput = {
					9.266,
					101.677,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					hideMarkShare = false,
					hideInteractionSign = true,
					toplogoComList = {
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
						battleRoom = true,
						actionState = true,
						vlog = true,
						teamSpeech = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 3,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 239,
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
						nodeId = 240,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 290,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 294,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 296,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 297,
						portId = "In"
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
						nodeId = 241,
						portId = "In"
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
				DirectOut = {
					{
						nodeId = 242,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527089,
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
				duration = 0,
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
						nodeId = 243,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527090,
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
				duration = 3.12,
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
						nodeId = 244,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 289,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527091
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 245,
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
						nodeId = 246,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527093,
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
				duration = 5,
				disableCamera = false,
				chatType = 10,
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
						nodeId = 247,
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
						nodeId = 248,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 287,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6527094,
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
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
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 249,
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
						nodeId = 250,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 286,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527095,
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
				duration = 5,
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
						nodeId = 251,
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
						nodeId = 252,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 285,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527096,
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
				duration = 0,
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
						nodeId = 253,
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
						nodeId = 254,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 283,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 284,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527097,
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
				duration = 9.5,
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
						nodeId = 255,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527098,
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
				duration = 3,
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
						nodeId = 256,
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
						nodeId = 257,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 282,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527099,
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
						nodeId = 258,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527100,
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
				duration = 6.25,
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
						nodeId = 259,
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
						nodeId = 260,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 277,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 279,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 280,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527101,
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
						nodeId = 261,
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
						nodeId = 262,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 276,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527102,
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
				duration = 9.12,
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
						nodeId = 263,
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
						nodeId = 264,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 275,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527103,
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
						nodeId = 265,
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
						nodeId = 266,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 274,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527104,
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
				duration = 5.75,
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
						nodeId = 267,
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
						nodeId = 268,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 272,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 273,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527105,
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
				duration = 3.62,
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
						nodeId = 269,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527106,
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
				duration = 10.25,
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
						nodeId = 270,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527107,
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
				duration = 4.75,
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
						nodeId = 271,
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
						nodeId = 2,
						portId = "End"
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
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 5.44
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_AlertStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 2,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 303,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_LoveStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -778952768,
				staticIdVInput = -669799096
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					6.516,
					323.308,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 281,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 278,
						portId = "In"
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					4.797,
					326.058,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 365,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -669799096,
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 281,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -989505828,
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 7.22
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Think02_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1,
				aniStateList = {
					"Emotion_Think02_Start",
					"Emotion_Think02_Loop",
					"Emotion_Think02_End"
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
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				playAniType = 1,
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
			kind = 20,
			inputs = {
				durationVInput = 0.5,
				staticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 288,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990094,
				positionVInput = {
					76.399,
					119.713,
					683.195
				},
				rotationVInput = {
					0,
					310.45,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -778952768
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527092
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 245,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					72.89,
					119.713,
					684.95
				},
				rotationVInput = {
					0,
					84.316,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 291,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					72.63,
					119.713,
					684.4
				},
				rotationVInput = {
					0,
					69.608,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 292,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					73.33,
					119.713,
					686.04
				},
				rotationVInput = {
					0,
					156.931,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 293,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					73.58,
					119.713,
					687.03
				},
				rotationVInput = {
					0,
					173.133,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
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
					119.725,
					0
				},
				targetPositionVInput = {
					72.564,
					119.71,
					685.959
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
						nodeId = 295,
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
					154.877,
					0
				},
				targetPositionVInput = {
					73.26,
					119.439,
					688.476
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
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					79.151,
					119.713,
					681.703
				},
				rotationVInput = {
					0,
					301.914,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
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
					64.07,
					122.757,
					688.887
				},
				rotationVInput = {
					7.891,
					113.022,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 645,
				fStop = 5.44
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 298,
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
					63.385,
					122.943,
					686.34
				},
				rotationVInput = {
					9.266,
					101.677,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					hideMarkShare = false,
					hideInteractionSign = true,
					toplogoComList = {
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
						battleRoom = true,
						actionState = true,
						vlog = true,
						teamSpeech = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 1,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 300,
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
						nodeId = 301,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 351,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 355,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 357,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 358,
						portId = "In"
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
						nodeId = 302,
						portId = "In"
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
				DirectOut = {
					{
						nodeId = 303,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527089,
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
				duration = 0,
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
						nodeId = 304,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527090,
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
				duration = 3.12,
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
						nodeId = 305,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 350,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527091
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 306,
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
						nodeId = 307,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527093,
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
				duration = 5,
				disableCamera = false,
				chatType = 10,
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
						nodeId = 308,
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
						nodeId = 309,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 348,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6527094,
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
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
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 310,
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
						nodeId = 311,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 347,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527095,
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
				duration = 5,
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
						nodeId = 312,
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
						nodeId = 313,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 346,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527096,
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
				duration = 0,
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
						nodeId = 314,
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
						nodeId = 315,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 344,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 345,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527097,
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
				duration = 9.5,
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
						nodeId = 316,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527098,
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
				duration = 3,
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
						nodeId = 317,
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
						nodeId = 318,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 343,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527099,
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
						nodeId = 319,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527100,
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
				duration = 6.25,
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
						nodeId = 320,
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
						nodeId = 321,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 338,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 340,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 341,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527101,
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
						nodeId = 322,
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
						nodeId = 323,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 337,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527102,
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
				duration = 9.12,
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
						nodeId = 324,
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
						nodeId = 325,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 336,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527103,
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
						nodeId = 326,
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
						nodeId = 327,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 335,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527104,
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
				duration = 5.75,
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
						nodeId = 328,
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
						nodeId = 329,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 333,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 334,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527105,
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
				duration = 3.62,
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
						nodeId = 330,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527106,
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
				duration = 10.25,
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
						nodeId = 331,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527107,
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
				duration = 4.75,
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
						nodeId = 332,
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
						nodeId = 0,
						portId = "End"
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
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 91578472,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 5.44
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_AlertStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 2,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 303,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_LoveStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -778952768,
				staticIdVInput = -669799096
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					6.516,
					323.308,
					0
				}
			},
			fields = {
				cameraId = 91578471,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 281,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 339,
						portId = "In"
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
					74.427,
					120.9,
					683.654
				},
				rotationVInput = {
					4.797,
					326.058,
					0
				}
			},
			fields = {
				cameraId = 91579075,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 365,
				fStop = 9.01
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -669799096,
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 342,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -989505828,
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -778952768,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990094,
				processingTime = 0,
				playAniType = 1,
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.692,
					120.953,
					684.461
				},
				rotationVInput = {
					12.016,
					115.084,
					0
				}
			},
			fields = {
				cameraId = 91578470,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 393,
				fStop = 7.22
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Think02_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				playAniType = 1,
				aniStateList = {
					"Emotion_Think02_Start",
					"Emotion_Think02_Loop",
					"Emotion_Think02_End"
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
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				playAniType = 1,
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
			kind = 20,
			inputs = {
				durationVInput = 0.5,
				staticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 349,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990094,
				positionVInput = {
					76.399,
					119.713,
					683.195
				},
				rotationVInput = {
					0,
					310.45,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -778952768
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527092
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 306,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					72.89,
					119.713,
					684.95
				},
				rotationVInput = {
					0,
					84.316,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 352,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					72.63,
					119.713,
					684.4
				},
				rotationVInput = {
					0,
					69.608,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 353,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					73.33,
					119.713,
					686.04
				},
				rotationVInput = {
					0,
					156.931,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 354,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					73.58,
					119.713,
					687.03
				},
				rotationVInput = {
					0,
					173.133,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
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
					119.725,
					0
				},
				targetPositionVInput = {
					72.564,
					119.71,
					685.959
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
						nodeId = 356,
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
					154.877,
					0
				},
				targetPositionVInput = {
					73.26,
					119.439,
					688.476
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
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					79.151,
					119.713,
					681.703
				},
				rotationVInput = {
					0,
					301.914,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
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
					64.07,
					122.757,
					688.887
				},
				rotationVInput = {
					7.891,
					113.022,
					0
				}
			},
			fields = {
				cameraId = 91578469,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 645,
				fStop = 5.44
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 359,
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
					63.385,
					122.943,
					686.34
				},
				rotationVInput = {
					9.266,
					101.677,
					0
				}
			},
			fields = {
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 24,
			inputs = {
				switchToPlayerVInput = true
			},
			flowIn = {
				In = 0
			}
		}
	}
}
