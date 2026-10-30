-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_53812182.lua

return {
	startNodeId = 1,
	dialogueId = 53812182,
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
						nodeId = 2,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				modeInfo = {
					resetAllActions = false,
					blockEvent = false,
					modeType = 1,
					blockCameraZoom = false,
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					hideUIWhiteList = {
						[5] = true
					},
					toplogoComList = {
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
						actionState = true,
						vlog = true,
						teamSpeech = true,
						quest = false,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true
					}
				}
			},
			flowIn = {
				In = 0
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
				portCount = 6
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
				},
				["2"] = {
					{
						nodeId = 4,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 20,
				autoPathfindingVInput = true,
				speedVInput = 1.25,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					163.4,
					0
				},
				targetPositionVInput = {
					-1720.052,
					90.748,
					582.67
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 79,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							value = 0,
							inTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							value = 1,
							inTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 39,
			inputs = {
				pitchSpeedRatioVInput = 0.25,
				fovBlendTimeVInput = 1.5,
				fovBlendFuncVInput = "Linear",
				blendToFovVInput = 30,
				transitionSpeedVInput = 0,
				targetZoomVInput = 0.5,
				shoulderVInput = {
					0,
					0,
					2
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 20,
				autoPathfindingVInput = true,
				speedVInput = 1.25,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					163.4,
					0
				},
				targetPositionVInput = {
					-1719.206,
					90.778,
					583.193
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 85,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 1,
							value = 0,
							inTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							value = 1,
							inTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26023057,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 7
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3
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
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 10,
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
				["1"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26023056,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 6
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3
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
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 16,
						portId = "Play"
					}
				},
				["3"] = {
					{
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 56,
			fields = {
				shakeType = 0,
				cameraShakeItem = {
					shakeRadius = -1,
					decayTime = 4,
					sustainTime = 3,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 0,
					random = false,
					flags = 0,
					initPhase = 0,
					shakeBias = 0,
					shakeAmplitude = 0.3,
					shakeFrequency = 6,
					shakeDissipation = 28,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								inWeight = 0,
								outTangent = 0,
								value = 1,
								inTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								time = 0
							},
							{
								inWeight = 0,
								outTangent = 0,
								value = 1,
								inTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								time = 1
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
								inWeight = 0,
								outTangent = 0,
								value = 1,
								inTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								time = 0
							},
							{
								inWeight = 0,
								outTangent = 0,
								value = 1,
								inTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								time = 1
							}
						}
					},
					shakeDir = {
						0.2,
						0.2,
						-0.2
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "SFX_Novice_Earthquake"
			},
			fields = {
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0,
				enableFadeOut = false
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26023058,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400109,
				matchAudioDuration = true,
				duration = 8
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26023059,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400061,
				matchAudioDuration = true,
				duration = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 47,
			inputs = {
				cancelBlendFovVInput = true,
				fovBlendOutFuncVInput = "Linear",
				cancelModifyYawSpeedRatioVInput = true,
				cancelModifyPitchSpeedRatioVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 23,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 10,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		[79] = {
			kind = 9,
			inputs = {
				staticIdVInput = 79379146
			},
			fields = {
				entityType = 2
			}
		},
		[85] = {
			kind = 9,
			inputs = {
				staticIdVInput = 79379149
			},
			fields = {
				entityType = 2
			}
		}
	}
}
