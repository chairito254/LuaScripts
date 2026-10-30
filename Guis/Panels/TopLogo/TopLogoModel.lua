-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TopLogo\\TopLogoModel.lua

local Time = require("Core.Common.Time")
local NpcDialogueData = require("Data.npc_dialogue_data")
local UIModel = require("Guis.UIModel")
local Class = require("Core.Framework.Class")
local TopLogoModel = Class.LightClass("TopLogoModel", UIModel)

function TopLogoModel:ctor()
	UIModel.ctor(self)
end

return TopLogoModel
