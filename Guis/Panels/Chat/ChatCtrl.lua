-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Chat\\ChatCtrl.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("ChatCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local Const = require("Common.Const.Const")
local UICtrl = require("Guis.UICtrl")
local ChatCtrl = Class.LightClass("ChatCtrl", UICtrl)
local UIConst = require("Const.UIConst")
local TimerManager = require("Core.Timer.TimerManager")
local Time = require("Core.Common.Time")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientConst = require("Const.ClientConst")
local ChatComponent = require("Guis.Panels.Chat.Component.ChatComponent")

require("Guis.Panels.Chat.Component.ChatComponentOfMessage")

local MailNewComponent = require("Guis.Panels.Chat.Component.MailNewComponent")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local HotkeyConst = require("Const.HotkeyConst")
local RedDotConst = require("Const.RedDotConst")
local PlayerLevelTable = require("Data.player_level_data")
local FuncIdConfigData = require("Data.func_index_config_data")
local AddressDataConst = require("Const.AddressDataConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientSwitch = require("Common.ClientSwitch")
local SettingSelectorTextData = require("Data.setting_selector_text_data")
local SettingComponent = require("Guis.Panels.Chat.Component.SettingComponent")
local HistoryInformationComponent = require("Guis.Panels.Chat.Component.HistoryInformationComponent")
local ItemComponent = require("Guis.Panels.Chat.Component.ItemComponent")
local PetShareComponent = require("Guis.Panels.Chat.Component.PetShareComponent")
local FriendNewComponent = require("Guis.Panels.Chat.Component.FriendNewComponent")
local FriendTabComponent = require("Guis.Panels.Chat.Component.FriendTabComponent")
local TeamGameplayComponent = require("Guis.Panels.Chat.Component.TeamGameplayComponent")
local SwitchChannelComponent = require("Guis.Panels.Chat.Component.SwitchChannelComponent")
local CallbackHandler = require("Core.Common.CallbackHandler")
local Utils = require("Common.Utils.Utils")
local HomelandConfigData = require("Data.homeland_config_data")
local CommonSwitch = require("Common.CommonSwitch")
local NoticeDef = require("Common.NoticeDef")
local PlayerForbidConst = require("Common.Const.PlayerForbidConst")
local CHAT_MESSAGE_ITEM_NAME_SET = {
	["UI_Node_Chat_Reply_Cell(Clone)"] = true,
	["UI_Node_ChatPanel_Message_Me(Clone)"] = true,
	["UI_Node_ChatPanel_Message(Clone)"] = true
}

ChatCtrl.messages = {
	[MessageName.CHANNEL_LIST_UPDATE] = {
		"refreshChannelList",
		true
	},
	[MessageName.VARIANT_FRIEND_CHANGED] = {
		"onVariantFriendChanged",
		true
	},
	[MessageName.CHAT_MESSAGE_UPDATE] = {
		"tryUpdateMessageList",
		true
	},
	[MessageName.CHAT_MESSAGE_UPDATE_ITEM] = {
		"tryUpdateMessageItem",
		true
	},
	[MessageName.ADD_NEW_CHAT_MESSAGE] = {
		"addNewMessage",
		true
	},
	[MessageName.REMOVE_CHANNEL] = {
		"removeChannel",
		true
	},
	[MessageName.RECV_FRIEND_LIST] = {
		"refreshFriendList",
		true
	},
	[MessageName.BLACK_LIST_UPDATE] = {
		"refreshFriendList",
		true
	},
	[MessageName.ADD_FRIEND_SUCCESS] = {
		"addFriendSuccess",
		true
	},
	[MessageName.RECV_FRIEND_REQUEST_LIST] = {
		"refreshFriendRequestList",
		true
	},
	[MessageName.RECV_QUERY_PLAYER_INFO] = {
		"refreshRecommendFriendList",
		true
	},
	[MessageName.RECV_MAIL] = {
		"refreshMailList",
		true
	},
	[MessageName.RECV_MAIL_CONTENT] = {
		"refreshMailContent",
		true
	},
	[MessageName.CHAT_RED_DOT_UPDATE] = {
		"onChatRedDotMsg",
		true
	},
	[MessageName.SYNC_TEAM_INFO] = {
		"onTeamInfoUpdate",
		true
	},
	[MessageName.CHAT_CHANNEL_LINE_CHANGE] = {
		"onWorldChannelLineChanged",
		true
	},
	[MessageName.CHAT_WORLD_CHANNEL_CHANGE] = {
		"refreshWorldChannel",
		true
	},
	[MessageName.RECV_SCORED_RECOMMEND_FRIEND_LIST] = {
		"refreshScoredRecommendList",
		true
	},
	[MessageName.FRIEND_CHAT_GROUP_UPDATE] = {
		"refreshFriendChatGroup",
		true
	},
	[MessageName.COMMON_SWITCH_STATE_CHANGED] = {
		"onCommonSwitchStateChanged",
		true
	},
	[MessageName.PLAYER_SPARK_CHANGE] = {
		"refreshPlayerSpark",
		true
	},
	[MessageName.NOTIFY_ACTIVITY_DAY_UPDATED] = {
		"refreshPlayerSpark",
		true
	},
	[MessageName.PLAYER_LEVEL_CHANGE] = {
		"onPlayerLevelChanged",
		true
	}
}

function ChatCtrl:handleBlurEffect()
	local useStaticBlur = self.adapter:openingUINumWithLayer(UIConst.PANEL_LAYER) > 1

	self.view.uiBlurDynamic.gameObject:SetActiveEx(not useStaticBlur)
	self.view.uiBlurStatic.gameObject:SetActiveEx(useStaticBlur == true)
end

function ChatCtrl:onCreate(info)
	self:handleBlurEffect()
	UICtrl.onCreate(self, info)

	self.inClosing = false
	self.expend = false
	self.extensionVisible = false
	self.friendTabComponent = nil
	self.chatComponent = ChatComponent.new(self)

	self:initializeChatContainerStates()

	self.tabHideHandlers = {
		[pg.game.chat.tabType.Mail] = function()
			if self.mailComponent then
				self.mailComponent:onHide()
			end
		end
	}

	self.view.privateUComponent.gameObject:SetActiveEx(true)
	self.view.warningTipsUWidget.gameObject:SetActiveEx(false)
	self.view.bottomSendUComponent:TryChangePage("ClickToNew", 0)
	self.view.noMessageRectTransform.gameObject:SetActiveEx(false)
	self:checkCommonSwitch()

	function self.view.listMembersUList.luaRenderItem(button, _, data)
		self:renderMemberItem(button, data)
	end

	self.curTabType = nil

	if self.uiScene then
		self.uiScene:setLocalEnv()
	end
end

function ChatCtrl:initializeChatContainerStates()
	self.chatContainerKey = nil
	self.chatContainerStates = {
		mail = {
			loading = false,
			loadSerial = 0,
			fieldName = "mailComponent",
			container = self.view.mailUContainer,
			componentClass = MailNewComponent
		},
		history = {
			loading = false,
			loadSerial = 0,
			fieldName = "historyComponent",
			container = self.view.historyInformationUContainer,
			componentClass = HistoryInformationComponent
		},
		setting = {
			loading = false,
			loadSerial = 0,
			fieldName = "settingComponent",
			container = self.view.settingUContainer,
			componentClass = SettingComponent
		},
		item = {
			loading = false,
			loadSerial = 0,
			fieldName = "itemComponent",
			container = self.view.chatItemUContainer,
			componentClass = ItemComponent
		},
		pet = {
			loading = false,
			loadSerial = 0,
			fieldName = "petShareComponent",
			container = self.view.petUContainer,
			componentClass = PetShareComponent
		},
		friend = {
			loading = false,
			loadSerial = 0,
			fieldName = "friendNewComponent",
			container = self.view.friendListPanelUContainer,
			componentClass = FriendNewComponent
		},
		friendTab = {
			loading = false,
			loadSerial = 0,
			fieldName = "friendTabComponent",
			container = self.view.friendUContainer,
			componentClass = FriendTabComponent
		},
		gameplay = {
			loading = false,
			loadSerial = 0,
			fieldName = "teamGameplayComponent",
			container = self.view.gameplayUContainer,
			componentClass = TeamGameplayComponent
		},
		channel = {
			loading = false,
			loadSerial = 0,
			fieldName = "switchChannelComponent",
			container = self.view.channelPanelUContainer,
			componentClass = SwitchChannelComponent
		}
	}
end

function ChatCtrl:ensureChatContainerComponent(key, callback)
	local states = self.chatContainerStates

	if not states or self.inClosing then
		return
	end

	local state = states[key]

	self.chatContainerKey = key

	local container = state.container
	local component = self[state.fieldName]

	if component then
		callback(component)

		return
	end

	state.pendingCallback = callback

	if state.loading then
		return
	end

	state.loading = true
	state.loadSerial = state.loadSerial + 1

	local loadSerial = state.loadSerial
	local ownerView = self.view

	local function onContentLoaded(content)
		local isStale = self.view ~= ownerView or self.chatContainerStates ~= states or state.loadSerial ~= loadSerial or self.inClosing

		if isStale then
			if self.chatContainerStates == states and state.loadSerial == loadSerial then
				state.loading = false
				state.pendingCallback = nil
			end

			return
		end

		state.loading = false

		local pendingCallback = state.pendingCallback

		state.pendingCallback = nil

		if not content or self.chatContainerKey ~= key then
			return
		end

		component = self[state.fieldName]

		if not component then
			component = state.componentClass.new(self, content.transform)
			self[state.fieldName] = component
		end

		pendingCallback(component)
	end

	if container:CheckURLLoaded() then
		onContentLoaded(container.content)
	else
		container:LoadDefaultUrlManually(onContentLoaded)
	end
end

function ChatCtrl:renderMemberItem(button, data)
	local playerId = data.uid

	local function renderPlayerAvatar(playerData)
		LuaUIUtils.renderPlayerAvatarButton(button, {
			hideLevel = true,
			showCaptain = true,
			playerId = playerId,
			playerInfo = playerData
		})
	end

	pg.me:queryPlayerInfo(playerId, nil, true, renderPlayerAvatar)
	self:bindMemberPlayerInfoCardEvents(button, playerId)
end

function ChatCtrl:bindMemberPlayerInfoCardEvents(button, playerId)
	local function openPlayerInfoCard()
		self:openPlayerInfoCard(playerId)

		return false
	end

	button.luaClick = openPlayerInfoCard

	button:SetGamepadLongPress(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonWest, nil, 0, openPlayerInfoCard)
	button:SetHotkeyActiveOnlyInCurrentItem(true)
	button:SetHotkeyConsoleBar("CONSOLE_BAR_PROFILE", -2, self.view.mainConsoleBarTransform)
end

function ChatCtrl:tryFocusChatInputField(shouldFocusWithGamepad)
	local isHarmonyPC = UNITY_OPENHARMONY and ClientConfigInputPlatform == "Standalone"
	local isPlayStation = pg.global.platform and pg.global.platform:isPS()

	if isHarmonyPC or isPlayStation then
		self.view.chatUInputField:DeSelect()

		return
	end

	local isMobile = pg.global.ui:runPlatformByMobile()
	local isUsingGamepad = pg.game.input:isUsingGamepad()

	if not isMobile and (shouldFocusWithGamepad or not isUsingGamepad) then
		self.view.chatUInputField:Select()
	end
end

function ChatCtrl:selectInitialTab(shouldFocus)
	local targetButton

	if self.initTab == pg.game.chat.tabType.Chat then
		targetButton = self.view.btnChatUButton
	elseif self.initTab == pg.game.chat.tabType.Notice then
		targetButton = self.view.btnNoticeUButton
	elseif self.initTab == pg.game.chat.tabType.Friend then
		targetButton = self.view.btnFriendUButton
	elseif self.initTab == pg.game.chat.tabType.Public then
		targetButton = self.view.btnPublicUButton
	elseif self.initTab == pg.game.chat.tabType.Mail then
		targetButton = self.view.btnMailUButton
	end

	if targetButton == nil then
		return
	end

	if shouldFocus then
		CS.XGUI.Navigation.NavManager.Instance:FocusItem(targetButton)
	end

	targetButton:OnClickSimulate()
	self:refreshChannelTabGamepadDefaultFocus(targetButton)
end

function ChatCtrl:refreshChannelTabGamepadDefaultFocus(targetButton)
	if IsNil(targetButton) then
		return
	end

	if IsNil(self.channelTabWidget) then
		self.channelTabWidget = self.view.btnChatUButton.transform.parent:GetComponent("UWidget")
	end

	if IsNil(self.channelTabWidget) then
		return
	end

	self.channelTabWidget:SetNavGroupDefaultItem(targetButton)
end

function ChatCtrl:resolveOpenChannelSelection(info, defaultTab, defaultSelectionKey)
	if info == nil or info.initTab == nil then
		return defaultTab, defaultSelectionKey
	end

	local initTab = info.initTab
	local selectionKey = self:findOpenChannelSelectionKey(initTab, info)

	if selectionKey then
		return initTab, selectionKey
	end

	if info.initSecondTab then
		return self:resolveLegacyChannelSelection(initTab, info.initSecondTab)
	end

	local savedTab, savedSelectionKey = self:getSavedChannelSelection()
	local savedChannelList = self.model:getTabChannelListData(savedTab)
	local canRestoreSavedChannel = savedTab == initTab and self.model:findChannelIndex(savedChannelList, savedSelectionKey) ~= nil

	if canRestoreSavedChannel then
		return savedTab, savedSelectionKey
	end

	return initTab, nil
end

function ChatCtrl:findOpenChannelSelectionKey(tabType, info)
	local channelList = self.model:getTabChannelListData(tabType)

	if info.initChannelId ~= nil then
		for _, channelData in ipairs(channelList) do
			local channelId = channelData.channelId or channelData.playerId

			if tostring(channelId) == tostring(info.initChannelId) then
				return self.model:getChannelSelectionKey(channelData)
			end
		end
	end

	if info.initGroupBase ~= nil then
		for _, channelData in ipairs(channelList) do
			if channelData.groupBase == info.initGroupBase then
				return self.model:getChannelSelectionKey(channelData)
			end
		end
	end

	if info.initChannelType ~= nil then
		for _, channelData in ipairs(channelList) do
			if channelData.type == info.initChannelType then
				return self.model:getChannelSelectionKey(channelData)
			end
		end
	end
end

function ChatCtrl:resolveInitialChannelSelection(info)
	local preferRewardMail = info ~= nil and info.preferRewardMail == true

	if info and info.initTab ~= nil and not preferRewardMail then
		return self:resolveOpenChannelSelection(info, info.initTab, nil)
	end

	if info and info.subTab == 1 and not preferRewardMail then
		return pg.game.chat.tabType.Chat, "type:" .. pg.game.chat.channelType.System
	end

	if CommonSwitch.MAIL and pg.game.chat:checkHasRewardMail() then
		return pg.game.chat.tabType.Mail, nil
	end

	if info and info.initTab ~= nil then
		return self:resolveOpenChannelSelection(info, info.initTab, nil)
	end

	if info and info.subTab == 1 then
		return pg.game.chat.tabType.Chat, "type:" .. pg.game.chat.channelType.System
	end

	if not CommonSwitch.CHAT then
		return pg.game.chat.tabType.Mail, nil
	end

	if self.curTabType == nil and self:isInTeamChatContext() then
		return pg.game.chat.tabType.Notice, "type:" .. pg.game.chat.channelType.Team
	end

	return self:getInitialSelectedChannel()
end

function ChatCtrl:isInTeamChatContext()
	local isInTeamRoom = pg.global.ui:checkUIOpen(UIConst.UI_ID_TEAM_ROOM)
	local isInTeamDungeon = pg.me:isInTeam() and pg.me:isInTeamDungeonScene()

	return isInTeamRoom or isInTeamDungeon
end

function ChatCtrl:getInitialSelectedChannel()
	local initTab, initSelectionKey = self:getSavedChannelSelection()
	local hasUnreadMail = pg.game.chat:checkHasNewMail()

	if CommonSwitch.MAIL and hasUnreadMail then
		return pg.game.chat.tabType.Mail, nil
	end

	if not CommonSwitch.CHAT then
		return pg.game.chat.tabType.Mail, nil
	end

	for _, channelData in ipairs(pg.game.chat:getPrivateChannelListData()) do
		local channelId = channelData.channelId or channelData.playerId

		if channelData.tIndex == 0 and pg.game.chat:getChannelUnReadMsgCount(channelId) > 0 then
			return pg.game.chat.tabType.Chat, self.model:getChannelSelectionKey(channelData)
		end
	end

	local teamInfo = pg.me:getCurTeamInfo()
	local hasUnreadTeamMessage = pg.me:isInTeam() and pg.game.chat:getChannelUnReadMsgCount(teamInfo.teamId) > 0

	if hasUnreadTeamMessage then
		return pg.game.chat.tabType.Notice, "type:" .. pg.game.chat.channelType.Team
	end

	if pg.game.chat:getChannelUnReadMsgCount(pg.game.chat.channelType.Friend) > 0 then
		return pg.game.chat.tabType.Notice, "type:" .. pg.game.chat.channelType.Friend
	end

	if pg.game.chat:getChannelUnReadMsgCount(pg.game.chat:getHomeCampGroupId()) > 0 then
		return pg.game.chat.tabType.Notice, "type:" .. pg.game.chat.channelType.Home
	end

	if pg.game.chat:getChannelUnReadMsgCount(pg.game.chat.channelType.Near) > 0 then
		return pg.game.chat.tabType.Notice, "type:" .. pg.game.chat.channelType.Near
	end

	for _, channelData in ipairs(self.model:getTabChannelListData(pg.game.chat.tabType.Public)) do
		if pg.game.chat:getChannelUnReadMsgCount(channelData.channelId) > 0 then
			return pg.game.chat.tabType.Public, self.model:getChannelSelectionKey(channelData)
		end
	end

	if pg.game.chat:getFriendRequestCount() > 0 then
		return pg.game.chat.tabType.Friend, nil
	end

	return initTab, initSelectionKey
end

function ChatCtrl:getSavedChannelSelection()
	local defaultSelectionKey = "base:" .. Const.CHAT_ATTR_WORLD.group_base
	local defaultRecord = "v2|" .. pg.game.chat.tabType.Public .. "|" .. defaultSelectionKey
	local recordKey = pg.me.uid .. ClientConst.PrefKey.ChatChannelRecord
	local record = pg.global.prefsCacheUtils:getString(recordKey, defaultRecord)
	local recordParts = string.split(record, "|")

	if recordParts[1] == "v2" then
		return tonumber(recordParts[2]) or pg.game.chat.tabType.Public, recordParts[3]
	end

	return self:resolveLegacyChannelSelection(tonumber(recordParts[1]), tonumber(recordParts[2]))
end

function ChatCtrl:resolveLegacyChannelSelection(legacyTab, legacyIndex)
	local channelList

	if legacyTab == pg.game.chat.tabType.Chat then
		channelList = pg.game.chat:getPrivateChannelListData()
	elseif legacyTab == pg.game.chat.tabType.Public then
		channelList = pg.game.chat:getWorldChannelListData()
	elseif legacyTab == pg.game.chat.tabType.Notice then
		channelList = pg.game.chat:getSystemChannelListData()
	else
		return legacyTab or pg.game.chat.tabType.Public, nil
	end

	local channelData = channelList[legacyIndex or 1]

	if channelData == nil then
		return legacyTab, nil
	end

	return self.model:getChannelTabType(channelData), self.model:getChannelSelectionKey(channelData)
end

function ChatCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		if self.extensionVisible then
			self.view.btnPrivateOtherUButton:OnClickSimulate()
		elseif self.chatComponent.showAddPanel then
			self.view.addPanelUWidget.gameObject:SetActiveEx(false)

			self.chatComponent.showAddPanel = false
		else
			self:onClose()
		end
	end

	function self.view.addBtnCloseUButton.luaClick()
		self.view.addPanelUWidget.gameObject:SetActiveEx(false)

		self.chatComponent.showAddPanel = false
	end

	function self.view.otherBtnCloseUButton.luaClick()
		self.view.otherPanelRectTransform.gameObject:SetActiveEx(false)

		self.extensionVisible = false
	end

	function self.view.bgCloseUButton.luaClick()
		self:onClose()
	end

	function self.view.btnNewUButton.luaClick()
		self.chatComponent:resetNewMessageCount()
		self.view.messageListUList:GoToIndex(-1, true)
	end

	function self.view.btnPrivateAddUButton.luaClick()
		self:ensureChatContainerComponent("friend", function(component)
			component:refreshFriendList(component.OpenType.CreateChat)
		end)
	end

	function self.view.btnAddUButton.luaClick()
		self:ensureChatContainerComponent("friend", function(component)
			component:refreshFriendList(component.OpenType.CreateChat)
		end)
	end

	function self.view.personalTopAddBtn.luaClick()
		self:openTeamInvite()
	end

	function self.view.btnPrivateOtherUButton.luaClick(navConfirm)
		if navConfirm and self.view.btnPrivateOtherUButton.isSelected then
			return
		end

		local group = pg.game.chat:getFriendChatGroup(self.chatComponent.curSelectedChannelId)

		if group and group.markForRemove then
			pg.global.showBubbleMessageRaw(pg.getGameString("CHAT_GROUP_NOT_EXIST"))
			self:removeChannel(self.chatComponent.curSelectedChannelId)

			return
		end

		self.extensionVisible = not self.extensionVisible
		self.view.btnPrivateOtherUButton.isSelected = self.extensionVisible

		self.view.otherPanelRectTransform.gameObject:SetActiveEx(self.extensionVisible)
		self.view.listOtherUList:RefreshList()
	end

	function self.view.btnPublicUButton.luaClick(navConfirm)
		if navConfirm and self.view.btnPublicUButton.isSelected then
			return
		end

		self.expend = false

		if self.chatComponent.showAddPanel then
			self.view.addPanelUWidget.gameObject:SetActiveEx(false)

			self.chatComponent.showAddPanel = false
		end

		self.view.panelUComponent:TryChangePage("Tab", 2)
		self:refreshChannelListInner(pg.game.chat.tabType.Public, self.initSelectionKey or 1)

		self.initSelectionKey = nil

		self:hideExtensionFunc()
		self.view.panelUComponent:TryChangePage("Expend", 0)
		self.chatComponent:checkSendButtonState()
	end

	function self.view.btnChatUButton.luaClick(navConfirm)
		if navConfirm and self.view.btnChatUButton.isSelected then
			return
		end

		self.expend = false

		if self.chatComponent.showAddPanel then
			self.view.addPanelUWidget.gameObject:SetActiveEx(false)

			self.chatComponent.showAddPanel = false
		end

		self.view.panelUComponent:TryChangePage("Tab", 0)
		self:refreshChannelListInner(pg.game.chat.tabType.Chat, self.initSelectionKey or 1)

		self.initSelectionKey = nil

		self.view.panelUComponent:TryChangePage("Expend", 0)
		self.chatComponent:checkSendButtonState()
	end

	function self.view.btnFriendUButton.luaClick(navConfirm)
		if navConfirm and self.view.btnFriendUButton.isSelected then
			return
		end

		pg.me:serverMsg("RPC_CS_GetRecommendPlayer")
		self:notifyTabHide(pg.game.chat.tabType.Friend)

		self.curTabType = pg.game.chat.tabType.Friend

		self.view.panelUComponent:TryChangePage("Tab", 5)
		self.view.secondTabRectTransform.gameObject:SetActiveEx(true)
		self.view.panelUComponent:TryChangePage("Expend", 0)
		self:ensureChatContainerComponent("friendTab", function(component)
			if self.curTabType ~= pg.game.chat.tabType.Friend then
				return
			end

			if self.openFriendList then
				component:openFriendListPanel()

				self.openFriendList = false
				self.openAddFriend = false
			elseif self.openAddFriend then
				component:openAddFriendPanel()

				self.openAddFriend = false
			else
				component:refreshFriendPanel()
				component:refreshFriendTillableState()
			end
		end)

		self.chatComponent.curSelectedChannelId = nil
	end

	function self.view.btnNoticeUButton.luaClick(navConfirm)
		if navConfirm and self.view.btnNoticeUButton.isSelected then
			return
		end

		self.expend = false

		self.view.panelUComponent:TryChangePage("Tab", 1)

		if self.chatComponent.showAddPanel then
			self.view.addPanelUWidget.gameObject:SetActiveEx(false)

			self.chatComponent.showAddPanel = false
		end

		self:refreshChannelListInner(pg.game.chat.tabType.Notice, self.initSelectionKey or 1)

		self.initSelectionKey = nil

		self:hideExtensionFunc()
		self.view.panelUComponent:TryChangePage("Expend", 0)
	end

	function self.view.btnMailUButton.luaClick(navConfirm)
		if navConfirm and self.view.btnMailUButton.isSelected then
			return
		end

		self.expend = false

		self.chatComponent:resetBottomInputState()
		self:hideExtensionFunc()
		self.view.panelUComponent:TryChangePage("Expend", 0)
		self.view.btnExpendUButton:TryChangePage("Expend", 0)
		self.view.channelTipUWidget:SetActive(false)
		self.view.secondTabRectTransform.gameObject:SetActiveEx(false)
		self.view.panelUComponent:TryChangePage("Tab", 4)
		self.view.noMessageRectTransform.gameObject:SetActiveEx(false)
		self:notifyTabHide(pg.game.chat.tabType.Mail)

		self.curTabType = pg.game.chat.tabType.Mail

		self:ensureChatContainerComponent("mail", function(component)
			if self.curTabType ~= pg.game.chat.tabType.Mail then
				return
			end

			local shouldRefreshMail = pg.game.chat:ensureMailsForLanguage()

			if not shouldRefreshMail then
				component:refreshMailList(nil, true)
			end

			if self.initMailId then
				component:selectMailById(self.initMailId)

				self.initMailId = nil
			end
		end)

		self.chatComponent.curSelectedChannelId = nil
	end

	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.FUNC_MENU_MAIL, self.view.btnMailUButton, function()
		return pg.game.chat:redDot_GetMailState()
	end)

	function self.view.btnSetUButton.luaClick()
		self:ensureChatContainerComponent("setting", function(component)
			component:refreshSettingList()
		end)
		self:hideExtensionFunc()
	end

	self.view.btnExpendUButton:SetGamepadAction("")
	self.view.btnExpendUButton:SetHotkeyForceHidden(true)

	function self.view.btnExpendUButton.luaClick()
		self.expend = not self.expend

		if self.expend and not string.isNilOrEmpty(self.view.bottomSearchUTMPInputField.text) then
			local selectedItem = self.view.channelListUList.selectedItem
			local selectionKey = self.model:getChannelSelectionKey(selectedItem)

			self:refreshChannelList({
				selectionKey = selectionKey
			})
		end

		self.view.panelUComponent:TryChangePage("Expend", self.expend and 1 or 0)
		self.view.btnExpendUButton:TryChangePage("Expend", self.expend and 1 or 0)

		self.view.bottomSearchUTMPInputField.text = ""

		self.view.channelTipUWidget:SetActive(false)
	end

	local closeCommonBind = KeyBindingPro.GetOrAddKeyBindingByName(self.view.widget.gameObject, "closeCommonBind")

	closeCommonBind.isVirtual = true
	closeCommonBind.priority = -1
	closeCommonBind.actionPath = "Common/ClosePanelCommon"

	function closeCommonBind.luaTrigger(inputInfo)
		self:onClose()
	end

	local focusInputBind = KeyBindingPro.GetOrAddKeyBindingByName(self.view.widget.gameObject, "focusInputBind")

	focusInputBind.isVirtual = true
	focusInputBind.priority = -1
	focusInputBind.actionPath = "Raw/KeyBoardEnter"

	function focusInputBind.luaTrigger(inputInfo)
		self.view.chatUInputField:Select()
	end

	function self.view.btnGoUButton.luaClick()
		if self.view.channelListUList.selectedItem.type == pg.game.chat.channelType.Team then
			self:openTeamInvite()
		elseif self.view.channelListUList.selectedItem.type == pg.game.chat.channelType.Home then
			pg.global.showConfirmMsgRaw(pg.getGameString("GO_HOMELAND"), pg.getGameString("CREATE_HOMELAND_DESC"), function()
				if HomelandConfigData.createHomelandPortId then
					pg.me:CallServerMsgTeleportToScene(Const.SCENE_ID.COT, HomelandConfigData.createHomelandPortId, false)
				end
			end)
		end
	end

	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.CHAT_TAB_MESSAGE, self.view.btnChatUButton, function()
		if self.messageNumPrivate > 0 then
			return RedDotConst.RedDotStyle.NUM
		end

		return RedDotConst.RedDotStyle.NONE
	end, function()
		self.messageNumPrivate = self.model:redDot_GetTabMessageNumb()

		return self.messageNumPrivate
	end)
	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.CHAT_TAB_FRIEND, self.view.btnFriendUButton, function()
		return self.model:redDot_GetFriendRequestState()
	end, function()
		return pg.game.chat:getFriendRequestCount()
	end)

	local function getNoticeRedDotStyle()
		return self.model:redDot_GetTabState(pg.game.chat.tabType.Notice)
	end

	local function getNoticeUnreadCount()
		return self.model:getTabUnreadCount(pg.game.chat.tabType.Notice)
	end

	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.CHAT_TAB_NOTICE, self.view.btnNoticeUButton, getNoticeRedDotStyle, getNoticeUnreadCount)
	self:addNavFocusListener(CallbackHandler(self, "onNavFocusChange"))
end

function ChatCtrl:openTeamInvite()
	local teamInfo = pg.me:getCurTeamInfo()

	pg.global.ui:open(UIConst.UI_ID_DUNGEON_INVITE, {
		dungeonId = teamInfo and teamInfo.dungeonSceneId,
		hardLv = teamInfo and teamInfo.hardLv
	})
end

function ChatCtrl:onNavFocusChange()
	self:refreshConsoleBarState()

	if not self.view or not self.view.messageListUList then
		return
	end

	local btns = self.view.messageListUList:GetAllButtons()

	for i = 0, btns.Length - 1 do
		local button = btns[i]
		local data = self.view.messageListUList:GetData(button)
		local playerEle = data and self:getMessagePlayerElement(button, data) or nil

		if playerEle then
			playerEle:SetHotkeyForceHidden(true)
		end
	end

	local outsideBtn = self:getFocusedChatListButton()
	local data = outsideBtn and self.view.messageListUList:GetData(outsideBtn) or nil
	local playerEle = data and self:getMessagePlayerElement(outsideBtn, data) or nil

	if playerEle then
		playerEle:SetHotkeyForceHidden(false)
	end
end

function ChatCtrl:getFocusedChatListButton()
	if pg.global.navMgr.CurrentFocusedGroupName ~= "ListChat" then
		return nil
	end

	local currentFocusedUContent = pg.global.navMgr.CurrentFocusedUContent

	if not currentFocusedUContent or not self.view or not self.view.messageListUList then
		return nil
	end

	local node = currentFocusedUContent.transform

	for _ = 1, 4 do
		if node and node.gameObject and CHAT_MESSAGE_ITEM_NAME_SET[node.gameObject.name] then
			return node:GetComponent("UButton")
		end

		node = node and node.parent
	end

	return nil
end

function ChatCtrl:getMessagePlayerElement(button, data)
	local messageType = pg.game.chat.messageType

	if data.tIndex == messageType.OtherPlayer or data.tIndex == messageType.SelfPlayer then
		return button:GetChild("PlayerInfo"):GetComponent("UButton")
	end

	if data.tIndex ~= messageType.Interact then
		return nil
	end

	local objectReference = button:GetComponent("ObjectReference")

	return objectReference:GetRefValue("avatarUButton")
end

function ChatCtrl:getFocusedChatListData()
	local listButton = self:getFocusedChatListButton()

	return listButton and self.view.messageListUList:GetData(listButton) or nil
end

function ChatCtrl:isFocusedValidTeamInvite()
	local data = self:getFocusedChatListData()

	if not data or data.subType ~= pg.game.chat.subMessageType.DungeonInvite and data.subType ~= pg.game.chat.subMessageType.Team then
		return false
	end

	if data.playerId == pg.me.uid or pg.me:isInTeam(true) then
		return false
	end

	local isValid = self.chatComponent:getDungeonInviteRefreshInfo(data)

	return isValid == true
end

function ChatCtrl:isFocusedHomeSeasonCelebrationInvite()
	local data = self:getFocusedChatListData()

	if not data or data.subType ~= pg.game.chat.subMessageType.HomeSeasonCelebrationInvite and data.subType ~= pg.game.chat.subMessageType.HomeSeasonMutationGift then
		return false
	end

	if data.playerId == pg.me.uid then
		return false
	end

	if data.subType == pg.game.chat.subMessageType.HomeSeasonCelebrationInvite then
		return self.chatComponent:isHomeSeasonCelebrationInviteValid(data)
	end

	return true
end

function ChatCtrl:refreshConsoleBarState()
	local currentFocusedUContent = pg.global.navMgr.CurrentFocusedUContent

	if currentFocusedUContent and (currentFocusedUContent.gameObject.name == "UI_Node_ChatPanel_Friend_Item(Clone)" or currentFocusedUContent.gameObject.name == "UI_Node_ChatPanel_Friend_Group(Clone)") then
		CS.XGUI.Navigation.ConsoleBar.SetStateForAll("ConsoleBar_A_Chat", true)
	else
		CS.XGUI.Navigation.ConsoleBar.SetStateForAll("ConsoleBar_A_Chat", false)
	end

	CS.XGUI.Navigation.ConsoleBar.SetStateForAll("ConsoleBar_Apply_Team_Chat", self:isFocusedValidTeamInvite())
	CS.XGUI.Navigation.ConsoleBar.SetStateForAll("ConsoleBar_Home_Invite", self:isFocusedHomeSeasonCelebrationInvite())
end

function ChatCtrl:hideExtensionFunc()
	if self.extensionVisible then
		self.extensionVisible = not self.extensionVisible

		self.view.otherPanelRectTransform.gameObject:SetActiveEx(self.extensionVisible)

		self.view.btnPrivateOtherUButton.isSelected = self.extensionVisible
	end
end

function ChatCtrl:getWhiteList()
	local whiteList = {}

	whiteList[UIConst.UI_ID_TEAM_ROOM] = true
	whiteList[UIConst.UI_ID_LITTLE_FIRE_GARDEN_MANUAL] = true
	whiteList[UIConst.UI_ID_LOTTERY] = true

	if not pg.global.ui:checkUIOpen(UIConst.UI_ID_TEAM_ROOM) then
		whiteList[UIConst.UI_ID_GAME_INSTANCE] = true
		whiteList[UIConst.UI_ID_WORLD_RACING_MAP] = true

		if not pg.global.ui:checkUIOpen(UIConst.UI_ID_WORLD_RACING_MAP) then
			whiteList[UIConst.UI_ID_EVENT] = true
		end
	end

	return whiteList
end

function ChatCtrl:addNewMessage(info)
	self.chatComponent:tryRefreshChannelLastMessage(info.channelId)

	if info.channelId == self.chatComponent.curSelectedChannelId then
		self.chatComponent:refreshChatMessageList(true)
	end

	local messageData = info.messageData
	local isGroupMessage = messageData and messageData.channelType == pg.game.chat.channelType.Group

	if isGroupMessage and self.friendTabComponent then
		self.friendTabComponent:refreshGroupChatList()
	end

	local shouldRefreshChannelList = self.curTabType == pg.game.chat.tabType.Chat and info.channelOrderChanged

	if shouldRefreshChannelList then
		local selectedItem = self.view.channelListUList.selectedItem
		local selectionKey = self.model:getChannelSelectionKey(selectedItem)

		self:refreshChannelListInner(pg.game.chat.tabType.Chat, selectionKey)
	end

	local channelTypeInfo = pg.game.chat.channelTypeInfo[messageData.channelType]
	local treePath = string.format(RedDotConst.RedDotPath.CHAT_TAB_MESSAGE_LIST_ITEM, channelTypeInfo.cate, info.channelId)

	pg.global.refreshRedDotState(treePath)
end

function ChatCtrl:tryUpdateMessageList(info)
	self.chatComponent:tryRefreshChannelLastMessage(info.channelId)

	if pg.global.platform:isConsoleFamily() and info.channelId ~= self.chatComponent.curSelectedChannelId then
		return
	end

	self.chatComponent:refreshChatMessageList()
end

function ChatCtrl:tryUpdateMessageItem(info)
	if not info then
		return
	end

	if info.channelId ~= self.chatComponent.curSelectedChannelId then
		return
	end

	local isOk = self.chatComponent:tryRefreshChatMessageItem(info.msgId)

	if isOk == false then
		self.chatComponent:refreshChatMessageList()
	end
end

function ChatCtrl:onTeamInfoUpdate(info)
	local isCurrentTeamChannel = self.curTabType == pg.game.chat.tabType.Notice and self.view.channelListUList.selectedItem and self.view.channelListUList.selectedItem.type == pg.game.chat.channelType.Team

	if not isCurrentTeamChannel then
		return
	end

	self:refreshChannelListInner(pg.game.chat.tabType.Notice, "type:" .. pg.game.chat.channelType.Team)
end

function ChatCtrl:refreshChannelList(info)
	local shouldRefresh = self.curTabType == pg.game.chat.tabType.Chat or info and info.tabType == self.curTabType

	if not shouldRefresh then
		return
	end

	local selectedItem = self.view.channelListUList.selectedItem
	local selectionKey = info and info.selectionKey or self.model:getChannelSelectionKey(selectedItem)

	self:refreshChannelListInner(self.curTabType, selectionKey)
end

function ChatCtrl:onVariantFriendChanged(info)
	if self.curTabType == pg.game.chat.tabType.Chat then
		local selectedItem = self.view.channelListUList.selectedItem
		local selectionKey = self.model:getChannelSelectionKey(selectedItem)

		self:refreshChannelListInner(pg.game.chat.tabType.Chat, selectionKey)
	end

	self:refreshFriendList()
end

function ChatCtrl:onWorldChannelLineChanged(info)
	local groupId = info.groupId
	local oldGroupId = info.oldGroupId
	local isPublicTab = self.curTabType == pg.game.chat.tabType.Public

	for _, channel in ipairs(pg.game.chat.worldChannelListData) do
		local isTargetChannel = pg.game.chat:isChatGroupBase(groupId, channel.groupBase) or pg.game.chat:isChatGroupBase(oldGroupId, channel.groupBase)

		if isTargetChannel then
			self:updateWorldChannelLine(channel, groupId, isPublicTab)

			return
		end
	end
end

function ChatCtrl:updateWorldChannelLine(channel, groupId, isPublicTab)
	if channel.channelId == groupId then
		return
	end

	channel.channelId = groupId

	if string.isNilOrEmpty(groupId) then
		if isPublicTab then
			self:refreshChannelListInner(pg.game.chat.tabType.Public)
		end

		return
	end

	local selectionKey = self.model:getChannelSelectionKey(channel)

	pg.me:chatHistory(pg.me.uid, groupId, Const.CHAT_TYPE.GROUP, 0, 50, {
		isWorldChannelChange = isPublicTab,
		selectionKey = selectionKey
	})
end

function ChatCtrl:refreshWorldChannel(selectionKey)
	self.chatComponent.needSetBottom = true

	self:refreshChannelListInner(pg.game.chat.tabType.Public, selectionKey)
end

function ChatCtrl:onPlayerLevelChanged()
	if self.curTabType ~= pg.game.chat.tabType.Public then
		return
	end

	local selectionKey = self.model:getChannelSelectionKey(self.view.channelListUList.selectedItem)

	self:refreshChannelListInner(pg.game.chat.tabType.Public, selectionKey)
end

function ChatCtrl:notifyTabHide(nextTabType)
	if self.curTabType == nextTabType then
		return
	end

	local handler = self.tabHideHandlers[self.curTabType]

	if handler then
		handler()
	end
end

function ChatCtrl:refreshChannelListInner(curTab, selection)
	if self.curTabType ~= curTab then
		self:notifyTabHide(curTab)

		self.curTabType = curTab
		self.chatComponent.needSetBottom = true
	end

	self.chatComponent:resetBottomInputState()
	self.chatComponent:refreshChannelList(curTab, selection)
end

function ChatCtrl:removeChannel(playerId)
	self.chatComponent:removeChannel(playerId)
end

function ChatCtrl:refreshFriendList()
	self.chatComponent:refreshFriendState()

	if self.friendTabComponent then
		self.friendTabComponent:refreshFriendPanel()
	end

	if self.friendNewComponent then
		self.friendNewComponent:refreshFriendListState()
	end
end

function ChatCtrl:refreshPlayerSpark(playerUid)
	self.sparkAnimationPlayerUid = playerUid

	self.chatComponent:refreshPlayerSpark()

	if self.friendTabComponent then
		self.friendTabComponent:refreshPlayerSpark()
	end

	if self.friendNewComponent then
		self.friendNewComponent:refreshFriendListState()
	end

	self.sparkAnimationPlayerUid = nil
end

function ChatCtrl:refreshFriendChatGroup()
	if self.chatComponent then
		self.chatComponent:refreshFriendCustomInfo()
	end

	if self.friendTabComponent then
		self.friendTabComponent:refreshFriendPanel()
	end
end

function ChatCtrl:addFriendSuccess(playerId)
	local playerInfo = pg.game.chat:getPlayerInfo(playerId)

	if not playerInfo then
		return
	end

	local playerName = playerInfo.playerName
	local _h = ChatCtrl._platformHooks

	if _h and _h.getAddFriendSuccessPlayerName then
		playerName = _h.getAddFriendSuccessPlayerName(self, playerId, playerInfo, playerName)
	end

	local messageData = {
		tIndex = pg.game.chat.messageType.Tips,
		subType = pg.game.chat.subMessageType.Text,
		channelId = playerId,
		textContent = pg.getFormatText(pg.getGameString("CHAT_ADD_FRIEND_TIP"), playerName),
		playerId = playerId,
		timeStamp = math.floor(Time.secondCache),
		channelType = pg.game.chat.channelType.Player
	}
	local data = pg.game.chat:getChatMessageListData()

	if data[playerId] == nil then
		data[playerId] = {}
	end

	table.insert(data[playerId], messageData)
	self.chatComponent:refreshChatMessageList(true)
end

function ChatCtrl:refreshRecommendFriendList(data)
	if self.friendTabComponent then
		self.friendTabComponent:refreshRecommendList(data)
	end
end

function ChatCtrl:refreshScoredRecommendList()
	if self.friendTabComponent then
		self.friendTabComponent:refreshScoredRecommendList()
	end
end

function ChatCtrl:refreshFriendRequestList()
	if self.friendTabComponent then
		self.friendTabComponent:refreshFriendApplyList()
	end
end

function ChatCtrl:refreshMailList(info)
	if self.curTabType ~= pg.game.chat.tabType.Mail then
		return
	end

	if not self.mailComponent then
		return
	end

	self.mailComponent:refreshMailList(info and info.indexDiff)
	self.mailComponent:refreshMailContent()
end

function ChatCtrl:refreshMailContent()
	if self.mailComponent then
		self.mailComponent:refreshMailContent()
	end
end

function ChatCtrl:handlePlayerTooltip(playerEle, data, targetRect, shouldBindHotKey, shouldSuppressNav)
	function playerEle.luaClick()
		local extraInfo = {
			openType = data.playerId == pg.me.uid and ClientConst.PlayerInfoOpenType.Edit or ClientConst.PlayerInfoOpenType.Chat,
			reportInfo = self:buildChatReportInfo(data),
			reportText = self:getChatReportText(data)
		}

		local function onPlayerInfoQueried(_, succeeded)
			if succeeded == true then
				self.chatComponent:refreshPlayerAvatarList({
					tostring(data.playerId)
				})
			end

			self:openPlayerInfoCard(data.playerId, extraInfo)
		end

		local querySent = pg.game.chat:getPlayerInfoFromServer(data.playerId, pg.game.chat.queryPlayerInfoType.ShowPlayerInfo, onPlayerInfoQueried, extraInfo, true)

		if not querySent then
			self:openPlayerInfoCard(data.playerId, extraInfo)
		end
	end

	playerEle.navForceNonInteractable = shouldSuppressNav

	if shouldBindHotKey and self.view.mainConsoleBarTransform then
		playerEle:SetGamepadAction("Raw/GamepadStart")
		playerEle:SetHotkeyConsoleBar("CONSOLE_BAR_PROFILE", -2, self.view.mainConsoleBarTransform)
		playerEle:SetHotkeyForceHidden(true)
	end

	if pg.game.input:isUsingGamepad() then
		self:onNavFocusChange()
	end
end

function ChatCtrl:getChatReportText(data)
	if not Utils.isTable(data) then
		return nil
	end

	local textContent = data.textContent or ""

	if data.subType == pg.game.chat.subMessageType.Audio then
		textContent = pg.game.chat:getAudioMessageText(data) or ""
	elseif data.subType ~= pg.game.chat.subMessageType.Text then
		return nil
	end

	if string.isNilOrEmpty(textContent) then
		return nil
	end

	return pg.getFormatText(pg.getGameString("CHAT_REPORT_MESSAGE_CONTENT"), textContent)
end

function ChatCtrl:buildChatReportInfo(data)
	if not Utils.isTable(data) or data.playerId == nil or tostring(data.playerId) == "" then
		return nil
	end

	local playerInfo = pg.game.chat:getPlayerInfo(data.playerId) or {}
	local playerName = playerInfo.playerName or LuaUIUtils.getPlayerDisplayName(data.playerId)
	local reportInfo = {
		reportType = "chat",
		detailType = "private_chat",
		uid = tostring(data.playerId or ""),
		name = playerName or "",
		content = data.textContent or playerName or "",
		msgId = tostring(data.messageId or "")
	}

	if data.subType == pg.game.chat.subMessageType.Audio then
		reportInfo.reportPrefix = "Voice: "
	end

	local pictureInfo = data.extraInfo and data.extraInfo[Const.CHAT_EXTRA_TYPE.Picture]

	if pictureInfo then
		reportInfo.imgUrl = pictureInfo.url or pictureInfo.imgUrl
		reportInfo.imageCheckId = pictureInfo.imageCheckId or pictureInfo.ImageCheckId
	end

	if data.channelType == pg.game.chat.channelType.World then
		reportInfo.channel = "world"
		reportInfo.detailType = "world_chat"
	elseif data.channelType == pg.game.chat.channelType.Team then
		reportInfo.channel = "team"
		reportInfo.detailType = "team_chat"
	elseif data.channelType == pg.game.chat.channelType.Player then
		reportInfo.channel = "private"
		reportInfo.detailType = "private_chat"

		if data.playerId == pg.me.uid then
			reportInfo.receiveUid = tostring(data.channelId or "")
		else
			reportInfo.receiveUid = tostring(pg.me.uid or "")
		end
	elseif data.channelType == pg.game.chat.channelType.Group then
		reportInfo.channel = "private"
		reportInfo.detailType = "group_chat"
	elseif data.channelType == pg.game.chat.channelType.Friend then
		reportInfo.channel = "private"
		reportInfo.detailType = "friend_chat"
	elseif data.channelType == pg.game.chat.channelType.Home then
		reportInfo.channel = "private"
		reportInfo.detailType = "home_chat"
	elseif data.channelType == pg.game.chat.channelType.Near then
		reportInfo.channel = "private"
		reportInfo.detailType = "near_chat"
	end

	return reportInfo
end

function ChatCtrl:openPlayerInfoCard(uid, extraInfo)
	local extraInfoOpenType = Utils.isTable(extraInfo) and extraInfo.openType
	local reportInfo = Utils.isTable(extraInfo) and extraInfo.reportInfo or nil
	local reportText = Utils.isTable(extraInfo) and extraInfo.reportText or nil
	local sourceChannelName
	local openSource = pg.game.chat.AddFriendSource.ChatChannel

	if self.view then
		local curChannelData = self.view.channelListUList.selectedItem

		if curChannelData then
			if curChannelData.type == pg.game.chat.channelType.Player then
				sourceChannelName = pg.getGameString("CHAT_CHANNEL_PRIVATE")
			elseif curChannelData.type == pg.game.chat.channelType.World then
				sourceChannelName = pg.game.chat:getWorldChatChannelName(curChannelData.channelId, curChannelData.groupBase)
			else
				sourceChannelName = pg.getGameString(curChannelData.label)
			end
		else
			openSource = pg.game.chat.AddFriendSource.PlayerCard
		end
	end

	if string.isNilOrEmpty(sourceChannelName) then
		openSource = pg.game.chat.AddFriendSource.PlayerCard
	end

	local param = {
		openType = extraInfoOpenType or ClientConst.PlayerInfoOpenType.Chat,
		playerId = uid,
		openSource = openSource,
		sourceName = sourceChannelName,
		reportInfo = reportInfo,
		reportText = reportText
	}

	LuaUIUtils.openInfoPlayerCard(param)
end

function ChatCtrl:createNewChat(button, playerId, blockSwitchChannel)
	local _h = ChatCtrl._platformHooks

	if _h and _h.createNewChat then
		return _h.createNewChat(self, button, playerId, blockSwitchChannel)
	end

	if self.view == nil then
		if not blockSwitchChannel then
			local openParam = {
				initTab = pg.game.chat.tabType.Chat
			}

			pg.global.ui:open(UIConst.UI_ID_CHAT, openParam, function()
				pg.game.chat:tryCreatePrivateChat(playerId, true)
			end, nil, {
				ignoreDisableMainCamera = true
			})
		end
	else
		if not blockSwitchChannel then
			self.view.btnChatUButton:OnClickSimulate()
		end

		pg.game.chat:tryCreatePrivateChat(playerId, not blockSwitchChannel)
	end
end

function ChatCtrl:createNewGroupChat(groupId)
	if self.view == nil then
		pg.global.ui:open(UIConst.UI_ID_CHAT, {
			initTab = pg.game.chat.tabType.Chat
		}, function()
			pg.game.chat:tryCreateGroupChat(groupId, true)
		end, nil, {
			ignoreDisableMainCamera = true
		})
	else
		self.view.btnChatUButton:OnClickSimulate()
		pg.game.chat:tryCreateGroupChat(groupId, true)
	end
end

function ChatCtrl:onDestroy()
	self:invalidateChatContainerLoads()

	self.chatContainerStates = nil

	UICtrl.onDestroy(self)
end

function ChatCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.initMailId = info and info.initMailId or nil
	self.openAddFriend = info and info.openAddFriend == true
	self.openFriendList = info and info.openFriendList == true

	local isFirstOpen = self.curTabType == nil
	local hasOpenSelection = info and (info.initTab ~= nil or info.subTab == 1 or info.initMailId ~= nil)

	if not isFirstOpen and not hasOpenSelection then
		return
	end

	self.initTab, self.initSelectionKey = self:resolveInitialChannelSelection(info)

	if isFirstOpen then
		self.curTabType = self.initTab
		self.chatComponent.needSetBottom = true
	end

	local shouldAutoFocus = isFirstOpen and not hasOpenSelection

	self:selectInitialTab(shouldAutoFocus)

	if isFirstOpen then
		self:tryFocusChatInputField()
	end
end

function ChatCtrl:onChatRedDotMsg()
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.CHAT_TAB_FRIEND)
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.CHAT_TAB_MESSAGE)
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.CHAT_TAB_NOTICE)
	self.chatComponent:redDot_RefreshChannelList()
end

function ChatCtrl:checkCommonSwitch()
	self.view.btnMailUButton.gameObject:SetActiveEx(CommonSwitch.MAIL)
	self.view.btnChatUButton.gameObject:SetActiveEx(CommonSwitch.CHAT)
	self.view.btnPublicUButton.gameObject:SetActiveEx(CommonSwitch.CHAT)
	self.view.btnFriendUButton.gameObject:SetActiveEx(CommonSwitch.CHAT)
	self.view.btnNoticeUButton.gameObject:SetActiveEx(CommonSwitch.CHAT)
	self.view.btnSetUButton.gameObject:SetActiveEx(CommonSwitch.CHAT)
end

function ChatCtrl:checkCanOpen(showNotice, data)
	if not pg.me:checkFunctionUnlock(Const.FUNCTION_NAME.CHAT) then
		pg.global.ui.tips:showTextTip(pg.getLocalizationText(FuncIdConfigData[Const.FUNCTION_NAME.CHAT].unlockDesc))

		return false
	end

	if not CommonSwitch.MAIL and data and data.initTab and data.initTab == pg.game.chat.tabType.Mail then
		pg.global.showBubbleMessage(NoticeDef.COMMON_SWITCH_CLOSE_TIP)

		return false
	end

	if not CommonSwitch.CHAT then
		if data and data.initTab and data.initTab == pg.game.chat.tabType.Mail then
			return true
		else
			pg.global.showBubbleMessage(NoticeDef.COMMON_SWITCH_CLOSE_TIP)

			return false
		end
	end

	if LuaUIUtils.checkFeatureForbid(PlayerForbidConst.PLAYER_SWITCH.PLAYER_CHAT) then
		return false
	end

	return true
end

function ChatCtrl:onCommonSwitchStateChanged()
	if not CommonSwitch.CHAT or not CommonSwitch.MAIL then
		self:onClose()
		pg.global.showBubbleMessage(NoticeDef.COMMON_SWITCH_CLOSE_TIP)
	end
end

function ChatCtrl:onClose()
	if self.inClosing then
		return
	end

	self.inClosing = true

	self:invalidateChatContainerLoads()

	if self.chatComponent then
		self.chatComponent:cancelSpeechRecording()
	end

	self.view.rootUComponent:InvokeCallbackWithCallback(CS.XGUI.EInvokeTime.Custom1, function()
		if self.chatComponent then
			self.chatComponent:onClose()
		end

		self.chatComponent = nil
		self.friendTabComponent = nil

		if self.mailComponent then
			self.mailComponent:onClose()
		end

		self.mailComponent = nil
		self.historyComponent = nil
		self.settingComponent = nil
		self.itemComponent = nil
		self.petShareComponent = nil
		self.friendNewComponent = nil
		self.teamGameplayComponent = nil
		self.switchChannelComponent = nil

		self:close()
	end)
end

function ChatCtrl:invalidateChatContainerLoads()
	self.chatContainerKey = nil

	if not self.chatContainerStates then
		return
	end

	for _, state in pairs(self.chatContainerStates) do
		state.loadSerial = state.loadSerial + 1
		state.loading = false
		state.pendingCallback = nil
	end
end

return ChatCtrl
