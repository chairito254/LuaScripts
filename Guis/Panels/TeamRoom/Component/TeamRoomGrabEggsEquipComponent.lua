-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TeamRoom\\Component\\TeamRoomGrabEggsEquipComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local UIConst = require("Const.UIConst")
local HotkeyConst = require("Const.HotkeyConst")
local Const = require("Common.Const.Const")
local MessageName = require("Const.MessageName")
local GrabEggsRankUtils = require("Guis.Utils.GrabEggsRankUtils")
local TeamRoomGrabEggsEquipComponent = Class.LightClass("TeamRoomGrabEggsEquipComponent", UIComponent)
local NOVICE_PROTECTION_TEAM_TEXT_KEY = "GRAB_EGG_NOVICEPROTECTION_TEAM"
local GRAB_EGGS_FAIR_PLAY_NOTICE_TEXT_KEY = "GRAB_EGG_PVP_TXT_4"
local GRAB_EGGS_SHARED_REWARD_NOTICE_TEXT_KEY = "GRAB_EGG_PVP_TXT_5"
local MAX_NOTICE_COUNT = 2
local NOTICE_LONG_DISPLAY_SECONDS = 5

TeamRoomGrabEggsEquipComponent.messages = {
	[MessageName.SYNC_TEAM_INFO] = {
		"refreshVisible",
		true
	},
	[MessageName.TEAM_MATCHED_STATUS_CHANGE] = {
		"refreshVisible",
		true
	},
	[MessageName.TEAM_MATCH_START_TIME_CHANGE] = {
		"refreshVisible"
	},
	[MessageName.TEAM_ENTER_MEMBER_AGREE_CHANGE] = {
		"refreshVisible",
		true
	},
	[MessageName.TEAM_PUSH_GO_READY_ROOM] = {
		"refreshVisible",
		true
	},
	[MessageName.TEAM_MATCH_ENTRY_INTERACTABLE_CHANGE] = {
		"refreshVisible",
		true
	},
	[MessageName.GRAB_EGG_NOVICE_PROTECTION_CHANGED] = {
		"refreshGrabEggsNotices",
		true
	},
	[MessageName.GRAB_EGG_RANK_CHANGED] = {
		"refreshGrabEggsNotices",
		true
	}
}

function TeamRoomGrabEggsEquipComponent:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnStore = objectReference:GetRefValue("btnStoreUButton")
	self.btnEquip = objectReference:GetRefValue("btnEquipUButton")
	self.noticeToastItem1UButton = objectReference:GetRefValue("noticeToastItem1UButton")
	self.noticeToastItem2UButton = objectReference:GetRefValue("noticeToastItem2UButton")

	local noticeObjectReference1 = self.noticeToastItem1UButton.transform:GetComponent("ObjectReference")

	self.noticeToastItem1TextUSDFText = noticeObjectReference1:GetRefValue("textUSDFText")
	self.noticeToastItem1Text2USDFText = noticeObjectReference1:GetRefValue("text2USDFText")
	self.noticeToastItem1TextUSDFText.supportRichText = true
	self.noticeToastItem1Text2USDFText.supportRichText = true

	local noticeObjectReference2 = self.noticeToastItem2UButton.transform:GetComponent("ObjectReference")

	self.noticeToastItem2TextUSDFText = noticeObjectReference2:GetRefValue("textUSDFText")
	self.noticeToastItem2Text2USDFText = noticeObjectReference2:GetRefValue("text2USDFText")
	self.noticeToastItem2TextUSDFText.supportRichText = true
	self.noticeToastItem2Text2USDFText.supportRichText = true
	self.noticeStates = {}

	self:initNoticeAnimation(self.noticeToastItem1UButton)
	self:initNoticeAnimation(self.noticeToastItem2UButton)
end

function TeamRoomGrabEggsEquipComponent:initNoticeAnimation(button)
	for _, widget in ipairs({
		button,
		button:GetChild("Long"),
		button:GetChild("Short")
	}) do
		if NotNil(widget.anim) then
			widget.anim.playAutomatically = false

			widget.anim:Stop()
		end
	end
end

function TeamRoomGrabEggsEquipComponent:setNoticePage(button, page)
	local isLong = page == "Long"

	button:TryChangePage("State", page, isLong, true, not isLong)

	if isLong then
		button:GetChild("Long"):RefreshActiveCtrl()
		button:GetChild("Short"):RefreshActiveCtrl()
	end

	local animation = button:GetChild(page).anim

	if NotNil(animation) then
		animation:Stop()
		animation:Play()
	end
end

function TeamRoomGrabEggsEquipComponent:clearNotice(button)
	local notice = self.noticeStates[button]

	if notice then
		self:killTimer(notice.timerId)

		notice.timerId = nil
		self.noticeStates[button] = nil
	end
end

function TeamRoomGrabEggsEquipComponent:clearNotices()
	for button in pairs(self.noticeStates) do
		self:clearNotice(button)
	end
end

function TeamRoomGrabEggsEquipComponent:registerObjects()
	function self.btnEquip.luaClick()
		self:onBtnEquip()
	end

	function self.btnStore.luaClick()
		self:onBtnStore()
	end
end

function TeamRoomGrabEggsEquipComponent:initView()
	self:setButtonName(self.btnStore, "GRAB_EGG_BTN_STORE")
	self:setButtonName(self.btnEquip, "GRAB_EGG_BTN_EQUIP")
	self:setButtonHotkey(self.btnStore, HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadStart)
	self:setButtonHotkey(self.btnEquip, HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonSouth)
	self:refreshVisible()
end

function TeamRoomGrabEggsEquipComponent:onShow()
	self:refreshVisible()
end

function TeamRoomGrabEggsEquipComponent:onHide()
	self:clearNotices()
end

function TeamRoomGrabEggsEquipComponent:onVisibleChange(visible)
	if visible then
		self:refreshVisible()
	else
		self:onHide()
	end
end

function TeamRoomGrabEggsEquipComponent:onDestroy()
	self:clearNotices()

	self.noticeStates = nil
end

function TeamRoomGrabEggsEquipComponent:setButtonName(button, key)
	local objectReference = button.transform:GetComponent("ObjectReference")
	local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")

	ClientTextUtils.setText(txtNameUBaseText, pg.getGameString(key))
end

function TeamRoomGrabEggsEquipComponent:setButtonHotkey(button, path)
	local objectReference = button.transform:GetComponent("ObjectReference")
	local keyHotKeyContent = objectReference:GetRefValue("keyHotKeyContent")

	keyHotKeyContent:SetHotKeyPaths(path)
end

function TeamRoomGrabEggsEquipComponent:onBtnEquip()
	pg.global.ui:open(UIConst.UI_ID_GRAB_EGGS_BAG, {
		bagType = UIConst.GRAB_EGG_BAG_TYPE.INVENTORY
	})
end

function TeamRoomGrabEggsEquipComponent:onBtnStore()
	if LuaUIUtils.checkFuncTemporaryDisable(UIConst.UI_ID_SHOP_MAIN) then
		return
	end

	pg.global.ui:open(UIConst.UI_ID_SHOP_MAIN, {
		shopTags = {
			35
		}
	})
end

function TeamRoomGrabEggsEquipComponent:setNoticeText(button, textComponent, textComponent2, notice)
	if not notice then
		self:clearNotice(button)
		button:SetActive(false)

		return
	end

	ClientTextUtils.setText(textComponent, notice.shortText)
	ClientTextUtils.setText(textComponent2, notice.text)
	button:SetActive(true)

	if not self:checkUIShow() or not button.gameObject.activeInHierarchy then
		self:clearNotice(button)

		return
	end

	local currentNotice = self.noticeStates[button]

	if currentNotice and currentNotice.id == notice.id then
		return
	end

	self:clearNotice(button)

	self.noticeStates[button] = notice

	self:setNoticePage(button, "Long")

	notice.timerId = self:startTimer(function()
		self:killTimer(notice.timerId)

		notice.timerId = nil

		if self.noticeStates and self.noticeStates[button] == notice and self:checkUIShow() and button.gameObject.activeInHierarchy then
			self:setNoticePage(button, "Short")
		end
	end, NOTICE_LONG_DISPLAY_SECONDS)
end

function TeamRoomGrabEggsEquipComponent:getGrabEggsNotices()
	local notices = {}
	local dungeonId = self.ctrl and self.ctrl.getTeamRoomFrameDungeonId and self.ctrl:getTeamRoomFrameDungeonId()

	if dungeonId ~= Const.ROB_EGG_SCENE_CLIP_ID and dungeonId ~= Const.ROB_EGG_SCENE_ID then
		return notices
	end

	local hardLv = self.ctrl and self.ctrl.getTeamRoomFrameHardLv and self.ctrl:getTeamRoomFrameHardLv()
	local player = pg.me
	local info = dungeonId and hardLv and player and player.grabEgg_getNoviceProtectionInfo and player:grabEgg_getNoviceProtectionInfo(dungeonId, hardLv)

	if info ~= nil and info.isNextRoundProtected then
		notices[#notices + 1] = {
			id = NOVICE_PROTECTION_TEAM_TEXT_KEY,
			text = pg.getFormatText(pg.getGameString(NOVICE_PROTECTION_TEAM_TEXT_KEY), info.remainingTimes, info.totalTimes),
			shortText = pg.getGameString("GRAB_EGG_NOVICEPROTECTION_TEAM_SHORT")
		}
	end

	if GrabEggsRankUtils.isRankScoreLimited(hardLv, player and player.eggLv) then
		notices[#notices + 1] = {
			id = "GRAB_EGG_RANK_SCORE_LIMIT_TEAM",
			text = pg.getGameString("GRAB_EGG_RANK_SCORE_LIMIT_TEAM"),
			shortText = pg.getGameString("GRAB_EGG_RANK_SCORE_LIMIT_TEAM_SHORT")
		}
	end

	notices[#notices + 1] = {
		id = GRAB_EGGS_SHARED_REWARD_NOTICE_TEXT_KEY,
		text = pg.getGameString(GRAB_EGGS_SHARED_REWARD_NOTICE_TEXT_KEY),
		shortText = pg.getGameString("GRAB_EGG_PVP_TXT_5_SHORT")
	}

	if dungeonId == Const.ROB_EGG_SCENE_ID then
		notices[#notices + 1] = {
			id = GRAB_EGGS_FAIR_PLAY_NOTICE_TEXT_KEY,
			text = pg.getGameString(GRAB_EGGS_FAIR_PLAY_NOTICE_TEXT_KEY),
			shortText = pg.getGameString("GRAB_EGG_PVP_TXT_4_SHORT")
		}
	end

	while #notices > MAX_NOTICE_COUNT do
		notices[#notices] = nil
	end

	return notices
end

function TeamRoomGrabEggsEquipComponent:refreshGrabEggsNotices()
	local dungeonId = self.ctrl and self.ctrl.getTeamRoomFrameDungeonId and self.ctrl:getTeamRoomFrameDungeonId()
	local hardLv = self.ctrl and self.ctrl.getTeamRoomFrameHardLv and self.ctrl:getTeamRoomFrameHardLv()

	if self.noticeDungeonId ~= dungeonId or self.noticeHardLv ~= hardLv then
		self.noticeDungeonId = dungeonId
		self.noticeHardLv = hardLv

		self:clearNotices()
	end

	local notices = self:getGrabEggsNotices()

	self:setNoticeText(self.noticeToastItem1UButton, self.noticeToastItem1TextUSDFText, self.noticeToastItem1Text2USDFText, notices[1])
	self:setNoticeText(self.noticeToastItem2UButton, self.noticeToastItem2TextUSDFText, self.noticeToastItem2Text2USDFText, notices[2])
end

function TeamRoomGrabEggsEquipComponent:refreshVisible()
	local dungeonId = self.ctrl and self.ctrl.getTeamRoomFrameDungeonId and self.ctrl:getTeamRoomFrameDungeonId()
	local showEquipButtons = dungeonId == Const.ROB_EGG_SCENE_CLIP_ID

	self.btnStore:SetActive(showEquipButtons)
	self.btnEquip:SetActive(showEquipButtons)

	local visible = true

	if pg.global.ui.tips and pg.global.ui.tips.teamMatchTip and pg.global.ui.tips.teamMatchTip.isCountDownPlaying then
		visible = false
	elseif pg.me.matchState ~= Const.PLAYER_MATCH_STATUS.IDLE then
		visible = false
	elseif pg.me:isInTeamDungeonScene() then
		visible = false
	end

	if not visible then
		self:clearNotices()
	end

	self.gameObject:SetActiveEx(visible)
	self:refreshGrabEggsNotices()
end

return TeamRoomGrabEggsEquipComponent
