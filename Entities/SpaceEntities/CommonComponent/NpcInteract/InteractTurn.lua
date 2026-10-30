-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\NpcInteract\\InteractTurn.lua

local AIUtils = require("Common.Utils.AIUtils")
local AiConst = require("Common.Const.AiConst")
local UIConst = require("Const.UIConst")
local Utils = require("Common.Utils.Utils")
local PlayableConst = require("Common.Const.PlayableConst")
local InteractTurn = {}

function InteractTurn:onInteractRotationRecovered()
	if not self.isInInteractTurnAnim then
		return
	end

	self.recoverInteractRotationTimer = nil
	self.isInInteractTurnAnim = nil

	if not Utils.isNpc(self) then
		self:playDefaultAnimation(true)
	end

	AIUtils.ResumeAI(self.id, AiConst.PauseBtReason.DialogueControl)
	pg.global.ui.interact:setUIHide(UIConst.UI_HIDE_KEY.Dialogue, false)
end

function InteractTurn:startInteractTurnTimer(npcTurnTime)
	if self.recoverInteractRotationTimer ~= nil then
		self:removeTimer(self.recoverInteractRotationTimer)

		self.recoverInteractRotationTimer = nil
	end

	self.isInInteractTurnAnim = true
	self.recoverInteractRotationTimer = self:addTimer(npcTurnTime, function()
		InteractTurn.onInteractRotationRecovered(self)
	end)
end

return InteractTurn
