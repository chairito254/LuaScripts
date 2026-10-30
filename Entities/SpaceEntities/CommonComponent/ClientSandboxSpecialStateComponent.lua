-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\ClientSandboxSpecialStateComponent.lua

local Class = require("Core.Framework.Class")
local Const = require("Common.Const.Const")
local AiConst = require("Common.Const.AiConst")
local AnimationUtils = require("Common.Utils.AnimationUtils")
local SandboxConst = require("Common.Const.SandboxConst")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local ClientSandboxSpecialStateComponent = Class.Component("ClientSandboxSpecialStateComponent")

function ClientSandboxSpecialStateComponent:enterSandboxSpecialState(animKey, exitAnimKey)
	if self.isServerPuppet or self.authority ~= Const.AUTHORITY_MASTER then
		return false
	end

	if not self.characterState or self.characterState == CharacterStateConst.NONE then
		return false
	end

	if self.characterState == CharacterStateConst.SANDBOXSPECIAL then
		AnimationUtils.forceChangeState(self, CharacterStateConst.IDLE)
	end

	self.sandboxSpecialAnimKey = AnimationUtils.getID(animKey)
	self.sandboxSpecialExitAnimKey = AnimationUtils.getID(exitAnimKey or 0)

	self:pauseBt(AiConst.PauseBtReason.SandboxSpecial)
	AnimationUtils.forceChangeState(self, CharacterStateConst.SANDBOXSPECIAL)

	self.sandboxSpecialLooping = self.characterState == CharacterStateConst.SANDBOXSPECIAL

	if not self.sandboxSpecialLooping then
		self.sandboxSpecialAnimKey = nil
		self.sandboxSpecialExitAnimKey = nil

		self:resumeBt(AiConst.PauseBtReason.SandboxSpecial)
	end

	return self.sandboxSpecialLooping
end

function ClientSandboxSpecialStateComponent:onSandboxSpecialStateEntered()
	self:setPosition(self.bornPosition or self:getPosition())
	self:setRotation(self.bornRotation or self:getRotation(), true)
end

function ClientSandboxSpecialStateComponent:onEnterCombat()
	if self.isServerPuppet or self.authority ~= Const.AUTHORITY_MASTER then
		return
	end

	self:_cancel_SANDBOX_SPECIAL_ST()
end

function ClientSandboxSpecialStateComponent:exitSandboxSpecialState()
	if self.characterState == CharacterStateConst.SANDBOXSPECIAL then
		AnimationUtils.playAnimationState(self, CharacterStateConst.IDLE)
	end
end

function ClientSandboxSpecialStateComponent:onSandboxSpecialLoopExited()
	if not self.sandboxSpecialLooping then
		return
	end

	self.sandboxSpecialLooping = false

	self.eventEmitter:emit(SandboxConst.PUPPET_SPECIAL_LOOP_EXITED, self)
end

function ClientSandboxSpecialStateComponent:onSandboxSpecialStateExited()
	self.sandboxSpecialAnimKey = nil
	self.sandboxSpecialExitAnimKey = nil

	self:resumeBt(AiConst.PauseBtReason.SandboxSpecial)
	self:onSandboxSpecialLoopExited()
end

return ClientSandboxSpecialStateComponent
