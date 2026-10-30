-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91293429.lua

return {
	dialogueId = 91293429,
	schema = 1,
	startNodeId = 1,
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
						portId = "In",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 66,
			inputs = {
				resetOnFinishVInput = true,
				durationVInput = 0.1
			},
			fields = {
				staticIdList = {
					[1] = 91292468,
					[2] = 91292535
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 401052,
				positionVInput = {
					87.82,
					60.29,
					1071.74
				},
				rotationVInput = {
					0,
					341.639,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -771167497
			},
			flowIn = {
				In = 0
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 401055,
				positionVInput = {
					88.77,
					60.23,
					1071.18
				},
				rotationVInput = {
					0,
					335.81,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -739074067
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
			kind = 19,
			inputs = {
				staticIdVInput = -771167497,
				maxLimitTimeVInput = 8,
				targetEulerAngleVInput = {
					0,
					341.639,
					0
				},
				targetPositionVInput = {
					96.919,
					60.29,
					1074.753
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
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
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -739074067,
				maxLimitTimeVInput = 8,
				targetEulerAngleVInput = {
					0,
					341.639,
					0
				},
				targetPositionVInput = {
					95.191,
					60.29,
					1074.066
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
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
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 66,
			inputs = {
				durationVInput = 1
			},
			fields = {
				staticIdList = {
					[1] = -771167497,
					[2] = -739074067
				}
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		}
	}
}
