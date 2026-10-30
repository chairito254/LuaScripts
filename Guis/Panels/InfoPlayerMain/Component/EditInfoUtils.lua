-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\InfoPlayerMain\\Component\\EditInfoUtils.lua

local EditInfoUtils = {}
local Time = require("Core.Common.Time")
local UIConst = require("Const.UIConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local MIN_COUNT_DOWN_SECOND = 1

function EditInfoUtils.getTimeLeft(endTime)
	endTime = tonumber(endTime) or 0

	if endTime <= 0 then
		return nil
	end

	return endTime - Time.getSecond()
end

function EditInfoUtils.isExpired(endTime)
	local timeLeft = EditInfoUtils.getTimeLeft(endTime)

	return timeLeft ~= nil and timeLeft < MIN_COUNT_DOWN_SECOND
end

function EditInfoUtils.setConfirmButtonExpired(owner)
	local btnConfirm = owner and owner.btnConfirm

	if not btnConfirm then
		return
	end

	if owner.usingUWidget then
		owner.usingUWidget:SetActive(false)
	end

	btnConfirm:SetActive(true)
	btnConfirm:TryChangePage("IconState", 0)
	btnConfirm:TryChangePage("button", 4)

	btnConfirm.interactable = false

	ClientTextUtils.setText(owner.btnConfirmText, pg.getGameString("EXPIRED"))

	if owner.getWayBottomText then
		owner.getWayBottomText:SetActive(false)
	end
end

function EditInfoUtils.playCountDown(countDown, endTime, isTotalTime, endCb)
	if not countDown then
		return
	end

	local remainTime = EditInfoUtils.getTimeLeft(endTime)

	if not remainTime or remainTime < MIN_COUNT_DOWN_SECOND then
		countDown.luaFinished = nil

		countDown:Stop(true)

		countDown.formatText = ""
		countDown.onGetBaseText = nil

		countDown:SetActive(false)

		return
	end

	local timeType = isTotalTime and UIConst.TimeType.Full or UIConst.TimeType.OneTime

	countDown:SetActive(true)

	function countDown.onGetBaseText(days, hours, minutes, seconds)
		local totalSeconds = days * 86400 + hours * 3600 + minutes * 60 + seconds

		if totalSeconds < 0 then
			return ""
		end

		return LuaUIUtils.getCountDownString(totalSeconds, timeType, true)
	end

	function countDown.luaFinished()
		countDown:SetActive(false)

		countDown.formatText = ""

		if endCb then
			endCb()
		end
	end

	countDown:Play(remainTime)
end

return EditInfoUtils
