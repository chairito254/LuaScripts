-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72787718.lua

return {
	schema = "v4",
	startNodeId = 2,
	dialogueId = 72787718,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 2
			},
			flowIn = {
				End = true
			}
		},
		{
			kind = 6,
			fields = {
				retFlag = 1
			},
			flowIn = {
				End = true
			}
		},
		{
			kind = 8,
			flowOut = {
				Start = {
					{
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 135
				}
			},
			fields = {
				nodeMode = 1,
				enableDefaultLookAt = true,
				resetOrientation = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 4
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
						portId = "In",
						nodeId = 5
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
						portId = "In",
						nodeId = 6
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
						portId = "In",
						nodeId = 7
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
						portId = "In",
						nodeId = 8
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 128
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 129
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 130
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 131
					}
				}
			}
		},
		{
			kind = 24,
			inputs = {
				switchToPetVInput = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 9
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
						portId = "In",
						nodeId = 13
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 10
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
				In = true
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
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 46,
				positionVInput = {
					-1492.771,
					34.752,
					1305.123
				},
				rotationVInput = {
					4.094,
					68.745,
					0
				}
			},
			fields = {
				cameraId = 73672280,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 5,
				positionVInput = {
					-1491.084,
					34.623,
					1305.785
				},
				rotationVInput = {
					4.094,
					68.573,
					0
				}
			},
			fields = {
				cameraId = 73672396,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				focalDistance = 271,
				fStop = 3.8
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
			},
			flowIn = {
				In = true
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
		{
			kind = 23,
			flowIn = {
				In = true
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
		{
			kind = 25,
			fields = {
				condition = {
					"QUEST_STATE",
					4708042,
					nil,
					">=",
					4
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 16
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 80
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
						portId = "In",
						nodeId = 20
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 17
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
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 46,
				positionVInput = {
					-1477.62,
					34.386,
					1306.844
				},
				rotationVInput = {
					11.314,
					296.392,
					0
				}
			},
			fields = {
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 6,
				positionVInput = {
					-1478.357,
					34.222,
					1307.21
				},
				rotationVInput = {
					11.314,
					296.392,
					0
				}
			},
			fields = {
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801210
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
						portId = "In",
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801211
			},
			fields = {
				duration = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 22
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801212
			},
			fields = {
				duration = 5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801213
			},
			fields = {
				duration = 16
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 24
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
						portId = "In",
						nodeId = 25
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3801214
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
						portId = "In",
						nodeId = 26
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
						portId = "In",
						nodeId = 27
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 76
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 77
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801215,
				defaultSkipBranchVInput = 1
			},
			fields = {
				duration = 6,
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 28
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
			kind = 7,
			fields = {
				dialogueId = 3801216
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801218
			},
			fields = {
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 30
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
						portId = "In",
						nodeId = 31
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801219
			},
			fields = {
				duration = 5
			},
			flowIn = {
				In = true
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
						portId = "In",
						nodeId = 33
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3801220
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
						portId = "In",
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801221
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
						portId = "In",
						nodeId = 35
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
						portId = "In",
						nodeId = 36
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801303
			},
			fields = {
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 37
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
						portId = "In",
						nodeId = 40
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 58
					}
				},
				["2"] = {
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
				blendFuncVInput = "Cubic",
				fovVInput = 46,
				positionVInput = {
					-1479.331,
					34.555,
					1312.365
				},
				rotationVInput = {
					10.626,
					213.542,
					0
				}
			},
			fields = {
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 39
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 3,
				positionVInput = {
					-1479.499,
					34.498,
					1312.11
				},
				rotationVInput = {
					10.454,
					213.37,
					0
				}
			},
			fields = {
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 41
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
						portId = "In",
						nodeId = 42
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 56
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 54
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
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 43
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
						portId = "In",
						nodeId = 44
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
						portId = "In",
						nodeId = 45
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
		{
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = true
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
			kind = 23,
			flowIn = {
				In = true
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
		{
			kind = 65,
			inputs = {
				zoomVInput = 0.6,
				controlRotationVInput = {
					15.018,
					312.045,
					0
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 48
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
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 49
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
						portId = "End",
						nodeId = 0
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
						portId = "In",
						nodeId = 51
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
						portId = "In",
						nodeId = 52
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 72776252,
				durationVInput = 0.3
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 72776243,
				durationVInput = 0.3
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 46,
				positionVInput = {
					-1488.53,
					34.795,
					1305.56
				},
				rotationVInput = {
					9.939,
					60.734,
					0
				}
			},
			fields = {
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 55
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 3,
				positionVInput = {
					-1487.67,
					34.622,
					1306.042
				},
				rotationVInput = {
					9.939,
					60.734,
					0
				}
			},
			fields = {
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
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
						portId = "In",
						nodeId = 57
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 72776243,
				targetEulerAngleVInput = {
					0,
					208.905,
					0
				},
				targetPositionVInput = {
					-1474.795,
					33.441,
					1310.64
				}
			},
			fields = {
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
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
			kind = 19,
			inputs = {
				staticIdVInput = 72776252,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					14.962,
					0
				},
				targetPositionVInput = {
					-1483.15,
					31.804,
					1293.4
				}
			},
			fields = {
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 72776252
			},
			fields = {
				playAniType = 1,
				templateId = 500063,
				entityType = 2,
				aniStateList = {
					"Behav_LoveStart",
					"Behav_LoveLoop",
					"Behav_LoveEnd"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 72776243,
				targetEulerAngleVInput = {
					0,
					208.905,
					0
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 72776252,
				targetEulerAngleVInput = {
					0,
					14.962,
					0
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801217
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 63
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801222
			},
			fields = {
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 64
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
						portId = "In",
						nodeId = 65
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3801223,
				defaultSkipBranchVInput = 1
			},
			fields = {
				duration = 6,
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 66
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 74
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801205
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 67
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801224
			},
			fields = {
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801221,
				defaultSkipBranchVInput = 1
			},
			fields = {
				duration = 10,
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 69
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 73
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801225
			},
			flowIn = {
				In = true
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
				portCount = 2
			},
			flowIn = {
				In = true
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
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801303
			},
			fields = {
				chatType = 3,
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 72776252
			},
			fields = {
				playAniType = 1,
				templateId = 500063,
				entityType = 2,
				aniStateList = {
					"Behav_LoveStart",
					"Behav_LoveLoop",
					"Behav_LoveEnd"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801226
			},
			flowIn = {
				In = true
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
			kind = 7,
			fields = {
				dialogueId = 3801206
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 67
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 72776243,
				targetEulerAngleVInput = {
					0,
					-124.721,
					0
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 72776243,
				targetEulerAngleVInput = {
					0,
					-124.721,
					0
				}
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
						portId = "In",
						nodeId = 78
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 72776252,
				targetEulerAngleVInput = {
					0,
					-23.233,
					0
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 72776243
			},
			fields = {
				playAniType = 1,
				templateId = 500073,
				entityType = 2,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
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
						portId = "In",
						nodeId = 81
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 125
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801210
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
						portId = "In",
						nodeId = 82
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801211
			},
			fields = {
				duration = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 83
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801212
			},
			fields = {
				duration = 5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 3801213
			},
			fields = {
				duration = 16
			},
			flowIn = {
				In = true
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
						portId = "In",
						nodeId = 86
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 124
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801214
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
				In = true
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
						nodeId = 123
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801227
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
						portId = "In",
						nodeId = 89
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
						portId = "In",
						nodeId = 90
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 120
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 121
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801228
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
						portId = "In",
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801224
			},
			fields = {
				duration = 4
			},
			flowIn = {
				In = true
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
				dialogueIdVInput = 3801221,
				defaultSkipBranchVInput = 1
			},
			fields = {
				duration = 10,
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 93
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 119
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801225
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 95
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 118
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801303
			},
			fields = {
				chatType = 3,
				duration = 4
			},
			flowIn = {
				In = true
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
						portId = "In",
						nodeId = 99
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 117
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 97
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 46,
				positionVInput = {
					-1479.331,
					34.555,
					1312.365
				},
				rotationVInput = {
					10.626,
					213.542,
					0
				}
			},
			fields = {
				cameraId = 73673794,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 98
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 3,
				positionVInput = {
					-1479.499,
					34.498,
					1312.11
				},
				rotationVInput = {
					10.454,
					213.37,
					0
				}
			},
			fields = {
				cameraId = 73673938,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3
			},
			flowIn = {
				In = true
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
						portId = "In",
						nodeId = 101
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 115
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 113
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
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 102
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 104
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 109
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
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 105
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
						portId = "In",
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 65,
			inputs = {
				zoomVInput = 0.6,
				controlRotationVInput = {
					15.018,
					312.045,
					0
				}
			},
			flowIn = {
				In = true
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
			kind = 12,
			inputs = {
				resumeNpcVInput = false
			},
			flowIn = {
				In = true
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
			kind = 10,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "End",
						nodeId = 1
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
						portId = "In",
						nodeId = 110
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
						portId = "In",
						nodeId = 111
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 112
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 72776252,
				durationVInput = 0.3
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 72776243,
				durationVInput = 0.3
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 46,
				positionVInput = {
					-1488.53,
					34.795,
					1305.56
				},
				rotationVInput = {
					9.939,
					60.734,
					0
				}
			},
			fields = {
				cameraId = 73673964,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 3,
				positionVInput = {
					-1487.67,
					34.622,
					1306.042
				},
				rotationVInput = {
					9.939,
					60.734,
					0
				}
			},
			fields = {
				cameraId = 73674167,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
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
						portId = "In",
						nodeId = 116
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 72776243,
				targetEulerAngleVInput = {
					0,
					208.905,
					0
				},
				targetPositionVInput = {
					-1474.795,
					33.441,
					1310.64
				}
			},
			fields = {
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
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
			kind = 19,
			inputs = {
				staticIdVInput = 72776252,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					14.962,
					0
				},
				targetPositionVInput = {
					-1483.15,
					31.804,
					1293.4
				}
			},
			fields = {
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 72776252
			},
			fields = {
				playAniType = 1,
				templateId = 500063,
				entityType = 2,
				aniStateList = {
					"Behav_LoveStart",
					"Behav_LoveLoop",
					"Behav_LoveEnd"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801226
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 94
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 72776252,
				targetEulerAngleVInput = {
					0,
					-23.233,
					0
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 46,
				positionVInput = {
					-1487.665,
					35.401,
					1303.948
				},
				rotationVInput = {
					12.517,
					48.462,
					0
				}
			},
			fields = {
				cameraId = 73673788,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 122
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 6,
				positionVInput = {
					-1487.123,
					35.24,
					1304.428
				},
				rotationVInput = {
					12.517,
					48.462,
					0
				}
			},
			fields = {
				cameraId = 73673792,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 72776243,
				targetEulerAngleVInput = {
					0,
					-124.721,
					0
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_HappyStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 72776243
			},
			fields = {
				playAniType = 1,
				templateId = 500073,
				entityType = 2,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 126
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 46,
				positionVInput = {
					-1477.62,
					34.386,
					1306.844
				},
				rotationVInput = {
					11.314,
					296.392,
					0
				}
			},
			fields = {
				cameraId = 73672528,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 127
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 6,
				positionVInput = {
					-1478.357,
					34.222,
					1307.21
				},
				rotationVInput = {
					11.314,
					296.392,
					0
				}
			},
			fields = {
				cameraId = 73672902,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150,
				fStop = 16
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
					264.988,
					0
				},
				targetPositionVInput = {
					-1487.152,
					32.816,
					1309.437
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 133
				}
			},
			fields = {
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 72776243,
				targetEulerAngleVInput = {
					0,
					208.905,
					0
				},
				targetPositionVInput = {
					-1481.78,
					32.768,
					1309.89
				}
			},
			fields = {
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 72776252,
				targetEulerAngleVInput = {
					0,
					14.962,
					0
				},
				targetPositionVInput = {
					-1482.19,
					32.662,
					1307.89
				}
			},
			fields = {
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 132
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				targetEulerAngleVInput = {
					0,
					84.015,
					0
				},
				targetPositionVInput = {
					-1484.948,
					32.608,
					1308.839
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 133
				}
			},
			fields = {
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							value = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1,
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
			kind = 17,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 72776243
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 134
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 136
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 137
				}
			},
			fields = {
				portCount = 3
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 72776252
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		}
	}
}
