-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79048574.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 79048574,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005221,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 8,
					portId = "EntityID"
				}
			},
			fields = {
				npcId = 401050,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowStart",
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				animCfg = {
					[1] = "EnvBehav_ScreenShowStart",
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
				ShowFinOut = {
					{
						nodeId = 3,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70005222,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 8,
					portId = "EntityID"
				}
			},
			fields = {
				npcId = 401050,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "EnvBehav_ScreenShowLoop",
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
				animCfg = {
					[1] = "EnvBehav_ScreenShowLoop",
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
				ShowFinOut = {
					{
						nodeId = 5,
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
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 70005223,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 8,
					portId = "EntityID"
				}
			},
			fields = {
				npcId = 401050,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "IdleSpecial",
				skipTime = 0.5,
				portCount = 1,
				npcStaticId = -1,
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
				ShowFinOut = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "StaticID"
			}
		},
		{
			kind = 17,
			inputs = {
				boneNameVInput = "Bip001 Head"
			},
			valueIn = {
				staticIdVInput = {
					nodeId = 7,
					portId = "Value"
				}
			},
			fields = {
				entityType = 2
			}
		}
	},
	blackboard = {
		StaticID = 78990225
	}
}
