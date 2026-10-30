-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Utils\\GrabEggsReviveUtils.lua

local Time = require("Core.Common.Time")
local ClientTextUtils = require("Utils.ClientTextUtils")
local GrabEggsReviveUtils = {}

function GrabEggsReviveUtils.setVisible(widget, visible)
	if NotNil(widget) then
		widget:SetActiveFastest(visible, true)
	end
end

function GrabEggsReviveUtils.stop(countDown)
	if IsNil(countDown) then
		return
	end

	countDown:Stop()

	countDown.onGetBaseText = nil
	countDown.luaCountDownUpdate = nil
	countDown.luaFinished = nil
end

function GrabEggsReviveUtils.play(countDown, textWidget, space, onUpdate)
	GrabEggsReviveUtils.stop(countDown)

	if IsNil(countDown) then
		return
	end

	local displaySecond

	local function getRemain()
		local endTime, interval = space:getRobEggPvpReviveTime()

		return endTime and math.max(0, endTime - Time.secondCache) or 0, interval
	end

	local function getRemainSecond()
		local remain = getRemain()

		return remain > 0 and math.ceil(remain) or 0
	end

	local function refreshText(second)
		if displaySecond ~= second then
			displaySecond = second

			ClientTextUtils.setText(textWidget, tostring(second))
		end
	end

	local function refresh()
		local second = getRemainSecond()

		refreshText(second)

		if onUpdate then
			onUpdate(second)
		end
	end

	countDown.useGameTime = false
	countDown.positiveTiming = false

	function countDown.onGetBaseText()
		return tostring(getRemainSecond())
	end

	function countDown.luaCountDownUpdate()
		refresh()
	end

	local function playCurrentWave()
		local remain, interval = getRemain()

		if interval then
			countDown:Play(remain, interval)
		else
			GrabEggsReviveUtils.stop(countDown)
			countDown:Reset(0, 1)
		end

		refresh()
	end

	countDown.luaFinished = playCurrentWave

	playCurrentWave()
end

return GrabEggsReviveUtils
