-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_80541066.lua

return {
	dialogueId = 80541066,
	schema = "v4",
	startNodeId = 1,
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
			kind = 18,
			inputs = {
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true
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
			kind = 2,
			fields = {
				portCount = 6
			},
			flowIn = {
				In = true
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
						nodeId = 6,
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
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400180,
				positionVInput = {
					-910.409,
					102.954,
					1243.386
				},
				rotationVInput = {
					0,
					25.617,
					0
				}
			},
			fields = {
				entityId = -1827017896
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
					nodeId = 6,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Shrug"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 2.4,
				playAniType = 1,
				entityType = 2,
				templateId = 400180
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
					nodeId = 6,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Talk"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 2.4,
				playAniType = 1,
				entityType = 2,
				templateId = 400180
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Smile01",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 2.4,
				playAniType = 1,
				entityType = 2,
				templateId = 400180,
				aniStateList = {
					"Emotion_Smile01",
					"Emotion_Smile01",
					"Emotion_Smile01"
				}
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
					nodeId = 6,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Talk",
				animationLayerVInput = 4,
				staticIdVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 5.2,
				playAniType = 1,
				templateId = 301
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 1.025,
				targetEulerAngleVInput = {
					0,
					120,
					0
				},
				targetPositionVInput = {
					-908.777,
					103.163,
					1245.183
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 6,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1
						}
					}
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
					301.242,
					0
				},
				targetPositionVInput = {
					-907.881,
					103.043,
					1244.821
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 62,
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 200001,
				positionVInput = {
					-908.927,
					102.912,
					1243.993
				},
				rotationVInput = {
					0,
					16.102,
					0
				}
			},
			fields = {
				entityId = -1456847143
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
					nodeId = 16,
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
				staticIdVInput = 2
			},
			valueIn = {
				lookAtEntityIdVInput = {
					nodeId = 16,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-906.62,
					104.401,
					1241.582
				},
				rotationVInput = {
					357.954,
					332.145,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90881290,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 21,
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
						nodeId = 22,
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
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201132
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 400180,
				duration = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
				portCount = 4
			},
			flowIn = {
				In = true
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
						nodeId = 24,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-907.529,
					104.323,
					1245.708
				},
				rotationVInput = {
					23.566,
					219.73,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90881667,
				squeezeFactor = 1
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
						nodeId = 54,
						portId = "In"
					}
				},
				True = {
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
				dialogueIdVInput = 6201133
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 100,
				duration = 5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 27,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2
			},
			flowIn = {
				["0"] = true,
				["1"] = true
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
				portCount = 5
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
						nodeId = 29,
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
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-906.881,
					104.557,
					1243.147
				},
				rotationVInput = {
					7.408,
					325.613,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90881637,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 14.7,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-907.639,
					104.557,
					1242.782
				},
				rotationVInput = {
					7.236,
					341.255,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90881640,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201135
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 400180,
				duration = 9
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
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Lefthand",
				animationLayerVInput = 4,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 2,
				playAniType = 1,
				templateId = 301
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201011
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 0,
				duration = 6
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
						nodeId = 36,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201136
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 400180,
				duration = 9
			},
			flowIn = {
				In = true
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
				dialogueIdVInput = 6201022
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 400180,
				duration = 14
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
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 4
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
						nodeId = 39,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-907.388,
					104.211,
					1244.602
				},
				rotationVInput = {
					29.582,
					253.936,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90881720,
				squeezeFactor = 1
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
						nodeId = 53,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201023
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 100,
				duration = 11
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
				portCount = 5
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
						nodeId = 10,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 51,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 6201025
			},
			fields = {
				portCount = 2,
				npcStaticId = 1,
				npcId = 400180,
				duration = 2,
				chatType = 3
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
				},
				["1"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201026
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201028
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 400180,
				duration = 9
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
						nodeId = 47,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 6201031
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 400180,
				duration = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201027
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201029
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 400180,
				duration = 8
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 50,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201030
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 400180,
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
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-907.367,
					104.694,
					1242.862
				},
				rotationVInput = {
					11.705,
					341.427,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90881721,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				blendTimeVInput = 18.7,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-907.688,
					104.527,
					1243.807
				},
				rotationVInput = {
					8.955,
					340.567,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90882658,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201024
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 100,
				duration = 5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201134
			},
			fields = {
				chatType = 3,
				npcStaticId = 1,
				npcId = 100,
				duration = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 27,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400180,
				positionVInput = {
					-908.777,
					103.163,
					1245.183
				},
				rotationVInput = {
					0,
					120,
					0
				}
			},
			fields = {
				entityId = -204105353
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 200001,
				positionVInput = {
					-905.526,
					103.233,
					1245.529
				},
				rotationVInput = {
					0,
					330,
					0
				}
			},
			fields = {
				entityId = -1219427633
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 200001,
				positionVInput = {
					-905.526,
					103.233,
					1245.529
				},
				rotationVInput = {
					0,
					320,
					0
				}
			},
			fields = {
				entityId = -69827221
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 200001,
				positionVInput = {
					-905.65,
					103.233,
					1245.108
				},
				rotationVInput = {
					0,
					320,
					0
				}
			},
			fields = {
				entityId = -1646323285
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 200001,
				positionVInput = {
					-905.442,
					103.233,
					1245.283
				},
				rotationVInput = {
					0,
					320,
					0
				}
			},
			fields = {
				entityId = -493581648
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 200001,
				positionVInput = {
					-905.122,
					103.004,
					1245.838
				},
				rotationVInput = {
					0,
					300,
					0
				}
			},
			fields = {
				entityId = -1233646822
			}
		},
		{
			kind = 13,
			fields = {
				resetOrientation = true,
				reactPreset = 3,
				enableGroupLookAt = true
			}
		},
		{
			kind = 17
		},
		{
			kind = 26
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400180,
				positionVInput = {
					-909.604,
					103.202,
					1244.909
				},
				rotationVInput = {
					0,
					180,
					0
				}
			},
			fields = {
				entityId = -1816043819
			}
		}
	}
}
