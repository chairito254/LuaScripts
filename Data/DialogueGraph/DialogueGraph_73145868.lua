-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_73145868.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 73145868,
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 81,
					portId = "EntityIDs"
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
						nodeId = 3,
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
						nodeId = 6,
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
						nodeId = 7,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 78,
						portId = "In"
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
						nodeId = 8,
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
						nodeId = 12,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 76,
						portId = "In"
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
						nodeId = 10,
						portId = "In"
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
					-226.696,
					98.217,
					718.663
				},
				rotationVInput = {
					9.595,
					98.721,
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
						nodeId = 11,
						portId = "In"
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
					-225.538,
					98.018,
					718.485
				},
				rotationVInput = {
					9.767,
					98.721,
					0
				}
			},
			fields = {
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
						nodeId = 13,
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
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801465
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
						nodeId = 15,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801466
			},
			flowIn = {
				In = true
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
				dialogueIdVInput = 3801468
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
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801469
			},
			fields = {
				duration = 14
			},
			flowIn = {
				In = true
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
				portCount = 2
			},
			flowIn = {
				In = true
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
						nodeId = 74,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801470
			},
			fields = {
				duration = 15,
				portCount = 2
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
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801471
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
				portCount = 2
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
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801473
			},
			fields = {
				duration = 7,
				portCount = 2
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
				},
				["1"] = {
					{
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801474
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 24,
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
						nodeId = 25,
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
						nodeId = 26,
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
						nodeId = 27,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 70,
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
						nodeId = 28,
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
						nodeId = 29,
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
						nodeId = 33,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 30,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 32,
						portId = "In"
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
					-227.241,
					99.052,
					719.715
				},
				rotationVInput = {
					32.8,
					238.054,
					0
				}
			},
			fields = {
				squeezeFactor = 1.426,
				sensorWidth = 142,
				cameraId = 73685301,
				fStop = 16,
				focalDistance = 150
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 31,
						portId = "In"
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
					-228.588,
					98.435,
					718.857
				},
				rotationVInput = {
					31.425,
					236.85,
					0
				}
			},
			fields = {
				squeezeFactor = 1.14,
				sensorWidth = 37,
				cameraId = 73685302,
				fStop = 3.8,
				focalDistance = 271
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					233.447,
					0
				},
				targetPositionVInput = {
					-230.648,
					95.485,
					717.4
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
						nodeId = 34,
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
						nodeId = 35,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3801476
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
						nodeId = 36,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801477
			},
			fields = {
				duration = 9,
				portCount = 2
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
				},
				["1"] = {
					{
						nodeId = 63,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801478
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 38,
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
						nodeId = 62,
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
						nodeId = 41,
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
						nodeId = 44,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Behav_Happy"
			},
			fields = {
				playAniType = 1,
				entityType = 1,
				templateId = 1032100
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 72890041,
				playableStateVInput = "Behav_Happy"
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 500079
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
						nodeId = 45,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801480
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
						nodeId = 46,
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
						nodeId = 47,
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
						nodeId = 48,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 58,
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
				dialogueIdVInput = 3801481
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
						nodeId = 49,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801641
			},
			fields = {
				duration = 16,
				npcId = 400253,
				chatType = 3
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
				dialogueIdVInput = 3801642
			},
			fields = {
				duration = 12,
				npcId = 400253,
				chatType = 3
			},
			flowIn = {
				In = true
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
				portCount = 2
			},
			flowIn = {
				In = true
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
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801482
			},
			fields = {
				chatType = 5,
				duration = 4
			},
			flowIn = {
				In = true
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
						nodeId = 54,
						portId = "In"
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
						nodeId = 55,
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
						nodeId = 0,
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
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 72890041,
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
					-231.212,
					96.567,
					717.903
				},
				rotationVInput = {
					13.72,
					205.051,
					0
				}
			},
			fields = {
				squeezeFactor = 1.426,
				sensorWidth = 142,
				cameraId = 73685442,
				fStop = 16,
				focalDistance = 150
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 59,
						portId = "In"
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
					-231.355,
					96.484,
					717.596
				},
				rotationVInput = {
					13.72,
					205.051,
					0
				}
			},
			fields = {
				squeezeFactor = 1.14,
				sensorWidth = 37,
				cameraId = 73685443,
				fStop = 3.8,
				focalDistance = 271
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 72890041,
				playableStateVInput = "Emotion_Smile_Start"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 68,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				processingTime = 3.433,
				entityType = 2,
				templateId = 400253,
				aniStateList = {
					"Emotion_Smile_Start",
					"Emotion_Smile_Loop",
					"Emotion_Smile_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 72890041,
				playableStateVInput = "Talk_Shrug"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 68,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				processingTime = 3.433,
				templateId = 400253
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					215.288,
					0
				},
				targetPositionVInput = {
					-229.939,
					95.444,
					716.74
				}
			},
			fields = {
				setPosition = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801479
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 38,
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
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 72890041,
				playableStateVInput = "Daily_Hello"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 68,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400253
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
					-229.905,
					97.405,
					720.445
				},
				rotationVInput = {
					17.845,
					205.911,
					0
				}
			},
			fields = {
				squeezeFactor = 1.426,
				sensorWidth = 142,
				cameraId = 73685305,
				fStop = 16,
				focalDistance = 150
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 67,
						portId = "In"
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
					-230.107,
					97.256,
					720.029
				},
				rotationVInput = {
					17.845,
					205.911,
					0
				}
			},
			fields = {
				squeezeFactor = 1.14,
				sensorWidth = 37,
				cameraId = 73685441,
				fStop = 3.8,
				focalDistance = 271
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400253,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-232.051,
					95.06,
					716.378
				},
				rotationVInput = {
					0,
					48.879,
					0
				}
			},
			fields = {
				entityId = -126499777
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 72890041,
				targetEulerAngleVInput = {
					0,
					53.158,
					0
				},
				targetPositionVInput = {
					-231.87,
					94.986,
					714.939
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
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					233.447,
					0
				},
				targetPositionVInput = {
					-229.795,
					95.485,
					718.033
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
			kind = 7,
			fields = {
				dialogueId = 3801475
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 72890041,
				playableStateVInput = "Behav_Happy"
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 500079
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801472
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
			kind = 5,
			inputs = {
				staticIdVInput = 72890041,
				playableStateVInput = "Behav_Cry"
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 500079
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801467
			},
			flowIn = {
				In = true
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 72890041,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				entityType = 2,
				playAniType = 1,
				templateId = 500079,
				aniStateList = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					114.82,
					0
				},
				targetPositionVInput = {
					-223.253,
					96.762,
					718.708
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
				staticIdVInput = 72890041,
				targetEulerAngleVInput = {
					0,
					293.569,
					0
				},
				targetPositionVInput = {
					-221.601,
					96.869,
					718.009
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
			kind = 17,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 72890041
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					nodeId = 80,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 82,
					portId = "EntityID"
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
