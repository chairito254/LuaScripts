-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\RacingDungeonGoldCoin.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local RacingDungeonGoldCoin = Class.LightClass("Sandbox.RacingDungeonGoldCoin", LevelItem)

function RacingDungeonGoldCoin:onSandboxReady()
	RacingDungeonGoldCoin.super.onSandboxReady(self)
	self:applyState()
end

function RacingDungeonGoldCoin:onRacingDungeonPlayerEnter(actorId)
	local space = self.sandbox and self.sandbox.space

	if not pg or not pg.me or not pg.pawn or actorId ~= pg.pawn.actorId or not space or not space:isRacingDungeon() then
		return false
	end

	if not self.syncInfo or self.syncInfo.state ~= WorldRaceDungeonConst.GOLD_COIN_STATE.READY then
		return false
	end

	self:serverMsg("RPC_CS_TryPickupCoins")

	return true
end

function RacingDungeonGoldCoin:onLevelItemValueChange(key, oldValue, value)
	RacingDungeonGoldCoin.super.onLevelItemValueChange(self, key, oldValue, value)

	if key == "state" and oldValue ~= value then
		self:applyState()
	end
end

function RacingDungeonGoldCoin:applyState()
	local isReady = self.syncInfo and self.syncInfo.state == WorldRaceDungeonConst.GOLD_COIN_STATE.READY

	self:setIsActive(isReady == true)
end

return RacingDungeonGoldCoin
