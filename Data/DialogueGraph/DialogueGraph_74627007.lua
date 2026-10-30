-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_74627007.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 74627007,
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
					hideInteractionSign = true,
					toplogoComList = {
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
						vlog = true,
						teamSpeech = true
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
						portId = "In",
						nodeId = 4
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 51
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 24,
			inputs = {
				switchToPlayerVInput = true
			},
			flowIn = {
				In = 0
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
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 2,
				targetEulerAngleVInput = {
					0,
					71.834,
					0
				},
				targetPositionVInput = {
					-1491.534,
					77.997,
					981.602
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 54
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
							value = 0,
							weightedMode = 0,
							time = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							weightedMode = 0,
							time = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1
						}
					}
				}
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
						portId = "In",
						nodeId = 7
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
						nodeId = 50
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70006415,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 2,
				npcStaticId = 2,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				delayTime = 1
			},
			flowIn = {
				In = 0
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
			kind = 2,
			fields = {
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 47
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 48
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 49
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
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70006416,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 2,
				npcStaticId = 2,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2.38,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 13
					}
				}
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
						portId = "In",
						nodeId = 14
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
						nodeId = 16
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 5,
				playableStateVInput = "StunStart"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 53
				}
			},
			fields = {
				templateId = 3,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"StunStart",
					"StunLoop",
					"StunEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 17
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
						portId = "In",
						nodeId = 18
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 42
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 43
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 44
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 46
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70006418,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 20
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
						portId = "In",
						nodeId = 21
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
						portId = "In",
						nodeId = 22
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 39
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 40
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 41
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002250,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				portCount = 1,
				skipTime = 2,
				anim = "Behav_Happy",
				npcId = -1050115081,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 1,
				animCfg = {
					[1] = "Behav_Happy",
					[2] = {
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
						portId = "In",
						nodeId = 23
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
						portId = "In",
						nodeId = 24
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 34
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 35
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 36
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002251,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				portCount = 1,
				skipTime = 2,
				anim = "Behav_Happy",
				npcId = 201811,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 1,
				animCfg = {
					[1] = "Behav_Happy",
					[2] = {
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
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002252,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				portCount = 1,
				skipTime = 2,
				anim = "Behav_Happy",
				npcId = 201811,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 1,
				animCfg = {
					[1] = "Behav_Happy",
					[2] = {
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
						portId = "In",
						nodeId = 26
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
						portId = "In",
						nodeId = 27
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 30
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 31
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 32
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 33
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
						portId = "In",
						nodeId = 28
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
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 1
			},
			flowIn = {
				In = 0
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
			kind = 20,
			inputs = {
				durationVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 42
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 43
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 44
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 45
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 6,
				playableStateVInput = "AI_IdleSpecial03"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 42
				}
			},
			fields = {
				templateId = 1100110001,
				processingTime = 2.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"AI_IdleSpecial03",
					"AI_IdleSpecial03",
					"AI_IdleSpecial03"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 6,
				playableStateVInput = "AI_IdleSpecial03"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 43
				}
			},
			fields = {
				templateId = 1100110001,
				processingTime = 2.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"AI_IdleSpecial03",
					"AI_IdleSpecial03",
					"AI_IdleSpecial03"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 6,
				playableStateVInput = "AI_IdleSpecial03"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 44
				}
			},
			fields = {
				templateId = 1100110001,
				processingTime = 2.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"AI_IdleSpecial03",
					"AI_IdleSpecial03",
					"AI_IdleSpecial03"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 6,
				playableStateVInput = "AI_IdleSpecial03"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 45
				}
			},
			fields = {
				templateId = 1100110001,
				processingTime = 2.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"AI_IdleSpecial03",
					"AI_IdleSpecial03",
					"AI_IdleSpecial03"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy",
				loopDurationVInput = 3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 42
				}
			},
			fields = {
				templateId = 1100110001,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy",
				loopDurationVInput = 3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 43
				}
			},
			fields = {
				templateId = 1100110001,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy",
				loopDurationVInput = 3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 44
				}
			},
			fields = {
				templateId = 1100110001,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy",
				loopDurationVInput = 3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 45
				}
			},
			fields = {
				templateId = 1100110001,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 1100110001,
				positionVInput = {
					-1492.038,
					78.217,
					983.81
				},
				rotationVInput = {
					0,
					156.938,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1050115081
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 1100110001,
				positionVInput = {
					-1490.244,
					78.391,
					984.013
				},
				rotationVInput = {
					0,
					181.393,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -761605657
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 1100110001,
				positionVInput = {
					-1488.994,
					78.17,
					980.672
				},
				rotationVInput = {
					0,
					292.507,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -396908352
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 1100110001,
				positionVInput = {
					-1489.889,
					78.17,
					979.509
				},
				rotationVInput = {
					0,
					315.097,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1490913028
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1493.912,
					81.491,
					981.482
				},
				rotationVInput = {
					43.343,
					80.091,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 82209446,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				playableStateVInput = "Emotion_Shock"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 54
				}
			},
			fields = {
				templateId = 3,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Emotion_Shock",
					"Emotion_Shock",
					"Emotion_Shock"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$P_Levelitem_Eff_Parmon_LevelAppear_Normal_starfriut.prefab",
				postionVInput = {
					-1489.13,
					78.51,
					983.49
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
				retValueInput = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				animationLayerVInput = 4,
				loopDurationVInput = 4,
				playableStateVInput = "TalkUpper_Cheeksupport"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 54
				}
			},
			fields = {
				templateId = 3,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1494.356,
					79.51,
					984.049
				},
				rotationVInput = {
					10.144,
					103.746,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 82209445,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 36,
			inputs = {
				retValueInput = 3
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		{
			kind = 17,
			fields = {
				entityType = 0
			}
		}
	}
}
