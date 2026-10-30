-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\StateInteractor.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local StateInteractor = Class.LightClass("Sandbox.StateInteractor", LevelItem)

function StateInteractor:ctor(sandbox, spawnInfo, syncInfo)
	StateInteractor.super.ctor(self, sandbox, spawnInfo, syncInfo)
end

return StateInteractor
