-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91309279.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 91309279,
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
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 37
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 4
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 8
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 12
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 19
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 25
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					34.22,
					100.241,
					-44
				},
				rotationVInput = {
					0,
					70,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1967571307
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Greet",
				staticIdVInput = -1967571307
			},
			fields = {
				templateId = 990010,
				processingTime = 3,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = -1967571307,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					273.634,
					0
				},
				targetPositionVInput = {
					31.782,
					100.241,
					-43.823
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 1,
				staticIdVInput = -1967571307
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					33.01,
					100.297,
					-44.78
				},
				rotationVInput = {
					0,
					71.009,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -2015298121
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 9
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
				In = 0
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
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = -2015298121,
				speedVInput = 0.75,
				targetEulerAngleVInput = {
					0,
					255.266,
					0
				},
				targetPositionVInput = {
					30.997,
					100.241,
					-44.56
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						portId = "In",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 1,
				staticIdVInput = -2015298121
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91284484,
				targetEulerAngleVInput = {
					0,
					100,
					0
				},
				targetPositionVInput = {
					36.01,
					100.241,
					-42.97
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
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
						nodeId = 14
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284484,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					105.798,
					0
				},
				targetPositionVInput = {
					42.452,
					101.065,
					-44.88
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284484,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					104.849,
					0
				},
				targetPositionVInput = {
					49.114,
					104.032,
					-46.861
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284484,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					58.912,
					0
				},
				targetPositionVInput = {
					55.099,
					105.002,
					-46.471
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 20,
				staticIdVInput = 91284484,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					123.787,
					0
				},
				targetPositionVInput = {
					55.338,
					104.813,
					-38.19
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						portId = "0",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 4,
				maxAwaitTime = -1
			},
			flowIn = {
				["3"] = 0,
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
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
			kind = 14,
			inputs = {
				staticIdVInput = 91284479,
				targetEulerAngleVInput = {
					0,
					336.931,
					0
				},
				targetPositionVInput = {
					35.89,
					100.241,
					-44.17
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
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
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284479,
				targetEulerAngleVInput = {
					0,
					105.382,
					0
				},
				targetPositionVInput = {
					40.355,
					101.065,
					-45.241
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 22
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284479,
				targetEulerAngleVInput = {
					0,
					103.912,
					0
				},
				targetPositionVInput = {
					47.863,
					104.012,
					-47.992
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284479,
				targetEulerAngleVInput = {
					0,
					61.725,
					0
				},
				targetPositionVInput = {
					54.44,
					105.006,
					-47.869
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 20,
				staticIdVInput = 91284479,
				targetEulerAngleVInput = {
					0,
					73.74,
					0
				},
				targetPositionVInput = {
					53.9,
					104.806,
					-40.24
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						portId = "1",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91284552,
				targetEulerAngleVInput = {
					0,
					161.639,
					0
				},
				targetPositionVInput = {
					35.47,
					100.242,
					-42.27
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
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
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284552,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					105.798,
					0
				},
				targetPositionVInput = {
					42.452,
					101.065,
					-44.88
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284552,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					104.849,
					0
				},
				targetPositionVInput = {
					49.114,
					104.032,
					-46.861
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284552,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					58.912,
					0
				},
				targetPositionVInput = {
					55.099,
					105.002,
					-46.471
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 30
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 20,
				staticIdVInput = 91284552,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					122.779,
					0
				},
				targetPositionVInput = {
					53.919,
					104.743,
					-38.42
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						portId = "2",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91284525,
				targetEulerAngleVInput = {
					0,
					316.61,
					0
				},
				targetPositionVInput = {
					35.22,
					100.241,
					-44.74
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
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
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284525,
				targetEulerAngleVInput = {
					0,
					105.382,
					0
				},
				targetPositionVInput = {
					40.355,
					101.065,
					-45.241
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284525,
				targetEulerAngleVInput = {
					0,
					103.912,
					0
				},
				targetPositionVInput = {
					47.863,
					104.012,
					-47.992
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 91284525,
				targetEulerAngleVInput = {
					0,
					61.725,
					0
				},
				targetPositionVInput = {
					54.44,
					105.006,
					-47.869
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 20,
				staticIdVInput = 91284525,
				speedVInput = 0.75,
				targetEulerAngleVInput = {
					0,
					87.562,
					0
				},
				targetPositionVInput = {
					53.59,
					104.749,
					-39.33
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
							inTangent = 1
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
						portId = "3",
						nodeId = 18
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
						portId = "In",
						nodeId = 38
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5
			},
			flowIn = {
				In = 0
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
						nodeId = 41
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 40
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6519071,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1967571307,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.75,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 42
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
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 25
			},
			flowIn = {
				In = 0
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
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6519070,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1967571307,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.5,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			}
		}
	}
}
