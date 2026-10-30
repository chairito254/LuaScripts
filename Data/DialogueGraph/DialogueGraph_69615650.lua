-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_69615650.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 69615650,
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 29,
					portId = "EntityID"
				}
			},
			fields = {
				enableGroupLookAt = true,
				resetOrientation = true,
				reactPreset = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FOut = {
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
				portCount = 3
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
				},
				["1"] = {
					{
						nodeId = 26,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3705176
			},
			fields = {
				duration = 3,
				chatType = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 6,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 2,
				maxAwaitTime = -1
			},
			flowIn = {
				["1"] = true,
				["0"] = true
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
						nodeId = 8,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				},
				["3"] = {
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
				delayTime = 0.5
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
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					58.823,
					0
				},
				targetPositionVInput = {
					-1413.1,
					24.858,
					1682.13
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 31,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1
						}
					}
				}
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
			kind = 4,
			fields = {
				delayTime = 1.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			valueIn = {
				entityIdVInput = {
					nodeId = 31,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 12,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 4,
				maxAwaitTime = -1
			},
			flowIn = {
				["3"] = true,
				["2"] = true,
				["1"] = true,
				["0"] = true
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
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					58.823,
					0
				},
				targetPositionVInput = {
					-1413.1,
					24.858,
					1682.13
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 30,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1
						}
					}
				}
			},
			flowIn = {
				In = true
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
				delayTime = 1.5
			},
			flowIn = {
				In = true
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
			kind = 20,
			valueIn = {
				entityIdVInput = {
					nodeId = 30,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 12,
						portId = "1"
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
						nodeId = 18,
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
						nodeId = 20,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			valueIn = {
				entityIdVInput = {
					nodeId = 33,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 10,
			inputs = {
				showAllUIVInput = false
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3705177
			},
			fields = {
				duration = 3,
				chatType = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 22,
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
						nodeId = 12,
						portId = "3"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					202.34,
					0
				},
				targetPositionVInput = {
					-1441.35,
					24.83,
					1660.18
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 32,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1
						}
					}
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 24,
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
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			valueIn = {
				entityIdVInput = {
					nodeId = 32,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 12,
						portId = "2"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_SleepEnd"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 29,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 500049,
				processingTime = 4.083
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 6,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 28,
			valueIn = {
				entityIdVInput = {
					nodeId = 29,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 4.5
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 69615756
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 68989624
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 67107969
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 69615756
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9
		}
	}
}
