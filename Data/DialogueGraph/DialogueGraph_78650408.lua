-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_78650408.lua

return {
	startNodeId = 1,
	dialogueId = 78650408,
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
						nodeId = 4,
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
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = true,
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
				OnSkipStart = {
					{
						nodeId = 82,
						portId = "In"
					}
				},
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
				portCount = 5
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
						nodeId = 80,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 62,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 81,
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
						nodeId = 7,
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
						nodeId = 14,
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
						nodeId = 9,
						portId = "In"
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
					-1589.486,
					100.388,
					854.411
				},
				rotationVInput = {
					33.502,
					210.193,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 2260,
				fStop = 8,
				cameraId = 82708926,
				visualizeDOF = false,
				squeezeFactor = 1.129,
				sensorWidth = 400
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
						nodeId = 10,
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
						nodeId = 11,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				speedVInput = 0.95,
				maxLimitTimeVInput = 20,
				targetPositionVInput = {
					-1597.548,
					87.405,
					834.324
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 106,
					portId = "EntityID"
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
							outTangent = 1,
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							time = 1,
							outWeight = 0,
							inWeight = 0,
							value = 1,
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
			kind = 4,
			fields = {
				delayTime = 4.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 52422181,
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
						nodeId = 15,
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
						nodeId = 16,
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
						nodeId = 28,
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
						nodeId = 18,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				fovVInput = 42,
				blendTimeVInput = 12,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1595.37,
					97.421,
					856.774
				},
				rotationVInput = {
					24.908,
					182.519,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 82708954,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
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
				["1"] = {
					{
						nodeId = 20,
						portId = "In"
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
					-1599.145,
					88.592,
					830.478
				},
				rotationVInput = {
					4.969,
					332.92,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 390,
				fStop = 12,
				cameraId = 91066217,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 250
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				fovVInput = 30,
				blendTimeVInput = 2.5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1599.145,
					88.592,
					830.478
				},
				rotationVInput = {
					5.313,
					333.608,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91066222,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 22,
						portId = "In"
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
					-1590.467,
					88.995,
					829.546
				},
				rotationVInput = {
					0.844,
					103.898,
					-0.001
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 315,
				fStop = 16,
				cameraId = 91064937,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 500
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 23,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				fovVInput = 40,
				blendTimeVInput = 2.5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1590.337,
					88.994,
					829.511
				},
				rotationVInput = {
					0.328,
					104.758,
					-0.001
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91064933,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				fovVInput = 43,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1586.056,
					88.435,
					838.299
				},
				rotationVInput = {
					337.123,
					327.248,
					-0.001
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91065299,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 43,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1587.383,
					88.281,
					837.718
				},
				rotationVInput = {
					348.811,
					340.311,
					-0.001
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91065301,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3.5
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
			kind = 5,
			inputs = {
				staticIdVInput = 59077307,
				speedVInput = 0.8,
				playableStateVInput = "Behav_LoveStart",
				playStartLoopEndVInput = true,
				loopDurationVInput = 3.333
			},
			fields = {
				templateId = 201905,
				processingTime = 1.467,
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
			kind = 4,
			fields = {
				delayTime = 9
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707600,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400162,
				matchAudioDuration = true,
				duration = 8.38,
				disableCamera = false,
				chatType = 3,
				skipTime = 1,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				npcStaticId = -1
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
						nodeId = 33,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707601,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400162,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				skipTime = 1,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				npcStaticId = -1
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
						nodeId = 35,
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
						nodeId = 54,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707602,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400162,
				matchAudioDuration = true,
				duration = 11.25,
				disableCamera = false,
				chatType = 3,
				skipTime = 1,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				npcStaticId = -1
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
						nodeId = 37,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 52,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3707603,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400162,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 3,
				skipTime = 1,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				npcStaticId = -1
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
			kind = 12,
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
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 3
			},
			flowIn = {
				In = 0
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
		{
			kind = 39,
			inputs = {
				fovBlendFuncVInput = "Linear",
				maxLockTimeVInput = 3,
				rotSpeedCurveVInput = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outTangent = 0,
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							time = 3,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 0
						}
					}
				}
			},
			valueIn = {
				faceToTargetVInput = {
					nodeId = 122,
					portId = "BoneTransform"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				LockTimeOut = {
					{
						nodeId = 0,
						portId = "End"
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
						nodeId = 43,
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
						nodeId = 46,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 50,
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
					15.681,
					0
				},
				targetPositionVInput = {
					-1593.826,
					87.405,
					836.994
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					263.703,
					0
				},
				targetPositionVInput = {
					-1591.98,
					87.405,
					837.88
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 112,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
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
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 82423015
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					309.056,
					0
				},
				targetPositionVInput = {
					-1592.05,
					87.405,
					836.38
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 113,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 72526864
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					215.436,
					0
				},
				targetPositionVInput = {
					-1592.247,
					87.405,
					838.466
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 111,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77979713
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0
			},
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 72526864,
				playableStateVInput = "Story_Announce_Start"
			},
			fields = {
				templateId = 400162,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_Announce_Start",
					"Story_Announce_Loop",
					"Story_Announce_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				fovVInput = 43,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1595.961,
					88.668,
					834.307
				},
				rotationVInput = {
					3.937,
					38.237,
					-0.001
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91065684,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 43,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1596.084,
					88.704,
					834.15
				},
				rotationVInput = {
					3.422,
					38.409,
					-0.001
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91066240,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
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
						nodeId = 55,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 56,
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
						nodeId = 58,
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
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 72526864
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 77979713
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 82423015
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 39,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1590.431,
					88.988,
					844.554
				},
				rotationVInput = {
					15.11,
					350.453,
					-0.001
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 360,
				fStop = 13.33,
				cameraId = 91065670,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 570
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
				fovVInput = 38,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1590.462,
					88.939,
					844.74
				},
				rotationVInput = {
					13.563,
					350.796,
					-0.001
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91065671,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 72526864
			},
			fields = {
				activePlayEmotion = false,
				noBlink = true,
				activePlayLip = true
			},
			flowIn = {
				In = 0
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
						nodeId = 67,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 63,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					106.21,
					0
				},
				targetPositionVInput = {
					-1601.366,
					87.333,
					833.669
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 107,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 10,
				staticIdVInput = 91042789,
				playableStateVInput = "Home_OperateLoop_Ice"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 107,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 880859,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 14,
			inputs = {
				staticIdVInput = 59077307,
				targetEulerAngleVInput = {
					358.848,
					12.49,
					354.736
				},
				targetPositionVInput = {
					-1600.767,
					88.059,
					832.169
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 20,
				staticIdVInput = 59077307,
				playableStateVInput = "Fly_Idle"
			},
			fields = {
				templateId = 201905,
				processingTime = 1.467,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Fly_Idle",
					"Fly_Idle",
					"Fly_Idle"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					293.382,
					0
				},
				targetPositionVInput = {
					-1599.917,
					87.393,
					833.416
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 109,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
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
		{
			kind = 5,
			inputs = {
				speedVInput = 0.8,
				playOnEntityVInput = true,
				playableStateVInput = "Emotion_Helpless"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 109,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400014,
				processingTime = 2.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2
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
		{
			kind = 5,
			inputs = {
				speedVInput = 0.8,
				playOnEntityVInput = true,
				playableStateVInput = "Daily_Teach_Loop",
				playStartLoopEndVInput = true,
				loopDurationVInput = 10
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 109,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400014,
				processingTime = 2.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Daily_Teach_Start",
					"Daily_Teach_Loop",
					"Daily_Teach_Loop"
				}
			},
			flowIn = {
				In = 0
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
						nodeId = 71,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 74,
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
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					116.021,
					0
				},
				targetPositionVInput = {
					-1600.812,
					87.553,
					840.545
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 112,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.2
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
			kind = 19,
			inputs = {
				speedVInput = 0.8,
				maxLimitTimeVInput = 20,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					108.866,
					0
				},
				targetPositionVInput = {
					-1591.683,
					87.396,
					837.746
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 112,
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
							outTangent = 1,
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							time = 1,
							outWeight = 0,
							inWeight = 0,
							value = 1,
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
				targetEulerAngleVInput = {
					0,
					106.232,
					0
				},
				targetPositionVInput = {
					-1603.663,
					87.553,
					838.668
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 113,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				delayTime = 1.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.75,
				maxLimitTimeVInput = 8,
				targetEulerAngleVInput = {
					0,
					340,
					0
				},
				targetPositionVInput = {
					-1592.05,
					87.405,
					836.38
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 113,
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
							outTangent = 1,
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							time = 1,
							outWeight = 0,
							inWeight = 0,
							value = 1,
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
				targetEulerAngleVInput = {
					0,
					117.884,
					0
				},
				targetPositionVInput = {
					-1602.616,
					87.554,
					841.8
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 111,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
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
			kind = 4,
			fields = {
				delayTime = 1.2
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
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 8,
				targetEulerAngleVInput = {
					0,
					100,
					0
				},
				targetPositionVInput = {
					-1592.003,
					87.405,
					836.646
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 111,
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
							outTangent = 1,
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							time = 1,
							outWeight = 0,
							inWeight = 0,
							value = 1,
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
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					105,
					0
				},
				targetPositionVInput = {
					-1603.823,
					87.553,
					840.092
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					114.784,
					0
				},
				targetPositionVInput = {
					-1605.304,
					87.553,
					840.195
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 106,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
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
					30.836,
					0
				},
				targetPositionVInput = {
					-1593.826,
					87.405,
					836.994
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 83,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 82423015,
				targetEulerAngleVInput = {
					0,
					309.056,
					0
				},
				targetPositionVInput = {
					-1592.05,
					87.405,
					836.38
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
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
			kind = 14,
			inputs = {
				staticIdVInput = 72526864,
				targetEulerAngleVInput = {
					0,
					263.703,
					0
				},
				targetPositionVInput = {
					-1591.98,
					87.405,
					837.88
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 85,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77979713,
				targetEulerAngleVInput = {
					0,
					215.436,
					0
				},
				targetPositionVInput = {
					-1592.247,
					87.405,
					838.466
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		[106] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[107] = {
			kind = 9,
			inputs = {
				staticIdVInput = 91042789
			},
			fields = {
				entityType = 2
			}
		},
		[109] = {
			kind = 9,
			inputs = {
				staticIdVInput = 52422181
			},
			fields = {
				entityType = 2
			}
		},
		[111] = {
			kind = 17,
			inputs = {
				staticIdVInput = 77979713
			},
			fields = {
				entityType = 2
			}
		},
		[112] = {
			kind = 17,
			inputs = {
				staticIdVInput = 72526864
			},
			fields = {
				entityType = 2
			}
		},
		[113] = {
			kind = 17,
			inputs = {
				staticIdVInput = 82423015
			},
			fields = {
				entityType = 2
			}
		},
		[122] = {
			kind = 17,
			inputs = {
				staticIdVInput = 52418043
			},
			fields = {
				entityType = 2
			}
		}
	}
}
