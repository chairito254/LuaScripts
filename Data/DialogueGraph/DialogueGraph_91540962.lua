-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91540962.lua

return {
	startNodeId = 1,
	dialogueId = 91540962,
	schema = 1,
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
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 3
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"QUEST_STATE",
					8702078,
					nil,
					"=",
					4
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				True = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 190,
				param = {
					[1] = 433
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "1",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 3,
				executeOnce = false
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
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
			kind = 27,
			fields = {
				uid = 121,
				param = {
					8702001,
					0,
					{
						0,
						0,
						0
					},
					{
						0,
						0,
						0
					},
					{
						0,
						0,
						0
					},
					true,
					true,
					0
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
		},
		{
			kind = 25,
			fields = {
				condition = {
					"QUEST_STATE",
					8702067,
					nil,
					"=",
					4
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				True = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 190,
				param = {
					[1] = 432
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "0",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"QUEST_STATE",
					8702068,
					nil,
					"=",
					4
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				True = {
					{
						portId = "In",
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 190,
				param = {
					[1] = 434
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "2",
						nodeId = 5
					}
				}
			}
		}
	}
}
