-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_52754291.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 52754291,
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
			kind = 12,
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
				portCount = 7
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 4,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 45,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendFuncVInput = "EaseIn",
				blendExponentVInput = 0,
				fovVInput = 48,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1657.339,
					96.189,
					797.716
				},
				rotationVInput = {
					353.4,
					226.9,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91311302,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 18,
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				fovVInput = 50,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1656.559,
					95.9,
					796.6
				},
				rotationVInput = {
					342.8,
					251.5,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91311301,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					255.81,
					0
				},
				targetPositionVInput = {
					-1656.709,
					94.692,
					795.765
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 11,
			fields = {
				modeInfo = {
					hideMarkShare = true,
					hideInteractionSign = true,
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
					toplogoComList = {
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
						alert = true,
						actionState = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				delayTime = 0.6
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
						nodeId = 11,
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
						nodeId = 10,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 15,
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
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 12,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 74,
			inputs = {
				maxSpeedVInput = 0.35,
				maxIntensityVInput = 5,
				windEffectResIDVInput = "$Eff_Env_CETutotial_Wind_HoleWind.prefab",
				endPositionVInput = {
					-1664.361,
					94.766,
					798.377
				},
				startPositionVInput = {
					-1661.919,
					94.488,
					774.358
				}
			},
			dynamicInputs = {
				"maxIntensityDVInput",
				"maxSpeedDVInput"
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 6
			},
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
			kind = 49,
			valueIn = {
				effectIdVInput = {
					nodeId = 46,
					portId = "EffectID"
				},
				generatorIdVInput = {
					nodeId = 46,
					portId = "GeneratorID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 9
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 49,
			valueIn = {
				effectIdVInput = {
					nodeId = 48,
					portId = "EffectID"
				},
				generatorIdVInput = {
					nodeId = 48,
					portId = "GeneratorID"
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
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26021020,
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
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
						nodeId = 21,
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
						nodeId = 22,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2.5,
				blendExponentVInput = 0,
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1654.889,
					95.8,
					797.391
				},
				rotationVInput = {
					354.238,
					245.851,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91311281,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 23,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 25,
				blendExponentVInput = 0,
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1654.973,
					95.8,
					797.551
				},
				rotationVInput = {
					356.988,
					240.351,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91311294,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					243.768,
					0
				},
				targetPositionVInput = {
					-1656.43,
					94.627,
					796.739
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				speedVInput = 0.75,
				maxLimitTimeVInput = 10,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					243.768,
					0
				},
				targetPositionVInput = {
					-1657.3,
					94.681,
					796.31
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0
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
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Daily_Overlook_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 0.5
			},
			fields = {
				templateId = 3,
				processingTime = 3.033,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Daily_Overlook_Start",
					"Daily_Overlook_Loop",
					"Daily_Overlook_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 69185470,
				durationVInput = 1,
				targetEulerAngleVInput = {
					0,
					101.46,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						nodeId = 29,
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
						nodeId = 30,
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
						nodeId = 33,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_PointTo02",
				playOnEntityVInput = true,
				animationLayerVInput = 4,
				staticIdVInput = 69185470
			},
			fields = {
				templateId = 400100,
				processingTime = 4.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 69185470,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 69185470
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26021021,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 9.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 26021022,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 1,
				npcStaticId = -1,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 4.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26021023,
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
				npcId = 400100,
				matchAudioDuration = true,
				duration = 4.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 36,
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
						nodeId = 37,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				},
				["5"] = {
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
				dialogueIdVInput = 26021024,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				anim = "Emotion_Firm_Start",
				portCount = 1,
				animCfg = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End",
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
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26021025,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400100,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				anim = "Emotion_ShakeHead",
				portCount = 1,
				animCfg = {
					[1] = "Emotion_ShakeHead",
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
						nodeId = 39,
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
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 41,
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
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 69185470,
				targetEulerAngleVInput = {
					0,
					237.24,
					0
				},
				targetPositionVInput = {
					-1655.937,
					94.439,
					798.448
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 69185470,
				speedVInput = 0.75,
				maxLimitTimeVInput = 20,
				targetEulerAngleVInput = {
					0,
					239.68,
					0
				},
				targetPositionVInput = {
					-1658.64,
					94.78,
					796.5
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0
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
				delayTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 46,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Env_CETutotial_Wind_HoleWind.prefab",
				postionVInput = {
					-1667.356,
					92.742,
					781.147
				},
				rotationVInput = {
					-10.748,
					-37.62,
					0
				}
			},
			fields = {
				playOne = true
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
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Env_CETutotial_Wind_HoleWind.prefab",
				postionVInput = {
					-1682.04,
					95.242,
					783.148
				},
				rotationVInput = {
					-7.351,
					-42.488,
					0
				}
			},
			fields = {
				playOne = true
			},
			flowIn = {
				In = 0
			}
		}
	}
}
