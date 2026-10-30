-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91034351.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91034351,
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
					showHud = true,
					toplogoComList = {
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
						vlog = true,
						teamSpeech = true,
						quest = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 57,
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
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 22,
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
						nodeId = 9,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 96,
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
						nodeId = 97,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5160004,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-92.037,
					187.844,
					1013.566
				},
				rotationVInput = {
					0,
					306.641,
					0
				}
			},
			fields = {
				entityId = -457204890,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5160002,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-93.421,
					188.161,
					1016.015
				},
				rotationVInput = {
					0,
					303.566,
					0
				}
			},
			fields = {
				entityId = -71340212,
				ignoreGravity = false
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
					297.146,
					0
				},
				targetPositionVInput = {
					-92.026,
					187.844,
					1014.419
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
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
						nodeId = 15,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -71340212,
				targetEulerAngleVInput = {
					0,
					284.228,
					0
				},
				targetPositionVInput = {
					-96.547,
					188.082,
					1017.259
				}
			},
			fields = {
				finishToSteer = false,
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
				staticIdVInput = -2044615730,
				targetEulerAngleVInput = {
					0,
					302.72,
					0
				},
				targetPositionVInput = {
					-96.085,
					188.082,
					1017.747
				}
			},
			fields = {
				finishToSteer = false,
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
				staticIdVInput = 2,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					285.36,
					0
				},
				targetPositionVInput = {
					-96.822,
					188.082,
					1016.273
				}
			},
			fields = {
				finishToSteer = false,
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
				staticIdVInput = -457204890,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					306.877,
					0
				},
				targetPositionVInput = {
					-96.317,
					188.082,
					1015.696
				}
			},
			fields = {
				finishToSteer = false,
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
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204306,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 4.12,
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
						nodeId = 17,
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 18,
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
						nodeId = 21,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 94,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -71340212,
				maxLimitTimeVInput = 6,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					243.492,
					0
				},
				targetPositionVInput = {
					-103.03,
					188.082,
					1017.264
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
			},
			flowOut = {
				FinishOut = {
					{
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 2,
				staticIdVInput = -71340212,
				playableStateVInput = "TakeLook_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 6,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160002,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					268.671,
					0
				},
				targetPositionVInput = {
					-101.524,
					188.082,
					1016.533
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
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -2044615730,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					244.557,
					0
				},
				targetPositionVInput = {
					-102.036,
					188.082,
					1017.308
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
				staticIdVInput = -457204890,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					318.646,
					0
				},
				targetPositionVInput = {
					-102.015,
					188.082,
					1015.696
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204307,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5160005,
				matchAudioDuration = true,
				duration = 2,
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
						nodeId = 25,
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
						nodeId = 26,
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
						nodeId = 27,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 92,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 93,
						portId = "In"
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
						nodeId = 28,
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
						nodeId = 29,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 90,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 91,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204308,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 10.38,
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
						nodeId = 30,
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
						nodeId = 31,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204309,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160004,
				matchAudioDuration = true,
				duration = 2.12,
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
						nodeId = 32,
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
						nodeId = 33,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 83,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 85,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 86,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 87,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204310,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 10.75,
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
						nodeId = 34,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 82,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6204311
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 35,
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
						nodeId = 36,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 79,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 80,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204313,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 10.38,
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
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204314,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 9.38,
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
						nodeId = 38,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6204315
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 39,
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
						nodeId = 40,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204317,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 9.62,
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
						nodeId = 41,
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
						nodeId = 42,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 74,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204319,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 5.88,
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
						nodeId = 43,
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
						nodeId = 44,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 71,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204320,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160005,
				matchAudioDuration = true,
				duration = 2,
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
						nodeId = 45,
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
						nodeId = 46,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 67,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 68,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204321,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160004,
				matchAudioDuration = true,
				duration = 9.62,
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
						nodeId = 47,
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
						nodeId = 48,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204322,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160004,
				matchAudioDuration = true,
				duration = 6.5,
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
						nodeId = 49,
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
						nodeId = 50,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204323,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
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
						nodeId = 51,
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
						nodeId = 52,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 61,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 62,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 63,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204324,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 4.25,
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
						nodeId = 53,
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
						nodeId = 54,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 59,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 60,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204325,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 6.38,
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
						nodeId = 55,
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
						nodeId = 56,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204326,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 6,
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
						nodeId = 57,
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
			kind = 5,
			inputs = {
				staticIdVInput = -71340212,
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 6,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160002,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -71340212,
				playableStateVInput = "Talk_Cheeksupport",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 6,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160002,
				aniStateList = {
					"Talk_Cheeksupport",
					"Talk_Cheeksupport",
					"Talk_Cheeksupport"
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
					-102.264,
					189.457,
					1016.138
				},
				rotationVInput = {
					12.583,
					325.966,
					0.001
				}
			},
			fields = {
				cameraId = 91418637,
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
			kind = 5,
			inputs = {
				staticIdVInput = -71340212,
				playableStateVInput = "Emotion_Excited_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 6,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160002,
				aniStateList = {
					"Emotion_Excited_Start",
					"Emotion_Excited_Loop",
					"Emotion_Excited_End"
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
					-101.887,
					189.449,
					1014.797
				},
				rotationVInput = {
					16.537,
					352.952,
					0
				}
			},
			fields = {
				cameraId = 91418574,
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
				staticIdVInput = -71340212,
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
				lookAtEntityStaticIdVInput = -71340212
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Nod",
				staticIdVInput = 2
			},
			fields = {
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 301
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -457204890,
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160004,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -457204890,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk",
				staticIdVInput = -457204890
			},
			fields = {
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160004
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -457204890
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
					-103.982,
					189.652,
					1017.142
				},
				rotationVInput = {
					16.021,
					109.836,
					0.001
				}
			},
			fields = {
				cameraId = 91417763,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy",
				staticIdVInput = -2044615730
			},
			fields = {
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160005
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -71340212
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -71340212,
				playableStateVInput = "Emotion_Excited_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160002,
				aniStateList = {
					"Emotion_Excited_Start",
					"Emotion_Excited_Loop",
					"Emotion_Excited_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -71340212,
				lookAtEntityStaticIdVInput = -2044615730
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
					-101.437,
					189.518,
					1014.728
				},
				rotationVInput = {
					12.583,
					338.342,
					0.001
				}
			},
			fields = {
				cameraId = 91418554,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_ShakeHead",
				staticIdVInput = -71340212
			},
			fields = {
				processingTime = 6,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160002
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6204316
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 78,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204318,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 7.25,
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
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -71340212,
				animationLayerVInput = 4,
				playableStateVInput = "TalkUpper_Confused"
			},
			fields = {
				processingTime = 4.5,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160002
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
					-102.264,
					189.457,
					1016.138
				},
				rotationVInput = {
					12.583,
					325.966,
					0.001
				}
			},
			fields = {
				cameraId = 91418348,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 7.18
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -71340212,
				durationVInput = 0.5,
				targetEulerAngleVInput = {
					0,
					100.474,
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
			kind = 7,
			fields = {
				dialogueId = 6204312
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -71340212,
				durationVInput = 0.5,
				targetEulerAngleVInput = {
					0,
					100.474,
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
						nodeId = 84,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Disappoint_Start",
				staticIdVInput = -71340212
			},
			fields = {
				processingTime = 3,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5160002
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
					-100.915,
					189.348,
					1015.421
				},
				rotationVInput = {
					9.146,
					314.449,
					0.001
				}
			},
			fields = {
				cameraId = 91418440,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 8.94
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -2044615730,
				targetEulerAngleVInput = {
					0,
					205.681,
					0
				},
				targetPositionVInput = {
					-102.097,
					188.082,
					1017.651
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
						nodeId = 88,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -71340212,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementTypeVInput = 1,
				cameraMovementTimeVInput = 40,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementVectorVInput = {
					0,
					0.2,
					0
				},
				positionVInput = {
					-103.35,
					189.085,
					1016.137
				},
				rotationVInput = {
					14.188,
					105.309,
					0
				}
			},
			fields = {
				cameraId = 91610463,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 12.94
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -71340212
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-104.063,
					189.55,
					1016.246
				},
				rotationVInput = {
					7.771,
					40.909,
					0
				}
			},
			fields = {
				cameraId = 91417688,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 12.94
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -71340212
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -2044615730,
				lookAtEntityStaticIdVInput = -71340212
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
					-101.571,
					195.456,
					1008.736
				},
				rotationVInput = {
					30.116,
					25.955,
					0
				}
			},
			fields = {
				cameraId = 91418717,
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
						nodeId = 95,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 5.4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-101.571,
					195.456,
					1008.736
				},
				rotationVInput = {
					31.491,
					17.36,
					0
				}
			},
			fields = {
				cameraId = 91417624,
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
			kind = 16,
			inputs = {
				slotParamVInput = 5160005,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-91.493,
					187.844,
					1015.093
				},
				rotationVInput = {
					0,
					189.904,
					0
				}
			},
			fields = {
				entityId = -2044615730,
				ignoreGravity = false
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
					-89.809,
					189.417,
					1010.671
				},
				rotationVInput = {
					5.02,
					333.357,
					-0.001
				}
			},
			fields = {
				cameraId = 91417176,
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
						nodeId = 98,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 9.3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-93.32,
					189.388,
					1015.832
				},
				rotationVInput = {
					4.333,
					286.431,
					-0.001
				}
			},
			fields = {
				cameraId = 91417210,
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
