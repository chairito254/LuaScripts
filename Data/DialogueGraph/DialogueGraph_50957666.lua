-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_50957666.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 50957666,
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
			kind = 34,
			valueIn = {
				staticIdVInput = {
					nodeId = 11,
					portId = "Value"
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
					nodeId = 12,
					portId = "EntityID"
				}
			},
			fields = {
				enableDefaultLookAt = true,
				resetOrientation = true,
				enableGroupLookAt = true
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
			kind = 29,
			valueIn = {
				staticIdVInput = {
					nodeId = 11,
					portId = "Value"
				}
			},
			fields = {
				emojiName = "Cry",
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 270108
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 12,
					portId = "EntityID"
				}
			},
			fields = {
				chatType = 3,
				duration = 5,
				anim = "Behav_Cry",
				npcId = 401002
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 270109
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 12,
					portId = "EntityID"
				}
			},
			fields = {
				chatType = 3,
				duration = 3,
				npcId = 401002
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 68
		},
		{
			kind = 17
		},
		{
			kind = 26,
			valueIn = {
				entityIdVInput = {
					nodeId = 12,
					portId = "EntityID"
				},
				faceTransVInput = {
					nodeId = 8,
					portId = "BoneTransform"
				}
			},
			flowOut = {
				FinishOut = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 73,
			inputs = {
				presetNameVInput = "FocusToTarget"
			},
			valueIn = {
				targetEntityVInput = {
					nodeId = 12,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			}
		},
		[12] = {
			kind = 9,
			valueIn = {
				staticIdVInput = {
					nodeId = 11,
					portId = "Value"
				}
			},
			fields = {
				entityType = 2
			}
		}
	},
	blackboard = {}
}
