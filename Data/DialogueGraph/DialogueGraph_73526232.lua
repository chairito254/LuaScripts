-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_73526232.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 73526232,
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
				enhanceAmbientIntensityVInput = true,
				showHUDVInput = true,
				hideTopLogoVInput = true
			},
			fields = {
				topLogoComs = {
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
					quest = true,
					photo = true,
					petFertility = true,
					petExchange = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 99000034
			},
			fields = {
				duration = 7,
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 4
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
