-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\BatchRequest\\BatchRequestWaiting.lua

local Const = require("Common.Const.Const")
local Time = require("Core.Common.Time")
local UIConst = require("Const.UIConst")
local ClientUtils = require("Utils.ClientUtils")
local BatchRequestWaiting = {}
local waitingOwner

function BatchRequestWaiting.canOpen(ui)
	return waitingOwner == nil and not ui:checkUIOpen(UIConst.UI_ID_COMMON_WAITING)
end

function BatchRequestWaiting.isOwned(record)
	local ctrl = record.waitingUI and record.waitingUI.commonWaiting

	return ctrl and ctrl:isWaitingOwner(record.waitingToken) == true
end

function BatchRequestWaiting.close(record)
	if waitingOwner == record then
		waitingOwner = nil
	end

	ClientUtils.tryWithLogError(function()
		if BatchRequestWaiting.isOwned(record) then
			record.waitingUI:closeImmediately(UIConst.UI_ID_COMMON_WAITING)
		end
	end)
end

function BatchRequestWaiting.open(system, record, ui, text, onClosed)
	waitingOwner = record
	record.waitingUI = ui
	record.waitingToken = {}
	record.openDeadline = Time.getTickSecond() + Const.BATCH_REQUEST_UI_OPEN_TIMEOUT_SECONDS

	local ok = ClientUtils.tryWithLogError(function()
		ui:open(UIConst.UI_ID_COMMON_WAITING, {
			text = text or pg.getGameString(Const.BATCH_REQUEST_DEFAULT_WAITING_TEXT_KEY),
			waitingToken = record.waitingToken
		}, function()
			if system._active ~= record then
				BatchRequestWaiting.close(record)

				return
			end

			record.openCallbackReceived = true
		end, function()
			if onClosed then
				if system._active == record then
					onClosed()
				end
			elseif system._active == record then
				record.task:finish("waitingClosed")
			end
		end)
	end)

	if not ok then
		record.openFailed = true
	end
end

function BatchRequestWaiting.checkReady(record, now)
	if record.task.state == "ready" then
		if record.openFailed or now >= record.openDeadline then
			return false, "waitingUnavailable"
		end

		if not record.openCallbackReceived then
			return nil
		end

		if not BatchRequestWaiting.isOwned(record) or not record.waitingUI.commonWaiting:isWaitingReady() then
			return false, "waitingUnavailable"
		end
	elseif not BatchRequestWaiting.isOwned(record) then
		return false, "waitingClosed"
	end

	return true
end

return BatchRequestWaiting
