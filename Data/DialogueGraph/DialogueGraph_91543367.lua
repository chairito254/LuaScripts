-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91543367.lua

return {
	startNodeId = 2,
	dialogueId = 91543367,
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
					hideMarkShare = true,
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
						nodeId = 0,
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
			kind = 22,
			inputs = {
				blendVInput = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 5,
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
						nodeId = 6,
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
						nodeId = 12,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91121158,
				targetEulerAngleVInput = {
					0,
					279.106,
					0
				},
				targetPositionVInput = {
					-141.712,
					100.721,
					774.6
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
				slotParamVInput = 5160004,
				positionVInput = {
					-144.592,
					100.526,
					774.851
				},
				rotationVInput = {
					0,
					115.952,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1758407131
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
					133.735,
					0
				},
				targetPositionVInput = {
					-143.771,
					100.609,
					775.555
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
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-144.604,
					102.371,
					778.772
				},
				rotationVInput = {
					6.903,
					162.029,
					-0.002
				}
			},
			fields = {
				cameraId = 91579857,
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
			kind = 14,
			inputs = {
				staticIdVInput = 91578127,
				targetEulerAngleVInput = {
					0,
					279.106,
					0
				},
				targetPositionVInput = {
					-141.946,
					100.704,
					773.142
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
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
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
				portCount = 5
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
						nodeId = 41,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				},
				["3"] = {
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
				portCount = 7
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
				["2"] = {
					{
						nodeId = 39,
						portId = "In"
					}
				},
				["3"] = {
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
				dialogueIdVInput = 6204183,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true
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
				dialogueIdVInput = 6204184,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
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
						nodeId = 19,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 35,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 36,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 37,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204185,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160005,
				matchAudioDuration = true
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
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204186,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 3.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true
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
						nodeId = 23,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204187,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160049,
				matchAudioDuration = true
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
				portCount = 6
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
						nodeId = 27,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 6204188,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true
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
			kind = 10,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 1,
						portId = "End"
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
						nodeId = 28,
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
						nodeId = 29,
						portId = "In"
					}
				},
				["1"] = {
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
				moveTypeVInput = 2,
				maxLimitTimeVInput = 8,
				staticIdVInput = 91578127,
				targetEulerAngleVInput = {
					0,
					181.521,
					0
				},
				targetPositionVInput = {
					-153.468,
					101.334,
					789.434
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
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0,
							outTangent = 1
						},
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							outTangent = 0
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
				moveTypeVInput = 2,
				maxLimitTimeVInput = 8,
				staticIdVInput = 91121158,
				targetEulerAngleVInput = {
					0,
					170.189,
					0
				},
				targetPositionVInput = {
					-152.89,
					101.362,
					789.49
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
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0,
							outTangent = 1
						},
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							outTangent = 0
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
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-141.805,
					102.674,
					778.97
				},
				rotationVInput = {
					11.888,
					193.933,
					-0.002
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
						nodeId = 33,
						portId = "In"
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
					-141.805,
					102.674,
					778.97
				},
				rotationVInput = {
					11.888,
					193.933,
					-0.002
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
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 8,
				staticIdVInput = -1679557481,
				targetEulerAngleVInput = {
					0,
					40.998,
					0
				},
				targetPositionVInput = {
					-142.799,
					100.595,
					770.5
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
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0,
							time = 0,
							outTangent = 1
						},
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
							inTangent = 1,
							time = 1,
							outTangent = 0
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
				slotParamVInput = 5160049,
				positionVInput = {
					-151.261,
					100.677,
					762.033
				},
				rotationVInput = {
					0,
					61.964,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1679557481
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
					-142.024,
					102.263,
					777.697
				},
				rotationVInput = {
					12.36,
					193.69,
					0
				}
			},
			fields = {
				cameraId = 91579783,
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1533386000,
				staticIdVInput = -411649735
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1679557481,
				staticIdVInput = -811985187
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				durationVInput = 0.5,
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					159.656,
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
				playableStateVInput = "Story_Akimbo",
				staticIdVInput = 91121158
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160002,
				processingTime = 9.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_LookAround02",
				staticIdVInput = 2
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 301,
				processingTime = 9.633
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "EnvBehav_Wavehand_Left",
				staticIdVInput = -1384858910
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160004,
				processingTime = 3.8
			},
			flowIn = {
				In = 0
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
					-155.878,
					106.855,
					781.893
				},
				rotationVInput = {
					13.934,
					133.464,
					-0.002
				}
			},
			fields = {
				cameraId = 91580031,
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
			kind = 3,
			inputs = {
				blendTimeVInput = 15.4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-149.859,
					112.217,
					765.871
				},
				rotationVInput = {
					359.667,
					149.794,
					-0.002
				}
			},
			fields = {
				cameraId = 91580040,
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
		}
	}
}
