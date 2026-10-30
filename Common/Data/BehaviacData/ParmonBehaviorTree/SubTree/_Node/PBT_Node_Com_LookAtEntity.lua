-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_LookAtEntity.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_LookAtEntity = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_LookAtEntity",
		version = 9,
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "0",
				name = "tTargetStaticId",
				const = 0,
				type = "int"
			},
			{
				value = "0",
				name = "tTargetActorId",
				const = 0,
				type = "int"
			},
			{
				value = "false",
				name = "tForce",
				const = false,
				type = "bool"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "10",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "8",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tTargetActorId"
								}
							},
							{
								Opr = {
									func = "getActorId",
									params = {
										{
											field = "tTargetStaticId"
										}
									}
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						class = "Action",
						id = "9",
						properties = {
							{
								Method = {
									func = "lookAtEntity",
									params = {
										{
											field = "tTargetActorId"
										},
										{
											field = "tForce"
										}
									}
								}
							},
							{
								ResultOption = "BT_INVALID"
							},
							{
								ResultResumeOption = "BT_None"
							}
						},
						attachments = {},
						children = {}
					}
				}
			}
		}
	}
}

return PBT_Node_Com_LookAtEntity
