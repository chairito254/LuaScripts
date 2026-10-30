-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\PlayerComponent\\ClientFriendQueryConfig.lua

local ClientFriendQueryConfig = {
	queryPlayerInfo = {
		"playerName",
		"uid",
		"level",
		"starTitle",
		"online",
		"loginTime",
		"lastLogoutTime",
		"teamId",
		"teamMembers",
		"matchStatus",
		"showPetInfo",
		"headIcon",
		"headFrame",
		"newbieBuffLastTriggerTime",
		"userName",
		"homelandKey",
		"homelandHasTillableFacility",
		"avatarPresetKey",
		"avatarConfig",
		"curShow",
		"showSignature",
		"teamDungeonSceneId",
		"isWholeTitle",
		"showTitles",
		"showTitleExtra",
		"cardBackground",
		"fashionScore",
		"voiceSignature",
		"badgeShowMap",
		"chatBubble",
		"stableAttributesStr",
		"profilePhotographyStudioUid"
	},
	queryPlayerNewbieBuff = {
		"newbieBuffLastTriggerTime"
	},
	queryFriendTillableStateList = {
		"homelandHasTillableFacility"
	},
	queryDungeonInvitePlayerStateList = {
		"teamId",
		"teamMembers",
		"matchStatus",
		"teamDungeonSceneId"
	},
	queryBasicPlayerInfoList = {
		"uid",
		"playerName",
		"level",
		"headIcon",
		"headFrame",
		"newbieBuffLastTriggerTime"
	},
	getUserdataByUids = {
		"playerName",
		"level",
		"online",
		"starTitle",
		"loginTime",
		"lastLogoutTime",
		"teamId",
		"teamMembers",
		"matchStatus",
		"teamDungeonSceneId",
		"showPetInfo",
		"headIcon",
		"headFrame",
		"newbieBuffLastTriggerTime",
		"userName",
		"homelandKey"
	},
	queryPlayerInfoByFuzzyName = {
		"playerName",
		"level",
		"online",
		"starTitle",
		"loginTime",
		"lastLogoutTime",
		"teamId",
		"teamMembers",
		"matchStatus",
		"showPetInfo",
		"headIcon",
		"headFrame",
		"newbieBuffLastTriggerTime",
		"userName",
		"homelandKey",
		"avatarPresetKey",
		"avatarConfig",
		"curShow",
		"stableAttributesStr"
	}
}

return ClientFriendQueryConfig
