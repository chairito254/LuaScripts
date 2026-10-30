-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_76759391.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 76759391,
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
						nodeId = 26
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
				cameraId = 76759407,
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
						nodeId = 6
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
				setRotation = false,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 7
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
				setRotation = false,
				setPosition = true,
				reset = false
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
			kind = 20,
			inputs = {
				staticIdVInput = 76707907,
				isResetValueInput = true,
				durationVInput = 0.01
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
			kind = 20,
			inputs = {
				staticIdVInput = 76707909,
				isResetValueInput = true,
				durationVInput = 0.01
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 10
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
				setRotation = false,
				setPosition = true,
				reset = true
			},
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
			kind = 14,
			inputs = {
				staticIdVInput = 2,
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
				setRotation = false,
				setPosition = true,
				reset = true
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
			kind = 20,
			inputs = {
				staticIdVInput = 1,
				isResetValueInput = true,
				durationVInput = 0.01
			},
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
			kind = 20,
			inputs = {
				staticIdVInput = 2,
				isResetValueInput = true,
				durationVInput = 0.01
			},
			flowIn = {
				In = 0
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
						nodeId = 15
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
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 202050,
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
				ignoreGravity = false,
				entityId = -1014425536
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				speedVInput = 0.85,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
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
					nodeId = 15
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
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
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.85,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
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
					nodeId = 15
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
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
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.85,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
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
					nodeId = 15
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
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
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.85,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
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
					nodeId = 15
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
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
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.85,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
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
					nodeId = 15
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
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
						nodeId = 21
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
						nodeId = 22
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
						nodeId = 23
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 31
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
					nodeId = 15
				}
			},
			fields = {
				entityType = 2,
				templateId = 401051,
				processingTime = 4,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "0",
						nodeId = 24
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
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					236.2,
					0
				},
				targetPositionVInput = {
					-1099.006,
					65.928,
					1743.001
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 27
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
					236.2,
					0
				},
				targetPositionVInput = {
					-1099.006,
					65.928,
					1743.001
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = true
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
				isResetValueInput = true,
				staticIdVInput = 1,
				isFadeInVInput = true,
				durationVInput = 0.01
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isResetValueInput = true,
				staticIdVInput = 2,
				isFadeInVInput = true,
				durationVInput = 0.01
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
				playableStateVInput = "Behav_Love"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 40
				}
			},
			fields = {
				entityType = 2,
				templateId = 401051,
				processingTime = 4,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "1",
						nodeId = 24
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
					nodeId = 15
				}
			},
			fields = {
				entityType = 2,
				templateId = 202050,
				processingTime = 4.617,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "0",
						nodeId = 33
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
						nodeId = 34
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
						nodeId = 16
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.85,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				targetPositionVInput = {
					-1109.427,
					68.999,
					1732.391
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 40
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
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
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.85,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				targetPositionVInput = {
					-1106.084,
					66.396,
					1731.254
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 40
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
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
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.85,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				targetPositionVInput = {
					-1104.872,
					65.812,
					1733.886
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 40
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
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
				speedVInput = 0.85,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
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
					nodeId = 40
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
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
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 15
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
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 202051,
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
				ignoreGravity = false,
				entityId = -770162911
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 42
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
					nodeId = 40
				}
			},
			fields = {
				entityType = 2,
				templateId = 202051,
				processingTime = 4,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "1",
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 40
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
						nodeId = 41
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
						nodeId = 26
					}
				}
			}
		}
	}
}
