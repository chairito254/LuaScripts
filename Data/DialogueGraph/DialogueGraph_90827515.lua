-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90827515.lua

return {
	startNodeId = 1,
	dialogueId = 90827515,
	schema = "v4",
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
			kind = 11,
			fields = {
				modeInfo = {
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					toplogoComList = {
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
						alert = true,
						actionState = true,
						vlog = true
					}
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
			kind = 5,
			inputs = {
				playableStateVInput = "Story_TakeItem"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 11
				}
			},
			fields = {
				processingTime = 2.967,
				playAniType = 1,
				templateId = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 8
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PLAYER_BODY_TYPE",
					1,
					1,
					">=",
					1
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 90832541,
				durationVInput = 0.1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 90832543,
				durationVInput = 0.1
			},
			flowIn = {
				In = true
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
			kind = 18,
			inputs = {
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				hideAllUIVInput = true,
				clearEventInputVInput = true
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
				virtualEntityTypeVInput = 2,
				slotParamVInput = 401083,
				positionVInput = {
					49.72,
					52.77,
					1026.23
				},
				rotationVInput = {
					271.149,
					135.406,
					45.406
				}
			},
			fields = {
				entityId = -55538417
			}
		},
		{
			kind = 9
		},
		{
			kind = 66
		},
		{
			kind = 20
		}
	}
}
