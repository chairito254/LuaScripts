-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_87749611.lua

return {
	dialogueId = 87749611,
	schema = 1,
	startNodeId = 1,
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
						portId = "In",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 70,
				param = {
					url = "$UI_Img_ItemView_Forest_4.png"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		}
	}
}
