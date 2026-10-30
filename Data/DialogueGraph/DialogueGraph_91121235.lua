-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91121235.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91121235,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 0
			},
			flowIn = {
				End = 0
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
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 18,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 3,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					2.48,
					0.003,
					-45.99
				},
				rotationVInput = {
					0,
					355.739,
					0
				}
			},
			fields = {
				entityId = -1609731214,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 90820276,
				durationVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 3,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					193.646,
					0
				},
				targetPositionVInput = {
					1.954,
					0.003,
					-56.224
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 3,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 3,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90820276,
				playableStateVInput = "TalkUpper_Like"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 3,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 3.333,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			valueIn = {
				entityIdVInput = {
					nodeId = 3,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
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
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.5
			},
			flowIn = {
				In = 0
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					1.65,
					0.003,
					-46.86
				},
				rotationVInput = {
					0,
					19.83,
					0
				}
			},
			fields = {
				entityId = -286687840,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 90820276,
				durationVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 11,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				speedVInput = 0.8,
				targetEulerAngleVInput = {
					0,
					171.281,
					0
				},
				targetPositionVInput = {
					1.425,
					0.003,
					-51.249
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 11,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					nodeId = 11,
					portId = "EntityID"
				}
			},
			fields = {
				emojiName = "Cheer",
				duration = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 16,
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
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		}
	}
}
