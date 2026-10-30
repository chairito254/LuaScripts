-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91514584.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91514584,
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
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					hideInteractionSign = true,
					hideMarkShare = false,
					hideTopLogo = true,
					blockCameraZoom = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					toplogoComList = {
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
						teamSpeech = true,
						quest = true
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
						nodeId = 22
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
						nodeId = 4
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 64
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 69
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.3
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
						nodeId = 6
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
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 67
				}
			},
			fields = {
				enableDefaultLookAt = true,
				cameraPreset = 2,
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 1,
				enableGroupLookAt = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				portCount = 5
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
						nodeId = 62
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 63
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304880,
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
				npcId = 5150043,
				matchAudioDuration = true,
				duration = 6.38,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0
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
						nodeId = 11
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 59
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 58
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 60
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5150043,
				dialogueIdVInput = 3304881,
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
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0
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
						nodeId = 13
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
						nodeId = 54
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 56
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 57
					}
				},
				["5"] = {
					{
						portId = "Stop",
						nodeId = 58
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304882,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5150043,
				matchAudioDuration = true,
				duration = 8.25,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0
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
				portCount = 8
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
						nodeId = 48
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 49
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 50
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 51
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304883,
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
				npcId = 5150030,
				matchAudioDuration = true,
				duration = 3.25,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0
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
						nodeId = 43
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304884
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 9
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
						nodeId = 34
					}
				},
				["2"] = {
					{
						portId = "StopDof",
						nodeId = 36
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 37
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 39
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 40
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 41
					}
				},
				["8"] = {
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
				dialogueIdVInput = 3304886,
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
				npcId = 5150043,
				matchAudioDuration = true,
				duration = 11.5,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304887,
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
				npcId = 5150043,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0
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
				portCount = 4
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
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304888,
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
				npcId = 5150043,
				matchAudioDuration = true,
				duration = 7.12,
				disableCamera = false,
				chatType = 0,
				blackScreenPlayType = 0
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
						portId = "In",
						nodeId = 23
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
						nodeId = 24
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 27
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 29
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 25
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
						nodeId = 26
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
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1172671232
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
						nodeId = 30
					}
				}
			}
		},
		{
			kind = 21,
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
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91459695,
				staticIdVInput = 91197886
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
					-921.617,
					440.475,
					-500.863
				},
				rotationVInput = {
					348.543,
					147.983,
					359.935
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.27,
				sensorWidth = 213,
				recombineQuality = 1,
				openDof = false,
				focalDistance = 635,
				fStop = 14.37,
				cameraId = 91535077
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-920.763,
					440.475,
					-502.231
				},
				rotationVInput = {
					345.965,
					147.471,
					359.935
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.27,
				sensorWidth = 213,
				recombineQuality = 1,
				openDof = false,
				focalDistance = 635,
				fStop = 14.37,
				cameraId = 91535083
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
					-920.917,
					441.161,
					-503.576
				},
				rotationVInput = {
					357.653,
					106.548,
					359.936
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1.27,
				sensorWidth = 213,
				recombineQuality = 1,
				openDof = true,
				focalDistance = 635,
				fStop = 14.37,
				cameraId = 91535073
			},
			flowIn = {
				StopDof = 1,
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -1172671232,
				targetEulerAngleVInput = {
					0,
					175.068,
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
			kind = 26,
			inputs = {
				staticIdVInput = 91534473,
				targetEulerAngleVInput = {
					0,
					175.419,
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
				playableStateVInput = "IdleSpecial",
				staticIdVInput = 91197886
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150043,
				processingTime = 4.3
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 91459695,
				targetEulerAngleVInput = {
					0,
					175.068,
					0
				}
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 78
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
				lookAtEntityStaticIdVInput = 91197886,
				staticIdVInput = -1172671232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91197886,
				staticIdVInput = 91459695
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304885
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
						portId = "Stop",
						nodeId = 45
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
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_DoubtStart",
				staticIdVInput = 91459695,
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150030,
				processingTime = 0,
				aniStateList = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
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
				delayTime = 0.2
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
			kind = 26,
			inputs = {
				staticIdVInput = 91459695
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 77
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
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-922.725,
					444.476,
					-505.508
				},
				rotationVInput = {
					19.2,
					106.696,
					359.933
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 340,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 221,
				fStop = 12.11,
				cameraId = 91534674
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -1172671232
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 76
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
			kind = 26,
			inputs = {
				staticIdVInput = 91534473
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 76
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
				lookAtEntityStaticIdVInput = 91459695,
				staticIdVInput = -1172671232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91459695,
				staticIdVInput = 91197886
			},
			flowIn = {
				In = 0
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
					-921.58,
					444.015,
					-505.331
				},
				rotationVInput = {
					11.5,
					140.913,
					359.936
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 340,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 358,
				fStop = 10.28,
				cameraId = 91534654
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 55
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-921.219,
					443.927,
					-505.776
				},
				rotationVInput = {
					11.5,
					140.913,
					359.936
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 340,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 358,
				fStop = 10.28,
				cameraId = 91535059
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91197886,
				staticIdVInput = 91534473
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91197886,
				staticIdVInput = -1172671232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "EnvBehav_Sing",
				staticIdVInput = 91534473
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 5
			},
			flowIn = {
				Stop = 1,
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
					-920.736,
					440.615,
					-506.283
				},
				rotationVInput = {
					354.903,
					32.4,
					359.936
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 340,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 441,
				fStop = 12.11,
				cameraId = 91534618
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91534473,
				staticIdVInput = -1172671232
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				staticIdVInput = 91197886
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150043,
				processingTime = 4.3
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-920.506,
					440.61,
					-502.479
				},
				rotationVInput = {
					340.98,
					155.745,
					359.933
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 151,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 634,
				fStop = 21.06,
				cameraId = 91549223
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91197886,
				staticIdVInput = -1172671232
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
						nodeId = 68
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 66
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-919.506,
					439.626,
					-503.629
				},
				rotationVInput = {
					0,
					170.141,
					0
				}
			},
			fields = {
				entityId = -1172671232,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 73
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 74
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 75
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 66
				}
			},
			fields = {
				portCount = 4
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					170.141,
					0
				},
				targetPositionVInput = {
					-919.506,
					439.626,
					-503.629
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
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-920.668,
					440.61,
					-502.092
				},
				rotationVInput = {
					341.84,
					157.463,
					359.933
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 151,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 634,
				fStop = 21.06,
				cameraId = 91534577
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
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 50,
			inputs = {
				enableFillLightVInput = true,
				fillLightIntensityVInput = 8059
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91197886
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91534473
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91459695
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91459695
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = -1172671232
			},
			fields = {
				entityType = 4
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91197886
			},
			fields = {
				entityType = 2
			}
		}
	}
}
