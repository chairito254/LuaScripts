-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\SequelElevator.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local SequelElevator = Class.LightClass("SequelElevator", LevelItem)
local ClientConst = require("Const.ClientConst")
local SandboxConst = require("Common.Const.SandboxConst")
local Time = require("Core.Common.Time")

function SequelElevator:ctor(sandbox, spawnInfo, syncInfo)
	SequelElevator.super.ctor(self, sandbox, spawnInfo, syncInfo)
end

function SequelElevator:onSandboxReady()
	return
end

function SequelElevator:destroy()
	SequelElevator.super.destroy(self)
end

return SequelElevator
