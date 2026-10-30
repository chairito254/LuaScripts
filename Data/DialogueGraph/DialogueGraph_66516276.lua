-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_66516276.lua

return {
	dialogueId = 66516276,
	schema = "v4",
	startNodeId = 1,
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
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				applyStateConflictVInput = true,
				startSkipVInput = true,
				showHUDVInput = true,
				pauseNearbyMonsterAIVInput = true
			},
			fields = {
				topLogoComs = {
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
					teamSpeech = true,
					quest = true
				}
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
					nodeId = 7,
					portId = "EntityID"
				}
			},
			fields = {
				enableGroupLookAt = true,
				resetOrientation = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				dialogueIdVInput = 3705180
			},
			fields = {
				anim = "Behav_Cry",
				duration = 6,
				chatType = 3
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
						nodeId = 6,
						portId = "In"
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
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 69700171
			},
			fields = {
				entityType = 2
			}
		}
	}
}
