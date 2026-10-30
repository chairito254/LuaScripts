-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\SubComponents\\EcsPartSB.lua

local Class = require("Core.Framework.Class")
local SubComponent = require("GameApp.Sandbox.SubComponents.SubComponent")
local EcsPartSB = Class.LightClass("EcsPartSB", SubComponent)

function EcsPartSB:ctor(id, levelItem, info)
	EcsPartSB.super.ctor(self, id, levelItem, info)

	if not levelItem.ecsPart then
		levelItem.ecsPart = self

		local syncInfo = levelItem.syncInfo

		if syncInfo and syncInfo.ecsSyncObject then
			pg.game.ecs:registerSyncObject(syncInfo.ecsSyncObject, true)
		end
	end
end

return EcsPartSB
