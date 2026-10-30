-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_69441796.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 69441796,
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
				portCount = 7
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 10
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 5
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					294.316,
					0
				},
				targetPositionVInput = {
					-1205.87,
					74.98,
					814.2
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400252,
				positionVInput = {
					-1201.158,
					74.924,
					813.159
				},
				rotationVInput = {
					0,
					287.98,
					0
				}
			},
			fields = {
				entityId = -4.116448272555477e+18
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.9,
				targetEulerAngleVInput = {
					0,
					258.501,
					0
				},
				targetPositionVInput = {
					-1204.15,
					74.98,
					814.701
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 6
				}
			},
			fields = {
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FinishOut = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Daily_Watch_1_Loop"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 6
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400252,
				processingTime = 9.7
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Daily_Overlook_Loop",
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
				templateId = 4,
				processingTime = 9.617
			},
			flowIn = {
				Stop = true,
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendFuncVInput = "Cubic",
				positionVInput = {
					-1199.455,
					76.416,
					811.816
				},
				rotationVInput = {
					0,
					297.132,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 69520149
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				fovVInput = 45,
				blendTimeVInput = 3,
				blendFuncVInput = "Cubic",
				positionVInput = {
					-1200.785,
					76.549,
					812.498
				},
				rotationVInput = {
					0,
					297.132,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 69520149
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801081
			},
			fields = {
				duration = 13,
				chatType = 3
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
						portId = "In",
						nodeId = 14
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 17
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 9
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801189
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
						portId = "In",
						nodeId = 15
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
						portId = "In",
						nodeId = 16
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
						portId = "End",
						nodeId = 0
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
					-1203.504,
					76.127,
					813.79
				},
				rotationVInput = {
					0,
					292.844,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 69520149
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendTimeVInput = 2,
				positionVInput = {
					-1205.7,
					75.927,
					814.354
				},
				rotationVInput = {
					16.439,
					298,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 69520149
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Squat_Start",
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
				templateId = 4,
				processingTime = 2.233
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 17
		}
	}
}
