-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\BubbleBarrier.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local SandboxConst = require("Common.Const.SandboxConst")
local BubbleBarrier = Class.LightClass("BubbleBarrier", LevelItem)

function BubbleBarrier:ctor(sandbox, spawnInfo, syncInfo)
	BubbleBarrier.super.ctor(self, sandbox, spawnInfo, syncInfo)
end

function BubbleBarrier:onBubbleHit(actorId)
	self:sendSandboxEvent(SandboxConst.EVENT_TYPE.BUBBLE_BARRIER_HIT)
end

function BubbleBarrier:onBubbleEnter(actorId)
	self:sendSandboxEvent(SandboxConst.EVENT_TYPE.BUBBLE_BARRIER_ENTER)
end

function BubbleBarrier:onBubbleLeave(actorId)
	self:sendSandboxEvent(SandboxConst.EVENT_TYPE.BUBBLE_BARRIER_LEAVE)
end

function BubbleBarrier:destroy()
	BubbleBarrier.super.destroy(self)
end

return BubbleBarrier
