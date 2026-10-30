-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90875085.lua

return {
	dialogueId = 90875085,
	schema = 1,
	startNodeId = 1,
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
						portId = "In",
						nodeId = 2
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
						portId = "In",
						nodeId = 3
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
			kind = 38,
			inputs = {
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					251.209,
					0
				},
				targetPositionVInput = {
					-1236.331,
					69.512,
					1677.499
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				finishToSteer = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						portId = "0",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 2
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
			kind = 51,
			inputs = {
				triggerIdVInput = 690
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 51,
			inputs = {
				triggerIdVInput = 691
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 51,
			inputs = {
				triggerIdVInput = 692
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 14
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005079,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 19
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 11020101,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial",
				portCount = 1,
				animCfg = {
					[1] = "IdleSpecial",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005080,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 19
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 11020101,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial02",
				portCount = 1,
				animCfg = {
					[1] = "IdleSpecial02",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 70005081,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 11020101,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial",
				portCount = 1,
				animCfg = {
					[1] = "IdleSpecial",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
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
				dialogueIdVInput = 70005082,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 11020101,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial02",
				portCount = 1,
				animCfg = {
					[1] = "IdleSpecial02",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005083,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 11020101,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Attack04",
				portCount = 1,
				animCfg = {
					[1] = "Attack04",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
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
			kind = 10,
			inputs = {
				endSkipVInput = true
			},
			flowIn = {
				In = 0
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005907,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 19
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 11020101,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial",
				portCount = 1,
				animCfg = {
					[1] = "IdleSpecial",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005908,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 11020101,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial",
				portCount = 1,
				animCfg = {
					[1] = "IdleSpecial",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 70005908,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 11020101,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial",
				portCount = 1,
				animCfg = {
					[1] = "IdleSpecial",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
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
			kind = 38,
			inputs = {
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					89.793,
					0
				},
				targetPositionVInput = {
					-1238.044,
					69.096,
					1676.503
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 21
				}
			},
			fields = {
				finishToSteer = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						portId = "1",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 90639214
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 90639216
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 90639214
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 90639216
			},
			fields = {
				entityType = 2
			}
		}
	}
}
