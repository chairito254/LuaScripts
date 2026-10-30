-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_SendMsgToPartners.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_SendMsgToPartners = {
	behavior = {
		useForRoute = true,
		name = "ParmonBehaviorTree/SubTree/PBT_SendMsgToPartners",
		agenttype = "CombatAgent",
		version = 5,
		properties = {},
		pars = {
			{
				name = "partnerIds",
				value = "0:",
				type = "vector<int>",
				const = {}
			},
			{
				name = "tMessageName",
				const = "",
				value = "",
				type = "string"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "4",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "partnerIds"
								}
							},
							{
								Opr = {
									func = "getPartnerIds",
									params = {
										{
											field = "selfId"
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
						id = "2",
						class = "Action",
						properties = {
							{
								Method = {
									func = "doSendMessage",
									params = {
										{
											field = "selfId"
										},
										{
											field = "partnerIds"
										},
										{
											field = "tMessageName"
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

return PBT_SendMsgToPartners
