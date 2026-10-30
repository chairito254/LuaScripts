-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\PaintFruitFieldCounter.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local PaintFruitFieldCounter = Class.LightClass("PaintFruitFieldCounter", LevelItem)

function PaintFruitFieldCounter:ctor(sandbox, spawnInfo, syncInfo)
	PaintFruitFieldCounter.super.ctor(self, sandbox, spawnInfo, syncInfo)
end

return PaintFruitFieldCounter
