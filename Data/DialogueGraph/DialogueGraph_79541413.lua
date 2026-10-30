-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79541413.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 79541413,
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
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
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
			kind = 22,
			inputs = {
				blendVInput = 0.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 21,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					-498.52,
					58.213,
					776.297
				},
				rotationVInput = {
					8.902,
					69.441,
					0.002
				}
			},
			fields = {
				openDof = true,
				focalDistance = 200,
				fStop = 10.77,
				cameraId = 83819202,
				squeezeFactor = 1,
				sensorWidth = 360
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
					201.378,
					0
				},
				targetPositionVInput = {
					-497.741,
					56.806,
					777.94
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 27,
					portId = "EntityID"
				}
			},
			fields = {
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400204,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-497.306,
					56.848,
					776.997
				},
				rotationVInput = {
					0,
					210,
					0
				}
			},
			fields = {
				entityId = -551894471
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 80375396,
				playableStateVInput = "Fragrance"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 8,
					portId = "EntityID"
				}
			},
			fields = {
				entityType = 2,
				templateId = 400204,
				processingTime = 9.333,
				playAniType = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 8,
					portId = "EntityID"
				}
			},
			fields = {
				resetOrientation = true,
				reactPreset = 3,
				cameraPreset = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FOut = {
					{
						nodeId = 11,
						portId = "In"
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
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201189
			},
			fields = {
				npcStaticId = 79673718,
				npcId = 401059,
				duration = 2,
				chatType = 3,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 13,
						portId = "In"
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
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201190
			},
			fields = {
				npcStaticId = 79673718,
				npcId = 401059,
				duration = 10,
				chatType = 7,
				skipTime = 10
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					-498.323,
					58.861,
					778
				},
				rotationVInput = {
					0.824,
					207.982,
					0.002
				}
			},
			fields = {
				openDof = true,
				focalDistance = 200,
				fStop = 7.18,
				cameraId = 83819204,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201194
			},
			fields = {
				npcStaticId = 79673718,
				npcId = 401059,
				duration = 2,
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201195
			},
			fields = {
				npcStaticId = 79673718,
				npcId = 401059,
				duration = 2,
				chatType = 3
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
			kind = 16,
			inputs = {
				slotParamVInput = 401059,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-499.12,
					56.884,
					776.37
				},
				rotationVInput = {
					0,
					24.431,
					0
				}
			},
			fields = {
				entityId = -1961255180
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 15,
				staticIdVInput = 80375309,
				playableStateVInput = "Behav_DoubtLoop"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 19,
					portId = "EntityID"
				}
			},
			fields = {
				entityType = 2,
				templateId = 401059,
				processingTime = 2,
				playAniType = 1,
				aniStateList = {
					"Behav_DoubtLoop",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 23,
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
				["0"] = {
					{
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 25,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 20,
						portId = "In"
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
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400066,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-637.213,
					48.048,
					851.638
				},
				rotationVInput = {
					0,
					272.046,
					0
				}
			},
			fields = {
				entityId = -243236035
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2
			},
			fields = {
				entityId = -1061094806
			}
		},
		{
			kind = 17
		}
	}
}
