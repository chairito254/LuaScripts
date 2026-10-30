-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_76761935.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 76761935,
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
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				blockCameraZoomVInput = true
			},
			fields = {
				topLogoComs = {
					quest = true,
					photo = true,
					petFertility = true,
					callFriends = true,
					bubble = true,
					alert = true,
					multiPlayer = true,
					combat = true,
					chat = true,
					petExchange = true,
					npc = true,
					petChat = true,
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			fields = {
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				resetOrientation = true,
				reactPreset = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FOut = {
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
				dialogueIdVInput = 3706330
			},
			fields = {
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
			kind = 12,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 6
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
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 76761941
			},
			fields = {
				entityType = 2
			}
		}
	}
}
