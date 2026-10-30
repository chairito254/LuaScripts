-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_58538840.lua

return {
	startNodeId = 1,
	schema = "v4",
	dialogueId = 58538840,
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
						portId = "In",
						nodeId = 3
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
						portId = "In",
						nodeId = 4
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
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 17
				}
			},
			fields = {
				resetOrientation = true,
				enableGroupLookAt = true,
				enableDefaultLookAt = true
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801165
			},
			fields = {
				duration = 6,
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
				["0"] = {
					{
						portId = "In",
						nodeId = 8
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-990.673,
					89.605,
					574.579
				},
				rotationVInput = {
					0,
					135.782,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
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
					nodeId = 16
				}
			},
			fields = {
				templateId = 400150,
				playAniType = 1,
				entityType = 2
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
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-989.796,
					89.7,
					572.332
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 9
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					316.726,
					0
				},
				targetPositionVInput = {
					-990.135,
					88.141,
					574.409
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 12
				}
			},
			fields = {
				setPosition = true
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 58482468
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 14,
			inputs = {
				targetPositionVInput = {
					-989.68,
					88.36,
					573.36
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 14
				}
			},
			fields = {
				setPosition = true,
				setRotation = true,
				reset = true
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 58482468
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 58482468
			},
			fields = {
				entityType = 2
			}
		}
	}
}
