-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91524968.lua

return {
	dialogueId = 91524968,
	schema = 1,
	startNodeId = 3,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 3
			},
			flowIn = {
				End = 0
			}
		},
		[3] = {
			kind = 8,
			flowOut = {
				Start = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		[4] = {
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
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		[5] = {
			kind = 25,
			fields = {
				condition = {
					"CHECK_CLIENT_CUSTOM_VARIABLE",
					1139,
					nil,
					"=",
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
						nodeId = 9
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		[6] = {
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
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		[7] = {
			kind = 21,
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
		[8] = {
			kind = 23,
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		[9] = {
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
					hideUIWhiteList = {
						[194] = true
					},
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
						bubble = false
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
						nodeId = 61
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 10
					}
				}
			}
		},
		[10] = {
			kind = 22,
			inputs = {
				blendVInput = 1
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
		[11] = {
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
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		[12] = {
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
						nodeId = 52
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 13
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 58
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 45
					}
				}
			}
		},
		[13] = {
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
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
		[14] = {
			kind = 4,
			fields = {
				delayTime = 8
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
		[15] = {
			kind = 12,
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
		[16] = {
			kind = 10,
			inputs = {
				showAllUIVInput = false,
				showTopLogoVInput = false,
				endSkipVInput = true,
				resumeNearbyMonsterAIVInput = false,
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
						nodeId = 17
					}
				}
			}
		},
		[17] = {
			kind = 83,
			fields = {
				portCount = 3,
				observeId = 10,
				isFreeConfigCluePosition = true,
				cluePositions = {
					{
						-1000,
						700,
						0
					},
					{
						800,
						300,
						0
					},
					{
						0,
						200,
						0
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
						nodeId = 34
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
						nodeId = 18
					}
				}
			}
		},
		[18] = {
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
						nodeId = 23
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 19
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 21
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 22
					}
				}
			}
		},
		[19] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-53.061,
					41.133,
					517.593
				},
				rotationVInput = {
					7.62,
					278.236,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 283,
				fStop = 5.94,
				cameraId = 91534857,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 20
					}
				}
			}
		},
		[20] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-52.462,
					41.337,
					517.583
				},
				rotationVInput = {
					10.167,
					269.986,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 283,
				fStop = 5.94,
				cameraId = 91534873,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[21] = {
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					246.567,
					0
				},
				targetPositionVInput = {
					-54.823,
					39.802,
					518.376
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
							inWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		[22] = {
			kind = 19,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					273.984,
					0
				},
				targetPositionVInput = {
					-55.411,
					39.802,
					516.791
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
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
							inWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		[23] = {
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					toplogoComList = {
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
						portId = "In",
						nodeId = 33
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 24
					}
				}
			}
		},
		[24] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609019,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		[25] = {
			kind = 12,
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
		[26] = {
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
						nodeId = 30
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		[27] = {
			kind = 16,
			inputs = {
				slotParamVInput = 5090010,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-54.775,
					39.802,
					520.404
				},
				rotationVInput = {
					0,
					218.348,
					0
				}
			},
			fields = {
				entityId = -778010464,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 28
					}
				}
			}
		},
		[28] = {
			kind = 19,
			inputs = {
				staticIdVInput = -778010464,
				targetEulerAngleVInput = {
					0,
					63.89,
					0
				},
				targetPositionVInput = {
					-57.22,
					39.8,
					517.31
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
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
						nodeId = 29
					}
				}
			}
		},
		[29] = {
			kind = 5,
			inputs = {
				staticIdVInput = -778010464,
				playableStateVInput = "Story_Greet02"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 5090010,
				processingTime = 9.633,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		[30] = {
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
						nodeId = 31
					}
				}
			}
		},
		[31] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609020,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5090010,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
		[32] = {
			kind = 12,
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
		[33] = {
			kind = 22,
			inputs = {
				blendVInput = 1
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
		[34] = {
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
						nodeId = 35
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 39
					}
				}
			}
		},
		[35] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609015,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 36
					}
				}
			}
		},
		[36] = {
			kind = 12,
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
		[37] = {
			kind = 48,
			flowIn = {
				In = 1
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
		[38] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 40,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-54.984,
					40.875,
					517.529
				},
				rotationVInput = {
					6.901,
					268.267,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 283,
				fStop = 5.94,
				cameraId = 91535508,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[39] = {
			kind = 29,
			inputs = {
				staticIdVInput = 91520773
			},
			fields = {
				emojiName = "Sleep",
				duration = 6
			},
			flowIn = {
				In = 0
			}
		},
		[40] = {
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
						nodeId = 41
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 43
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 44
					}
				}
			}
		},
		[41] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609016,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 42
					}
				}
			}
		},
		[42] = {
			kind = 12,
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
		[43] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 5,
				fovVInput = 40,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-54.681,
					40.912,
					517.532
				},
				rotationVInput = {
					359.51,
					272.22,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 283,
				fStop = 5.94,
				cameraId = 91535509,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[44] = {
			kind = 29,
			inputs = {
				staticIdVInput = 91520769
			},
			fields = {
				emojiName = "Alert",
				duration = 6
			},
			flowIn = {
				In = 0
			}
		},
		[45] = {
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
						nodeId = 46
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 50
					}
				}
			}
		},
		[46] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					320.357,
					0
				},
				targetPositionVInput = {
					-51.458,
					39.802,
					517.239
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
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
		[47] = {
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					354.57,
					0
				},
				targetPositionVInput = {
					-52.837,
					39.802,
					519.169
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
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
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
		[48] = {
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					26.889,
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
						portId = "In",
						nodeId = 49
					}
				}
			}
		},
		[49] = {
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					-56.161,
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
		[50] = {
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					336.669,
					0
				},
				targetPositionVInput = {
					-52.652,
					39.802,
					515.853
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
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
		[51] = {
			kind = 19,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					336.947,
					0
				},
				targetPositionVInput = {
					-53.152,
					39.802,
					517.043
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
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
							inWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		[52] = {
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 40,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-48.6,
					41.266,
					514.813
				},
				rotationVInput = {
					358.452,
					311.507,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 450,
				fStop = 4,
				cameraId = 91525163,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		[53] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 40,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-52.255,
					40.895,
					517.88
				},
				rotationVInput = {
					353.494,
					333.927,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 223,
				fStop = 12.85,
				cameraId = 91525274,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 54
					}
				}
			}
		},
		[54] = {
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
						nodeId = 55
					}
				}
			}
		},
		[55] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 1.5,
				fovVInput = 40,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-52.255,
					40.895,
					517.88
				},
				rotationVInput = {
					350.916,
					339.083,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91534504,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 56
					}
				}
			}
		},
		[56] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				fovVInput = 40,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-51.695,
					41.037,
					517.189
				},
				rotationVInput = {
					0.197,
					273.595,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91534508,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 57
					}
				}
			}
		},
		[57] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				fovVInput = 40,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-54.681,
					40.912,
					517.532
				},
				rotationVInput = {
					2.947,
					271.533,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 283,
				fStop = 5.94,
				cameraId = 91534557,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		[58] = {
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
						nodeId = 59
					}
				}
			}
		},
		[59] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 2609010,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
		[60] = {
			kind = 12,
			flowIn = {
				In = 0
			}
		},
		[61] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				fovVInput = 40,
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-54.681,
					40.912,
					517.532
				},
				rotationVInput = {
					8.276,
					269.814,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 283,
				fStop = 5.94,
				cameraId = 91535596,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
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
		}
	}
}
