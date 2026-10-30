-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\PetManage\\PetBalanceResetRequester.lua

local Class = require("Core.Framework.Class")
local TimerManager = require("Core.Timer.TimerManager")
local NoticeDef = require("Common.NoticeDef")
local PetBalanceResetSession = require("Common.Utils.PetBalanceResetSession")
local PetBalanceResetText = require("Utils.PetBalanceResetText")
local RESULT_TIMEOUT_SECONDS = 8
local PetBalanceResetRequester = Class.LiteClass("PetBalanceResetRequester")

function PetBalanceResetRequester:ctor(owner)
	self.owner = owner
	self.session = PetBalanceResetSession.new()
	self.timerId = nil
end

function PetBalanceResetRequester:isIdle()
	return self.session:isIdle()
end

function PetBalanceResetRequester:request(petId)
	local queued, reason = self.session:tryQueue(petId)

	if not queued then
		return false, reason
	end

	local player = pg.me

	if not player or player.destroyed or not player.server or not player.serverMsg then
		self.session:abortSend()

		return false, "unavailable"
	end

	self:_stopTimer()

	self.timerId = TimerManager.addTimer(RESULT_TIMEOUT_SECONDS, function()
		self.timerId = nil

		if self.session:timeout() and pg.global and pg.global.showBubbleMessageRaw then
			pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_RESULT_PENDING"), 2)
		end
	end)

	player:serverMsg("RPC_CS_PetBalanceReset", petId)

	return true
end

function PetBalanceResetRequester:onResult(player, petId, noticeId)
	if player ~= pg.me then
		return false
	end

	local accepted, outcome = self.session:complete(petId, noticeId, NoticeDef.SUCCESS)

	if not accepted then
		return false
	end

	self:_stopTimer()

	if outcome == "success" and pg.global and pg.global.showBubbleMessageRaw then
		pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_SUCCESS"), 2)
	end

	return true
end

function PetBalanceResetRequester:clear()
	self:_stopTimer()
	self.session:clear()
end

function PetBalanceResetRequester:_stopTimer()
	if not self.timerId then
		return
	end

	TimerManager.removeTimer(self.timerId)

	self.timerId = nil
end

return PetBalanceResetRequester
