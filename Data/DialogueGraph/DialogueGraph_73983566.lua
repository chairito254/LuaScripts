-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_73983566.lua

return {
	startNodeId = 1,
	dialogueId = 73983566,
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
				showHUDVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true
			},
			fields = {
				topLogoComs = {
					alert = true,
					bubble = true,
					petExchange = true,
					petFertility = true,
					photo = true,
					quest = true,
					vlog = true,
					teamSpeech = true,
					multiPlayer = true,
					combat = true,
					chat = true,
					callFriends = true,
					petChat = true,
					npc = true
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
				dialogueIdVInput = 99000125
			},
			fields = {
				duration = 9
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 99000126
			},
			fields = {
				duration = 2
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
