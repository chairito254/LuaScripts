-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72038371.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 72038371,
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
				exitCatchModeVInput = false,
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
				portCount = 3
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706094
			},
			fields = {
				duration = 2,
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
			kind = 47,
			inputs = {
				fovBlendOutTimeVInput = 1.5,
				fovBlendOutFuncVInput = "EaseOut"
			},
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
		},
		{
			kind = 39,
			inputs = {
				maxLockTimeVInput = 3,
				fovBlendTimeVInput = 1.5,
				fovBlendFuncVInput = "EaseIn",
				blendToFovVInput = 45,
				shoulderVInput = {
					0.6,
					0.3,
					0.3
				}
			},
			valueIn = {
				faceToTargetVInput = {
					portId = "BoneTransform",
					nodeId = 8
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 9
				}
			},
			fields = {
				resetOrientation = true,
				enableGroupLookAt = true,
				enableDefaultLookAt = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 72037844
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 72037844
			},
			fields = {
				entityType = 2
			}
		}
	}
}
