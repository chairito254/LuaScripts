-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandMainPage\\HomelandMainPageModel.lua

local logger = require("Core.Log.LoggerManager").getLogger("HomelandMainPageModel")
local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local HomelandMainPageModel = Class.LightClass("HomelandMainPageModel", UIModel)
local OpDef = require("Common.OpDef")

function HomelandMainPageModel:changeHomelandName(newName, callback)
	pg.me:requestHomeCampOp(OpDef.OP.CS_HC_ChangeName, {
		name = newName
	}, callback)
end

return HomelandMainPageModel
