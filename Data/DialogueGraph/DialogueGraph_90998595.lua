-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90998595.lua

return {
	dialogueId = 90998595,
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
			kind = 11,
			fields = {
				modeInfo = {
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					toplogoComList = {
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
				}
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
			kind = 22,
			inputs = {
				blendVInput = 0.8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 4
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
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 46,
			fields = {
				volumeComponentCount = 1,
				volumeComponents = {
					{
						active = true,
						typeName = "VignetteComponent",
						parameters = {
							m_VignetteColor = {
								overrideState = true,
								valueType = "color",
								value = {
									a = 1,
									g = 0,
									b = 0,
									r = 0
								}
							},
							m_EdgeWidth = {
								overrideState = true,
								value = 2,
								valueType = "float"
							},
							m_EdgeSoftness = {
								overrideState = true,
								value = 0,
								valueType = "float"
							},
							m_VignetteAlpha = {
								overrideState = true,
								value = 1,
								valueType = "float"
							},
							m_FisheyeFovDeg = {
								overrideState = true,
								value = 0,
								valueType = "float"
							},
							m_FollowAspect = {
								overrideState = true,
								value = true,
								valueType = "bool"
							}
						}
					}
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 32,
			fields = {
				eventName = "blackScreen",
				eventParam = {
					[1] = 121
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 70008000,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				portCount = 1,
				chatType = 5,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"GOTO_POSITION",
					90998627,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				True = {
					{
						portId = "In",
						nodeId = 9
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
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "End",
						nodeId = 0
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 5
					}
				}
			}
		}
	}
}
