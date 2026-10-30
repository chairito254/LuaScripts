-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91023176.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 91023176,
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
				startSkipVInput = true,
				showHUDVInput = true,
				pauseNearbyMonsterAIVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				applyStateConflictVInput = true
			},
			fields = {
				topLogoComs = {
					alert = true,
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
					bubble = true
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
			kind = 60,
			inputs = {
				exitTypeVInput = 2,
				enterTypeVInput = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["1"] = {
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
				blendTimeVInput = 1,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					-31.35,
					39.622,
					448.27
				},
				rotationVInput = {
					0,
					330,
					0.002
				}
			},
			fields = {
				fStop = 4,
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200
			},
			flowIn = {
				In = true
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
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Angry",
				playOnEntityVInput = true,
				applyRootMotionVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 31,
					portId = "EntityID"
				}
			},
			fields = {
				entityType = 1,
				playAniType = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Attack01",
				playOnEntityVInput = true,
				applyRootMotionVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 31,
					portId = "EntityID"
				}
			},
			fields = {
				entityType = 1,
				playAniType = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 10,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 1,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					-32.056,
					39.622,
					449.493
				},
				rotationVInput = {
					0,
					330,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91028154
			},
			flowIn = {
				In = true
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
						nodeId = 11,
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
			kind = 5,
			inputs = {
				playableStateVInput = "Attack02",
				playOnEntityVInput = true,
				applyRootMotionVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 31,
					portId = "EntityID"
				}
			},
			fields = {
				entityType = 1,
				playAniType = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
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
				In = true
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
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 1,
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					-29.335,
					39.622,
					444.78
				},
				rotationVInput = {
					0,
					330,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91030709
			},
			flowIn = {
				In = true
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
						nodeId = 15,
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 36,
			inputs = {
				keyValueInput = 5
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.2
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					-29.335,
					51,
					444.78
				},
				rotationVInput = {
					0,
					330,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91028153
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 19,
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
		},
		{
			kind = 56,
			fields = {
				cameraShakeItem = {
					shakeDissipation = 28,
					random = false,
					flags = 0,
					shakeRadius = -1,
					decayTime = 2,
					sustainTime = 0.1,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 0,
					initPhase = 0,
					shakeBias = 0,
					shakeAmplitude = 1,
					shakeFrequency = 6,
					shakeRadiusCurve = {
						preWrapMode = 8,
						postWrapMode = 8,
						keys = {
							{
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								time = 0
							},
							{
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
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
						preWrapMode = 8,
						postWrapMode = 8,
						keys = {
							{
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								time = 0
							},
							{
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								time = 1
							}
						}
					},
					shakeDir = {
						0,
						1,
						0
					}
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 56,
			fields = {
				shakeType = 1,
				cameraShakeItem = {
					shakeDissipation = 28,
					flags = 0,
					shakeRadius = -1,
					decayTime = 2,
					sustainTime = 0.1,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 1,
					shakeFrequency = 6,
					shakeRadiusCurve = {
						preWrapMode = 8,
						postWrapMode = 8,
						keys = {
							{
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								time = 0
							},
							{
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								time = 1
							}
						}
					},
					shakePos = {
						0,
						0,
						0
					},
					noisePosAmplitudes = {
						0,
						0,
						0
					},
					noiseRotAmplitudes = {
						3,
						3,
						3
					},
					shakeFrequencyCurve = {
						preWrapMode = 8,
						postWrapMode = 8,
						keys = {
							{
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								time = 0
							},
							{
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								value = 1,
								outTangent = 0,
								inTangent = 0,
								time = 1
							}
						}
					},
					noisePosSeeds = {
						0,
						0,
						0
					},
					noiseRotSeeds = {
						0,
						0,
						0
					}
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "battle_pets_pikachu_attack_common01"
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
			kind = 4,
			fields = {
				delayTime = 0.15
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 24,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "battle_pets_pikachu_attack_common01"
			},
			flowIn = {
				Play = true
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
			kind = 4,
			fields = {
				delayTime = 0.15
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 26,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "battle_pets_pikachu_attack_common01"
			},
			flowIn = {
				Play = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.15
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 28,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "battle_pets_pikachu_attack_common01"
			},
			flowIn = {
				Play = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.15
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 30,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "battle_pets_pikachu_attack_common01"
			},
			flowIn = {
				Play = true
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		}
	}
}
