-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_80290256.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 80290256,
	nodes = {
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
			kind = 20,
			inputs = {
				staticIdVInput = 1,
				durationVInput = 0.25
			},
			flowIn = {
				In = 0
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
			kind = 20,
			inputs = {
				staticIdVInput = 2,
				durationVInput = 0.25
			},
			flowIn = {
				In = 0
			}
		}
	}
}
