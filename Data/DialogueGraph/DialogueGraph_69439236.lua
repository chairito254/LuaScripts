-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_69439236.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 69439236,
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
			kind = 2,
			fields = {
				portCount = 8
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 5
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 20
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 19
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 18
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 21
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 22
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 500005,
				dialogueIdVInput = 3801001
			},
			fields = {
				duration = 12,
				chatType = 3,
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801002
			},
			flowIn = {
				In = true
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
						portId = "In",
						nodeId = 8
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801004
			},
			fields = {
				duration = 4,
				chatType = 3
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
			kind = 7,
			fields = {
				dialogueId = 3801005
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801006
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
						portId = "In",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801007
			},
			fields = {
				duration = 15,
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 12
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
						portId = "In",
						nodeId = 13
					}
				},
				["1"] = {
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
				blendTimeVInput = 2,
				blendFuncVInput = "EaseOut",
				fovVInput = 45,
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
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 69519707
			},
			flowIn = {
				In = true
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
						portId = "In",
						nodeId = 15
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
			kind = 5,
			inputs = {
				playableStateVInput = "Talk",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400253,
				processingTime = 14.167
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801003
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendFuncVInput = "EaseIn",
				fovVInput = 45,
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
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 69519707
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
					portId = "EntityID",
					nodeId = 24
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
				entityId = -4.134956030652362e+18
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				},
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 25
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
					portId = "EntityID",
					nodeId = 20
				},
				lookAtEntityIdVInput = {
					portId = "BoneTransform",
					nodeId = 25
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 24
				}
			},
			fields = {
				playAniType = 1,
				templateId = 5,
				processingTime = 7.117
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 9
		},
		{
			kind = 17,
			valueIn = {
				staticIdVInput = {
					portId = "EntityID",
					nodeId = 24
				}
			}
		}
	}
}
