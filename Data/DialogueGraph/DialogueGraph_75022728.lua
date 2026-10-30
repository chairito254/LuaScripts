-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_75022728.lua

return {
	dialogueId = 75022728,
	schema = "v4",
	startNodeId = 2,
	nodes = {
		[0] = {
			kind = 6,
			flowIn = {
				End = true
			}
		},
		{
			kind = 6,
			fields = {
				retFlag = 1
			},
			flowIn = {
				End = true
			}
		},
		{
			kind = 8,
			flowOut = {
				Start = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 18,
			inputs = {
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true,
				blockEventVInput = true,
				startSkipVInput = true,
				showHUDVInput = true
			},
			fields = {
				topLogoComs = {
					teamSpeech = true,
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
					vlog = true
				}
			},
			flowIn = {
				In = true
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 10,
					portId = "EntityID"
				}
			},
			fields = {
				resetOrientation = true,
				enableGroupLookAt = true,
				enableDefaultLookAt = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				dialogueIdVInput = 70007225
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 10,
					portId = "EntityID"
				}
			},
			fields = {
				chatType = 3,
				npcId = 401044,
				duration = 10
			},
			flowIn = {
				In = true
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
			kind = 7,
			fields = {
				dialogueId = 70007226
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70007227
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 10,
					portId = "EntityID"
				}
			},
			fields = {
				chatType = 3,
				portCount = 2,
				npcId = 401044,
				duration = 12
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
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 70007228
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 1,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 70007229
			},
			flowIn = {
				In = true
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
			kind = 9,
			inputs = {
				staticIdVInput = 75010654
			},
			fields = {
				entityType = 2
			}
		}
	}
}
