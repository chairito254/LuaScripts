-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Spectate\\SpectateCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("SpectateModel")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local SpectateCtrl = Class.LightClass("SpectateCtrl", UICtrl)
local SpectateMinMapComponent = require("Guis.Panels.Spectate.Component.SpectateMinMapComponent")
local SpectateTeamInfoComponent = require("Guis.Panels.Spectate.Component.SpectateTeamInfoComponent")
local CommonSwitch = require("Common.CommonSwitch")
local UIConst = require("Const.UIConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientConst = require("Const.ClientConst")
local NoticeDef = require("Common.NoticeDef")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Time = require("Core.Common.Time")
local CommonConst = require("Common.Const.Const")
local GrabEggsReviveUtils = require("Guis.Utils.GrabEggsReviveUtils")
local SWITCH_PLAYER_CD = 0.5
local posImgMask = "$Img_Map_Mark_GrabEgg_Position%s.png"

SpectateCtrl.messages = {
	[MessageName.ON_OBSERVE_NUM_CHANGED] = {
		"refreshAllSpectateNumTxt",
		true
	},
	[MessageName.ON_OBSERVE_PLAYER_CHANGED] = {
		"on_switch_player",
		true
	},
	[MessageName.SYNC_TEAM_INFO] = {
		"refreshObserveInfo",
		true
	},
	[MessageName.TEAM_ENTER_DUNGEON] = {
		"refreshObserveInfo",
		true
	},
	[MessageName.INPUT_DEVICE_CHANGED] = {
		"onInputDeviceChanged",
		true
	},
	[MessageName.APP_FOCUS_CHANGED] = {
		"onAppFocusChanged",
		true
	},
	[MessageName.DUNGEON_STATE_CHANGE] = {
		"refreshReviveCountDown",
		true
	},
	[MessageName.GRAB_EGG_RELIVE_COUNT_DOWN_CHANGED] = {
		"refreshReviveCountDown",
		true
	}
}

function SpectateCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.sceneMode = UIConst.HUD_MODE.IN_TEAM
	self.minMapComponent = SpectateMinMapComponent.new(self)
	self.teamInfoComponent = SpectateTeamInfoComponent.new(self)
end

function SpectateCtrl:addListener()
	self:bindHotKeyPerform("Common/Cancel", function()
		self:exitSpectate()
	end, self.view.btnCloseUButton.gameObject)
	self:bindHotKeyPerform("Common/Confirm", function()
		self:openChat()
	end, self.view.btnChatPC.gameObject)
	self:bindHotKeyPerform("Hud/PetBallScroll", function(_, inputInfo)
		self:onScrollEvent(inputInfo)
	end)
	self:bindHotKeyPerform("Raw/GamepadSelect", function()
		self:openChat()
	end)
	self:bindHotKeyPerform("Raw/GamepadLeftShoulder", function()
		self:changePlayerPre()
	end)
	self:bindHotKeyPerform("Raw/GamepadRightShoulder", function()
		self:changePlayerNext()
	end)
	self:bindHotKeyPerform("Raw/GamepadButtonEast", function()
		self:exitSpectate()
	end)

	function self.view.btnCloseUButton.luaClick(button, index, data)
		self:exitSpectate()
	end

	function self.view.btnChat.luaClick(button, index, data)
		self:openChat()
	end

	function self.view.btnChatPC.luaClick(button, index, data)
		self:openChat()
	end

	function self.view.btnPrev.luaClick(button, index, data)
		self:changePlayerPre()
	end

	function self.view.btnNext.luaClick(button, index, data)
		self:changePlayerNext()
	end
end

function SpectateCtrl:onScrollEvent(inputInfo)
	if inputInfo.valueVec2.y < 0 then
		self:changePlayerNext()
	else
		self:changePlayerPre()
	end
end

function SpectateCtrl:isRobEggPvp()
	local me = pg.me

	return me and me.space and me.space.sceneId == CommonConst.ROB_EGG_SCENE_ID
end

function SpectateCtrl:isObservingRobEggPvpPoint()
	local me = pg.me

	return self:isRobEggPvp() and (not me.observeTargetUid or me.observeTargetUid == me.uid)
end

function SpectateCtrl:setKeyTips()
	local showSwitch = not self:isObservingRobEggPvpPoint()
	local keyList = {}

	if pg.game.input:isUsingGamepad() then
		if showSwitch then
			table.insert(keyList, {
				path = "Raw/GamepadLeftShoulder",
				label = pg.getGameString("DEATH_SPECTATE_SWITCH_TEAMMATE_UP")
			})
			table.insert(keyList, {
				path = "Raw/GamepadRightShoulder",
				label = pg.getGameString("DEATH_SPECTATE_SWITCH_TEAMMATE_DOWN")
			})
		end

		table.insert(keyList, {
			path = "Raw/GamepadButtonEast",
			label = pg.getGameString("DEATH_SPECTATE_ESC")
		})
	elseif pg.global.ui:runPlatformByPC() then
		if showSwitch then
			table.insert(keyList, {
				path = "Hud/PetBallScroll",
				label = pg.getGameString("DEATH_SPECTATE_SWITCH_TEAMMATE")
			})
		end

		table.insert(keyList, {
			path = "Common/Cancel",
			label = pg.getGameString("DEATH_SPECTATE_ESC")
		})
	elseif not self:isRobEggPvp() then
		return
	end

	LuaUIUtils.setKeyList(self.view.keyListUList, keyList)
end

function SpectateCtrl:onInputDeviceChanged(deviceType)
	self:setKeyTips()
	self:refreshCameraDragInput(self._curVisible)
end

function SpectateCtrl:refreshCameraDragInput(visible)
	local enabled = visible == true and pg.global.ui:runPlatformByMobile()
	local listener = self.view and self.view.cameraDragListener

	if enabled and not listener then
		listener = self.view:createCameraDragListener()

		function listener.luaDragUpdate(x, y)
			self:onCameraDragUpdate(x, y)
		end

		function listener.luaEndDrag()
			self:resetCameraDragInput()
		end
	end

	if NotNil(listener) then
		listener.gameObject:SetActiveEx(enabled)
	end

	if not enabled then
		self:resetCameraDragInput()
	end
end

function SpectateCtrl:onCameraDragUpdate(x, y)
	if not self._curVisible or not pg.global.ui:runPlatformByMobile() then
		self:resetCameraDragInput()

		return
	end

	self.cameraDragging = true

	if x ~= 0 or y ~= 0 then
		local playerCameraMode = pg.game.camera and pg.game.camera.playerCameraMode

		if playerCameraMode then
			playerCameraMode:onManualViewInput()
		end
	end

	pg.game.input:setViewAxisByFrameDeltaPixel(x, y)
end

function SpectateCtrl:resetCameraDragInput()
	if self.cameraDragging then
		self.cameraDragging = false

		pg.game.input:setViewAxisByDeltaPixel(0, 0)
	end
end

function SpectateCtrl:onAppFocusChanged(focus)
	if focus then
		return
	end

	local listener = self.view and self.view.cameraDragListener

	if NotNil(listener) and listener.enabled then
		listener.enabled = false
		listener.enabled = true
	end

	self:resetCameraDragInput()
end

function SpectateCtrl:onVisibleChange(visible)
	UICtrl.onVisibleChange(self, visible)
	self:refreshCameraDragInput(visible)
end

function SpectateCtrl:onHide()
	self:refreshCameraDragInput(false)
	UICtrl.onHide(self)
end

function SpectateCtrl:exitSpectate()
	local isRobEggPvp = self:isRobEggPvp() and pg.me.space.isPvp
	local params = {
		title = pg.getGameString("DEATH_SPECTATE_ESC_TITLE"),
		desc = pg.getGameString("DEATH_SPECTATE_ESC_TXT"),
		okCb = function()
			if isRobEggPvp then
				pg.me:leaveDungeonScene()
			else
				pg.me:exitObserverMode()
			end
		end
	}

	pg.global.ui:open(UIConst.UI_ID_COMMON_CONFIRM, params)
end

function SpectateCtrl:changePlayerPre()
	if not self:canChangePlayer() then
		return
	end

	pg.me:changeObservePlayer(false)
end

function SpectateCtrl:changePlayerNext()
	if not self:canChangePlayer() then
		return
	end

	pg.me:changeObservePlayer(true)
end

function SpectateCtrl:openChat()
	if not CommonSwitch.CHAT then
		pg.global.showBubbleMessage(NoticeDef.COMMON_SWITCH_CLOSE_TIP)

		return
	end

	if not pg.game:checkModuleEnable(ClientConst.ModuleKey.Chat) then
		return
	end

	if string.isNilOrEmpty(pg.me.worldChatGroupId) then
		return
	end

	pg.global.ui:open(UIConst.UI_ID_CHAT, nil, nil, nil, {
		ignoreDisableMainCamera = true
	})
end

function SpectateCtrl:refreshAllSpectateNumTxt(observerList)
	if not pg.me.observeTargetUid then
		return
	end

	local observes = {}
	local observeNum = 0

	if observerList then
		observes = observerList[pg.me.observeTargetUid] or {}
		observeNum = #observes
	elseif pg.me.space.observerList then
		observes = pg.me.space.observerList[pg.me.observeTargetUid] or {}
		observeNum = #observes
	end

	ClientTextUtils.setText(self.view.spectateMemberTxt, string.format(pg.getGameString("DEATH_SPECTATE_COUNT"), observeNum))
end

function SpectateCtrl:on_switch_player()
	self:refreshObserveInfo()

	if self.teamInfoComponent then
		self.teamInfoComponent:refreshTeamInfo()
	end

	if self.minMapComponent then
		self.minMapComponent:refreshTeamInfo()
	end

	self:refreshAllSpectateNumTxt()
end

function SpectateCtrl:refreshObserveInfo()
	if self:isRobEggPvp() then
		return self:refreshRobEggPvpObserveInfo()
	end

	local me = pg.me
	local uid = me and me.observeTargetUid

	if not uid then
		return false
	end

	local teamInfo = me:getCurTeamInfo()

	if not teamInfo or not teamInfo.sortList or not teamInfo.membersInfo then
		return false
	end

	local teamPlayers = self:parseTeamInfo(teamInfo)
	local posId

	for idx, id in ipairs(teamPlayers) do
		if id == uid then
			posId = idx

			break
		end
	end

	local memberInfo = teamInfo.membersInfo[uid]

	if not posId or not memberInfo or not memberInfo.playerName then
		return false
	end

	self:setImage(self.view.memberPosImg, string.format(posImgMask, posId))
	ClientTextUtils.setText(self.view.memberName, memberInfo.playerName)

	return true
end

function SpectateCtrl:refreshRobEggPvpObserveInfo()
	local showTarget = not self:isObservingRobEggPvpPoint()

	LuaUIUtils.setUIViewVisible(self.view.layoutNameUWidget, showTarget)
	LuaUIUtils.setUIViewVisible(self.view.btnPrev, showTarget)
	LuaUIUtils.setUIViewVisible(self.view.btnNext, showTarget)
	self:setKeyTips()

	local me = pg.me
	local uid = me and me.observeTargetUid
	local teamInfo = me and me:getCurTeamInfo()
	local memberInfo = uid and teamInfo and teamInfo.membersInfo and teamInfo.membersInfo[uid]
	local playerName = showTarget and memberInfo and memberInfo.playerName or nil

	ClientTextUtils.setText(self.view.memberName, playerName or "")

	local posId

	for idx, id in ipairs(self:parseTeamInfo(teamInfo)) do
		if showTarget and id == uid then
			posId = idx

			break
		end
	end

	LuaUIUtils.setUIViewVisible(self.view.memberPosImg, posId ~= nil)

	if posId then
		self:setImage(self.view.memberPosImg, string.format(posImgMask, posId))
	end

	return playerName ~= nil and playerName ~= ""
end

function SpectateCtrl:setImage(img, url)
	if url == nil or url == "" then
		return
	end

	if not img then
		return
	end

	if string.startsWith(url, "http") then
		img:SetTextureByUrl(url)
	else
		img.url = url
	end
end

function SpectateCtrl:parseTeamInfo(teamInfo)
	teamInfo = teamInfo or pg.me and pg.me:getCurTeamInfo()

	if not teamInfo or not teamInfo.sortList then
		return {}
	end

	local res = {}

	for i, uid in ipairs(teamInfo.sortList) do
		table.insert(res, uid)
	end

	return res
end

function SpectateCtrl:enterMistyForest(isEnter)
	if not self.view or not self.minMapComponent or not self.minMapComponent.miniMapUComponent then
		return
	end

	self.minMapComponent.miniMapUComponent:TryChangePage("MistyForest", isEnter and 1 or 0)
end

function SpectateCtrl:stopReviveCountDown()
	local countDown = self.view and self.view.countDownUCountDown

	GrabEggsReviveUtils.stop(countDown)
	GrabEggsReviveUtils.setVisible(self.view and self.view.countDownSingleUWidget, false)
end

function SpectateCtrl:refreshReviveCountDown()
	local space = pg.me and pg.me.space
	local endTime = space and space.getRobEggPvpReviveTime and space:getRobEggPvpReviveTime()

	self.reviveCountDownEndTime = self.reviveCountDownEndTime or endTime

	self:stopReviveCountDown()

	local visible = endTime ~= nil and Time.secondCache < self.reviveCountDownEndTime
	local countDown = self.view.countDownUCountDown

	GrabEggsReviveUtils.setVisible(countDown, visible)
	GrabEggsReviveUtils.setVisible(self.view.txtNameUSDFText, visible)
	GrabEggsReviveUtils.setVisible(self.view.txtTitleUSDFText, visible)

	if not visible or not countDown then
		return
	end

	ClientTextUtils.setText(self.view.txtTitleUSDFText, pg.getGameString("GRAB_EGG_PVP_REVIVE_TIME"))

	local single = self.view.countDownSingleUWidget
	local lastSecond

	GrabEggsReviveUtils.play(countDown, self.view.txtNameUSDFText, space, function(second)
		if Time.secondCache >= self.reviveCountDownEndTime then
			self:refreshReviveCountDown()

			return
		end

		local showSingle = NotNil(single) and second > 0 and second <= 3

		countDown.renderOpacity = showSingle and 0 or 1

		if lastSecond == second then
			return
		end

		lastSecond = second

		GrabEggsReviveUtils.setVisible(single, showSingle)

		if showSingle then
			ClientTextUtils.setText(self.view.countDownSingleNumber, tostring(second))
			ClientTextUtils.setText(self.view.countDownSingleBgNumber, tostring(second))
			single:InvokeCallback(CS.XGUI.EInvokeTime.User1)
		end
	end)
end

function SpectateCtrl:onDestroy()
	self:refreshCameraDragInput(false)

	local listener = self.view and self.view.cameraDragListener

	if NotNil(listener) then
		listener.luaDragUpdate = nil
		listener.luaEndDrag = nil
	end

	self:stopReviveCountDown()
	UICtrl.onDestroy(self)
end

function SpectateCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.reviveCountDownEndTime = nil

	self:refreshObserveInfo()
	self:refreshAllSpectateNumTxt()

	if not self:isRobEggPvp() then
		self:setKeyTips()
	end

	self:refreshReviveCountDown()
end

function SpectateCtrl:canChangePlayer()
	if self:isObservingRobEggPvpPoint() then
		return false
	end

	local now = Time.realSecondCache

	if self.lastChangePlayerTime and now - self.lastChangePlayerTime < SWITCH_PLAYER_CD then
		return false
	end

	self.lastChangePlayerTime = now

	return true
end

return SpectateCtrl
