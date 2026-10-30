-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_77012190.lua

return {
	dialogueId = 77012190,
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
			kind = 11,
			fields = {
				modeInfo = {
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = false,
					blockEvent = false,
					modeType = 1,
					blockCameraZoom = false,
					toplogoComList = {
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
						bubble = true,
						alert = true
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
			kind = 24,
			inputs = {
				switchToWalkVInput = true
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
						nodeId = 164
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 260230230,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 6
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
						nodeId = 7
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
						nodeId = 8
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
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 10,
			inputs = {
				showTopLogoVInput = false,
				showAllUIVInput = false,
				enablePlayerMoveVInput = false,
				enableEventVInput = false,
				enableCameraZoomVInput = false
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
			kind = 45,
			inputs = {
				timelineResIdVInput = "$P_TL_Novice_P3_ShuangZiChuXian.prefab"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				PreFinish = {
					{
						portId = "In",
						nodeId = 163
					}
				},
				Start = {
					{
						portId = "In",
						nodeId = 162
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
						nodeId = 12
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 161
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				modeInfo = {
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
					blockCameraZoom = true,
					toplogoComList = {
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
						bubble = true,
						alert = true
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
						nodeId = 13
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
						nodeId = 14
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
						portId = "In",
						nodeId = 45
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 42
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
						nodeId = 15
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
						nodeId = 24
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 79379149,
				targetEulerAngleVInput = {
					0.055,
					47.647,
					359.744
				},
				targetPositionVInput = {
					-1743.4,
					94.61,
					631.66
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
						portId = "In",
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79379149,
				lookAtEntityStaticIdVInput = 2
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
			kind = 5,
			inputs = {
				speedVInput = 1.2,
				staticIdVInput = 79379149,
				playableStateVInput = "Story_Observe"
			},
			fields = {
				templateId = 400061,
				processingTime = 5.833,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 18
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
						nodeId = 19
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 21
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
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79379149,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 79379149
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 79379146,
				targetEulerAngleVInput = {
					0,
					97.3,
					0
				},
				targetPositionVInput = {
					-1743.844,
					94.61,
					632.795
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
						portId = "In",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79379146,
				lookAtEntityStaticIdVInput = 2
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
					248.675,
					0
				},
				targetPositionVInput = {
					-1742.192,
					94.598,
					632.727
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
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				defaultTransStateVInput = "SquatObserve_Loop",
				playableStateVInput = "SquatObserve_Start",
				loopDurationVInput = 999
			},
			fields = {
				templateId = 3,
				processingTime = 3.733,
				playAniType = 1,
				isLooping = false,
				entityType = 0
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
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 79379149
			},
			flowIn = {
				In = 0
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
						nodeId = 29
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 30
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 31
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 32
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1742.579,
					95.267,
					632.706
				},
				rotationVInput = {
					16.285,
					272.227,
					359.184
				}
			},
			fields = {
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = true,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 65,
				spotLightInnerAngle = 0,
				radius = 4,
				punctualLightUnit = 1,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 4,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 1000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				color = {
					b = 1,
					a = 1,
					r = 0.6084906,
					g = 0.9314762
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1751.302,
					99.221,
					628.622
				},
				rotationVInput = {
					22.92,
					70.766,
					4.749
				}
			},
			fields = {
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 80,
				spotLightInnerAngle = 0,
				radius = 60,
				punctualLightUnit = 1,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 20406,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				color = {
					b = 1,
					a = 1,
					r = 0.8537736,
					g = 0.9751462
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1744.646,
					95.589,
					631.549
				},
				rotationVInput = {
					355.378,
					66.174,
					0
				}
			},
			fields = {
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = true,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 163,
				spotLightInnerAngle = 0,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 4,
				lightUnit = 2,
				lightType = 2,
				isSpot = false,
				isDisk = false,
				intensity = 700,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				color = {
					b = 1,
					a = 1,
					r = 0.7216981,
					g = 0.9086822
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1742.679,
					95.764,
					632.95
				},
				rotationVInput = {
					13.432,
					203.444,
					1.924
				}
			},
			fields = {
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = true,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 117,
				spotLightInnerAngle = 0,
				radius = 10,
				punctualLightUnit = 2,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 4,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 400,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				color = {
					b = 0.6273585,
					a = 1,
					r = 1,
					g = 0.8853377
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					-1743.019,
					95.73,
					632.296
				},
				rotationVInput = {
					7.623,
					72.307,
					349.783
				}
			},
			fields = {
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				usePhysicalLightUnit = false,
				twoSide = false,
				temperature = 1500,
				spotLightOuterAngle = 136,
				spotLightInnerAngle = 0,
				radius = 10,
				punctualLightUnit = 1,
				needTodEVMapping = false,
				mainLightRange = 3,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 2000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				color = {
					b = 1,
					a = 1,
					r = 0.6462264,
					g = 0.8918828
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.373,
					96.1,
					633.694
				},
				rotationVInput = {
					20.8,
					218.739,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837811,
				visualizeDOF = false
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
						nodeId = 39
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.509,
					96.05,
					633.853
				},
				rotationVInput = {
					25.639,
					209.04,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837815,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.638,
					95.896,
					633.452
				},
				rotationVInput = {
					26.478,
					241.5,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837846,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				blendTimeVInput = 12,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.688,
					95.708,
					633.772
				},
				rotationVInput = {
					8.727,
					234.469,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837848,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.588,
					96.2,
					634.131
				},
				rotationVInput = {
					26.81,
					217,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90879521,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 40
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.648,
					96.058,
					633.995
				},
				rotationVInput = {
					25.822,
					219.4,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90879507,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 41
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				blendTimeVInput = 12,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.8,
					95.894,
					634.098
				},
				rotationVInput = {
					17.4,
					217.4,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90879508,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 32,
			fields = {
				eventName = "setBGM",
				eventParam = {
					[1] = "BGM_Story_MeetingXY"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 46,
			valueIn = {
				["1"] = {
					portId = "animationCurveVOutput",
					nodeId = 184
				}
			},
			fields = {
				volumeParamInfoCount = 1,
				volumeComponentCount = 1,
				volumeComponents = {
					{
						typeName = "VignetteComponent",
						active = false,
						parameters = {
							m_VignetteColor = {
								valueType = "color",
								overrideState = true,
								value = {
									b = 0,
									a = 1,
									r = 0,
									g = 0
								}
							},
							m_EdgeWidth = {
								valueType = "float",
								value = 2,
								overrideState = true
							},
							m_EdgeSoftness = {
								valueType = "float",
								value = 0.75,
								overrideState = true
							},
							m_VignetteAlpha = {
								valueType = "float",
								value = 1,
								overrideState = true
							},
							m_FisheyeFovDeg = {
								valueType = "float",
								value = 0,
								overrideState = false
							},
							m_FollowAspect = {
								valueType = "bool",
								value = true,
								overrideState = false
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "VignetteComponent",
						params = {
							{
								paramIndex = 1,
								name = "宽度"
							}
						}
					}
				}
			},
			dynamicInputs = {
				"1"
			},
			flowIn = {
				Stop = 1,
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
						portId = "Stop",
						nodeId = 43
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
						portId = "In",
						nodeId = 46
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025029,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 3.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025030,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Emotion_Surprise_Start",
				npcId = 400109,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0.5,
				animCfg = {
					"Emotion_Surprise_Start",
					"Emotion_Surprise_Loop",
					"Emotion_Surprise_End",
					{
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 48
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
						nodeId = 159
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 49
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025031,
				lookAtIdVInput = 400109,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 50
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
						nodeId = 51
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025032,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Behav_HappyEnd",
				npcId = 400061,
				matchAudioDuration = true,
				duration = 7.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				animCfg = {
					[1] = "Behav_HappyEnd",
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
				["0"] = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025033,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Emotion_Solemn_Start",
				npcId = 400109,
				matchAudioDuration = true,
				duration = 8.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				animCfg = {
					"Emotion_Solemn_Start",
					"Emotion_Solemn_Loop",
					"Emotion_Solemn_End",
					{
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 54
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025034,
				lookAtIdVInput = 400109,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 26025035,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Emotion_Surprise",
				npcId = 400061,
				matchAudioDuration = true,
				duration = 7.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 2,
				skipTime = 0,
				animCfg = {
					[1] = "Emotion_Surprise",
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
				["0"] = {
					{
						portId = "In",
						nodeId = 56
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 152
					}
				},
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 154
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 26025036
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 26025038,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Story_Idle_Proud",
				npcId = 400061,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				animCfg = {
					[1] = "Story_Idle_Proud",
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
				["0"] = {
					{
						portId = "In",
						nodeId = 58
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
						nodeId = 59
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 150
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025040,
				lookAtIdVInput = 400109,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 60
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025041,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 8.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 61
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
						nodeId = 148
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 62
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025042,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Emotion_Solemn_Start",
				npcId = 400061,
				matchAudioDuration = true,
				duration = 6.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				animCfg = {
					"Emotion_Solemn_Start",
					"Emotion_Solemn_Loop",
					"Emotion_Solemn_End",
					{
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 63
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
						nodeId = 146
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 64
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025043,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Emotion_Solemn_Start",
				npcId = 400109,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				animCfg = {
					"Emotion_Solemn_Start",
					"Emotion_Solemn_Loop",
					"Emotion_Solemn_End",
					{
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 12,
			inputs = {
				resumeNpcVInput = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 66
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
						nodeId = 67
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 69
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 145
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2.5,
				blendExponentVInput = 0,
				fovVInput = 60,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.394,
					95.1,
					632.977
				},
				rotationVInput = {
					357.6,
					241,
					0.388
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 100,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 100,
				fStop = 2,
				cameraId = 90837927,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 20,
				fovVInput = 60,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.408,
					95.1,
					632.975
				},
				rotationVInput = {
					354.3,
					240.8,
					0.388
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 100,
				fStop = 3,
				cameraId = 90837928,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
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
						portId = "In",
						nodeId = 70
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
						nodeId = 71
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 144
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 114
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"CHECK_CLIENT_CUSTOM_VARIABLE",
					1137,
					nil,
					"<",
					2
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 137
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 73
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
						nodeId = 133
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 74
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 134
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025051,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Behav_Happy",
				npcId = 400061,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				animCfg = {
					[1] = "Behav_Happy",
					[2] = {
						[1] = false,
						[2] = 10
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 75
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 260250510,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 4.25,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 12,
			inputs = {
				resumeNpcVInput = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 77
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
						nodeId = 129
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 78
					}
				},
				["2"] = {
					{
						portId = "StopDof",
						nodeId = 131
					}
				},
				["3"] = {
					{
						portId = "StopDof",
						nodeId = 132
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025053,
				lookAtIdVInput = 400109,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 6.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 79
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025054,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 80
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025055,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400109,
				matchAudioDuration = true,
				duration = 8.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 81
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025056,
				lookAtIdVInput = 400109,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 82
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025057,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400109,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 83
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 127
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 26025058
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 84
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025060,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400109,
				matchAudioDuration = true,
				duration = 7.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 85
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025062,
				lookAtIdVInput = 400109,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 86
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
						nodeId = 87
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
						nodeId = 88
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 110
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 89
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
						nodeId = 90
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79379149,
				lookAtEntityStaticIdVInput = 79379146
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025063,
				lookAtIdVInput = 400109,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 92
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025064,
				lookAtIdVInput = 400061,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400109,
				matchAudioDuration = true,
				duration = 3.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 93
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025065,
				lookAtIdVInput = 400109,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 94
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
						nodeId = 109
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 95
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025066,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 2.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 96
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
						nodeId = 97
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
						nodeId = 98
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 102
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 103
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
						nodeId = 101
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 99
					}
				}
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
						nodeId = 100
					}
				}
			}
		},
		{
			kind = 38,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 15,
				entityIdVInput = 79379146,
				targetEulerAngleVInput = {
					0,
					7.407,
					0
				},
				targetPositionVInput = {
					-1735.176,
					94.492,
					616.786
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
				moveTypeVInput = 2,
				maxLimitTimeVInput = 15,
				entityIdVInput = 79379149,
				targetEulerAngleVInput = {
					0,
					302.72,
					0
				},
				targetPositionVInput = {
					-1734.093,
					94.585,
					617.466
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
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1743.505,
					95.883,
					634.223
				},
				rotationVInput = {
					0.804,
					151.33,
					0.001
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 79412480,
				visualizeDOF = false
			},
			flowIn = {
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
						nodeId = 104
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				durationVInput = 0.4,
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					-97.7,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 185
				},
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 186
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
						portId = "In",
						nodeId = 105
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
						nodeId = 106
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
						portId = "In",
						nodeId = 107
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
						portId = "In",
						nodeId = 108
					}
				}
			}
		},
		{
			kind = 24,
			inputs = {
				switchToLocomotionVInput = true
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
			kind = 28,
			inputs = {
				staticIdVInput = 79379149
			},
			flowIn = {
				In = 0
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
						portId = "In",
						nodeId = 111
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
						nodeId = 116
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 121
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 112
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 122
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 124
					}
				},
				["5"] = {
					{
						portId = "Play",
						nodeId = 126
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
						portId = "In",
						nodeId = 113
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 4.7,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.302,
					95.55,
					633.764
				},
				rotationVInput = {
					15.3,
					237.177,
					4.31
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 87919241,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 114
					}
				}
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
						nodeId = 115
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.489,
					96,
					633.61
				},
				rotationVInput = {
					15.3,
					237.177,
					1.945
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 87920787,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 117
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
						nodeId = 118
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 120
					}
				}
			}
		},
		{
			kind = 56,
			fields = {
				shakeType = 0,
				cameraShakeItem = {
					initPhase = 0,
					random = false,
					shakeRadius = -1,
					decayTime = 4,
					sustainTime = 3,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 0,
					flags = 0,
					shakeBias = 0,
					shakeAmplitude = 0.3,
					shakeFrequency = 6,
					shakeDissipation = 28,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								value = 1,
								time = 0
							},
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								value = 1,
								time = 1
							}
						}
					},
					shakePos = {
						0,
						0,
						0
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								value = 1,
								time = 0
							},
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								value = 1,
								time = 1
							}
						}
					},
					shakeDir = {
						0.2,
						0.2,
						-0.2
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
						nodeId = 119
					}
				}
			}
		},
		{
			kind = 56,
			fields = {
				shakeType = 0,
				cameraShakeItem = {
					initPhase = 0,
					random = false,
					shakeRadius = -1,
					decayTime = 6,
					sustainTime = 4,
					attackTime = 2,
					holdForever = false,
					playSpace = 0,
					shakeType = 0,
					flags = 0,
					shakeBias = 0,
					shakeAmplitude = 0.15,
					shakeFrequency = 4,
					shakeDissipation = 28,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								value = 1,
								time = 0
							},
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								value = 1,
								time = 1
							}
						}
					},
					shakePos = {
						0,
						0,
						0
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								value = 1,
								time = 0
							},
							{
								weightedMode = 0,
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								value = 1,
								time = 1
							}
						}
					},
					shakeDir = {
						0.2,
						0.2,
						-0.2
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 32,
			fields = {
				eventName = "setBGM",
				eventParam = {
					[1] = "BGM_Scene_Novice_Cave_2"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				speedVInput = 1.2,
				staticIdVInput = 2,
				playableStateVInput = "SquatFall_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				templateId = 3,
				processingTime = 3.733,
				playAniType = 1,
				entityType = 0,
				aniStateList = {
					"SquatFall_Start",
					"SquatFall_Loop",
					"SquatFall_End"
				}
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
						nodeId = 123
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Shaking",
				staticIdVInput = 79379149
			},
			fields = {
				templateId = 400061,
				processingTime = 3.733,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
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
						portId = "In",
						nodeId = 125
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Shaking",
				staticIdVInput = 79379146
			},
			fields = {
				templateId = 400109,
				processingTime = 3.733,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "SFX_Novice_Earthquake"
			},
			fields = {
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0,
				enableFadeOut = false
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 26025059
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 128
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025061,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 4.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 85
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				blendTimeVInput = 4,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.744,
					95.527,
					633.949
				},
				rotationVInput = {
					11.352,
					223.895,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837959,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 130
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 12,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.958,
					95.527,
					634.358
				},
				rotationVInput = {
					12.033,
					209.951,
					1.435
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837966,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 6,
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.705,
					95.35,
					632.827
				},
				rotationVInput = {
					12.97,
					205.6,
					0
				}
			},
			valueIn = {
				dofTargetVInput = {
					portId = "BoneTransform",
					nodeId = 187
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 1357,
				fStop = 9,
				cameraId = 90849797,
				visualizeDOF = false
			},
			flowIn = {
				StopDof = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 6,
				fovVInput = 44,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.601,
					95.005,
					632.782
				},
				rotationVInput = {
					359.26,
					276,
					0
				}
			},
			valueIn = {
				dofTargetVInput = {
					portId = "BoneTransform",
					nodeId = 188
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 1357,
				fStop = 9,
				cameraId = 90849750,
				visualizeDOF = false
			},
			flowIn = {
				StopDof = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				blendTimeVInput = 1.6,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.21,
					95.25,
					632.844
				},
				rotationVInput = {
					6.67,
					229.77,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837937,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 131
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
						portId = "In",
						nodeId = 135
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 306,
				param = {
					name = "CHARACTER_APPEARANCE_NAME_X",
					pos = {
						-1200,
						200,
						0
					}
				}
			},
			flowIn = {
				closeUIFInput = 1,
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 136
					}
				}
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
						portId = "closeUIFInput",
						nodeId = 135
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
						nodeId = 138
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 140
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 141
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025052,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Behav_Happy",
				npcId = 400109,
				matchAudioDuration = true,
				duration = 3.38,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				animCfg = {
					[1] = "Behav_Happy",
					[2] = {
						[1] = false,
						[2] = 5
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 139
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 260250520,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 3.62,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				blendTimeVInput = 1.6,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.395,
					94.9,
					633.217
				},
				rotationVInput = {
					354.2,
					253.7,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837939,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 132
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
						portId = "In",
						nodeId = 142
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 306,
				param = {
					name = "CHARACTER_APPEARANCE_NAME_Y",
					pos = {
						1200,
						-400,
						0
					}
				}
			},
			flowIn = {
				closeUIFInput = 1,
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 143
					}
				}
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
						portId = "closeUIFInput",
						nodeId = 142
					}
				}
			}
		},
		{
			kind = 32,
			fields = {
				eventName = "setBGM",
				eventParam = {
					[1] = "BGM_Story_ChooseXY"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 79379149,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.395,
					94.9,
					633.217
				},
				rotationVInput = {
					354.2,
					253.7,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90866145,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 147
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				blendTimeVInput = 12,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.618,
					95.15,
					632.826
				},
				rotationVInput = {
					7.3,
					272.21,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90866147,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				blendTimeVInput = 1.6,
				fovVInput = 36,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.4,
					95.4,
					633
				},
				rotationVInput = {
					13.7,
					223.3,
					359.769
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90877213,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 149
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 12,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.368,
					95.35,
					632.974
				},
				rotationVInput = {
					12.97,
					211.5,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 9,
				cameraId = 90877203,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				blendTimeVInput = 4,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.744,
					95.527,
					633.949
				},
				rotationVInput = {
					11.352,
					223.895,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837958,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 151
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				blendTimeVInput = 12,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.744,
					95.527,
					633.949
				},
				rotationVInput = {
					12.7,
					223.3,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837964,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 26025037
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 153
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26025039,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Story_Bind_Nod",
				npcId = 400109,
				matchAudioDuration = true,
				duration = 4.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				animCfg = {
					[1] = "Story_Bind_Nod",
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
				["0"] = {
					{
						portId = "In",
						nodeId = 58
					}
				}
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
						nodeId = 157
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 155
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				blendTimeVInput = 2,
				fovVInput = 50,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.904,
					95.1,
					633.294
				},
				rotationVInput = {
					354.2,
					239.3,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837891,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 156
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 18,
				fovVInput = 48,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.926,
					95.1,
					633.331
				},
				rotationVInput = {
					354.2,
					237.8,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837934,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				blendTimeVInput = 2,
				fovVInput = 48,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.072,
					95.1,
					633.465
				},
				rotationVInput = {
					351.4,
					237.5,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90879546,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 158
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 18,
				fovVInput = 48,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1742.107,
					95.1,
					633.56
				},
				rotationVInput = {
					351.412,
					234.393,
					0.464
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90879553,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 4,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.744,
					95.527,
					633.949
				},
				rotationVInput = {
					11.352,
					223.895,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837852,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 160
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 12,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.744,
					95.527,
					633.949
				},
				rotationVInput = {
					12.7,
					223.3,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 1357,
				fStop = 4,
				cameraId = 90837950,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 36,
			inputs = {
				retValueInput = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 22,
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
						portId = "In",
						nodeId = 165
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				blendExponentVInput = 0,
				fovVInput = 38,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.124,
					95.8,
					633.617
				},
				rotationVInput = {
					344.6,
					245.4,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 85129676,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 166
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				blendTimeVInput = 11,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1741.124,
					95.8,
					633.617
				},
				rotationVInput = {
					344.5,
					243.4,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 85159453,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		[184] = {
			kind = 59,
			fields = {
				animationCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							value = 2,
							time = 0
						},
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							value = 0,
							time = 1.5
						}
					}
				}
			}
		},
		[185] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[186] = {
			kind = 17,
			inputs = {
				staticIdVInput = 82161089
			},
			fields = {
				entityType = 2
			}
		},
		[187] = {
			kind = 17,
			inputs = {
				boneNameVInput = "Bip001 Head",
				staticIdVInput = 79379149
			},
			fields = {
				entityType = 2
			}
		},
		[188] = {
			kind = 17,
			inputs = {
				boneNameVInput = "Bip001 Head",
				staticIdVInput = 79379146
			},
			fields = {
				entityType = 2
			}
		}
	}
}
