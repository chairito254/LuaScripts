-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_47768894.lua

return {
	startNodeId = 1,
	dialogueId = 47768894,
	schema = 1,
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 14,
					portId = "EntityIDs"
				}
			},
			fields = {
				reactPreset = 0,
				nodeMode = 1,
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				cameraPreset = 0,
				resetOrientation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400228,
				dialogueIdVInput = 20000220,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Attack01",
				skipTime = 0,
				animCfg = {
					[1] = "Attack01",
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
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400226,
				dialogueIdVInput = 20000221,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Attack01",
				skipTime = 0,
				animCfg = {
					[1] = "Attack01",
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
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400227,
				dialogueIdVInput = 20000222,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Attack01",
				skipTime = 0,
				animCfg = {
					[1] = "Attack01",
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
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 400228,
				dialogueIdVInput = 20000223,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Attack04",
				skipTime = 0,
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
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		[13] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72240089
			},
			fields = {
				entityType = 2
			}
		},
		[14] = {
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					nodeId = 13,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 15,
					portId = "EntityID"
				},
				["3EntityIDVInput"] = {
					nodeId = 16,
					portId = "EntityID"
				},
				["4EntityIDVInput"] = {
					nodeId = 17,
					portId = "EntityID"
				}
			},
			fields = {
				portCount = 4
			}
		},
		[15] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72241103
			},
			fields = {
				entityType = 2
			}
		},
		[16] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72241105
			},
			fields = {
				entityType = 2
			}
		},
		[17] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72241105
			},
			fields = {
				entityType = 0
			}
		}
	}
}
