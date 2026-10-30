-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\SurfPlanFsm\\SurfDisableState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local SurfDisableState = Class.LiteClass("SurfDisableState", State)

function SurfDisableState:onEnter(controller)
	controller.surfPlan:breakPlan()
end

return SurfDisableState
