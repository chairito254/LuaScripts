-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_57083578.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 57083578,
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
			kind = 18,
			inputs = {
				hideAllUIVInput = true,
				blockEventVInput = true,
				hideTopLogoVInput = true
			},
			flowIn = {
				In = true
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
			kind = 1,
			fields = {
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
						portId = "In",
						nodeId = 4
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
			kind = 2,
			fields = {
				portCount = 5
			},
			flowOut = {
				["1"] = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 21
				}
			},
			fields = {
				templateId = 500011,
				playAniType = 1,
				entityType = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801176
			},
			fields = {
				chatType = 5,
				skipTime = 3,
				duration = 4
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801132
			},
			fields = {
				chatType = 3,
				duration = 13
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801133
			},
			fields = {
				chatType = 3,
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801134
			},
			fields = {
				chatType = 3,
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801135
			},
			fields = {
				chatType = 3,
				duration = 8
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
					-283.64,
					76.303,
					1850.097
				},
				rotationVInput = {
					0,
					157.627,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				squeezeFactor = 1,
				sensorWidth = 360
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 2
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 14
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
					-282.851,
					76.42,
					1850.885
				},
				rotationVInput = {
					0,
					168.614,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 57080832
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetPositionVInput = {
					-1196,
					75,
					802
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 15
				}
			},
			fields = {
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							outTangent = 0,
							inTangent = 1,
							value = 1
						}
					}
				}
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					-145.296,
					0
				},
				targetPositionVInput = {
					-282.339,
					75.35,
					1848.542
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 17
				}
			},
			fields = {
				reset = true,
				setRotation = true,
				setPosition = true
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 57080832
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					166.178,
					0
				},
				targetPositionVInput = {
					-670.34,
					88.316,
					1604.03
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 19
				}
			},
			fields = {
				reset = true,
				setRotation = true,
				setPosition = true
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 57080832
			},
			fields = {
				entityType = 2
			}
		}
	}
}
