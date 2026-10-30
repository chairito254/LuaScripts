-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_57083450.lua

return {
	dialogueId = 57083450,
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
			kind = 2,
			fields = {
				portCount = 5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["1"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 4,
						portId = "In"
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
					nodeId = 15,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 500010
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801125
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
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801126
			},
			fields = {
				duration = 9,
				chatType = 3
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
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-634.756,
					82.635,
					1604.248
				},
				rotationVInput = {
					0,
					21.506,
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
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendExponentVInput = 2,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-631.747,
					82.502,
					1605.906
				},
				rotationVInput = {
					0,
					281.685,
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
			fields = {
				entityType = 1
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					-29.295,
					0
				},
				targetPositionVInput = {
					-634.469,
					81.902,
					1606.947
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 11,
					portId = "EntityID"
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = true
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 57080714
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
					134.055,
					0
				},
				targetPositionVInput = {
					-634.61,
					82.314,
					1606.82
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 13,
					portId = "EntityID"
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = true
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 57080714
			},
			fields = {
				entityType = 2
			}
		}
	}
}
