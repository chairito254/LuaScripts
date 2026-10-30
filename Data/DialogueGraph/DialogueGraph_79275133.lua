-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79275133.lua

return {
	startNodeId = 1,
	dialogueId = 79275133,
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
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				blockCameraZoomVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true
			},
			fields = {
				topLogoComs = {
					chat = true,
					callFriends = true,
					bubble = true,
					alert = true,
					photo = true,
					petFertility = true,
					petExchange = true,
					petChat = true,
					npc = true,
					multiPlayer = true,
					combat = true,
					quest = true,
					teamSpeech = true,
					vlog = true
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
				dialogueIdVInput = 43502017,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementVectorVInput = {
					-0.5,
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
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 79274977,
				dialogueIdVInput = 43502001,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementVectorVInput = {
					-0.5,
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
				dialogsetCameraIdVInput = 79274977,
				dialogueIdVInput = 43502002,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementVectorVInput = {
					0.5,
					0,
					0
				}
			},
			fields = {
				chatType = 3,
				npcId = 0,
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
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 79274977,
				dialogueIdVInput = 43502003,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementVectorVInput = {
					0,
					0.5,
					0
				}
			},
			fields = {
				chatType = 3,
				npcStaticId = 79274972,
				duration = 2
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
				dialogsetCameraIdVInput = 79274977,
				dialogueIdVInput = 43502004,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementVectorVInput = {
					0,
					-0.5,
					0
				}
			},
			fields = {
				chatType = 3,
				npcStaticId = 79274972,
				duration = 2
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
				dialogsetCameraIdVInput = 79274977,
				dialogueIdVInput = 43502005,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementVectorVInput = {
					0,
					0,
					1
				}
			},
			fields = {
				chatType = 3,
				npcStaticId = 79274972,
				duration = 2
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
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 79274977,
				dialogueIdVInput = 43502006,
				dialogsetCameraMovementTypeVInput = 1,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementVectorVInput = {
					0,
					0,
					-1
				}
			},
			fields = {
				chatType = 3,
				npcStaticId = 79274972,
				duration = 2
			},
			flowIn = {
				In = true
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
				dialogsetCameraIdVInput = 79274977,
				dialogueIdVInput = 43502007,
				dialogsetCameraMovementAngleVInput = 45,
				dialogsetCameraMovementTypeVInput = 2,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementVectorVInput = {
					0,
					0,
					-5
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
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogsetCameraIdVInput = 79274977,
				dialogueIdVInput = 43502008,
				dialogsetCameraMovementAngleVInput = -45,
				dialogsetCameraMovementTypeVInput = 2,
				dialogsetCameraMovementTimeVInput = 1.5,
				dialogsetCameraMovementFuncVInput = 3,
				dialogsetCameraMovementVectorVInput = {
					0,
					0,
					-5
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
						nodeId = 13
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
						nodeId = 14
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
