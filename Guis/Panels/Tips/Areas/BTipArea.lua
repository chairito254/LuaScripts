-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Areas\\BTipArea.lua

local Class = require("Core.Framework.Class")
local BaseTipArea = require("Guis.Panels.Tips.BaseTipArea")
local BTipArea = Class.LightClass("BTipArea", BaseTipArea)

function BTipArea:onCtor(info)
	return
end

function BTipArea:onHide()
	self:clearRunItems()
end

return BTipArea
