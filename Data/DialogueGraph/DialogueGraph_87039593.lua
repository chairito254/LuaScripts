-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_87039593.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 87039593,
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
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					toplogoComList = {
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
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = true
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
						nodeId = 4,
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
						nodeId = 7,
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
						nodeId = 39,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 36,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 46,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 50,
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
					-10.453,
					102.111,
					-57.251
				},
				rotationVInput = {
					352.383,
					316.839,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91384164,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 644
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-10.767,
					102.143,
					-57.141
				},
				rotationVInput = {
					353.758,
					321.652,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91384606,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 644
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
						nodeId = 8,
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
						nodeId = 9,
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
					-13.61,
					102.149,
					-49.296
				},
				rotationVInput = {
					2.696,
					231.343,
					0
				}
			},
			fields = {
				fStop = 11.67,
				cameraId = 91384568,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-13.655,
					102.323,
					-49.268
				},
				rotationVInput = {
					358.743,
					231,
					0
				}
			},
			fields = {
				fStop = 11.67,
				cameraId = 91384667,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200
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
						nodeId = 12,
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
						nodeId = 13,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 33,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 35,
						portId = "In"
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
						nodeId = 14,
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
						nodeId = 15,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 21,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 25,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 29,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505053,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true
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
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505054,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 5.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91329900,
				npcId = 990010,
				matchAudioDuration = true
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
						nodeId = 19,
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
						nodeId = 20,
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
						nodeId = 0,
						portId = "End"
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
					-4.513,
					102.695,
					-49.87
				},
				rotationVInput = {
					2.009,
					18.479,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91384529,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
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
				blendTimeVInput = 10,
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1.302,
					104.249,
					-50.323
				},
				rotationVInput = {
					6.306,
					1.462,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91384558,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1385190128,
				targetEulerAngleVInput = {
					0,
					64.16,
					0
				},
				targetPositionVInput = {
					-7.833,
					100.184,
					-43.283
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
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = -1385190128,
				targetEulerAngleVInput = {
					0,
					355.305,
					0
				},
				targetPositionVInput = {
					-1.791,
					100.265,
					-42.364
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
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1
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
				staticIdVInput = -1127636232,
				targetEulerAngleVInput = {
					0,
					55.198,
					0
				},
				targetPositionVInput = {
					-1.305,
					100.149,
					-40.298
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
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 25,
				staticIdVInput = -1127636232,
				targetEulerAngleVInput = {
					0,
					346.178,
					0
				},
				targetPositionVInput = {
					2.4,
					100.058,
					-37.8
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
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1
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
					355.305,
					0
				},
				targetPositionVInput = {
					-1.791,
					100.265,
					-42.364
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
						nodeId = 28,
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
					359.003,
					0
				},
				targetPositionVInput = {
					-3.32,
					100.216,
					-41.552
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
			kind = 14,
			inputs = {
				staticIdVInput = -156307471,
				targetEulerAngleVInput = {
					0,
					31.295,
					0
				},
				targetPositionVInput = {
					-0.5,
					100.202,
					-40.964
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
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = -156307471,
				targetEulerAngleVInput = {
					0,
					317.677,
					0
				},
				targetPositionVInput = {
					3.43,
					100.028,
					-37.81
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
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1
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
				staticIdVInput = -224848157,
				targetEulerAngleVInput = {
					0,
					49.733,
					0
				},
				targetPositionVInput = {
					-8.679,
					100.168,
					-42.807
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
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = -224848157,
				targetEulerAngleVInput = {
					0,
					359.003,
					0
				},
				targetPositionVInput = {
					-3.32,
					100.216,
					-41.552
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
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1
						}
					}
				}
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
					-9.362,
					109.325,
					-37.757
				},
				rotationVInput = {
					9.572,
					163.344,
					0
				}
			},
			fields = {
				fStop = 32,
				cameraId = 91384698,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 292,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 756
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
				blendTimeVInput = 8,
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-11.52,
					108.703,
					-38.357
				},
				rotationVInput = {
					7.165,
					153.031,
					0
				}
			},
			fields = {
				fStop = 32,
				cameraId = 90831878,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 292,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 756
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 25,
				staticIdVInput = -1385190128,
				targetEulerAngleVInput = {
					0,
					355.305,
					0
				},
				targetPositionVInput = {
					-1.791,
					100.265,
					-42.364
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
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					-15.935,
					101.241,
					-50.222
				},
				rotationVInput = {
					0,
					40.483,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1127636232
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
				staticIdVInput = -1127636232,
				playableStateVInput = "FallToGroundL"
			},
			fields = {
				processingTime = 1.15,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1127636232,
				targetEulerAngleVInput = {
					0,
					55.198,
					0
				},
				targetPositionVInput = {
					-1.305,
					100.149,
					-40.298
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
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1
						}
					}
				}
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
					-15.99,
					101.143,
					-51.028
				},
				rotationVInput = {
					0,
					40,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1385190128
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1385190128,
				playableStateVInput = "FallToGroundH"
			},
			fields = {
				processingTime = 2.6,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 0
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
				speedVInput = 1.2,
				playableStateVInput = "Story_LookAround02",
				staticIdVInput = -1385190128
			},
			fields = {
				processingTime = 9.633,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 303
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					-15.147,
					101.241,
					-50.71
				},
				rotationVInput = {
					0,
					44.059,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156307471
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -156307471,
				playableStateVInput = "FallToGroundL"
			},
			fields = {
				processingTime = 0.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990011
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.75,
				staticIdVInput = -156307471,
				targetEulerAngleVInput = {
					0,
					55.198,
					0
				},
				targetPositionVInput = {
					-1.305,
					100.149,
					-40.298
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
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
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
						nodeId = 45,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = -156307471
			},
			fields = {
				duration = 5,
				emojiName = "Happy"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 3,
				positionVInput = {
					-14.962,
					101.143,
					-51.035
				},
				rotationVInput = {
					0,
					40,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -224848157
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				staticIdVInput = -224848157,
				playableStateVInput = "FallToGroundH"
			},
			fields = {
				processingTime = 2.6,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 0
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
					40,
					0
				},
				targetPositionVInput = {
					-15.99,
					101.143,
					-51.028
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
						nodeId = 49,
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
					40,
					0
				},
				targetPositionVInput = {
					-14.962,
					101.143,
					-51.035
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
				slotParamVInput = 990062,
				positionVInput = {
					11.18,
					101.48,
					-63.43
				},
				rotationVInput = {
					0,
					270,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -2037474542
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990061,
				positionVInput = {
					8.66,
					101.48,
					-67.55
				},
				rotationVInput = {
					0,
					349.714,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1370564884
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 52,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990063,
				positionVInput = {
					14.581,
					102.429,
					-68.306
				},
				rotationVInput = {
					0,
					310.45,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -182549301
			},
			flowIn = {
				In = 0
			}
		}
	}
}
