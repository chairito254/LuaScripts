-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_66515552.lua

return {
	dialogueId = 66515552,
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
				blockEventVInput = true
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
			kind = 2,
			fields = {
				portCount = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 4,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				labelVInput = 2,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500035,
				positionVInput = {
					22.615,
					0,
					47.365
				},
				rotationVInput = {
					0,
					33.617,
					0
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				labelVInput = 4,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500035,
				positionVInput = {
					20.287,
					0,
					49.671
				},
				rotationVInput = {
					0,
					33.617,
					0
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				labelVInput = 1,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500035,
				positionVInput = {
					23.96,
					0,
					45.52
				},
				rotationVInput = {
					0,
					33.617,
					0
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3705080
			},
			fields = {
				chatType = 3,
				duration = 4
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
						nodeId = 9,
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
		}
	}
}
