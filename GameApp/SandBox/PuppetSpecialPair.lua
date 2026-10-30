-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\PuppetSpecialPair.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local Const = require("Common.Const.Const")
local SandboxConst = require("Common.Const.SandboxConst")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local PuppetSpecialPair = Class.LightClass("PuppetSpecialPair", LevelItem)

function PuppetSpecialPair:ctor(sandbox, spawnInfo, syncInfo)
	PuppetSpecialPair.super.ctor(self, sandbox, spawnInfo, syncInfo)
end

function PuppetSpecialPair:onSandboxReady()
	PuppetSpecialPair.super.onSandboxReady(self)

	self.pairReady = true
	self.pairState = self.syncInfo.state or 0

	self:applyPairState()
end

function PuppetSpecialPair:onLevelItemValueChange(key, oldValue, value)
	if key ~= "state" or not self.pairReady or self.pairState == value then
		return
	end

	self.pairState = value

	self:applyPairState()
end

function PuppetSpecialPair:applyPairState()
	if not self.sandbox.isMain then
		return
	end

	if self.pairState == 0 then
		if not self:tryEnterPair() and not self.pairReadyTimer then
			self.pairReadyTimer = self:addTimer(0.1, function()
				if self:tryEnterPair() then
					self:stopWaitingForPair()
				end
			end, true)
		end
	elseif self.pairState == 1 then
		self:stopWaitingForPair()
		self:exitPair()
	end
end

function PuppetSpecialPair:stopWaitingForPair()
	if self.pairReadyTimer then
		self:removeTimer(self.pairReadyTimer)

		self.pairReadyTimer = nil
	end
end

function PuppetSpecialPair:isPuppetReady(puppet)
	if not puppet or not puppet.enterSandboxSpecialState or puppet.isServerPuppet or puppet.authority ~= Const.AUTHORITY_MASTER then
		return false
	end

	if not puppet.characterState or puppet.characterState == CharacterStateConst.NONE then
		return false
	end

	local view = puppet.eModel and puppet.eModel.modelModelView

	return NotNil(view) and view:IsAnimatorRead()
end

function PuppetSpecialPair:tryEnterPair()
	if self.pairState ~= 0 or not self.sandbox.isMain then
		return true
	end

	local config = self:getMajorConfig()
	local space = self.sandbox.space
	local a = space:getEntityByStaticId(config.puppetAStaticId)
	local b = space:getEntityByStaticId(config.puppetBStaticId)

	if a == b or not self:isPuppetReady(a) or not self:isPuppetReady(b) then
		return false
	end

	self:unbindPair()

	self.puppetA, self.puppetB = a, b

	function self.loopExitedCallback()
		self:onPairLoopExited()
	end

	a.eventEmitter:addEventListener(SandboxConst.PUPPET_SPECIAL_LOOP_EXITED, self.loopExitedCallback)
	b.eventEmitter:addEventListener(SandboxConst.PUPPET_SPECIAL_LOOP_EXITED, self.loopExitedCallback)

	self.startingPair = true

	local enteredA = a:enterSandboxSpecialState(config.loopAnimA, config.exitAnimA)
	local enteredB = b:enterSandboxSpecialState(config.loopAnimB, config.exitAnimB)

	self.startingPair = false

	return enteredA and enteredB
end

function PuppetSpecialPair:onPairLoopExited()
	if self.startingPair or self.pairState ~= 0 then
		return
	end

	self.pairState = 1

	self:stopWaitingForPair()
	self:exitPair()
	self:syncSingleFieldValue("state", 1)
end

function PuppetSpecialPair:exitPair()
	if self.puppetA and self.puppetA.sandboxSpecialLooping then
		self.puppetA:exitSandboxSpecialState()
	end

	if self.puppetB and self.puppetB.sandboxSpecialLooping then
		self.puppetB:exitSandboxSpecialState()
	end
end

function PuppetSpecialPair:unbindPair()
	if self.loopExitedCallback then
		if self.puppetA then
			self.puppetA.eventEmitter:removeEventListener(SandboxConst.PUPPET_SPECIAL_LOOP_EXITED, self.loopExitedCallback)
		end

		if self.puppetB then
			self.puppetB.eventEmitter:removeEventListener(SandboxConst.PUPPET_SPECIAL_LOOP_EXITED, self.loopExitedCallback)
		end

		self.loopExitedCallback = nil
	end
end

function PuppetSpecialPair:destroy()
	self:stopWaitingForPair()
	self:unbindPair()
	self:exitPair()

	self.puppetA, self.puppetB = nil

	PuppetSpecialPair.super.destroy(self)
end

return PuppetSpecialPair
