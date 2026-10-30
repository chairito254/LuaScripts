-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_69634143.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 69634143,
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
			kind = 2,
			fields = {
				portCount = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["6"] = {
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
				blendTimeVInput = 2,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-1202.282,
					76.099,
					815.369
				},
				rotationVInput = {
					0,
					234.564,
					0
				}
			},
			fields = {
				cameraId = 69519707,
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4
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
					252,
					0
				},
				targetPositionVInput = {
					-1202.944,
					74.862,
					814.613
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 14,
					portId = "EntityID"
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400253,
				positionVInput = {
					-1204.23,
					74.969,
					814.639
				},
				rotationVInput = {
					0,
					108.791,
					0
				}
			},
			fields = {
				entityId = -3.5175553580580956e+18
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			valueIn = {
				entityIdVInput = {
					nodeId = 7,
					portId = "EntityID"
				},
				faceTransVInput = {
					nodeId = 15,
					portId = "BoneTransform"
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
					nodeId = 7,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 15,
					portId = "BoneTransform"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 7,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 1.967,
				playAniType = 1,
				entityType = 2,
				templateId = -2147483648
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801051
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
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 12,
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
			kind = 9
		},
		{
			kind = 17,
			valueIn = {
				staticIdVInput = {
					nodeId = 14,
					portId = "EntityID"
				}
			}
		}
	}
}
