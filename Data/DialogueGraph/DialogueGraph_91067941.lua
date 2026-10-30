-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91067941.lua

return {
	startNodeId = 1,
	dialogueId = 91067941,
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
					hideInteractionSign = true,
					hideUIWhiteList = {
						[1630] = true
					},
					toplogoComList = {
						vlog = true,
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
						teamSpeech = true,
						quest = true,
						actionState = true
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
						nodeId = 3,
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
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.1
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
						nodeId = 14,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0.1,
				staticIdVInput = 91073579,
				isResetValueInput = true
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
			kind = 14,
			inputs = {
				staticIdVInput = 91073579,
				targetEulerAngleVInput = {
					0,
					50.5,
					0
				},
				targetPositionVInput = {
					427.51,
					118.419,
					1830.43
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
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0.1,
				staticIdVInput = 91073583,
				isResetValueInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91073583,
				targetEulerAngleVInput = {
					0,
					264.99,
					0
				},
				targetPositionVInput = {
					431.57,
					118.15,
					1831.449
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
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0.1,
				staticIdVInput = 91073581,
				isResetValueInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				staticIdVInput = 91073581,
				targetEulerAngleVInput = {
					0,
					336.4,
					0
				},
				targetPositionVInput = {
					429.93,
					118.339,
					1830.02
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
			kind = 20,
			inputs = {
				durationVInput = 0.1,
				staticIdVInput = 91073576,
				isResetValueInput = true
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
			kind = 14,
			inputs = {
				staticIdVInput = 91073576,
				targetEulerAngleVInput = {
					0,
					163.5,
					0
				},
				targetPositionVInput = {
					429.19,
					118.08,
					1832.8
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
				delayTime = 0.2
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
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					429.2,
					120.7,
					1835.5
				},
				rotationVInput = {
					30.44,
					173.5,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				visualizeDOF = false,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 0,
				fStop = 4,
				cameraId = 91067973
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70008086,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.88
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
						nodeId = 18,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 36,
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
						nodeId = 19,
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
						nodeId = 20,
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
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Env_SceneObject_Morphling_Appear.prefab",
				postionVInput = {
					429.18,
					118.719,
					1832.74
				}
			},
			fields = {
				playOne = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0,
				staticIdVInput = 91073576,
				isResetValueInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 22,
						portId = "In"
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
						nodeId = 23,
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
						nodeId = 27,
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
						nodeId = 25,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 26,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91073581,
				speedVInput = 1.25,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					144.949,
					0
				},
				targetPositionVInput = {
					428.21,
					119.106,
					1821.892
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
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0,
							outTangent = 0,
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
			kind = 19,
			inputs = {
				staticIdVInput = 91073583,
				speedVInput = 1.25,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					85.938,
					0
				},
				targetPositionVInput = {
					436.08,
					117.716,
					1834.18
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
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0,
							outTangent = 0,
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
			kind = 19,
			inputs = {
				staticIdVInput = 91073579,
				speedVInput = 1.25,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					90.813,
					0
				},
				targetPositionVInput = {
					423.6,
					118.869,
					1825.75
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
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0,
							outTangent = 0,
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
						nodeId = 28,
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
				["1"] = {
					{
						nodeId = 29,
						portId = "In"
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
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70008089,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2
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
						nodeId = 32,
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
				["1"] = {
					{
						nodeId = 33,
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
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 91073576,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					85.938,
					0
				},
				targetPositionVInput = {
					428.15,
					117.811,
					1836.53
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
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0,
							outTangent = 0,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70008087,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.38
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91067058,
				durationVInput = 0.5
			},
			flowIn = {
				In = 0
			}
		}
	}
}
