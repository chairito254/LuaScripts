-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\PetBalanceResetSession.lua

local PetBalanceResetSession = {}

function PetBalanceResetSession.new()
	return setmetatable({
		state = "idle"
	}, {
		__index = PetBalanceResetSession
	})
end

function PetBalanceResetSession:tryQueue(petId)
	if self.state ~= "idle" then
		return false, "busy"
	end

	if type(petId) ~= "string" or petId == "" then
		return false, "invalid"
	end

	self.state = "queued"
	self.petId = petId

	return true
end

function PetBalanceResetSession:abortSend()
	if self.state ~= "queued" then
		return false
	end

	self.state = "idle"
	self.petId = nil

	return true
end

function PetBalanceResetSession:timeout()
	if self.state ~= "queued" then
		return false
	end

	self.state = "uncertain"

	return true
end

function PetBalanceResetSession:complete(petId, noticeId, successNoticeId)
	if self.state ~= "queued" and self.state ~= "uncertain" then
		return false
	end

	if petId ~= self.petId then
		return false
	end

	local outcome = "failed"

	if noticeId == successNoticeId then
		outcome = "success"
	end

	self.state = "idle"
	self.petId = nil

	return true, outcome
end

function PetBalanceResetSession:clear()
	self.state = "idle"
	self.petId = nil
end

function PetBalanceResetSession:isIdle()
	return self.state == "idle"
end

return PetBalanceResetSession
