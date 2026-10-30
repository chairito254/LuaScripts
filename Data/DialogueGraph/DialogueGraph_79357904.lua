-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79357904.lua

return {
	startNodeId = 1,
	dialogueId = 79357904,
	schema = "v4",
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
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				hideTopLogoVInput = true,
				blockCameraZoomVInput = true
			},
			fields = {
				topLogoComs = {
					combat = true,
					chat = true,
					callFriends = true,
					bubble = true,
					alert = true,
					vlog = true,
					teamSpeech = true,
					quest = true,
					photo = true,
					petFertility = true,
					petExchange = true,
					petChat = true,
					npc = true,
					multiPlayer = true
				}
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
			kind = 60,
			inputs = {
				cameraMovementTimeVInput = 5,
				blendFuctionVInput = 3
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
			kind = 1,
			inputs = {
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogueIdVInput = 43502019,
				dialogsetCameraMovementVectorVInput = {
					-1,
					0,
					0
				}
			},
			fields = {
				npcStaticId = 79274972,
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
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraIdVInput = 79358706,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementTimeVInput = 3,
				dialogueIdVInput = 43502014,
				dialogsetCameraMovementVectorVInput = {
					-2,
					0,
					0
				}
			},
			fields = {
				npcStaticId = 79274972,
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
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraMovementModeVInput = 1,
				dialogsetCameraIdVInput = 79358706,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 3,
				dialogueIdVInput = 43502015,
				dialogsetCameraMovementVectorVInput = {
					-2,
					0,
					0
				}
			},
			fields = {
				npcId = 0,
				duration = 2,
				chatType = 3,
				npcStaticId = 79274972
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraMovementModeVInput = 2,
				dialogsetCameraIdVInput = 79358706,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 2,
				dialogueIdVInput = 43502016,
				dialogsetCameraMovementVectorVInput = {
					-2,
					0,
					0
				}
			},
			fields = {
				npcStaticId = 79274972,
				duration = 3,
				chatType = 3
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
						nodeId = 9
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
		}
	}
}
