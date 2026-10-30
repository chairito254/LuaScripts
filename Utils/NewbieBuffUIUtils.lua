-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\NewbieBuffUIUtils.lua

local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local Utils = require("Common.Utils.Utils")
local Time = require("Core.Common.Time")
local SysConfigData = require("Data.sys_config_data")
local NewbieBuffUIUtils = {}
local NEWBIE_BUFF_INSTANCE_ID = "__newbie_buff__"

function NewbieBuffUIUtils.setBuffInfo(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local numUBaseText = objectReference:GetRefValue("numUBaseText")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local countDownUCountDown = objectReference:GetRefValue("countDownUCountDown")

	ClientTextUtils.setText(numUBaseText, "")

	if iconUImage then
		iconUImage.url = nil
		iconUImage.url = data.icon
	end

	button:TryChangePage("Buff_Type", "Up")

	if countDownUCountDown then
		countDownUCountDown:Stop()
		LuaUIUtils.setUIViewVisible(countDownUCountDown, false)
	end
end

function NewbieBuffUIUtils.appendBuff(buffList, maxCount, player)
	local info = NewbieBuffUIUtils.getBuffInfo(player)
	local index = NewbieBuffUIUtils.findBuffIndex(buffList)

	if not info then
		if index > 0 then
			table.remove(buffList, index)
		end

		return
	end

	if index > 0 then
		table.remove(buffList, index)

		buffList[#buffList + 1] = info

		return
	end

	if maxCount and maxCount <= 0 then
		return
	end

	if maxCount and maxCount <= #buffList then
		buffList[#buffList] = nil
	end

	buffList[#buffList + 1] = info
end

function NewbieBuffUIUtils.findBuffIndex(buffList)
	if not buffList then
		return 0
	end

	for i, info in ipairs(buffList) do
		if info.instanceId == NEWBIE_BUFF_INSTANCE_ID then
			return i
		end
	end

	return 0
end

function NewbieBuffUIUtils.getBuffInfo(player)
	local isBuffEnabled = Utils.isNewbieBuffEnabled(player)

	if not isBuffEnabled or not NewbieBuffUIUtils.isBuffSceneEnabled(player) then
		return nil
	end

	local isSelfEnabled = Utils.isNewbieBuffSelfEnabled(player)
	local buffTime = SysConfigData.newbie_buff_time
	local buffEndTime
	local sourceName = ""

	if isSelfEnabled then
		buffEndTime = player.newbieBuffLastTriggerTime + buffTime
	else
		buffEndTime = player.teamInfo.newbieBuffMaxEndTime
		sourceName = NewbieBuffUIUtils.getSourceName(player.teamInfo)
	end

	return {
		templateId = 0,
		isNewbieBuff = true,
		hideCountDown = true,
		isDisplayed = true,
		instanceId = NEWBIE_BUFF_INSTANCE_ID,
		icon = SysConfigData.newbie_buff_icon,
		duration = buffTime,
		expiredTime = buffEndTime,
		showOrder = -math.huge,
		sourceType = isSelfEnabled and 1 or 0,
		sourceName = sourceName
	}
end

function NewbieBuffUIUtils.isBuffSceneEnabled(player)
	local space = player and player.space

	if not space then
		return false
	end

	local spaceType = Utils.getSpaceType(space.sceneId)

	return not Utils.isSpaceDungeon(spaceType) and not Utils.isSpaceSpecialBattleMode(space)
end

function NewbieBuffUIUtils.getSourceName(teamInfo)
	local now = Time.secondCache or 0
	local sourceNames = {}

	for _, uid in ipairs(teamInfo.sortList) do
		local member = teamInfo.membersInfo[uid]
		local endTime = tonumber(member.newbieBuffEndTime)

		if endTime and now < endTime then
			sourceNames[#sourceNames + 1] = member.playerName
		end
	end

	return table.concat(sourceNames, pg.getGameString("INTERVAL_SYMBOL"))
end

function NewbieBuffUIUtils.watch(uiComp)
	uiComp.newbieBuffInfo = NewbieBuffUIUtils.getBuffInfo(pg.me)

	if uiComp.newbieBuffRefreshTimer then
		return
	end

	local function refreshBuffInfo()
		local info = NewbieBuffUIUtils.getBuffInfo(pg.me)

		if NewbieBuffUIUtils.isInfoChanged(uiComp.newbieBuffInfo, info) then
			uiComp.newbieBuffInfo = info

			uiComp:refreshBuff(uiComp.curBuffPawn)
		end
	end

	uiComp.newbieBuffRefreshTimer = uiComp:startTimer(refreshBuffInfo, 1, true)
end

function NewbieBuffUIUtils.isInfoChanged(oldInfo, newInfo)
	if not oldInfo or not newInfo then
		return oldInfo ~= newInfo
	end

	return oldInfo.expiredTime ~= newInfo.expiredTime or oldInfo.sourceType ~= newInfo.sourceType or oldInfo.sourceName ~= newInfo.sourceName
end

function NewbieBuffUIUtils.isNewbieBuffInfo(buffInfo)
	return buffInfo and buffInfo.isNewbieBuff == true
end

return NewbieBuffUIUtils
