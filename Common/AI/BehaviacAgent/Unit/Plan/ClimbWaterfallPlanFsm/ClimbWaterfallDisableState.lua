-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\ClimbWaterfallPlanFsm\\ClimbWaterfallDisableState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local ClimbWaterfallDisableState = Class.LiteClass("ClimbWaterfallDisableState", State)

function ClimbWaterfallDisableState:onEnter(controller, oldState)
	ClimbWaterfallDisableState.super.onEnter(self, controller, oldState)
	controller.climbWaterfallPlan:breakPlan()
end

return ClimbWaterfallDisableState
