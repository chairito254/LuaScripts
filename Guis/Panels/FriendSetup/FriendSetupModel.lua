-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\FriendSetup\\FriendSetupModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local FriendSetupModel = Class.LightClass("FriendSetupModel", UIModel)

FriendSetupModel.FriendSetupType = {
	EditGroup = 1,
	CreateGroup = 0,
	ChangeGroup = 5,
	RemoveChatGroupMember = 4,
	AddChatGroupMember = 3,
	CreateChatGroup = 2
}

return FriendSetupModel
