-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72337232.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 72337232,
	nodes = {
		[0] = {
			kind = 6,
			flowIn = {
				End = true
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
			kind = 24,
			inputs = {
				switchToPlayerVInput = true
			},
			flowIn = {
				In = true
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
			kind = 58,
			inputs = {
				waitPlayerIdleVInput = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 18,
			inputs = {
				blockEventVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true
			},
			flowIn = {
				In = true
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
			kind = 22,
			inputs = {
				blendVInput = 0.5
			},
			flowIn = {
				In = true
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
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = true
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
			kind = 23,
			flowIn = {
				In = true
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
				portCount = 5
			},
			flowIn = {
				In = true
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
						nodeId = 18,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 16,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 83,
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
				In = true
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 91,
					portId = "EntityID"
				}
			},
			fields = {
				resetOrientation = true,
				reactPreset = 3,
				enableGroupLookAt = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				dialogueIdVInput = 3904511
			},
			fields = {
				skipTime = 1,
				duration = 2
			},
			flowIn = {
				In = true
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
				In = true
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
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904512
			},
			fields = {
				chatType = 10,
				skipTime = 1,
				duration = 4
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-636.936,
					48.887,
					849.629
				},
				rotationVInput = {
					22.552,
					85.493,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72603727,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-640.812,
					49.932,
					849.432
				},
				rotationVInput = {
					12.926,
					76.967,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 18.21,
				cameraId = 72531784,
				openDof = true,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					105.64,
					0
				},
				targetPositionVInput = {
					-639.736,
					48.205,
					850.869
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 91,
					portId = "EntityID"
				}
			},
			fields = {
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = true
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
			kind = 19,
			inputs = {
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					119.197,
					0
				},
				targetPositionVInput = {
					-638.037,
					48.153,
					850.314
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 91,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							inWeight = 0,
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							time = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							inWeight = 0,
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400066,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-635.193,
					47.955,
					849.784
				},
				rotationVInput = {
					0,
					288.859,
					0
				}
			},
			fields = {
				entityId = -1211997200
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				playStartLoopEndVInput = true,
				loopDurationVInput = 6,
				playableStateVInput = "Behav_SleepStart"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 18,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400203,
				processingTime = 0.95
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 21,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904513
			},
			fields = {
				duration = 2
			},
			flowIn = {
				In = true
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 67,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3904514
			},
			fields = {
				portCount = 2,
				chatType = 5,
				skipTime = 2,
				duration = 4
			},
			flowIn = {
				In = true
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
			kind = 27,
			fields = {
				uid = 306,
				param = {
					name = "CHARACTER_APPEARANCE_NAME_Sunia",
					title = "CHARACTER_APPEARANCE_DESC_Sunia",
					pos = {
						-1288,
						200,
						0
					}
				}
			},
			flowIn = {
				In = true,
				closeUIFInput = true
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904515
			},
			fields = {
				duration = 9
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904516
			},
			fields = {
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 27,
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 28,
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
						nodeId = 63,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 65,
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
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-636.005,
					49.346,
					849.334
				},
				rotationVInput = {
					4.333,
					351.508,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72615807,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904517
			},
			fields = {
				duration = 2
			},
			flowIn = {
				In = true
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
				In = true
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
						nodeId = 61,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 62,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904518
			},
			fields = {
				duration = 6
			},
			flowIn = {
				In = true
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
				portCount = 2
			},
			flowIn = {
				In = true
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
						nodeId = 60,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"TWIN_PET_CHOICE",
					nil,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				False = {
					{
						nodeId = 57,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 34,
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 35,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904519
			},
			fields = {
				duration = 2,
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 36,
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
				In = true
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
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-636.62,
					49.302,
					849.581
				},
				rotationVInput = {
					8.733,
					81.165,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72627994,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904521
			},
			fields = {
				portCount = 2,
				duration = 14
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 39,
						portId = "In"
					}
				},
				["1"] = {
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
				portCount = 3
			},
			flowIn = {
				In = true
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
						nodeId = 53,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 54,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904522
			},
			fields = {
				portCount = 2,
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 41,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 52,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3904523
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 42,
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 43,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 50,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904525
			},
			fields = {
				duration = 8
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 44,
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 45,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 49,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904526
			},
			fields = {
				duration = 10
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 46,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 10,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 48,
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
				In = true
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
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				playableStateVInput = "Emotion_Smile_Start"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 71,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 0.8
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-636.62,
					49.302,
					849.581
				},
				rotationVInput = {
					8.733,
					81.165,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72628208,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Introduce"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 71,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 2.683
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3904524
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 42,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Introduce"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 71,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 2.683
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Normal"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 93,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				templateId = 4,
				processingTime = 6.283
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-636.005,
					49.346,
					849.334
				},
				rotationVInput = {
					4.333,
					351.508,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72663402,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Emotion_Solemn_Start"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 84,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 500030,
				processingTime = 1,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"Emotion_Solemn_Start",
					"Emotion_Solemn_Loop",
					"Emotion_Solemn_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 59,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904520
			},
			fields = {
				duration = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 36,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 4,
				playableStateVInput = "Emotion_Solemn_Start"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 86,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 500030,
				processingTime = 1,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"Emotion_Solemn_Start",
					"Emotion_Solemn_Loop",
					"Emotion_Solemn_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-634.785,
					48.706,
					850.497
				},
				rotationVInput = {
					8.046,
					288.391,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72627700,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-636.62,
					49.302,
					849.581
				},
				rotationVInput = {
					8.733,
					81.165,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72663215,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Talk_Shrug"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 71,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 3.433
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				lookAtEntityIdVInput = {
					nodeId = 71,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 71,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					144.273,
					0
				},
				targetPositionVInput = {
					-636.16,
					48.002,
					850.443
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 92,
					portId = "EntityID"
				}
			},
			fields = {
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 66,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Crossingarms"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 92,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				templateId = 4,
				processingTime = 5.333
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.8
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 68,
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 69,
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
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					270.45,
					0
				},
				targetPositionVInput = {
					-634.69,
					47.943,
					850.393
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 18,
					portId = "EntityID"
				}
			},
			fields = {
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 8,
				playableStateVInput = "Behav_Love"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 18,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400203,
				processingTime = 3.833
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400204,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-635.193,
					47.955,
					849.784
				},
				rotationVInput = {
					0,
					283.757,
					0
				}
			},
			fields = {
				entityId = -1428751103
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Akimbo02",
				applyRootMotionVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 71,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 2,
				entityType = 2,
				templateId = 400204,
				processingTime = 10.917
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 73,
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
				In = true
			},
			flowOut = {
				["1"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 74,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 71,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 7.117
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 24,
						portId = "closeUIFInput"
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 72,
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
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-636.788,
					49.302,
					849.815
				},
				rotationVInput = {
					8.32,
					88.59,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72604937,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Talk_Normal"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 71,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 4.267
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"TWIN_PET_CHOICE",
					nil,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				False = {
					{
						nodeId = 81,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 80,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					121.846,
					0
				},
				targetPositionVInput = {
					-636.171,
					48.018,
					851.122
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 84,
					portId = "EntityID"
				}
			},
			fields = {
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					120.367,
					0
				},
				targetPositionVInput = {
					-636.038,
					48.107,
					850.904
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 86,
					portId = "EntityID"
				}
			},
			fields = {
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Circle",
				loopDurationVInput = 8
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 18,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400203,
				processingTime = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"TWIN_PET_CHOICE",
					nil,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				False = {
					{
						nodeId = 86,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 84,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400061,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-638.898,
					48.094,
					851.143
				},
				rotationVInput = {
					0,
					94.724,
					0
				}
			},
			fields = {
				entityId = -98812602
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 85,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					96.619,
					0
				},
				targetPositionVInput = {
					-637.642,
					48.089,
					851.291
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 84,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							inWeight = 0,
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							time = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							inWeight = 0,
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400109,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-638.898,
					48.094,
					851.143
				},
				rotationVInput = {
					0,
					94.724,
					0
				}
			},
			fields = {
				entityId = -79744879
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 87,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					94.724,
					0
				},
				targetPositionVInput = {
					-637.899,
					48.089,
					851.143
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 86,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							inWeight = 0,
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							time = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							inWeight = 0,
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400061,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-636.332,
					48.023,
					850.983
				},
				rotationVInput = {
					0,
					116.512,
					0
				}
			},
			fields = {
				entityId = -2014439521
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-637.315,
					49.565,
					849.415
				},
				rotationVInput = {
					13.546,
					73.052,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72627646,
				squeezeFactor = 1,
				sensorWidth = 360
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3904519
			},
			fields = {
				duration = 2
			}
		},
		{
			kind = 17
		},
		{
			kind = 17
		},
		{
			kind = 17
		}
	}
}
