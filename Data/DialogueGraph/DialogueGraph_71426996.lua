-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_71426996.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 71426996,
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
						nodeId = 4,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3705350
			},
			fields = {
				duration = 7,
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 3705351
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
				dialogueIdVInput = 3705350
			},
			fields = {
				duration = 7,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3705351
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
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 1.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 9,
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
				blendFuncVInput = "Cubic",
				positionVInput = {
					5.693,
					1.114,
					52.064
				},
				rotationVInput = {
					8.286,
					272.613,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 71429313,
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 17,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 16,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 16,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 17,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				labelVInput = 4,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500035,
				positionVInput = {
					20.287,
					0,
					49.671
				},
				rotationVInput = {
					0,
					33.617,
					0
				}
			},
			fields = {
				entityId = -3.5168317125957345e+18
			}
		},
		{
			kind = 16,
			inputs = {
				labelVInput = 2,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500035,
				positionVInput = {
					22.615,
					0,
					47.365
				},
				rotationVInput = {
					0,
					33.617,
					0
				}
			},
			fields = {
				entityId = -4.1288660166041236e+18
			}
		},
		{
			kind = 16,
			inputs = {
				labelVInput = 1,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500035,
				positionVInput = {
					23.96,
					0,
					45.52
				},
				rotationVInput = {
					0,
					33.617,
					0
				}
			},
			fields = {
				entityId = -3.616858489933571e+18
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 71171605
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 71171601
			},
			fields = {
				entityType = 2
			}
		}
	}
}
