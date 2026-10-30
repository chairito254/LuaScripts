-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_78782520.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 78782520,
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
				onSkipStartConnected = true,
				modeInfo = {
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
					pauseNearbyMonsterAI = true,
					toplogoComList = {
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
						petFertility = true,
						petExchange = true,
						petChat = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 115,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 3,
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
						nodeId = 4,
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
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 45,
			inputs = {
				timelineResIdVInput = "$P_TL_Grass_P9_IrisTectorumBossDiscolor.prefab"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				PreFinish = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				StartPlay = {
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
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 112,
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
						nodeId = 9,
						portId = "In"
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
						nodeId = 10,
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
						nodeId = 11,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 111,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 106,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 107,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 108,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 110,
						portId = "In"
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906418,
				lookAtIdVInput = 401059,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				audioName = "VOX_Chapter01_Sonia_256",
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 2
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
						nodeId = 105,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906419,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 6.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 6
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
						nodeId = 100,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 102,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 103,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 104,
						portId = "In"
					}
				},
				["5"] = {
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
				dialogueIdVInput = 3906420,
				lookAtIdVInput = 401059,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1899566943,
				npcId = 400077,
				matchAudioDuration = true,
				duration = 11.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 4
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
						nodeId = 88,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 97,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 98,
						portId = "StopLip"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906421,
				lookAtIdVInput = 401059,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 10.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 6
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
						nodeId = 96,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 97,
						portId = "StopLip"
					}
				},
				["4"] = {
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
				dialogueIdVInput = 3906422,
				lookAtIdVInput = 401059,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400077,
				matchAudioDuration = true,
				duration = 7.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
						nodeId = 22,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 91,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 92,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 93,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 94,
						portId = "StopLip"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906423,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906424,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 3.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 4
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
						nodeId = 85,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 87,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 88,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906425,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 4
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
						nodeId = 83,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 84,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 78,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906426,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 7.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 7
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
						nodeId = 74,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 76,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 80,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 78,
						portId = "StopLip"
					}
				},
				["6"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906427,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 3,
				npcStaticId = -689093949,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
						nodeId = 32,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-395.106,
					25.57,
					567.547
				},
				rotationVInput = {
					2.023,
					130.358,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 15,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 172,
				fStop = 19.5,
				cameraId = 90850312
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906428,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400526,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 7
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
				},
				["2"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 68,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				},
				["6"] = {
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
				dialogueIdVInput = 3906429,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -689093949,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				["2"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906430,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1541038355,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
						nodeId = 40,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 38,
						portId = "In"
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
					-392.646,
					25.857,
					566.414
				},
				rotationVInput = {
					352.215,
					156.141,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 15,
				cameraId = 90875139
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				fovVInput = 25,
				blendTimeVInput = 4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-392.652,
					25.968,
					566.428
				},
				rotationVInput = {
					352.215,
					156.141,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 15,
				cameraId = 90875140
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906458,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 3
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
						nodeId = 60,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3906431,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 3,
				skipTime = 0,
				npcStaticId = -689093949,
				npcId = 0,
				matchAudioDuration = true,
				duration = 6.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
				portCount = 4
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
						nodeId = 55,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 57,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 59,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906432,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 3,
				skipTime = 0,
				npcStaticId = -1541038355,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3906433,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1541038355,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0
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
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 49,
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
				Out = {
					{
						nodeId = 50,
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
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 52,
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
			kind = 33,
			inputs = {
				entityIdVInput = -1541038355,
				facialEmotionVInput = "Worried"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 54,
						portId = "In"
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
						nodeId = 53,
						portId = "StopLip"
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
					-394.342,
					25.591,
					566.271
				},
				rotationVInput = {
					9.586,
					6.255,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 90850366
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-394.327,
					25.567,
					566.409
				},
				rotationVInput = {
					9.586,
					6.255,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 90850367
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -1541038355,
				facialEmotionVInput = "Worried"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 7.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 57,
						portId = "StopLip"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1541038355,
				speedVInput = 0.8,
				playableStateVInput = "TalkUpper_Apologize_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 10,
				animationLayerVInput = 4
			},
			fields = {
				templateId = 400204,
				processingTime = 4,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"TalkUpper_Apologize_Start",
					"TalkUpper_Apologize_Loop",
					"TalkUpper_Apologize_End"
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
					-394.358,
					25.65,
					565.462
				},
				rotationVInput = {
					8.898,
					349.238,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 15,
				cameraId = 90850365
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-394.377,
					25.612,
					565.682
				},
				rotationVInput = {
					9.758,
					354.911,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 15,
				cameraId = 90850371
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -689093949,
				facialEmotionVInput = "Confused"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = false,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
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
			kind = 4,
			fields = {
				delayTime = 6.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 62,
						portId = "StopLip"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1541038355,
				playableStateVInput = "Talk_Introduce"
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
			kind = 33,
			inputs = {
				entityIdVInput = -1541038355
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = false,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 66,
						portId = "In"
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
						nodeId = 65,
						portId = "StopLip"
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
					-392.718,
					25.626,
					565.273
				},
				rotationVInput = {
					7.351,
					321.565,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 15,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 172,
				fStop = 19.5,
				cameraId = 90850346
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -689093949,
				lookAtEntityStaticIdVInput = -1541038355
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1541038355,
				lookAtEntityStaticIdVInput = -689093949
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1899566943,
				lookAtEntityStaticIdVInput = -689093949
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -616030320,
				speedVInput = 0.9,
				playableStateVInput = "Story_Talk_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 29
			},
			fields = {
				templateId = 400612,
				processingTime = 1.083,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_Talk_Start",
					"Story_Talk_Loop",
					"Story_Talk_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -689093949,
				facialEmotionVInput = "Confused"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = false,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
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
						nodeId = 72,
						portId = "StopLip"
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
					-393.569,
					25.621,
					566.248
				},
				rotationVInput = {
					7.695,
					301.97,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 37,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 132,
				fStop = 32,
				cameraId = 90850339
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 30,
				staticIdVInput = -689093949,
				playableStateVInput = "MainMenu_Idle_Start"
			},
			fields = {
				templateId = 400359,
				processingTime = 1.083,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"MainMenu_Idle_Start",
					"MainMenu_Idle_Loop",
					"MainMenu_Idle_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 560013,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-394.05,
					24,
					566.722
				},
				rotationVInput = {
					0,
					160.722,
					0
				}
			},
			fields = {
				entityId = -1770438868,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 77,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 80,
			inputs = {
				stateNameVInput = "Small_Up"
			},
			valueIn = {
				targetVInput = {
					nodeId = 76,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -1899566943,
				facialEmotionVInput = "Confused"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = false,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
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
			kind = 4,
			fields = {
				delayTime = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 78,
						portId = "StopLip"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -689093949,
				lookAtEntityStaticIdVInput = -1899566943
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -689093949,
				facialEmotionVInput = "Confused"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = false,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 82,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 81,
						portId = "StopLip"
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
					-394.508,
					25.486,
					566.505
				},
				rotationVInput = {
					6.664,
					47.165,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 143,
				fStop = 32,
				cameraId = 90850336
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			valueIn = {
				entityIdVInput = {
					nodeId = 117,
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
				fovVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-397.262,
					26.07,
					570.412
				},
				rotationVInput = {
					7.008,
					138.952,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 368,
				fStop = 16,
				cameraId = 91373515
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 86,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 20,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-396.948,
					26.011,
					570.05
				},
				rotationVInput = {
					7.008,
					138.952,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 368,
				fStop = 16,
				cameraId = 90850343
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -616030320,
				durationVInput = 2,
				targetEulerAngleVInput = {
					0,
					-21.4,
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
				staticIdVInput = -689093949,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				templateId = 4,
				processingTime = 1.083,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
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
					-404.917,
					26.985,
					576.684
				},
				rotationVInput = {
					359.273,
					142.046,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 1723,
				fStop = 16,
				cameraId = 90850280
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 90,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-406.184,
					27.743,
					575.953
				},
				rotationVInput = {
					350.335,
					144.968,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 744,
				fStop = 16,
				cameraId = 90850276
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -689093949,
				lookAtEntityStaticIdVInput = -616030320
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -616030320
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 106,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -616030320
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 108,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -1899566943,
				facialEmotionVInput = "Confused"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
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
			kind = 4,
			fields = {
				delayTime = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 94,
						portId = "StopLip"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1899566943,
				speedVInput = 0.7,
				playableStateVInput = "Talk_Lefthand"
			},
			fields = {
				templateId = 400077,
				processingTime = 1.083,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -689093949,
				facialEmotionVInput = "Confused"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = -1899566943,
				facialEmotionVInput = "Confused"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true,
				noBlink = false
			},
			flowIn = {
				In = 0,
				StopLip = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 99,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 10
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 98,
						portId = "StopLip"
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
					-395.123,
					25.736,
					565.342
				},
				rotationVInput = {
					10.961,
					22.069,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 90850244
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 101,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-395.064,
					25.789,
					565.034
				},
				rotationVInput = {
					11.305,
					19.147,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 90850328
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1899566943,
				speedVInput = 0.888,
				targetEulerAngleVInput = {
					0,
					241.9,
					0
				},
				targetPositionVInput = {
					-393.585,
					24.138,
					567.413
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
			kind = 15,
			inputs = {
				staticIdVInput = -1899566943,
				lookAtEntityStaticIdVInput = -689093949
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -689093949,
				lookAtEntityStaticIdVInput = -1899566943
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
					-391.827,
					25.794,
					562.531
				},
				rotationVInput = {
					15.086,
					9.177,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 90850266
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400077,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-393.739,
					24.138,
					567.761
				},
				rotationVInput = {
					0,
					156.141,
					0
				}
			},
			fields = {
				entityId = -1899566943,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400612,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-391.59,
					24.138,
					564.142
				},
				rotationVInput = {
					0,
					151.086,
					0
				}
			},
			fields = {
				entityId = -616030320,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-394.248,
					24.166,
					567.603
				},
				rotationVInput = {
					0,
					181.7,
					0
				}
			},
			fields = {
				entityId = -1541038355,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 109,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1541038355,
				lookAtEntityStaticIdVInput = -1899566943
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-394.826,
					24.181,
					566.792
				},
				rotationVInput = {
					0,
					-279.1,
					0
				}
			},
			fields = {
				entityId = -689093949,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 12,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-391.776,
					30.597,
					586.163
				},
				rotationVInput = {
					18.273,
					135.051,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 500,
				fStop = 16,
				cameraId = 90850104
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
					-389.539,
					30.32,
					587.212
				},
				rotationVInput = {
					18.273,
					135.051,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 500,
				fStop = 16,
				cameraId = 90850103
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
			kind = 64,
			fields = {
				weather = 0,
				timePeriod = 2,
				changeType = 1
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
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		[117] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	}
}
