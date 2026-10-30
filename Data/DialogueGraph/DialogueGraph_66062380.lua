-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_66062380.lua

return {
	startNodeId = 2,
	dialogueId = 66062380,
	schema = 1,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 1
			},
			flowIn = {
				End = 0
			}
		},
		{
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
						nodeId = 3,
						portId = "In"
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
						nodeId = 10,
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
						nodeId = 7,
						portId = "In"
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
				In = 0
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
				dialogueIdVInput = 26020206,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 1,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
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
			kind = 25,
			fields = {
				condition = {
					"QUEST_STATE",
					2606003,
					nil,
					">=",
					4
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 0,
						portId = "End"
					}
				},
				True = {
					{
						nodeId = 1,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 39,
			inputs = {
				blendToFovVInput = 35,
				maxLockTimeVInput = 2.5,
				fovBlendTimeVInput = 1,
				fovBlendFuncVInput = "EaseOut",
				shoulderVInput = {
					0.3,
					0,
					0
				}
			},
			valueIn = {
				faceToTargetVInput = {
					nodeId = 21,
					portId = "BoneTransform"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				LockTimeOut = {
					{
						nodeId = 8,
						portId = "In"
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
				In = 0
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
			kind = 47,
			inputs = {
				fovBlendOutFuncVInput = "EaseIn",
				cancelBlendFovVInput = true,
				fovBlendOutTimeVInput = 1.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				targetEulerAngleVInput = {
					0,
					-99.798,
					0
				},
				targetPositionVInput = {
					-1054.39,
					72.42,
					1728.25
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 16,
					portId = "EntityID"
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inTangent = 0,
							outTangent = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							time = 0
						},
						{
							inTangent = 1,
							outTangent = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "ExploreSkill_Smell"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 16,
					portId = "EntityID"
				}
			},
			fields = {
				entityType = 2,
				templateId = 2100530001,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 16,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 20,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			valueIn = {
				entityIdVInput = {
					nodeId = 16,
					portId = "EntityID"
				},
				faceTransVInput = {
					nodeId = 19,
					portId = "BoneTransform"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		[16] = {
			kind = 9,
			inputs = {
				staticIdVInput = 66072179
			},
			fields = {
				entityType = 2
			}
		},
		[19] = {
			kind = 17,
			fields = {
				entityType = 0
			}
		},
		[20] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[21] = {
			kind = 17,
			inputs = {
				staticIdVInput = 66072179
			},
			fields = {
				entityType = 2
			}
		}
	}
}
