-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_75195997.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 75195997,
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
				blockEventVInput = true,
				showHUDVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true
			},
			fields = {
				topLogoComs = {
					vlog = true,
					teamSpeech = true,
					quest = true,
					photo = true,
					petFertility = true,
					petExchange = true,
					petChat = true,
					npc = true,
					multiPlayer = true,
					combat = true,
					chat = true,
					callFriends = true,
					bubble = true,
					alert = true
				}
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
			kind = 56,
			fields = {
				cameraShakeItem = {
					flags = 0,
					random = false,
					initPhase = 0,
					shakeBias = 0,
					shakeAmplitude = 1,
					shakeFrequency = 6,
					shakeDissipation = 28,
					shakeRadius = -1,
					decayTime = 2,
					sustainTime = 0.1,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 0,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								weightedMode = 0,
								time = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								outWeight = 0,
								inWeight = 0
							},
							{
								weightedMode = 0,
								time = 1,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								outWeight = 0,
								inWeight = 0
							}
						}
					},
					shakePos = {
						0,
						0,
						0
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								weightedMode = 0,
								time = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								outWeight = 0,
								inWeight = 0
							},
							{
								weightedMode = 0,
								time = 1,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								outWeight = 0,
								inWeight = 0
							}
						}
					},
					shakeDir = {
						0.42,
						1,
						0
					}
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 10
			},
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
