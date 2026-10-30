-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79279880.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 79279880,
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
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				blockCameraZoomVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true
			},
			fields = {
				topLogoComs = {
					quest = true,
					photo = true,
					petFertility = true,
					petExchange = true,
					petChat = true,
					npc = true,
					multiPlayer = true,
					combat = true,
					chat = true,
					callFriends = true,
					bubble = true,
					alert = true,
					vlog = true,
					teamSpeech = true
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
				blendFuctionVInput = 3,
				cameraMovementTimeVInput = 5
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
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementExpVInput = 3,
				dialogueIdVInput = 43502018,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementVectorVInput = {
					-1,
					0,
					0
				}
			},
			fields = {
				chatType = 3,
				npcStaticId = 79274972,
				duration = 4
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
				dialogsetCameraMovementTimeVInput = 2,
				dialogsetCameraMovementFuncVInput = 0,
				dialogsetCameraMovementExpVInput = 3,
				dialogsetCameraIdVInput = 79354831,
				dialogueIdVInput = 43502009,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementVectorVInput = {
					-2,
					0,
					0
				}
			},
			fields = {
				chatType = 3,
				npcStaticId = 79274972,
				duration = 3
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
				dialogsetCameraMovementTimeVInput = 2,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementExpVInput = 3,
				dialogsetCameraIdVInput = 79354831,
				dialogueIdVInput = 43502010,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementVectorVInput = {
					-2,
					0,
					0
				}
			},
			fields = {
				chatType = 3,
				npcId = 0,
				npcStaticId = 79274972,
				duration = 4
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
				dialogsetCameraMovementTimeVInput = 2,
				dialogsetCameraMovementFuncVInput = 1,
				dialogsetCameraMovementExpVInput = 3,
				dialogsetCameraIdVInput = 79354831,
				dialogueIdVInput = 43502011,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementVectorVInput = {
					-2,
					0,
					0
				}
			},
			fields = {
				chatType = 3,
				npcStaticId = 79274972,
				duration = 3
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
			kind = 1,
			inputs = {
				dialogsetCameraMovementTimeVInput = 2,
				dialogsetCameraIdVInput = 79354831,
				dialogsetCameraMovementExpVInput = 3,
				dialogueIdVInput = 43502012,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementVectorVInput = {
					-2,
					0,
					0
				}
			},
			fields = {
				chatType = 3,
				npcStaticId = 79274972,
				duration = 3
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
			kind = 1,
			inputs = {
				dialogsetCameraMovementTimeVInput = 2,
				dialogsetCameraMovementFuncVInput = 4,
				dialogsetCameraIdVInput = 79354831,
				dialogueIdVInput = 43502013,
				dialogsetCameraBlendFuctionVInput = 0,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementVectorVInput = {
					-2,
					0,
					0
				}
			},
			fields = {
				chatType = 3,
				npcStaticId = 79274972,
				duration = 3
			},
			flowIn = {
				In = true
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
			kind = 12,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 11
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
