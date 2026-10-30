-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91119177.lua

return {
	dialogueId = 91119177,
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
				portCount = 4
			},
			flowIn = {
				In = 0
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
						nodeId = 10
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 5
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3.5
			},
			flowIn = {
				In = 0
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
			kind = 29,
			inputs = {
				staticIdVInput = 91349140
			},
			fields = {
				emojiName = "Think2",
				duration = 3
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 91349140,
				defaultTransStateVInput = "Sit_Idle",
				playableStateVInput = "Home_SitRelax01_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 17.133,
				aniStateList = {
					"Home_SitRelax01_Start",
					"Home_SitRelax01_Loop",
					"Home_SitRelax01_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 7
			},
			flowIn = {
				In = 0
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
				portCount = 4
			},
			flowIn = {
				In = 0
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
						nodeId = 9
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6513014,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 990010,
				skipTime = 0,
				npcStaticId = 91349140,
				duration = 6.5,
				matchAudioDuration = true,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6513013,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 990010,
				skipTime = 0,
				npcStaticId = 91349140,
				duration = 4.5,
				matchAudioDuration = true,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			}
		}
	}
}
