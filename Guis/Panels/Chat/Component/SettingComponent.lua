-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Chat\\Component\\SettingComponent.lua

local UIComponent = require("Guis.Helper.UIComponent")
local Class = require("Core.Framework.Class")
local SettingComponent = Class.LightClass("SettingComponent", UIComponent)
local ClientTextUtils = require("Utils.ClientTextUtils")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local LuaUIUtils = require("Utils.LuaUIUtils")
local MessageName = require("Const.MessageName")
local Const = require("Common.Const.Const")
local ClientConst = require("Const.ClientConst")
local UIConst = require("Const.UIConst")
local SettingSelectorTextData = require("Data.setting_selector_text_data")
local SettingTypeData = require("Data.setting_type_data")
local ChatSettingData = require("Data.chat_setting_data")
local ChatBubbleData = require("Data.chat_bubble_data")
local Utils = require("Common.Utils.Utils")
local EditComponent = require("Guis.Panels.InfoPlayerMain.Component.EditComponent")
local WidgetTypeToTIndex = {
	0,
	1,
	nil,
	nil,
	nil,
	2,
	1
}
local CloseAllTextIndex = 42
local InteractionScopeByValue = {
	[2] = ClientConst.InteractionInviteAcceptRange.ALL,
	ClientConst.InteractionInviteAcceptRange.FRIENDS,
	[0] = ClientConst.InteractionInviteAcceptRange.NONE
}

function SettingComponent:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.listInformationUList = objectReference:GetRefValue("listInformationUList")
	self.listNoticeUList = objectReference:GetRefValue("listNoticeUList")
	self.bgCloseUButton = objectReference:GetRefValue("bgCloseUButton")
	self.listBalloonsUList = objectReference:GetRefValue("listBalloonsUList")
	self.tabUList = objectReference:GetRefValue("tabUList")
	self.btnCloseUButton = objectReference:GetRefValue("btnCloseUButton")
	self.titleUSDFText = objectReference:GetRefValue("titleUSDFText")
end

function SettingComponent:initView()
	self.pendingBusinessSettings = {}
	self.settingRefreshVersion = 0

	ClientTextUtils.setText(self.titleUSDFText, pg.getGameString("SETTING"))

	function self.bgCloseUButton.luaClick()
		self:close()
	end

	function self.btnCloseUButton.luaClick()
		self:close()
	end

	local closeCommonBind = KeyBindingPro.GetOrAddKeyBindingByName(self.bgCloseUButton.gameObject, "closeCommonBind")

	closeCommonBind.isVirtual = true
	closeCommonBind.priority = 1
	closeCommonBind.actionPath = "Common/ClosePanelCommon"

	function closeCommonBind.luaTrigger(inputInfo)
		self.bgCloseUButton.luaClick()
	end

	function self.tabUList.luaRenderItem(button, index, data)
		self:renderTabItem(button, index, data)
	end

	function self.tabUList.luaSelectedChanged(uList, select)
		if not select then
			return
		end

		self.uWidget:TryChangePage("List", uList.selectedIndex)
	end

	function self.listInformationUList.luaRenderItem(button, index, data)
		self:renderSettingListItem(button, index, data)
	end

	function self.listNoticeUList.luaRenderItem(button, index, data)
		self:renderSettingListItem(button, index, data)
	end

	function self.listBalloonsUList.luaRenderItem(button, index, data)
		self:renderSettingListEffectItem(button, index, data)
	end

	self.tabUList:SetList({
		{
			tIndex = 0,
			name = "CHAT_SETTING_INFO"
		},
		{
			tIndex = 1,
			name = "CHAT_SETTING_NOTICE"
		},
		{
			tIndex = 2,
			name = "CHAT_SETTING_EFFECT"
		}
	})
	self.tabUList:SelectItem(0)
end

function SettingComponent:close()
	self.settingRefreshVersion = self.settingRefreshVersion + 1

	self:commitPendingBusinessSettings()

	self.pendingBusinessSettings = nil

	self.view.panelUComponent:TryChangePage("ShowPopup", 0)
end

function SettingComponent:refreshSettingList()
	self.pendingBusinessSettings = {}
	self.settingRefreshVersion = self.settingRefreshVersion + 1

	local refreshVersion = self.settingRefreshVersion

	self.view.panelUComponent:TryChangePage("ShowPopup", 2)
	self.listInformationUList:SetList(self:getSettingData("message"))
	self.listNoticeUList:SetList(self:getSettingData("messageInform"))
	self.listBalloonsUList:SetList(self:getSettingData("messagePerform"))

	local function onPrivacyLoaded()
		if self.view == nil or refreshVersion ~= self.settingRefreshVersion then
			return
		end

		self.listNoticeUList:RefreshList()
	end

	pg.me:fetchPrivacy(onPrivacyLoaded)
end

function SettingComponent:getSettingData(cate)
	local settingDatas = {}
	local settingTypeIds = {}

	for settingTypeId in pairs(SettingTypeData) do
		settingTypeIds[#settingTypeIds + 1] = settingTypeId
	end

	table.sort(settingTypeIds)

	for _, settingTypeId in ipairs(settingTypeIds) do
		local settingTab = SettingTypeData[settingTypeId]

		if cate == settingTab.cate then
			local tab = {
				tIndex = settingTab.cateType,
				tab = settingTab.tab,
				cate = settingTab.cate,
				tabName = settingTab.tabName,
				items = {}
			}

			for index, settingItem in ipairs(ChatSettingData) do
				if settingItem.tab == settingTab.tab then
					table.insert(tab.items, {
						id = index,
						tab = settingItem.tab,
						name = settingItem.name,
						widgetType = WidgetTypeToTIndex[settingItem.widgetType],
						optionType = settingItem.optionType,
						funcParam = settingItem.funcParam,
						widgetParam = settingItem.widgetParam,
						widgetDefaultValue = settingItem.widgetDefaultValue,
						widgetTxt = self:getVisibleSettingWidgetTxtList(settingItem),
						funcType = settingItem.funcType,
						buttonFunc = settingItem.buttonFunc
					})
				end
			end

			if #tab.items ~= 0 then
				table.insert(settingDatas, tab)
			end
		end
	end

	return settingDatas
end

function SettingComponent:getVisibleSettingWidgetTxtList(settingItem)
	local audioPlayTab = ChatSettingData[pg.game.chat.settingType.AudioPlay].tab

	if settingItem.tab ~= audioPlayTab or ClientConfigAppCountry ~= "cn" then
		return settingItem.widgetTxt
	end

	local languageWidgetTxt = pg.game.chat:getChatSettingWidgetTxt(pg.game.chat.channelType.World, Const.CHAT_ATTR_LANGUAGE.group_base)
	local visibleWidgetTxtList = {}

	for _, widgetTxt in ipairs(settingItem.widgetTxt) do
		if widgetTxt ~= languageWidgetTxt then
			visibleWidgetTxtList[#visibleWidgetTxtList + 1] = widgetTxt
		end
	end

	return visibleWidgetTxtList
end

function SettingComponent:renderTabItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
	local imgAddUImage = objectReference:GetRefValue("imgAddUImage")

	ClientTextUtils.setText(txtNameUBaseText, pg.getGameString(data.name))
end

function SettingComponent:renderSettingListItem(button, index, data)
	if data.tIndex == 0 then
		self:renderCheckSettingListItem(button, index, data)
	elseif data.tIndex == 2 then
		self:renderCheckSettingCategoryItem(button, index, data)
	else
		self:renderCommonSettingListItem(button, index, data)
	end
end

function SettingComponent:renderSettingListEffectItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local listSettingsUList = objectReference:GetRefValue("listSettingsUList")
	local settingItems = {}

	settingItems[#settingItems + 1] = {
		tIndex = 0,
		name = data.tabName
	}

	for _, settingItem in ipairs(data.items) do
		settingItems[#settingItems + 1] = {
			id = settingItem.id,
			tab = settingItem.tab,
			name = self:getChatChildTabName(settingItem.tab),
			tIndex = settingItem.widgetType,
			buttonFunc = settingItem.buttonFunc
		}
	end

	function listSettingsUList.luaRenderItem(childButton, childIndex, childData)
		if childData.tIndex == 0 then
			local objectReference = childButton:GetComponent("ObjectReference")
			local textTtileUSDFText = objectReference:GetRefValue("textTtileUSDFText")

			ClientTextUtils.setText(textTtileUSDFText, pg.getLocalizationText(childData.name))
		else
			local objectReference = childButton:GetComponent("ObjectReference")
			local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
			local name = self:getSettingEffectItemName(childData)

			ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(name))

			local funcName = self:getButtonFuncName(childData.buttonFunc)
			local clickFunc = self[funcName]

			function childButton.luaClick()
				if clickFunc then
					clickFunc(self)
				end
			end
		end
	end

	listSettingsUList:SetList(settingItems)
end

function SettingComponent:getButtonFuncName(buttonFunc)
	if buttonFunc ~= nil then
		return buttonFunc[1]
	end

	return buttonFunc
end

function SettingComponent:getSettingEffectItemName(childData)
	if childData.tab ~= "chatBubble" then
		return childData.name
	end

	local chatBubble = pg.me.chatBubble

	if chatBubble == nil or chatBubble == 0 then
		chatBubble = pg.game.chat:GetDefaultChatBubbleId()
	end

	local chatBubbleCfg = ChatBubbleData[chatBubble]

	return chatBubbleCfg and chatBubbleCfg.cardName or childData.name
end

function SettingComponent:getChatChildTabName(tab)
	if tab == "chatBubble" then
		return "默认"
	end
end

function SettingComponent:openChatBubblePanel()
	self.settingRefreshVersion = self.settingRefreshVersion + 1

	self:commitPendingBusinessSettings()

	self.pendingBusinessSettings = nil

	self.view.panelUComponent:TryChangePage("ShowPopup", 0)
	pg.global.ui:open(UIConst.UI_ID_INFO_PLAYER_MAIN, {
		openType = ClientConst.PlayerInfoOpenType.Edit,
		playerId = pg.me.uid,
		defaultEditTabIndex = EditComponent.tabIndex.ChatBubble
	})
end

function SettingComponent:renderCheckSettingListItem(button, index, data)
	local settingItem = data.items[1]
	local curSettingItemKey = pg.me.uid .. data.tab .. settingItem.id
	local checkBoxState = self:getCheckSettingState(settingItem, curSettingItemKey)
	local objectReference = button:GetComponent("ObjectReference")
	local nullUButton = objectReference:GetRefValue("nullUButton")
	local txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	local listCheckUList = objectReference:GetRefValue("listCheckUList")
	local isBusinessSetting = settingItem.funcType ~= nil

	nullUButton:SetActive(not isBusinessSetting)
	ClientTextUtils.setText(txtTitleUSDFText, pg.getLocalizationText(data.tabName))

	local checkItems = self:buildCheckSettingItems(settingItem, checkBoxState)

	listCheckUList.groupType = settingItem.optionType

	function nullUButton.luaSelectChanged(isSelected)
		if isSelected then
			listCheckUList:DeselectAll(false)
		else
			listCheckUList:SelectAll(false)
		end
	end

	function listCheckUList.luaRenderItem(button2, index2, data2)
		self:renderCheckSettingItem(button2, settingItem, data2)
	end

	function listCheckUList.luaSelectedChanged(list)
		self:handleCheckSettingChanged(settingItem, curSettingItemKey, nullUButton, list)
	end

	listCheckUList:SetList(checkItems)

	nullUButton.isSelected = not isBusinessSetting and table.contains(checkBoxState, tostring(CloseAllTextIndex))
end

function SettingComponent:renderCheckSettingCategoryItem(button, index, data)
	local settingItem = data.items[1]
	local curSettingItemKey = pg.me.uid .. data.tab .. settingItem.id
	local checkBoxState = self:getCheckSettingState(settingItem, curSettingItemKey)
	local objectReference = button:GetComponent("ObjectReference")
	local txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	local listCheckUList = objectReference:GetRefValue("listCheckUList")

	ClientTextUtils.setText(txtTitleUSDFText, pg.getLocalizationText(data.tabName))

	listCheckUList.groupType = settingItem.optionType

	function listCheckUList.luaRenderItem(button2, index2, data2)
		self:renderCheckSettingItem(button2, settingItem, data2)
	end

	function listCheckUList.luaSelectedChanged(list)
		self:handleCheckSettingChanged(settingItem, curSettingItemKey, nil, list)
	end

	listCheckUList:SetList(self:buildCheckSettingItems(settingItem, checkBoxState))
end

function SettingComponent:getCheckSettingState(settingItem, curSettingItemKey)
	local checkBoxState = {}

	if settingItem.funcType == "friendSocialSetting" then
		for optionIndex, settingKey in ipairs(settingItem.funcParam) do
			local enabled = self.pendingBusinessSettings[settingKey]

			if enabled == nil then
				enabled = pg.me:getFriendSocialSetting(settingKey)
			end

			if enabled then
				checkBoxState[#checkBoxState + 1] = tostring(settingItem.widgetTxt[optionIndex])
			end
		end

		return checkBoxState
	end

	if settingItem.funcType == "interactionInviteAcceptRange" then
		local rangeSettingKey = Const.FriendSocialSettingKey.InteractionInviteAcceptRange
		local currentValue = self.pendingBusinessSettings[rangeSettingKey]

		if currentValue == nil then
			currentValue = pg.me:getInteractionInviteAcceptRange()
		end

		currentValue = currentValue or ClientConst.InteractionInviteAcceptRange.ALL

		for optionIndex, optionValue in ipairs(settingItem.widgetParam) do
			if InteractionScopeByValue[optionValue] == currentValue then
				checkBoxState[#checkBoxState + 1] = tostring(settingItem.widgetTxt[optionIndex])

				break
			end
		end

		return checkBoxState
	end

	local checkBoxStateStr = pg.global.prefsCacheUtils:getString(curSettingItemKey, Utils.concatTableOrUserdata(settingItem.widgetDefaultValue, "|"))

	return string.split(checkBoxStateStr, "|")
end

function SettingComponent:buildCheckSettingItems(settingItem, checkBoxState)
	local checkItems = {}

	for _, txt in ipairs(settingItem.widgetTxt) do
		if txt ~= CloseAllTextIndex then
			checkItems[#checkItems + 1] = {
				id = txt,
				txt = SettingSelectorTextData[txt].name,
				selected = table.contains(checkBoxState, tostring(txt))
			}
		end
	end

	return checkItems
end

function SettingComponent:renderCheckSettingItem(button, settingItem, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")

	ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(data.txt))

	local typeIndex = settingItem.optionType == 1 and 0 or 1

	button:TryChangePage("Type", typeIndex)
end

function SettingComponent:handleCheckSettingChanged(settingItem, curSettingItemKey, nullUButton, list)
	local changedCheckBoxState = {}

	for _, listData in pairs(list.itemData) do
		if listData.selected then
			changedCheckBoxState[#changedCheckBoxState + 1] = listData.id
		end
	end

	if settingItem.funcType ~= nil then
		self:saveBusinessCheckSetting(settingItem, changedCheckBoxState)

		return
	end

	self:saveLocalCheckSetting(curSettingItemKey, nullUButton, changedCheckBoxState)
end

function SettingComponent:saveBusinessCheckSetting(settingItem, changedCheckBoxState)
	self.pendingBusinessSettings = self.pendingBusinessSettings or {}

	if settingItem.funcType == "friendSocialSetting" then
		for optionIndex, settingKey in ipairs(settingItem.funcParam) do
			local isSelected = table.contains(changedCheckBoxState, settingItem.widgetTxt[optionIndex])

			self.pendingBusinessSettings[settingKey] = isSelected
		end

		return
	end

	if settingItem.funcType == "interactionInviteAcceptRange" then
		local rangeSettingKey = Const.FriendSocialSettingKey.InteractionInviteAcceptRange

		for optionIndex, optionText in ipairs(settingItem.widgetTxt) do
			if changedCheckBoxState[1] == optionText then
				self.pendingBusinessSettings[rangeSettingKey] = InteractionScopeByValue[settingItem.widgetParam[optionIndex]]

				break
			end
		end
	end
end

function SettingComponent:commitPendingBusinessSettings()
	local pendingSettings = self.pendingBusinessSettings

	if pendingSettings == nil or next(pendingSettings) == nil then
		return
	end

	local rejectApplyKey = Const.FriendSocialSettingKey.RejectAllFriendApply
	local recommendKey = Const.FriendSocialSettingKey.DisableSystemFriendRecommend
	local scopeKey = Const.FriendSocialSettingKey.InteractionInviteAcceptRange
	local currentAcceptFriendApply = not pg.me:getFriendSocialSetting(rejectApplyKey)
	local currentRecommendEnabled = not pg.me:getFriendSocialSetting(recommendKey)
	local currentInteractionScope = pg.me:getInteractionInviteAcceptRange() or ClientConst.InteractionInviteAcceptRange.ALL
	local acceptFriendApply = currentAcceptFriendApply
	local recommendEnabled = currentRecommendEnabled
	local interactionScope = currentInteractionScope

	for settingKey, value in pairs(pendingSettings) do
		if settingKey == rejectApplyKey then
			acceptFriendApply = value ~= true
		elseif settingKey == recommendKey then
			recommendEnabled = value ~= true
		elseif settingKey == scopeKey then
			interactionScope = value
		end
	end

	local privacyUnchanged = acceptFriendApply == currentAcceptFriendApply and recommendEnabled == currentRecommendEnabled and interactionScope == currentInteractionScope

	if privacyUnchanged then
		return
	end

	pg.me:setPrivacy(acceptFriendApply, interactionScope, recommendEnabled)
end

function SettingComponent:saveLocalCheckSetting(curSettingItemKey, nullUButton, changedCheckBoxState)
	if #changedCheckBoxState == 0 then
		nullUButton:SetSelected(true)

		changedCheckBoxState[#changedCheckBoxState + 1] = CloseAllTextIndex
	else
		nullUButton:SetSelected(false)
	end

	pg.global.prefsCacheUtils:setString(curSettingItemKey, Utils.concatTableOrUserdata(changedCheckBoxState, "|"))
end

function SettingComponent:renderCommonSettingListItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	local listUList = objectReference:GetRefValue("listUList")

	ClientTextUtils.setText(txtTitleUSDFText, pg.getLocalizationText(data.tabName))

	local settingItems = {}

	for _, settingItem in ipairs(data.items) do
		table.insert(settingItems, {
			id = settingItem.id,
			name = settingItem.name,
			tIndex = settingItem.widgetType,
			widgetParam = settingItem.widgetParam,
			widgetDefaultValue = settingItem.widgetDefaultValue,
			widgetTxt = settingItem.widgetTxt,
			funcType = settingItem.funcType
		})
	end

	function listUList.luaRenderItem(button2, index2, data2)
		local curSettingItemKey = pg.me.uid .. data.tab .. data2.id
		local settingItemValue = pg.global.prefsCacheUtils:getString(curSettingItemKey, data2.widgetDefaultValue)

		if data2.tIndex == 0 then
			local objRef = button2:GetComponent("ObjectReference")
			local textTitleUSDFText = objRef:GetRefValue("textTitleUSDFText")
			local selectorUSelector = objRef:GetRefValue("selectorUSelector")
			local placeHolderUSDFText = objRef:GetRefValue("placeHolderUSDFText")

			ClientTextUtils.setText(textTitleUSDFText, pg.getLocalizationText(data2.name))
			ClientTextUtils.setText(placeHolderUSDFText, pg.getLocalizationText(SettingSelectorTextData[data2.widgetTxt[tonumber(settingItemValue)]].name))

			function selectorUSelector.luaRenderPopup(popup, uList)
				function uList.luaRenderItem(button3, index3, data3)
					local selectorListObjRef = button3:GetComponent("ObjectReference")
					local txtUText = selectorListObjRef:GetRefValue("txtUText")

					ClientTextUtils.setText(txtUText, pg.getLocalizationText(data3.selectorItemTxt))
				end

				function uList.luaSelectedChanged(list)
					ClientTextUtils.setText(placeHolderUSDFText, pg.getLocalizationText(uList.selectedItem.selectorItemTxt))
					selectorUSelector:ClosePopup()

					settingItemValue = uList.selectedItem.id

					if data2.funcType == nil then
						pg.global.prefsCacheUtils:setString(curSettingItemKey, settingItemValue)
					end

					local settingValue = uList.selectedItem.id

					if data2.widgetParam then
						settingValue = data2.widgetParam[settingValue]
					end

					self:settingChangeCallback(data2.id, data2.funcType, settingValue)
				end

				local selectorItems = {}

				for idx, selectorItemTxt in ipairs(data2.widgetTxt) do
					table.insert(selectorItems, {
						id = idx,
						selectorItemTxt = SettingSelectorTextData[selectorItemTxt].name
					})
				end

				uList:SetList(selectorItems)
				uList:SelectItem(settingItemValue - 1)
			end
		elseif data2.tIndex == 1 then
			local objRef = button2:GetComponent("ObjectReference")
			local textTitleUSDFText = objRef:GetRefValue("textTitleUSDFText")
			local sliderUSlider = objRef:GetRefValue("sliderUSlider")
			local textValueUSDFText = objRef:GetRefValue("textValueUSDFText")

			sliderUSlider:SetMinWithoutNotify(data2.widgetParam[1])
			sliderUSlider:SetMaxWithoutNotify(data2.widgetParam[2])

			sliderUSlider.value = tonumber(settingItemValue)

			sliderUSlider:SetSliderHotkeyStep(1)
			ClientTextUtils.setText(textValueUSDFText, sliderUSlider.value)

			function sliderUSlider.luaValueChanged(value)
				ClientTextUtils.setText(textValueUSDFText, math.floor(value))
				pg.global.prefsCacheUtils:setString(curSettingItemKey, math.floor(value))
			end

			ClientTextUtils.setText(textTitleUSDFText, pg.getLocalizationText(data2.name))
		end
	end

	listUList:SetList(settingItems)
end

function SettingComponent:settingChangeCallback(settingId, funcType, val)
	if settingId == pg.game.chat.settingType.Word then
		self.ctrl.chatComponent.wordSizeSetting = val

		local data = self.view.messageListUList.itemData

		for i = 0, data.Count - 1 do
			data[i].size = 0
		end

		self.view.messageListUList:RefreshList()

		return
	end

	if funcType == "interactionInviteAcceptRange" then
		self.pendingBusinessSettings[Const.FriendSocialSettingKey.InteractionInviteAcceptRange] = InteractionScopeByValue[val] or val

		return
	end

	if funcType == "rejectAllFriendApply" then
		self.pendingBusinessSettings[Const.FriendSocialSettingKey.RejectAllFriendApply] = val == 1

		return
	end

	if funcType == "disableSystemFriendRecommend" then
		self.pendingBusinessSettings[Const.FriendSocialSettingKey.DisableSystemFriendRecommend] = val == 1
	end
end

return SettingComponent
