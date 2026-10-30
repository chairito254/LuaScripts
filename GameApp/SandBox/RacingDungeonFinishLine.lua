-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\RacingDungeonFinishLine.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local DungeonConst = require("Common.Const.DungeonConst")
local RacingDungeonFinishLine = Class.LightClass("Sandbox.RacingDungeonFinishLine", LevelItem)

function RacingDungeonFinishLine:onRacingDungeonFinishPlayerEnter(actorId)
	local space = self.sandbox and self.sandbox.space

	if not pg or not pg.me or not pg.pawn or actorId ~= pg.pawn.actorId or not space or not space:isRacingDungeon() or space.status ~= DungeonConst.STATUS.PLAYING then
		return false
	end

	self:serverMsg("RPC_CS_TryFinish")

	return true
end

return RacingDungeonFinishLine
