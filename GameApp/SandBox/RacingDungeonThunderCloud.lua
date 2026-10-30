-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\RacingDungeonThunderCloud.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local EventConst = require("Common.Const.EventConst")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local Utils = require("Common.Utils.Utils")
local RacingDungeonThunderCloud = Class.LightClass("Sandbox.RacingDungeonThunderCloud", LevelItem)

function RacingDungeonThunderCloud:ctor(sandbox, spawnInfo, syncInfo)
	RacingDungeonThunderCloud.super.ctor(self, sandbox, spawnInfo, syncInfo)

	self.requestPending = false
	self._isInTrigger = false
	self._playerSwitchControlCallback = nil
end

function RacingDungeonThunderCloud:onSandboxReady()
	RacingDungeonThunderCloud.super.onSandboxReady(self)

	if not self._playerSwitchControlCallback and pg.me and pg.me.eventEmitter then
		function self._playerSwitchControlCallback()
			if self._isInTrigger then
				self.logger:info("[WorldRaceThunderCloud] playerSwitchControl", self.id)
			end

			self:_tryBeginThunderCloud()
		end

		pg.me.eventEmitter:addEventListener(EventConst.ON_PLAYER_SWITCH_CONTROL_ALL_CLIENT, self._playerSwitchControlCallback)
	end

	self.logger:info("[WorldRaceThunderCloud] sandboxReady", self.id)
end

function RacingDungeonThunderCloud:getInteractionListData()
	return nil
end

function RacingDungeonThunderCloud:_isLinkedRequiredPet()
	local player = pg.me

	if not player or not player.isControllingPet or not player:isControllingPet() then
		return false
	end

	local pet = player.getCurPetEntity and player:getCurPetEntity()

	if not pet or not pet.getConfigData then
		return false
	end

	local requiredPetPrototypeIds = self:getMajorConfig().requiredPetPrototypeId
	local petConfig = pet:getConfigData()

	if not Utils.isTable(requiredPetPrototypeIds) or not petConfig then
		return false
	end

	local petPrototypeId = tonumber(petConfig.petPrototypeId) or 0

	return petPrototypeId > 0 and table.contains(requiredPetPrototypeIds, petPrototypeId)
end

function RacingDungeonThunderCloud:_canBeginThunderCloud()
	local state = self.syncInfo and self.syncInfo.state

	return self._isInTrigger and not self.requestPending and state == WorldRaceDungeonConst.THUNDER_CLOUD_GROUP_STATE.READY and self:_isLinkedRequiredPet()
end

function RacingDungeonThunderCloud:_tryBeginThunderCloud()
	local canBegin = self:_canBeginThunderCloud()

	if self._isInTrigger then
		self.logger:info("[WorldRaceThunderCloud] tryBegin", self.id, canBegin)
	end

	if not canBegin then
		return false
	end

	self.requestPending = true

	self.logger:info("[WorldRaceThunderCloud] requestSent", self.id)
	self:serverMsg("RPC_CS_TryBeginThunderCloud")

	return true
end

function RacingDungeonThunderCloud:enterTrigger(actorId)
	if not pg.me or not pg.pawn or actorId ~= pg.pawn.actorId then
		return false
	end

	self._isInTrigger = true

	self.logger:info("[WorldRaceThunderCloud] triggerEnter", self.id)

	return self:_tryBeginThunderCloud()
end

function RacingDungeonThunderCloud:exitTrigger(actorId)
	if not pg.me or not pg.pawn or actorId ~= pg.pawn.actorId then
		return false
	end

	self._isInTrigger = false

	self.logger:info("[WorldRaceThunderCloud] triggerLeave", self.id)

	return true
end

function RacingDungeonThunderCloud:onLevelItemValueChange(key, oldValue, value)
	if key ~= "state" then
		return
	end

	self.logger:info("[WorldRaceThunderCloud] stateChanged", self.id, oldValue, value)

	self.requestPending = false

	self:_tryBeginThunderCloud()
end

function RacingDungeonThunderCloud:RPC_SC_TryBeginThunderCloudResult()
	self.logger:info("[WorldRaceThunderCloud] requestResult", self.id)

	self.requestPending = false
end

function RacingDungeonThunderCloud:destroy()
	if self._playerSwitchControlCallback and pg.me and pg.me.eventEmitter then
		pg.me.eventEmitter:removeEventListener(EventConst.ON_PLAYER_SWITCH_CONTROL_ALL_CLIENT, self._playerSwitchControlCallback)
	end

	self._playerSwitchControlCallback = nil
	self._isInTrigger = false
	self.requestPending = false

	RacingDungeonThunderCloud.super.destroy(self)
end

return RacingDungeonThunderCloud
