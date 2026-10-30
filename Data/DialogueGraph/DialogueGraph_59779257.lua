-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_59779257.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 59779257,
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
				blockEventVInput = true,
				hideTopLogoVInput = true
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
			kind = 2,
			fields = {
				portCount = 2
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
				},
				["1"] = {
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
				dialogueIdVInput = 3801177
			},
			fields = {
				chatType = 10,
				npcId = 400062,
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 42,
			inputs = {
				plotPhoneVInput = true,
				npcIdVInput = 400062
			},
			flowIn = {
				In = true
			}
		}
	}
}
