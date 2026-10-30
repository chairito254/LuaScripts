-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\Input\\keyboard_hotkey_config.lua

local data = {
	groupName = "Keyboard&Mouse",
	matchPaths = {
		"<Keyboard>",
		"<Mouse>"
	},
	hotkeyExcludes = {
		"<Keyboard>/ctrl",
		"<Keyboard>/leftCtrl",
		"<Keyboard>/rightCtrl",
		"<Keyboard>/alt",
		"<Keyboard>/leftAlt",
		"<Keyboard>/rightAlt",
		"<Keyboard>/escape",
		"<Keyboard>/anykey"
	},
	hotkeyActions = {
		["Bind/MoveUp"] = {},
		["Bind/MoveDown"] = {},
		["Bind/MoveLeft"] = {},
		["Bind/MoveRight"] = {},
		["Bind/CameraZoom"] = {},
		["Bind/Sprint"] = {},
		["Bind/Jump"] = {},
		["Bind/Interact"] = {},
		["Bind/Lock"] = {},
		["Bind/ClimbJump"] = {},
		["Bind/SwitchPet"] = {},
		["Bind/Pet1"] = {},
		["Bind/Pet2"] = {},
		["Bind/Pet3"] = {},
		["Bind/Pet4"] = {},
		["Bind/NormalAttack"] = {},
		["Bind/Skill1"] = {},
		["Bind/Skill2"] = {},
		["Bind/Skill3"] = {},
		["Bind/ExploreSkill"] = {},
		["Bind/Aim"] = {},
		["Bind/SwitchCatchMode"] = {},
		["Bind/ItemModifier"] = {},
		["Bind/Item1"] = {},
		["Bind/Item2"] = {},
		["Bind/Item3"] = {},
		["Bind/Item4"] = {},
		["Bind/SpecialAbility"] = {},
		["Bind/OpenPetBall"] = {},
		["Bind/OpenSetup"] = {},
		["Bind/OpenHelp"] = {},
		["Bind/OpenOrb"] = {},
		["Bind/OpenMap"] = {},
		["Bind/OpenPet"] = {},
		["Bind/OpenInformation"] = {},
		["Bind/OpenBag"] = {},
		["Bind/OpenHandBook"] = {},
		["Bind/QuickPhoto"] = {},
		["Bind/OpenMission"] = {},
		["Bind/ShowCursor"] = {},
		["Bind/Confirm"] = {},
		["Bind/CancelBind"] = {},
		["Bind/OpenPetBall"] = {},
		["Bind/battlePass"] = {},
		["Bind/SwitchTeamNegative"] = {},
		["Bind/SwitchTeamPositive"] = {},
		["Bind/SwitchPetTeam"] = {},
		["Bind/SwitchPetMode"] = {},
		["Bind/SkillChainAttack"] = {},
		["Bind/ItemDetail"] = {},
		["Bind/ItemClose"] = {},
		["Bind/VoiceChannel"] = {},
		["Bind/TrackOpenSpecial"] = {},
		["Bind/OpenSpecialTrain"] = {},
		["Bind/SwitchPage"] = {},
		["Bind/Extra1"] = {},
		["Bind/Service"] = {},
		["Bind/OpenSchoolGuide"] = {},
		["Bind/HomelandLog"] = {},
		["Bind/HomelandPet"] = {},
		["Bind/HomelandBuild"] = {},
		["Bind/HomelandStore"] = {},
		["Bind/Snapshot"] = {},
		["Bind/OpenEmotion"] = {},
		["Bind/HomelandFurnitureStore"] = {},
		["Bind/HomelandPlantBook"] = {},
		["Bind/HomelandMainPage"] = {},
		["Bind/SeasonLobby"] = {},
		["Bind/HomelandDesign"] = {},
		["Bind/HomelandSeason"] = {},
		["Bind/Shop"] = {},
		["Bind/Rule"] = {},
		["Bind/HomelandManage"] = {}
	},
	relativeActions = {
		{
			target = "Player/Move",
			bindingIndex = 1,
			src = "Bind/MoveUp"
		},
		{
			target = "Player/Move",
			bindingIndex = 2,
			src = "Bind/MoveDown"
		},
		{
			target = "Player/Move",
			bindingIndex = 3,
			src = "Bind/MoveLeft"
		},
		{
			target = "Player/Move",
			bindingIndex = 4,
			src = "Bind/MoveRight"
		},
		{
			src = "Bind/Jump",
			target = "Player/Jump"
		},
		{
			src = "Bind/Sprint",
			target = "Player/StartSprint"
		},
		{
			src = "Bind/ClimbJump",
			target = "Player/ClimbJump"
		},
		{
			target = "Player/ClimbJump2",
			bindingIndex = 2,
			src = "Bind/Jump"
		},
		{
			src = "Bind/ClimbJump",
			target = "Player/SpecialAbility"
		},
		{
			src = "Bind/Sprint",
			target = "Player/FastClimb"
		},
		{
			src = "Bind/Pet1",
			target = "Hud/Pet1"
		},
		{
			src = "Bind/Pet2",
			target = "Hud/Pet2"
		},
		{
			src = "Bind/Pet3",
			target = "Hud/Pet3"
		},
		{
			src = "Bind/Pet4",
			target = "Hud/Pet4"
		},
		{
			src = "Bind/SwitchPet",
			target = "Hud/SwitchPet"
		},
		{
			src = "Bind/NormalAttack",
			target = "Hud/ExitDelayExplore"
		},
		{
			src = "Bind/Skill1",
			target = "Hud/SkillQ"
		},
		{
			src = "Bind/Skill2",
			target = "Hud/SkillE"
		},
		{
			src = "Bind/Skill3",
			target = "Hud/SkillR"
		},
		{
			src = "Bind/ExploreSkill",
			target = "Hud/ExploreSkill"
		},
		{
			src = "Bind/Item1",
			target = "Hud/Extra1"
		},
		{
			src = "Bind/Item2",
			target = "Hud/Extra2"
		},
		{
			src = "Bind/Item3",
			target = "Hud/Extra3"
		},
		{
			src = "Bind/Item4",
			target = "Hud/Extra4"
		},
		{
			src = "Bind/NormalAttack",
			target = "Hud/NormalAttack"
		},
		{
			src = "Bind/Go",
			target = "Hud/Go"
		},
		{
			src = "Bind/Stop",
			target = "Hud/Stop"
		},
		{
			src = "Bind/ItemModifier",
			target = "Hud/BallMenu"
		},
		{
			src = "Bind/Interact",
			target = "Hud/Interact"
		},
		{
			src = "Bind/Skill1",
			target = "Hud/QteLeft"
		},
		{
			src = "Bind/Skill2",
			target = "Hud/QteRight"
		},
		{
			src = "Bind/QuickPhoto",
			target = "Hud/QuickPhoto"
		},
		{
			src = "Bind/OpenHandBook",
			target = "Hud/OpenHandBook"
		},
		{
			src = "Bind/OpenHandBook",
			target = "Hud/PetFirstOpenPetHandBook"
		},
		{
			src = "Bind/OpenBag",
			target = "Hud/OpenBag"
		},
		{
			src = "Bind/OpenInformation",
			target = "Hud/OpenInformation"
		},
		{
			src = "Bind/OpenPet",
			target = "Hud/OpenPet"
		},
		{
			src = "Bind/OpenPet",
			target = "Hud/GetSinglePet"
		},
		{
			src = "Bind/OpenMap",
			target = "Hud/OpenMap"
		},
		{
			src = "Bind/OpenMap",
			target = "Hud/AIAssistantOpenMap"
		},
		{
			src = "Bind/OpenMission",
			target = "Hud/OpenMission"
		},
		{
			src = "Bind/OpenHelp",
			target = "Hud/OpenHelp"
		},
		{
			src = "Bind/battlePass",
			target = "Hud/battlePass"
		},
		{
			src = "Bind/SwitchPetTeam",
			target = "Hud/SwitchPetTeam"
		},
		{
			src = "Bind/SwitchPetMode",
			target = "Hud/SwitchPetMode"
		},
		{
			src = "Bind/OpenPVP",
			target = "Hud/OpenPVP"
		},
		{
			src = "Bind/OpenPetBall",
			target = "Hud/OpenPetBall"
		},
		{
			src = "Bind/SkillChainAttack",
			target = "Hud/SkillChainAttack"
		},
		{
			src = "Bind/ItemDetail",
			target = "Hud/ItemDetail"
		},
		{
			src = "Bind/ItemClose",
			target = "Hud/ItemClose"
		},
		{
			src = "Bind/VoiceChannel",
			target = "Hud/TeamSpeech"
		},
		{
			src = "Bind/VoiceChannel",
			target = "Hud/PushTalk"
		},
		{
			src = "Bind/OpenOrb",
			target = "Hud/OpenOrb"
		},
		{
			src = "Bind/OpenPetBall",
			target = "Hud/OpenPetBall"
		},
		{
			src = "Bind/TrackOpenSpecial",
			target = "Hud/TrackOpenSpecial"
		},
		{
			src = "Bind/OpenSpecialTrain",
			target = "Hud/OpenSpecialTrain"
		},
		{
			src = "Bind/SwitchPage",
			target = "Hud/SwitchPage"
		},
		{
			src = "Bind/Extra1",
			target = "Hud/Extra1"
		},
		{
			src = "Bind/Service",
			target = "Hud/Service"
		},
		{
			src = "Bind/OpenSchoolGuide",
			target = "Hud/OpenSchoolGuide"
		},
		{
			src = "Bind/HomelandLog",
			target = "Hud/HomelandLog"
		},
		{
			src = "Bind/HomelandPet",
			target = "Hud/HomelandPet"
		},
		{
			src = "Bind/HomelandBuild",
			target = "Hud/HomelandBuild"
		},
		{
			src = "Bind/HomelandStore",
			target = "Hud/HomelandStore"
		},
		{
			src = "Bind/HomelandManage",
			target = "Hud/HomelandManage"
		},
		{
			src = "Bind/QuickPhoto",
			target = "Hud/DungeonPhoto"
		},
		{
			src = "Bind/Snapshot",
			target = "Hud/Snapshot"
		},
		{
			src = "Bind/OpenEmotion",
			target = "Hud/OpenEmotion"
		},
		{
			src = "Bind/HomelandFurnitureStore",
			target = "Hud/HomelandFurnitureStore"
		},
		{
			src = "Bind/HomelandPlantBook",
			target = "Hud/HomelandPlantBook"
		},
		{
			src = "Bind/HomelandMainPage",
			target = "Hud/HomelandMainPage"
		},
		{
			src = "Bind/HomelandDesign",
			target = "Hud/HomelandDesign"
		},
		{
			src = "Bind/HomelandSeason",
			target = "Hud/HomelandSeason"
		},
		{
			src = "Bind/Shop",
			target = "Hud/Shop"
		},
		{
			src = "Bind/Rule",
			target = "Hud/Rule"
		},
		{
			src = "Bind/SeasonLobby",
			target = "Hud/SeasonLobby"
		},
		{
			src = "Bind/ShowCursor",
			target = "Camera/ShowCursor"
		},
		{
			src = "Bind/CameraZoom",
			target = "Camera/CameraZoom"
		},
		{
			src = "Bind/Confirm",
			target = "Common/Confirm"
		},
		{
			src = "Bind/CancelBind",
			target = "Common/Cancel"
		},
		{
			src = "Bind/Lock",
			target = "Skill/LockTarget"
		},
		{
			target = "Skill/SupportSkill1",
			bindingIndex = 2,
			src = "Bind/Pet1"
		},
		{
			target = "Skill/SupportSkill2",
			bindingIndex = 2,
			src = "Bind/Pet2"
		},
		{
			target = "Skill/SupportSkill3",
			bindingIndex = 2,
			src = "Bind/Pet3"
		},
		{
			target = "Skill/SupportSkill4",
			bindingIndex = 2,
			src = "Bind/Pet4"
		},
		{
			src = "Bind/NormalAttack",
			target = "Skill/PutItem"
		},
		{
			src = "Bind/SwitchTeamNegative",
			target = "Pet/SwitchTeamNegative"
		},
		{
			src = "Bind/SwitchTeamPositive",
			target = "Pet/SwitchTeamPositive"
		},
		{
			src = "Bind/NormalAttack",
			target = "Catch/Throw"
		},
		{
			src = "Bind/SwitchCatchMode",
			target = "Catch/SwitchCatchMode"
		},
		{
			src = "Bind/Lock",
			target = "Catch/Focus"
		},
		{
			target = "BallDrive/Move",
			bindingIndex = 2,
			src = "Bind/MoveUp"
		},
		{
			target = "BallDrive/Move",
			bindingIndex = 3,
			src = "Bind/MoveDown"
		},
		{
			target = "BallDrive/Move",
			bindingIndex = 4,
			src = "Bind/MoveLeft"
		},
		{
			target = "BallDrive/Move",
			bindingIndex = 5,
			src = "Bind/MoveRight"
		},
		{
			src = "Bind/Skill2",
			target = "BallDrive/Cancel"
		},
		{
			target = "Temp/SupportSkill1",
			bindingIndex = 2,
			src = "Bind/Pet1"
		},
		{
			target = "Temp/SupportSkill2",
			bindingIndex = 2,
			src = "Bind/Pet2"
		},
		{
			target = "Temp/SupportSkill3",
			bindingIndex = 2,
			src = "Bind/Pet3"
		},
		{
			target = "Temp/SupportSkill4",
			bindingIndex = 2,
			src = "Bind/Pet4"
		}
	}
}

return data
