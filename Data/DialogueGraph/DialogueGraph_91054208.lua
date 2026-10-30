-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91054208.lua

return {
	dialogueId = 91054208,
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
			kind = 81,
			inputs = {
				waitDestroyVInput = true,
				uidVInput = 421
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.6
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
					hideMarkShare = true,
					hideInteractionSign = false,
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
						portId = "In",
						nodeId = 33
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 880933,
				positionVInput = {
					89.26,
					40.01,
					470.61
				},
				rotationVInput = {
					0,
					269.187,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -151395735
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 46
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101018,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -151395735,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101006,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.62,
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
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101007,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
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
						portId = "In",
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 28,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 11
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
						nodeId = 12
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
						nodeId = 42
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 20,
				staticIdVInput = -151395735,
				targetEulerAngleVInput = {
					0,
					90,
					0
				},
				targetPositionVInput = {
					85.37,
					40.02,
					465.58
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
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0
						},
						{
							weightedMode = 0,
							time = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0
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
						portId = "2",
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 7
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0,
				["4"] = 0,
				["3"] = 0
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
						nodeId = 15
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
						nodeId = 39
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 22
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 20
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 17
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101008,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PLAYER_BODY_TYPE",
					1,
					1,
					">=",
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
						nodeId = 19
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Social_HoldFaceLeft_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 99
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 52
				}
			},
			fields = {
				entityType = 0,
				templateId = 3,
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Social_HoldFaceLeft_Start",
					"Social_HoldFaceLeft_Loop",
					"Social_HoldFaceLeft_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Social_HoldFaceLeft_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 99
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 52
				}
			},
			fields = {
				entityType = 0,
				templateId = 3,
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Social_HoldFaceLeft_Start",
					"Social_HoldFaceLeft_Loop",
					"Social_HoldFaceLeft_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 91052590
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 1,
				lookAtEntityStaticIdVInput = 91052590
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3
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
			kind = 27,
			fields = {
				uid = 7,
				param = {
					snapshot = false,
					photoMode = "dialogue"
				}
			},
			flowIn = {
				closeUIFInput = 1,
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 24
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 38
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
						nodeId = 25
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
						nodeId = 26
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101019,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 8.75,
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
						nodeId = 27
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
						nodeId = 28
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 35
					}
				},
				["2"] = {
					{
						portId = "StopDof",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101020,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 29
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
						nodeId = 30
					}
				},
				["1"] = {
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
				dialogueIdVInput = 9101021,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
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
						nodeId = 31
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
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101022,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 12,
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
						nodeId = 33
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendExponentVInput = 1,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					76.628,
					43.637,
					525.756
				},
				rotationVInput = {
					353.296,
					2.474,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91085095,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 1,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					86.81,
					41.08,
					466.58
				},
				rotationVInput = {
					354.329,
					236.169,
					0.877
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91085083,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				StopDof = 1,
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
						nodeId = 37
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
						nodeId = 18
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 25
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "closeUIFInput",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				fovVInput = 32,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					86.57,
					40.37,
					465.53
				},
				rotationVInput = {
					352.674,
					97.282,
					0.346
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 410,
				fStop = 18.17,
				cameraId = 91085102,
				visualizeDOF = false,
				squeezeFactor = 1
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
						portId = "In",
						nodeId = 41
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				autoPathfindingVInput = true,
				staticIdVInput = 2,
				maxLimitTimeVInput = 20,
				targetEulerAngleVInput = {
					0,
					283.04,
					0
				},
				targetPositionVInput = {
					90.04,
					40.02,
					465.52
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
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0
						},
						{
							weightedMode = 0,
							time = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0
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
						portId = "0",
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				autoPathfindingVInput = true,
				staticIdVInput = 1,
				speedVInput = 1.2,
				maxLimitTimeVInput = 20,
				targetEulerAngleVInput = {
					0,
					286.26,
					0
				},
				targetPositionVInput = {
					89.57,
					39.97,
					464.81
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
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0
						},
						{
							weightedMode = 0,
							time = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0
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
						portId = "1",
						nodeId = 13
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
						portId = "In",
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "4",
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 1,
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					82.39,
					41.23,
					472.33
				},
				rotationVInput = {
					353.832,
					128.903,
					0.404
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91085089,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "3",
						nodeId = 13
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
					120.499,
					0
				},
				targetPositionVInput = {
					88.225,
					40.008,
					471.237
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
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
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					98.248,
					0
				},
				targetPositionVInput = {
					88.286,
					40.008,
					470.294
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 48
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
					85.758,
					41.569,
					469.073
				},
				rotationVInput = {
					13.863,
					57.608,
					359.99
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91428129,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 49
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -151395735,
				lookAtEntityStaticIdVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		[52] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	}
}
