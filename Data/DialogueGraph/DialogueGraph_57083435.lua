-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_57083435.lua

return {
	dialogueId = 57083435,
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
				templateId = 500009
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801123
			},
			fields = {
				duration = 10,
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
				dialogueIdVInput = 3801124
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
					-632.349,
					82.303,
					1593.089
				},
				rotationVInput = {
					0,
					195.198,
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
					-634.874,
					81.366,
					1596.878
				},
				rotationVInput = {
					0,
					189.134,
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
					-201.44,
					0
				},
				targetPositionVInput = {
					-633.254,
					81.389,
					1591.436
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
				staticIdVInput = 57080701
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
					-31.632,
					0
				},
				targetPositionVInput = {
					-632.68,
					81.586,
					1589.84
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
				staticIdVInput = 57080701
			},
			fields = {
				entityType = 2
			}
		}
	}
}
