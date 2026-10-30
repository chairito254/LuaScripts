-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_81995573.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 81995573,
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
				modeInfo = {
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
					enhanceAmbientIntensity = true,
					toplogoComList = {
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
						petChat = true,
						npc = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 34,
			inputs = {
				staticIdVInput = 76707907
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 34,
			inputs = {
				staticIdVInput = 76707909
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetPositionVInput = {
					-1101.02,
					65.63,
					1740.32
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 60
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = false
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
						nodeId = 7
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 50,
				playableStateVInput = "HideMimicry_Start",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 60
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1045100,
				processingTime = 1.417,
				playAniType = 1,
				aniStateList = {
					"HideMimicry_Start",
					"HideMimicry_Idle",
					"HideMimicry_End"
				}
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
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 0.8,
				blendFuncVInput = "EaseOut",
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1109.986,
					72.402,
					1738.232
				},
				rotationVInput = {
					43.659,
					92.131,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 82103461,
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
						portId = "In",
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 36,
			flowIn = {
				In = 0
			},
			flowOut = {
				fOutInput = {
					{
						portId = "In",
						nodeId = 11
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
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 21,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 36,
			inputs = {
				retValueInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				fOutInput = {
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				enableDefaultLookAt = true,
				cameraPreset = 0,
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 0,
				enableGroupLookAt = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 54,
			valueIn = {
				conditionVInput = {
					portId = "Value",
					nodeId = 63
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 54
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005010,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0.5,
				anim = "EnvBehav_ScreenShowLoop",
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				animCfg = {
					[1] = "EnvBehav_ScreenShowLoop",
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
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005011,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0.5,
				anim = "EnvBehav_ScreenShowLoop",
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				animCfg = {
					[1] = "EnvBehav_ScreenShowLoop",
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
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 19
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
						nodeId = 20
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
					toplogoComList = {
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
						petChat = true,
						npc = true
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
						nodeId = 31
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 21
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
					-1094.702,
					72.722,
					1747.001
				},
				rotationVInput = {
					24.959,
					225.377,
					-0.006
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 82108626,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 22
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 76707907,
				targetEulerAngleVInput = {
					0,
					357.418,
					0
				},
				targetPositionVInput = {
					-1084.524,
					75.43,
					1746.596
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = false
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
			kind = 14,
			inputs = {
				staticIdVInput = 76707909,
				targetEulerAngleVInput = {
					0,
					357.418,
					0
				},
				targetPositionVInput = {
					-1080.274,
					73.93,
					1749.596
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = false
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
			kind = 20,
			inputs = {
				isResetValueInput = true,
				durationVInput = 0.01,
				staticIdVInput = 76707907
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
			kind = 20,
			inputs = {
				isResetValueInput = true,
				durationVInput = 0.01,
				staticIdVInput = 76707909
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
						nodeId = 27
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 50
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 202050,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1097.401,
					65.7,
					1739.013
				},
				rotationVInput = {
					0,
					79.465,
					0
				}
			},
			fields = {
				entityId = -1137711163,
				ignoreGravity = false
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Love"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 27
				}
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 401051,
				processingTime = 4,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "0",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 2,
				maxAwaitTime = -1
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
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
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0.01,
				isResetValueInput = true,
				staticIdVInput = 1
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
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0.01,
				isResetValueInput = true,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 21,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 27
				}
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 202050,
				processingTime = 4.617,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "0",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 2,
				maxAwaitTime = -1
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 36
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
						nodeId = 37
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 45
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				speedVInput = 0.85,
				targetEulerAngleVInput = {
					0,
					80,
					0
				},
				targetPositionVInput = {
					-1099.625,
					65.536,
					1742.945
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 27
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						portId = "In",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				speedVInput = 0.85,
				targetEulerAngleVInput = {
					0,
					80,
					0
				},
				targetPositionVInput = {
					-1103.724,
					65.697,
					1743.872
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 27
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						portId = "In",
						nodeId = 39
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				speedVInput = 0.85,
				targetEulerAngleVInput = {
					0,
					80,
					0
				},
				targetPositionVInput = {
					-1106.866,
					65.939,
					1742.215
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 27
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						portId = "In",
						nodeId = 40
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				speedVInput = 0.85,
				targetEulerAngleVInput = {
					0,
					80,
					0
				},
				targetPositionVInput = {
					-1106.993,
					65.979,
					1738.344
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 27
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						portId = "In",
						nodeId = 41
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				speedVInput = 0.85,
				targetEulerAngleVInput = {
					0,
					70.762,
					0
				},
				targetPositionVInput = {
					-1107.64,
					66.014,
					1737.55
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 27
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 42
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 2,
				maxAwaitTime = -1
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 43
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
						nodeId = 28
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Love"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 50
				}
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 401051,
				processingTime = 4,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "1",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				speedVInput = 0.85,
				targetPositionVInput = {
					-1109.427,
					68.999,
					1732.391
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 50
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						portId = "In",
						nodeId = 46
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				speedVInput = 0.85,
				targetPositionVInput = {
					-1106.084,
					66.396,
					1731.254
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 50
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						portId = "In",
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				speedVInput = 0.85,
				targetPositionVInput = {
					-1104.872,
					65.812,
					1733.886
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 50
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						portId = "In",
						nodeId = 48
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				speedVInput = 0.85,
				targetEulerAngleVInput = {
					0,
					73.522,
					0
				},
				targetPositionVInput = {
					-1107.235,
					66.035,
					1736.127
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 50
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 42
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 27
				}
			},
			fields = {
				duration = 10,
				emojiName = "Love"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 202051,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1111.08,
					70.38,
					1735.83
				},
				rotationVInput = {
					0,
					259.465,
					0
				}
			},
			fields = {
				entityId = -951772155,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Love"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 50
				}
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 202051,
				processingTime = 4,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "1",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 50
				}
			},
			fields = {
				duration = 10,
				emojiName = "Love"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 51
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 12
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005002,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0.5,
				anim = "EnvBehav_ScreenShowStart",
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 55
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005003,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0.5,
				anim = "EnvBehav_ScreenShowLoop",
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				animCfg = {
					[1] = "EnvBehav_ScreenShowLoop",
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
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 56
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005004,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0.5,
				anim = "IdleSpecial",
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				animCfg = {
					[1] = "IdleSpecial",
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
				ShowFinOut = {
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
				dialogueIdVInput = 70005005,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0.5,
				anim = "EnvBehav_ScreenShowLoop",
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				animCfg = {
					[1] = "EnvBehav_ScreenShowLoop",
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
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 58
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005007,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0.5,
				anim = "EnvBehav_ScreenShowStart",
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005008,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0.5,
				anim = "EnvBehav_ScreenShowStart",
				portCount = 1,
				npcStaticId = -1,
				npcId = 401050,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 76707907,
				boneNameVInput = "Bip001 Head"
			},
			fields = {
				entityType = 2
			}
		},
		[63] = {
			kind = 44,
			fields = {
				variableName = "IsDIalogued"
			}
		}
	},
	blackboard = {
		IsDIalogued = false,
		loc = {
			-1101.02,
			65.63,
			1740.32
		}
	}
}
