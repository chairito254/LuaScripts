-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\FriendInviteList\\FriendInviteListCtrl.lua

local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local FriendInviteListCtrl = Class.LightClass("FriendInviteListCtrl", UICtrl)
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Time = require("Core.Common.Time")

FriendInviteListCtrl.messages = {
	[MessageName.TEAM_INVITE_NOTICES_CHANGED] = {
		"refreshInviteList"
	}
}

function FriendInviteListCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.noticeLists = info
	self.itemLineDelay = 0.015

	self:initInviteList(info)
end

function FriendInviteListCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		self:dismiss()
	end

	function self.view.btnCancelUButton.luaClick()
		self:dismiss()
	end

	function self.view.btnConfirmUButton.luaClick()
		local removeIds = {}

		for _, item in ipairs(self.noticeLists) do
			local pending = false

			if item.btnNoFunc then
				local result = item.btnNoFunc()

				pending = result == false and item.extraParam and item.extraParam.isVehicleRide
			else
				pg.me:acceptTeamInvite(item.playerId, false)
			end

			if not pending then
				removeIds[#removeIds + 1] = item.noticeId
			end
		end

		for _, noticeId in ipairs(removeIds) do
			pg.global.ui.tips:removeTeamInviteNotice(noticeId)
		end

		self:dismiss()
	end
end

function FriendInviteListCtrl:initInviteList()
	function self.view.listUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local progress = objectReference:GetRefValue("progressUProgress")
		local btnNoUButton = objectReference:GetRefValue("btnNoUButton")
		local btnYesUButton = objectReference:GetRefValue("btnYesUButton")
		local playerNameUText = objectReference:GetRefValue("playerNameUText")
		local noticeUText = objectReference:GetRefValue("noticeUText")
		local vxParTransform = objectReference:GetRefValue("vxParTransform")

		progress.minValue = 0
		progress.maxValue = data.duration

		self:refreshInviteTime(button, data)

		function btnNoUButton.luaClick()
			if data.btnNoFunc then
				local result = data.btnNoFunc()

				if result == false and data.extraParam and data.extraParam.isVehicleRide then
					return
				end
			else
				pg.me:acceptTeamInvite(data.playerId, false)
			end

			pg.global.ui.tips:removeTeamInviteNotice(data.noticeId)
			self:refreshInviteList()
		end

		function btnYesUButton.luaClick()
			if data.btnYesFunc then
				local result = data.btnYesFunc()

				if result == false and data.extraParam and data.extraParam.isVehicleRide then
					return
				end
			else
				pg.me:acceptTeamInvite(data.playerId, true)
			end

			pg.global.ui.tips:removeTeamInviteNotice(data.noticeId)
			self:refreshInviteList()
		end

		local playerName = LuaUIUtils.getPlayerDisplayName(data.playerId, data.playerInfo.playerName, true)
		local _h = FriendInviteListCtrl._platformHooks

		playerName = _h and _h.renderInvitePlayerName and _h.renderInvitePlayerName(self, button, data, playerName) or playerName

		ClientTextUtils.setText(playerNameUText, playerName)
		ClientTextUtils.setText(noticeUText, data.noticeMsg or "")
	end

	self:refreshInviteList()

	local _h = FriendInviteListCtrl._platformHooks

	if _h and _h.initInviteList then
		_h.initInviteList(self)
	end
end

function FriendInviteListCtrl:playListAni()
	local buttons = self.view.listUList:GetAllButtons()
	local delayTime = 0

	for i = 0, buttons.Length - 1 do
		local ani = buttons[i]:GetComponent("Animation")

		self:startTimer(function()
			ani:Play()
		end, delayTime)

		delayTime = delayTime + self.itemLineDelay
	end
end

function FriendInviteListCtrl:refreshInviteList()
	self.view.listUList:SetList(self.noticeLists)
end

function FriendInviteListCtrl:refreshInviteTime(button, data)
	local refs = button:GetComponent("ObjectReference")

	if data.expireAt then
		data.remainderTime = math.max(0, data.expireAt - Time.secondCache)
	end

	local request = data.extraParam and data.extraParam.rideRequest
	local enabled = not request or not request.submitted and data.remainderTime > 0

	refs:GetRefValue("btnNoUButton").interactable = enabled
	refs:GetRefValue("btnYesUButton").interactable = enabled
	refs:GetRefValue("progressUProgress").value = data.remainderTime

	LuaUIUtils.setUIViewVisible(refs:GetRefValue("vxParTransform"), data.remainderTime > 0 and data.remainderTime < data.duration)
end

function FriendInviteListCtrl:refreshInviteTimers()
	local list = self.view.listUList
	local buttons = list:GetAllButtons()
	local expired = false
	local now = Time.secondCache

	for index = 0, buttons.Length - 1 do
		local button = buttons[index]
		local data = list:GetData(button)

		if data then
			self:refreshInviteTime(button, data)

			if data.expireAt and now >= data.expireAt then
				expired = true
			end
		end
	end

	if expired then
		pg.global.ui.tips:refreshTeamInviteNotices()
	end
end

function FriendInviteListCtrl:onDestroy()
	self:onHide()
	UICtrl.onDestroy(self)
end

function FriendInviteListCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
end

function FriendInviteListCtrl:onShow()
	pg.global.ui.tips:refreshTeamInviteNotices()
	self:refreshInviteList()

	if not self.timeTrigger then
		self.timeTrigger = self:startTimer(function()
			self:refreshInviteTimers()
		end, 0.1, true)
	end
end

function FriendInviteListCtrl:onHide()
	if self.timeTrigger then
		self:killTimer(self.timeTrigger)

		self.timeTrigger = nil
	end
end

return FriendInviteListCtrl
