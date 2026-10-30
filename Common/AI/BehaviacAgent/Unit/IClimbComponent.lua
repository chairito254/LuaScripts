-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\IClimbComponent.lua

local Class = require("Core.Framework.Class")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local AIControllerUtils = require("Common.Utils.AIControllerUtils")
local PlayableConst = require("Common.Const.PlayableConst")
local Const = require("Common.Const.Const")
local IClimbComponent = Class.Component("IClimbComponent")

function IClimbComponent:switchToClimbOn__resetState(resetStateType)
	self.x_switchToClimbOn_init = nil

	AIControllerUtils.clearStateMotionWarpingSyncPoint(self.ent, CharacterStateConst.CLIMBON)
	self:switchToState__resetState(resetStateType)
end

function IClimbComponent:switchToClimbOn(climbOnPos, climbOnRot)
	if not self.x_switchToClimbOn_init then
		AIControllerUtils.setStateMotionWarpingSyncPoint(self.ent, CharacterStateConst.CLIMBON, PlayableConst.JumpOnWall, climbOnPos, climbOnRot)

		self.x_switchToClimbOn_init = true
	end

	return self:switchToState(CharacterStateConst[CharacterStateConst.CLIMBIDLE].name)
end

function IClimbComponent:switchToClimbWaterfallOn__resetState(resetStateType)
	self.x_switchToClimbWaterfallOn_init = nil

	AIControllerUtils.clearStateMotionWarpingSyncPoint(self.ent, CharacterStateConst.CLIMBWATERFALLJUMPON)
	self:switchToState__resetState(resetStateType)
end

function IClimbComponent:switchToClimbWaterfallOn(climbWaterfallOnPos, climbWaterfallOnRot)
	if not self.x_switchToClimbWaterfallOn_init then
		AIControllerUtils.setStateMotionWarpingSyncPoint(self.ent, CharacterStateConst.CLIMBWATERFALLJUMPON, PlayableConst.ClimbWaterfall_JumpOn, climbWaterfallOnPos, climbWaterfallOnRot, nil, true, true, true)

		self.x_switchToClimbWaterfallOn_init = true
	end

	return self:switchToState(CharacterStateConst[CharacterStateConst.CLIMBWATERFALLIDLE].name)
end

function IClimbComponent:switchToClimbWaterfallOff__resetState(resetStateType)
	self.x_switchToClimbWaterfallOff_init = nil

	self:switchToState__resetState(resetStateType)
end

function IClimbComponent:switchToClimbWaterfallOff(climbWaterfallEndType)
	if not self.x_switchToClimbWaterfallOff_init then
		local eModel = self.ent.eModel

		if eModel then
			eModel:SetClimbWaterfallEndType(Const.COMPONENT_AI_CONTROLLER, climbWaterfallEndType)
		end

		self.x_switchToClimbWaterfallOff_init = true
	end

	return self:switchToState(CharacterStateConst[CharacterStateConst.LOCOMOTION].name)
end

return IClimbComponent
