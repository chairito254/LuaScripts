-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_81615869.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 81615869,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 0
			},
			flowIn = {
				End = 0
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
			kind = 27,
			fields = {
				uid = 121,
				param = {
					questId = 3708061
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		}
	}
}
