-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LoginSelectServer\\LoginSelectServerModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local LoginSelectServerModel = Class.LightClass("LoginSelectServerModel", UIModel)
local ClientRepo = require("Core.Client.ClientRepo")

function LoginSelectServerModel.getServerListData()
	return ClientRepo.netHandler:getServerList() or {}
end

return LoginSelectServerModel
