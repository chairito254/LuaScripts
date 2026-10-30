-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72787894.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 72787894,
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
						portId = "In",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 82
				}
			},
			fields = {
				resetOrientation = true,
				nodeMode = 1,
				enableDefaultLookAt = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 3
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
						portId = "In",
						nodeId = 4
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
						nodeId = 5
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
						nodeId = 6
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
						portId = "In",
						nodeId = 7
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
						nodeId = 75
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 24,
			inputs = {
				switchToLocomotionVInput = true,
				switchToPetVInput = true
			},
			flowIn = {
				In = true
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
				portCount = 3
			},
			flowIn = {
				In = true
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
						nodeId = 9
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 73
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
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendFuncVInput = "Cubic",
				positionVInput = {
					-1455.572,
					33.911,
					1312.698
				},
				rotationVInput = {
					15.267,
					105.94,
					0
				}
			},
			fields = {
				fStop = 16,
				cameraId = 73676849,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				fovVInput = 46,
				blendTimeVInput = 5,
				positionVInput = {
					-1451.946,
					33.838,
					1311.925
				},
				rotationVInput = {
					14.064,
					105.253,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 73676850,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				focalDistance = 271
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
						nodeId = 13
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
						nodeId = 14
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801270
			},
			fields = {
				chatType = 3,
				duration = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 15
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
						nodeId = 16
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
						nodeId = 17
					}
				},
				["1"] = {
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
				blendFuncVInput = "Cubic",
				positionVInput = {
					-1417.786,
					32.25,
					1299.31
				},
				rotationVInput = {
					6.673,
					309.007,
					0
				}
			},
			fields = {
				fStop = 16,
				cameraId = 73678706,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 4,
				positionVInput = {
					-1420.236,
					31.934,
					1300.564
				},
				rotationVInput = {
					5.985,
					306.085,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 73678993,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				focalDistance = 271
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
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"QUEST_STATE",
					4708068,
					nil,
					"<",
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
						nodeId = 51
					}
				},
				True = {
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
				dialogueIdVInput = 3801271,
				defaultSkipBranchVInput = 1
			},
			fields = {
				portCount = 2,
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
			kind = 7,
			fields = {
				dialogueId = 3801272
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801274
			},
			fields = {
				duration = 13
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801275
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
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801276
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
						nodeId = 26
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
						nodeId = 27
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 48
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801277,
				defaultSkipBranchVInput = 1
			},
			fields = {
				portCount = 2,
				duration = 7
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
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801278
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
				dialogueIdVInput = 3801280
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
						nodeId = 30
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801281,
				defaultSkipBranchVInput = 1
			},
			fields = {
				portCount = 2,
				duration = 3
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
						nodeId = 46
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801282
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
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
				portCount = 4
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
						nodeId = 42
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 44
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
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801284
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
						nodeId = 34
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
						nodeId = 35
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
						nodeId = 36
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
						nodeId = 37
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
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 38
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
						nodeId = 39
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
						nodeId = 40
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
						nodeId = 41
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
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendFuncVInput = "Cubic",
				positionVInput = {
					-1430.205,
					31.607,
					1292.707
				},
				rotationVInput = {
					0.485,
					14.153,
					0
				}
			},
			fields = {
				fStop = 16,
				cameraId = 73681443,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 9,
				positionVInput = {
					-1431.296,
					31.607,
					1292.982
				},
				rotationVInput = {
					0.485,
					14.153,
					0
				}
			},
			fields = {
				fStop = 16,
				cameraId = 73681444,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 72066582,
				playableStateVInput = "IdleSpecial"
			},
			fields = {
				entityType = 2,
				templateId = 500076,
				processingTime = 5.167,
				playAniType = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 1,
				playableStateVInput = "Behav_AngryStart"
			},
			fields = {
				templateId = 11005300,
				processingTime = 5.167,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801283
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801279
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
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendFuncVInput = "Cubic",
				positionVInput = {
					-1438.245,
					30.531,
					1302.392
				},
				rotationVInput = {
					359.453,
					67.61,
					0
				}
			},
			fields = {
				fStop = 16,
				cameraId = 73682470,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 49
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
					-1436.475,
					30.549,
					1303.122
				},
				rotationVInput = {
					359.453,
					67.61,
					0
				}
			},
			fields = {
				fStop = 3.8,
				cameraId = 73682471,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				focalDistance = 271
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801273
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801271,
				defaultSkipBranchVInput = 1
			},
			fields = {
				portCount = 2,
				duration = 7
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
						nodeId = 72
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801285
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 3801287
			},
			fields = {
				duration = 15
			},
			flowIn = {
				In = true
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
				dialogueIdVInput = 3801275
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
						nodeId = 55
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801276
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
						nodeId = 56
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
						nodeId = 57
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 70
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801277,
				defaultSkipBranchVInput = 1
			},
			fields = {
				portCount = 2,
				duration = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 58
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 69
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801278
			},
			flowIn = {
				In = true
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
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801280
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
						nodeId = 60
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801281,
				defaultSkipBranchVInput = 1
			},
			fields = {
				portCount = 2,
				duration = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 61
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 68
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801282
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 62
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
						portId = "In",
						nodeId = 63
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 64
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 66
					}
				},
				["3"] = {
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
				dialogueIdVInput = 3801284
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
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendFuncVInput = "Cubic",
				positionVInput = {
					-1430.205,
					31.607,
					1292.707
				},
				rotationVInput = {
					0.485,
					14.153,
					0
				}
			},
			fields = {
				fStop = 16,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 9,
				positionVInput = {
					-1431.296,
					31.607,
					1292.982
				},
				rotationVInput = {
					0.485,
					14.153,
					0
				}
			},
			fields = {
				fStop = 16,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 72775882,
				playableStateVInput = "IdleSpecial"
			},
			fields = {
				entityType = 2,
				templateId = 500076,
				processingTime = 5.167,
				playAniType = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 1,
				playableStateVInput = "Behav_AngryStart"
			},
			fields = {
				templateId = 11005300,
				processingTime = 5.167,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801283
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
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
				dialogueId = 3801279
			},
			flowIn = {
				In = true
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
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendFuncVInput = "Cubic",
				positionVInput = {
					-1438.245,
					30.531,
					1302.392
				},
				rotationVInput = {
					359.453,
					67.61,
					0
				}
			},
			fields = {
				fStop = 16,
				squeezeFactor = 1.426,
				sensorWidth = 142,
				focalDistance = 150
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 71
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
					-1436.475,
					30.549,
					1303.122
				},
				rotationVInput = {
					359.453,
					67.61,
					0
				}
			},
			fields = {
				fStop = 3.8,
				squeezeFactor = 1.14,
				sensorWidth = 37,
				focalDistance = 271
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801286
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 72775882,
				playableStateVInput = "IdleSpecial"
			},
			fields = {
				entityType = 2,
				templateId = 500076,
				playAniType = 1
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
					109.907,
					0
				},
				targetPositionVInput = {
					-1448.421,
					28.436,
					1310.186
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 80
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
				staticIdVInput = 72066582,
				targetEulerAngleVInput = {
					0,
					280,
					0
				},
				targetPositionVInput = {
					-1424.401,
					28.681,
					1306.003
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
						nodeId = 77
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				targetEulerAngleVInput = {
					0,
					96.085,
					0
				},
				targetPositionVInput = {
					-1431.411,
					28.667,
					1306.865
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 80
				}
			},
			fields = {
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1
						},
						{
							inTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							time = 1,
							inWeight = 0,
							outTangent = 0
						}
					}
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 4
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 79
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 72066582,
				durationVInput = 0.3
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
				staticIdVInput = 72066582
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
					nodeId = 81
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 83
				}
			},
			fields = {
				portCount = 2
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
