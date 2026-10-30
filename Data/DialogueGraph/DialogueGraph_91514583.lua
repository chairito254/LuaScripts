-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91514583.lua

return {
	dialogueId = 91514583,
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
					hideTopLogo = true,
					hideMarkShare = false,
					toplogoComList = {
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
						alert = true,
						battleRoom = true,
						actionState = true,
						vlog = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 18,
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
				portCount = 5
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
						nodeId = 29,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 44,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 36,
						portId = "In"
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
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 32,
					portId = "EntityIDs"
				}
			},
			fields = {
				nodeMode = 1,
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				cameraPreset = 2,
				resetOrientation = true,
				reactPreset = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				portCount = 5
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
						nodeId = 28,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304870,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91525857,
				npcId = 2106930001,
				matchAudioDuration = true,
				duration = 11,
				disableCamera = false
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
						nodeId = 11,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 25,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 26,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 27,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 2106930001,
				dialogueIdVInput = 3304871,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91533980,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 5.25,
				disableCamera = false
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
						nodeId = 13,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 24,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3304872,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 2106930001,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304873,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 2106930001,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false
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
						nodeId = 20,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304874
			},
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
				portCount = 5
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
				},
				["1"] = {
					{
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304876,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 0,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 2106930001,
				matchAudioDuration = true,
				duration = 5.62,
				disableCamera = false
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
			kind = 5,
			inputs = {
				staticIdVInput = 91525857,
				playableStateVInput = "IdleSpecial"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 2106930001,
				processingTime = 4.3
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304875
			},
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
						nodeId = 23,
						portId = "Stop"
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
					-923.04,
					440.849,
					-500.774
				},
				rotationVInput = {
					353.528,
					143.168,
					359.976
				}
			},
			fields = {
				fStop = 13.18,
				cameraId = 91534403,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 448
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91525857,
				playableStateVInput = "IdleSpecial"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 2106930001,
				processingTime = 4.3
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 27,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-920.946,
					442.086,
					-503.536
				},
				rotationVInput = {
					350.416,
					154.312,
					359.974
				}
			},
			fields = {
				fStop = 13.18,
				cameraId = 91576094,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 448
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
					-919.441,
					444.239,
					-510.824
				},
				rotationVInput = {
					24.296,
					13.543,
					359.963
				}
			},
			fields = {
				fStop = 6.5,
				cameraId = 91534345,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 420
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91533980,
				playableStateVInput = "EnvBehav_Sing"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5150019,
				processingTime = 5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 91525857,
				playableStateVInput = "IdleSpecial"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 2106930001,
				processingTime = 4.3
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-921.145,
					440.838,
					-502.024
				},
				rotationVInput = {
					348.028,
					146.775,
					359.97
				}
			},
			fields = {
				fStop = 11.1,
				cameraId = 91534332,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 420
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
						nodeId = 30,
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
						nodeId = 31,
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
						nodeId = 34,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-919.599,
					439.901,
					-502.405
				},
				rotationVInput = {
					0,
					172.2,
					0
				}
			},
			fields = {
				entityId = -1114366396,
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
					nodeId = 31,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 47,
					portId = "EntityID"
				},
				["3EntityIDVInput"] = {
					nodeId = 46,
					portId = "EntityID"
				},
				["4EntityIDVInput"] = {
					nodeId = 48,
					portId = "EntityID"
				}
			},
			fields = {
				portCount = 4
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91533980,
				targetEulerAngleVInput = {
					0,
					176.29,
					0
				},
				targetPositionVInput = {
					-918.63,
					439.901,
					-502.32
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
			kind = 14,
			inputs = {
				staticIdVInput = 91533992,
				targetEulerAngleVInput = {
					0,
					175.79,
					0
				},
				targetPositionVInput = {
					-917.03,
					439.901,
					-502.29
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
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					170.141,
					0
				},
				targetPositionVInput = {
					-919.922,
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
				delayTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 6
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
				},
				["1"] = {
					{
						nodeId = 39,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 40,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 41,
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
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1114366396,
				targetEulerAngleVInput = {
					0,
					175.419,
					0
				},
				targetPositionVInput = {
					-919.48,
					439.901,
					-503.69
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
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							weightedMode = 0
						},
						{
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							weightedMode = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91533980,
				targetEulerAngleVInput = {
					0,
					175.419,
					0
				},
				targetPositionVInput = {
					-918.53,
					439.901,
					-503.81
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
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							weightedMode = 0
						},
						{
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							weightedMode = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91533992,
				targetEulerAngleVInput = {
					0,
					184.89,
					0
				},
				targetPositionVInput = {
					-916.91,
					439.901,
					-503.83
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
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							weightedMode = 0
						},
						{
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							weightedMode = 0
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
				staticIdVInput = -1114366396,
				lookAtEntityStaticIdVInput = 91525857
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91533980,
				lookAtEntityStaticIdVInput = 91525857
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91533992,
				lookAtEntityStaticIdVInput = 91525857
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
						nodeId = 45,
						portId = "In"
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
					-921.666,
					440.672,
					-501.243
				},
				rotationVInput = {
					349.918,
					146.258,
					359.97
				}
			},
			fields = {
				fStop = 11.1,
				cameraId = 91534287,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 420
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91533980
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91525857
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91533992
			},
			fields = {
				entityType = 2
			}
		}
	}
}
