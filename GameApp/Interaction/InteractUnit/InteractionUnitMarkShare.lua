-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Interaction\\InteractUnit\\InteractionUnitMarkShare.lua

local Class = require("Core.Framework.Class")
local InteractionUnitBase = require("GameApp.Interaction.InteractionUnitBase")
local InteractionUnitMarkShare = Class.LightClass("InteractionUnitMarkShare", InteractionUnitBase)

function InteractionUnitMarkShare:ctor(info, interactId)
	InteractionUnitMarkShare.super.ctor(self, info, interactId)

	self.interactFunc = info.interactFunc
	self.interactName = info.interactName
	self.isTip = info.isTip
end

function InteractionUnitMarkShare:canInteractive()
	if pg.me:isInCatchMode() then
		return false
	end

	if pg.space and not pg.space:canUseMediaMarker() then
		return false
	end

	return true
end

function InteractionUnitMarkShare:interactive()
	if pg.space and not pg.space:canUseMediaMarker() then
		return
	end

	if self.interactFunc then
		self.interactFunc()
	end
end

function InteractionUnitMarkShare:getText(interactData)
	return string.format(pg.getGameString("INFO_STAMP_NAME_FORMAT"), self.interactName) or ""
end

return InteractionUnitMarkShare
