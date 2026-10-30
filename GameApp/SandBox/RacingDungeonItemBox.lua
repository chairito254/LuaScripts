-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\RacingDungeonItemBox.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local RacingDungeonItemBox = Class.LightClass("Sandbox.RacingDungeonItemBox", LevelItem)

function RacingDungeonItemBox:onRacingDungeonPlayerEnter(actorId)
	local space = self.sandbox and self.sandbox.space

	if not pg or not pg.me or not pg.pawn or actorId ~= pg.pawn.actorId or not space or not space:isRacingDungeon() then
		return false
	end

	if not self.syncInfo or self.syncInfo.state ~= WorldRaceDungeonConst.BOX_STATE.READY then
		return false
	end

	self:serverMsg("RPC_CS_TryPickup")

	return true
end

return RacingDungeonItemBox
