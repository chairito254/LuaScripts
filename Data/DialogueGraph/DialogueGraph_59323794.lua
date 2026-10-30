-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_59323794.lua

return {
	startNodeId = 1,
	dialogueId = 59323794,
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
				blockEventVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true
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
			kind = 42,
			inputs = {
				npcIdVInput = 400079,
				plotPhoneVInput = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				dialogueIdVInput = 3505250
			},
			fields = {
				npcId = 400079,
				duration = 10,
				chatType = 6
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
			kind = 55,
			inputs = {
				plotPhoneVInput = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Start = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		}
	}
}
