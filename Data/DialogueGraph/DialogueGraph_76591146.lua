-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_76591146.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 76591146,
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
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				blockCameraZoomVInput = true
			},
			fields = {
				topLogoComs = {
					petChat = true,
					npc = true,
					multiPlayer = true,
					combat = true,
					chat = true,
					callFriends = true,
					bubble = true,
					alert = true,
					vlog = true,
					teamSpeech = true,
					quest = true,
					photo = true,
					petFertility = true,
					petExchange = true
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 4,
				positionVInput = {
					-1618.497,
					74.985,
					952.342
				},
				rotationVInput = {
					0,
					341.995,
					0
				}
			},
			fields = {
				entityId = -1511506366
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 5,
				positionVInput = {
					-1620.79,
					75.029,
					952.24
				}
			},
			fields = {
				entityId = -1661047761
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-1621.284,
					77.469,
					961.661
				},
				rotationVInput = {
					2.478,
					173.324,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 76591149
			},
			flowIn = {
				In = true
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
						nodeId = 7
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Daily_Hello"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 3
				}
			},
			fields = {
				templateId = 4,
				processingTime = 2.5,
				playAniType = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "0",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2
			},
			flowIn = {
				["1"] = true,
				["0"] = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 10
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
		},
		{
			kind = 5,
			inputs = {
				speedVInput = 0.01,
				playableStateVInput = "Friend_Heart_Left"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 4
				}
			},
			fields = {
				templateId = 3,
				processingTime = 0.167,
				playAniType = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 8
					}
				}
			}
		}
	}
}
