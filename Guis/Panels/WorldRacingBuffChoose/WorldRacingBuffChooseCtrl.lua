-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRacingBuffChoose\\WorldRacingBuffChooseCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("WorldRacingBuffChooseCtrl")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local EventWorldRacingData = require("Data.event_world_racing_data")
local MessageName = require("Const.MessageName")
local NoticeDef = require("Common.NoticeDef")
local WorldRacingBuffChooseCtrl = Class.LightClass("WorldRacingBuffChooseCtrl", UICtrl)

WorldRacingBuffChooseCtrl.messages = {
	[MessageName.WORLD_RACE_SELECTED_BUFF_CHANGED] = {
		"refreshBuffState",
		true
	},
	[MessageName.WORLD_RACE_SELECT_BUFF_RESULT] = {
		"onSelectBuffResult",
		true
	},
	[MessageName.EVENT_CUR_PAGE_REFRESH] = {
		"refreshBuffState",
		true
	},
	[MessageName.PLAYER_LEVEL_CHANGE] = {
		"refreshBuffState",
		true
	},
	[MessageName.PLAYER_TITLE_CHANGE] = {
		"refreshBuffState",
		true
	}
}

function WorldRacingBuffChooseCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.pendingBuffId = nil
	self.buffList = nil

	local phase = info and info.eventPhase
	local activityConfig = EventWorldRacingData[phase]

	if not activityConfig then
		logger:error("onOpen: racing activity config not found, phase=%s", tostring(phase))
		self:dismiss()

		return
	end

	self.buffList = ClientActivityUtils.getWorldRaceBuffList(activityConfig)

	if not self.buffList then
		self:dismiss()

		return
	end

	self.selectedBuffId = self.buffList[1].buffId

	for _, entry in ipairs(self.buffList) do
		if entry.buffId == pg.me.racingSelectedBuffId then
			self.selectedBuffId = entry.buffId

			break
		end
	end

	ClientTextUtils.setText(self.view.tMPUSDFText, pg.getGameString("OPEN_WORLD_RACING_BUFF_TITLE"))
	ClientTextUtils.setText(self.view.selectTitleUBaseText, pg.getGameString("OPEN_WORLD_RACING_BUFF_TITLE_SELECT"))
	self.view.listTabUList.gameObject:SetActiveEx(false)
	self.view.btnInfoUButton.gameObject:SetActiveEx(false)
	self.view.listBuffUList:SetList(self.buffList)
	self:refreshBuffState()
end

function WorldRacingBuffChooseCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:dismiss()
	end

	function self.view.btnConfirmUButton.luaClick()
		self:confirmBuff()
	end

	function self.view.listBuffUList.luaRenderItem(button, index, data)
		self:renderBuffItem(button, data)
	end

	function self.view.listBuffUList.luaClick(button, data)
		self.selectedBuffId = data.buffId

		button:InvokeCallback(CS.XGUI.EInvokeTime.User1)
		self:refreshBuffState()
	end
end

function WorldRacingBuffChooseCtrl:renderBuffItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")

	objectReference:GetRefValue("iconUImage").url = data.config.icon

	ClientTextUtils.setText(objectReference:GetRefValue("nameUBaseText"), pg.getLocalizationText(data.config.buffName))

	local contentUScrollRect = objectReference:GetRefValue("contentUScrollRect")

	ClientTextUtils.setText(contentUScrollRect.content, pg.getLocalizationText(data.config.buffDesc))
	self:refreshBuffItemState(button, data)
end

function WorldRacingBuffChooseCtrl:refreshBuffItemState(button, data)
	button:SetSelected(data.buffId == self.selectedBuffId)

	local objectReference = button:GetComponent("ObjectReference")

	objectReference:GetRefValue("equippedPanelRectTransform").gameObject:SetActiveEx(data.buffId == pg.me.racingSelectedBuffId)
end

function WorldRacingBuffChooseCtrl:refreshBuffState()
	if not self.buffList then
		return
	end

	if self.pendingBuffId == pg.me.racingSelectedBuffId then
		self.pendingBuffId = nil
	end

	local equipped = self.selectedBuffId == pg.me.racingSelectedBuffId
	local canEquip = not equipped and self.pendingBuffId == nil and ActivityUtils.activityBaseCheck(ClientActivityUtils.getWorldRaceActivity()) == NoticeDef.SUCCESS

	ClientTextUtils.setText(self.view.confirmNameUBaseText, pg.getGameString(equipped and "OPEN_WORLD_RACING_BUFF_EQUIPPED" or "OPEN_WORLD_RACING_BUFF_EQUIP"))

	self.view.btnConfirmUButton.interactable = canEquip
	self.view.btnConfirmUButton.visualInteractable = canEquip

	for index, data in ipairs(self.buffList) do
		if self.selectedBuffId == data.buffId then
			self.selectedBuffIndex = index - 1
		end

		local exists, button = self.view.listBuffUList:TryGetChildAt(index - 1)

		if exists then
			self:refreshBuffItemState(button, data)
		end
	end

	return canEquip
end

function WorldRacingBuffChooseCtrl:confirmBuff()
	if not self:refreshBuffState() then
		return
	end

	self.pendingBuffId = self.selectedBuffId

	self:refreshBuffState()
	pg.me:selectWorldRaceBuff(self.selectedBuffId)
end

function WorldRacingBuffChooseCtrl:onSelectBuffResult(buffId, errno)
	if self.pendingBuffId ~= buffId then
		return
	end

	if errno ~= NoticeDef.SUCCESS then
		self.pendingBuffId = nil
	end

	self:refreshBuffState()
end

return WorldRacingBuffChooseCtrl
