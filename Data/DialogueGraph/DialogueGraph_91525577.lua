-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91525577.lua

return {
	startNodeId = 1,
	dialogueId = 91525577,
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					toplogoComList = {
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
						battleRoom = true,
						actionState = true,
						vlog = true,
						teamSpeech = true,
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true,
						npc = true,
						multiPlayer = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 3,
						portId = "In"
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
						nodeId = 6,
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
						nodeId = 20,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 21,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 22,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 27,
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
					-51.01,
					199.084,
					1071.34
				},
				rotationVInput = {
					0,
					256.25,
					0
				}
			},
			fields = {
				entityId = -1445053369,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 6.5
			},
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
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 371413206,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 501029,
				matchAudioDuration = true,
				duration = 9.62,
				disableCamera = false,
				chatType = 3
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
						nodeId = 10,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 19,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 371413208,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 501029,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 11,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -555332630,
				playableStateVInput = "Talk_Goodbye"
			},
			fields = {
				templateId = 501029,
				processingTime = 2.267,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
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
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -555332630,
				durationVInput = 0.5,
				targetEulerAngleVInput = {
					0,
					271.1,
					0
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
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -555332630,
				speedVInput = 1.001,
				targetEulerAngleVInput = {
					0,
					271.101,
					0
				},
				targetPositionVInput = {
					-57.983,
					199.084,
					1069.179
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
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							outWeight = 0,
							value = 0
						},
						{
							weightedMode = 0,
							time = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							outWeight = 0,
							value = 1
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
						nodeId = 16,
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
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -555332630,
				durationVInput = 0.8
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
				staticIdVInput = -555332630
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -555332630,
				playableStateVInput = "Talk_Introduce"
			},
			fields = {
				templateId = 501029,
				processingTime = 3.833,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 501029,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-50.908,
					199.084,
					1069.99
				},
				rotationVInput = {
					0,
					262.696,
					0
				}
			},
			fields = {
				entityId = -555332630,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -555332630,
				speedVInput = 1.177,
				targetEulerAngleVInput = {
					0,
					56.645,
					0
				},
				targetPositionVInput = {
					-56.014,
					199.084,
					1069.461
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
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							outWeight = 0,
							value = 0
						},
						{
							weightedMode = 0,
							time = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							outWeight = 0,
							value = 1
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
				staticIdVInput = -1445053369,
				speedVInput = 1.158,
				targetEulerAngleVInput = {
					0,
					232.787,
					0
				},
				targetPositionVInput = {
					-54.85,
					199.084,
					1070.225
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
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							outWeight = 0,
							value = 0
						},
						{
							weightedMode = 0,
							time = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							outWeight = 0,
							value = 1
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-51.015,
					199.73,
					1067.169
				},
				rotationVInput = {
					352.593,
					298.677,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 636,
				fStop = 2.19,
				cameraId = 91535052,
				visualizeDOF = false,
				squeezeFactor = 1.018,
				sensorWidth = 53,
				recombineQuality = 0
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
				blendTimeVInput = 6,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-52.787,
					199.89,
					1068.113
				},
				rotationVInput = {
					356.89,
					296.786,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 636,
				fStop = 2.19,
				cameraId = 91538332,
				visualizeDOF = false,
				squeezeFactor = 1.018,
				sensorWidth = 53,
				recombineQuality = 0
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
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-53.998,
					200.351,
					1070.347
				},
				rotationVInput = {
					1.032,
					251.367,
					-0.001
				}
			},
			fields = {
				openDof = true,
				focalDistance = 124,
				fStop = 5.75,
				cameraId = 91534418,
				visualizeDOF = false,
				squeezeFactor = 1.242,
				sensorWidth = 47,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				blendTimeVInput = 8.1,
				fovVInput = 26,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-54.297,
					200.346,
					1070.247
				},
				rotationVInput = {
					1.051,
					251.367,
					-0.001
				}
			},
			fields = {
				openDof = true,
				focalDistance = 124,
				fStop = 5.75,
				cameraId = 91538002,
				visualizeDOF = false,
				squeezeFactor = 1.242,
				sensorWidth = 47,
				recombineQuality = 0
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
					232.107,
					0
				},
				targetPositionVInput = {
					-54.85,
					199.08,
					1070.22
				}
			},
			fields = {
				setRotation = false,
				reset = false,
				setPosition = true
			},
			flowIn = {
				In = 0
			}
		}
	}
}
