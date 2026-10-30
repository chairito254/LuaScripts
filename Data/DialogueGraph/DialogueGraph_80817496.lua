-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_80817496.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 80817496,
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
					exitCatchMode = true,
					blockEvent = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					modeType = 2,
					resetAllActions = true,
					blockCameraZoom = true,
					toplogoComList = {
						bubble = true,
						alert = true,
						actionState = true,
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
						callFriends = true
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
			kind = 3,
			inputs = {
				blendTimeVInput = 1.2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					235.901,
					50.77,
					1745.461
				},
				rotationVInput = {
					23.3,
					350.022,
					359.99
				}
			},
			fields = {
				fStop = 4,
				squeezeFactor = 1,
				visualizeDOF = false,
				cameraId = 81016475,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 4,
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
						nodeId = 5,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 6,
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
			kind = 26,
			inputs = {
				staticIdVInput = 86085877,
				targetEulerAngleVInput = {
					0,
					180.596,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 86085878,
				targetEulerAngleVInput = {
					0,
					180.596,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 86085879,
				targetEulerAngleVInput = {
					0,
					180.596,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
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
						nodeId = 9,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 33,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70007291,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_AngryStart",
				skipTime = 1,
				npcStaticId = 86085877,
				npcId = 710007,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				animCfg = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd",
					{
						[1] = true,
						[2] = 0
					}
				}
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
						nodeId = 11,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70007292,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "Behav_AngryStart",
				skipTime = 1,
				npcStaticId = 86085877,
				npcId = 710007,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				animCfg = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd",
					{
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 12,
						portId = "In"
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
						nodeId = 13,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70007293,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = 86085877,
				npcId = 710007,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 14,
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
						nodeId = 15,
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
						nodeId = 16,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 20,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 21,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 22,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Avatar_Female_Skill_Mushroom_Disappear.prefab",
				postionVInput = {
					236.058,
					49.148,
					1748.427
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
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
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 0.25
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
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_LevelAppear_Big.prefab",
				postionVInput = {
					234.907,
					49.171,
					1748.406
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_LevelAppear_Big.prefab",
				postionVInput = {
					235.34,
					49.152,
					1749.466
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 36,
			inputs = {
				retValueInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70007294,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 10,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false
			},
			flowIn = {
				In = 0
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
						nodeId = 26,
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
						nodeId = 27,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 28,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_LevelAppear_Big.prefab",
				postionVInput = {
					235.432,
					49.186,
					1746.966
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_LevelAppear_Big.prefab",
				postionVInput = {
					233.918,
					49.21,
					1747.205
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 36,
			inputs = {
				retValueInput = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_AngryStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 86085878
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 710007,
				processingTime = 0.5,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_AngryStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 86085879
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 710007,
				processingTime = 0.5,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_AngryStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 86085878
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 710007,
				processingTime = 0.5,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_AngryStart",
				playStartLoopEndVInput = true,
				staticIdVInput = 86085879
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 710007,
				processingTime = 0.5,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				In = 0
			}
		}
	}
}
