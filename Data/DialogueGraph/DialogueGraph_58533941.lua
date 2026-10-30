-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_58533941.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 58533941,
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
				blockEventVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 17,
					portId = "EntityID"
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
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801172
			},
			fields = {
				duration = 2,
				npcId = 400151
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
				dialogueIdVInput = 3801173
			},
			fields = {
				duration = 2,
				npcId = 400151
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
			kind = 2,
			fields = {
				portCount = 5
			},
			flowOut = {
				["4"] = {
					{
						nodeId = 8,
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
					nodeId = 16,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400151,
				playAniType = 1,
				entityType = 2
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
					-1198.774,
					79.047,
					789.896
				},
				rotationVInput = {
					0,
					145.238,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				squeezeFactor = 1
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
						nodeId = 11,
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
					-1198.315,
					79.243,
					789.58
				},
				rotationVInput = {
					359.717,
					172.035,
					359.281
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
					335.594,
					0
				},
				targetPositionVInput = {
					-1198.06,
					77.656,
					789.664
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 12,
					portId = "EntityID"
				}
			},
			fields = {
				setPosition = true
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 58482782
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 14,
			inputs = {
				targetPositionVInput = {
					-1198.17,
					77.7,
					788.46
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 14,
					portId = "EntityID"
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
				staticIdVInput = 58482782
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 58482782
			},
			fields = {
				entityType = 2
			}
		}
	}
}
