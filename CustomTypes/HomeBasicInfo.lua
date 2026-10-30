-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\HomeBasicInfo.lua

local CustomDict = require("Core.PropertySync.CustomDict")
local Class = require("Core.Framework.Class")
local Const = require("Common.Const.Const")
local HomeBasicInfo = Class.LiteClass("HomeBasicInfo", CustomDict)
local HOME_CAR_BASE_PART = Const.HOME_CAR_BASE_PART

function HomeBasicInfo:getCarSkinId()
	return self.carShapeInfo and self.carShapeInfo[HOME_CAR_BASE_PART.Skin] or 0
end

return HomeBasicInfo
