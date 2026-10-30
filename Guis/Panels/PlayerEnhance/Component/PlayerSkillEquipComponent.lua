-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PlayerEnhance\\Component\\PlayerSkillEquipComponent.lua

local UIComponent = require("Guis.Helper.UIComponent")
local Class = require("Core.Framework.Class")
local PlayerSkillEquipComponent = Class.LightClass("PlayerSkillEquipComponent", UIComponent)
local CallbackHandler = require("Core.Common.CallbackHandler")
local NoticeDef = require("Common.NoticeDef")
local UIConst = require("Const.UIConst")
local RedDotConst = require("Const.RedDotConst")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local HotkeyConst = require("Const.HotkeyConst")
local ClientTextUtils = require("Utils.ClientTextUtils")

PlayerSkillEquipComponent.GAMEPAD_EQUIP_ICON_OFFSET = Vector3(70, 70, 0)

function PlayerSkillEquipComponent:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.skillList = self.objectReference:GetRefValue("skillList")
	self.selector = self.objectReference:GetRefValue("selector")
	self.btnUpgrade = self.objectReference:GetRefValue("btnUpgrade")
	self.btnEquip = self.objectReference:GetRefValue("btnEquip")
	self.btnReplace = self.objectReference:GetRefValue("btnReplace")
	self.txtEquipBtn = self.objectReference:GetRefValue("txtEquipBtn")
	self.selectorFilter = self.objectReference:GetRefValue("selectorFilter")
	self.btnFilterOuter = self.objectReference:GetRefValue("btnFilterOuter")
	self.btnCleanFilter = self.objectReference:GetRefValue("btnCleanFilter")
	self.btnFilter = self.objectReference:GetRefValue("btnFilter")
	self.btnEditGroupName = self.objectReference:GetRefValue("btnEditGroupName")
	self.scrollRectUScrollRect = self.objectReference:GetRefValue("scrollRectUScrollRect")
	self.listTab3thUList = self.objectReference:GetRefValue("listTab3thUList")
	self.combatListUList = self.objectReference:GetRefValue("combatListUList")
	self.exploreListUList = self.objectReference:GetRefValue("exploreListUList")
	self.combatUSDFText = self.objectReference:GetRefValue("combatUSDFText")
	self.exploreSkillUSDFText = self.objectReference:GetRefValue("exploreSkillUSDFText")
	self.rootComp = self.transform:GetComponent("UComponent")

	local btnEquipOC = self.btnEquip:GetComponent("ObjectReference")
	local btnEquipName = btnEquipOC:GetRefValue("txtNameUText")

	ClientTextUtils.setText(btnEquipName, pg.getGameString("BUTTON_EQUIP_NAME"))
	ClientTextUtils.setText(self.combatUSDFText, pg.getGameString("ENTRY_COMBAT"))
	ClientTextUtils.setText(self.exploreSkillUSDFText, pg.getGameString("ENTRY_EXPLORE"))
	self:_findSkillLayoutObjects(self.scrollRectUScrollRect)
	self.studyUButton:SetActive(false)
	self.listTab3thUList:SetActive(false)

	function self.skillList.luaRenderItem(button, index, data)
		self:onRenderSkillItem(button, index, data)
	end

	function self.combatListUList.luaRenderItem(button, index, data)
		self:onRenderEquipSkillItem(button, index, data)
	end

	function self.exploreListUList.luaRenderItem(button, index, data)
		self:onRenderEquipSkillItem(button, index, data)
	end

	function self.skillListUList.luaRenderItem(button, _, data)
		self:onRenderElementItem(button, data)
	end

	function self.btnUpgrade.luaClick()
		self:switchToSkillTree()
	end

	function self.btnEquip.luaClick()
		self:onSwitchSkill()
	end

	function self.btnReplace.luaClick()
		self:onSwitchSkill()
	end

	function self.selector.luaClick()
		self:onBtnSelector()
	end

	function self.selector.luaSelectedChanged(selector)
		self:onBtnSelectGroupOption(selector)
	end

	function self.btnEditGroupName.luaClick()
		self:onBtnRenameGroupName()
	end

	function self.selectorFilter.luaSelectedChanged(selector)
		self:onBtnSelectOrderOption(selector)
	end

	function self.btnFilterOuter.luaClick()
		self:onBtnFilterSkill()
	end

	function self.btnFilter.luaClick()
		self:onBtnFilterSkill()
	end

	function self.btnCleanFilter.luaClick()
		self:onBtnClearFilterSkill()
	end

	function self.listUList.luaRenderItem(button, index, data)
		self:onRenderSkillSource(button, index, data)
	end

	function self.listTab3thUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
		local imgAddUImage = objectReference:GetRefValue("imgAddUImage")
	end

	function self.listTab3thUList.luaClick(button, data)
		return
	end

	ClientTextUtils.setText(self.txtNameUSDFText, pg.getGameString(""))
end

function PlayerSkillEquipComponent:_findSkillLayoutObjects(scrollRectUScrollRect)
	local objectReference = scrollRectUScrollRect.content:GetComponent("ObjectReference")

	self.skillListUList = objectReference:GetRefValue("skillListUList")
	self.videoPlayerUVideoPlayerX = objectReference:GetRefValue("videoPlayerUVideoPlayerX")
	self.btnDownloadUButton = objectReference:GetRefValue("btnDownloadUButton")
	self.textUSDFText = objectReference:GetRefValue("textUSDFText")
	self.skillNameUSDFText = objectReference:GetRefValue("skillNameUSDFText")
	self.levelUSDFText = objectReference:GetRefValue("levelUSDFText")
	self.listUList = objectReference:GetRefValue("listUList")
	self.btnStudyUButton = objectReference:GetRefValue("btnStudyUButton")
	self.studyUButton = objectReference:GetRefValue("studyUButton")
	self.txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
end

function PlayerSkillEquipComponent:open(mode, defaultId, defaultSelectSkillId)
	self.isOpen = true

	self:setGamepadEquipFlow(false)

	self.tabIndex = mode or 1
	self.defaultId = defaultId
	self.defaultSelectSkillId = defaultSelectSkillId
	self.selectSkButton = nil
	self.selectEqButton = nil

	self:refreshSkillEquipPage()

	if pg.game.input:isUsingGamepad() then
		self.combatListUList:DeselectAll(false)
		self.exploreListUList:DeselectAll(false)
	end

	self.ctrl:addNavFocusListener(CallbackHandler(self, "onNavFocusChanged"), "SkillEquipConsoleBar")
end

function PlayerSkillEquipComponent:close()
	self.isOpen = false

	self:setGamepadEquipFlow(false)

	local navMgr = pg.global.navMgr

	if navMgr then
		navMgr:SetConsoleBarState("focusOnSkillList", false)
		navMgr:SetConsoleBarState("focusOnEquipList", false)
	end
end

function PlayerSkillEquipComponent:setGamepadEquipFlow(active)
	self.gpEquipFlow = active

	if self.gpEquipIconTimer then
		self:killTimer(self.gpEquipIconTimer)

		self.gpEquipIconTimer = nil
	end

	if NotNil(self.gpEquipIcon) then
		self.gpEquipIcon:SetActive(false)
		CS.UnityEngine.Object.Destroy(self.gpEquipIcon.gameObject)
	end

	self.gpEquipIcon = nil

	if not active then
		return
	end

	local sourceButton = self.selectSkButton
	local previewParent = CS.XGUI.UWidget.rootCanvas.transform
	local previewObject = CS.UnityEngine.Object.Instantiate(sourceButton.gameObject, previewParent, false)

	previewObject.name = "GamepadEquipSkillCard"

	local preview = previewObject:GetComponent("UButton")

	self.gpEquipIcon = preview

	preview:TryInit()

	preview.ignoreLayout = true
	preview.visibility = CS.XGUI.EVisibility.HitTestInvisible
	preview.renderOpacity = 1
	preview.disableAllTweenEffect = true

	local contents = previewObject:GetComponentsInChildren(typeof(CS.XGUI.UContent), true)

	for i = 0, contents.Length - 1 do
		local content = contents[i]

		content.enableInputActon = false
		content.navForceNonInteractable = true
		content.draggable = false
		content.dropable = false
	end

	preview:TryChangePage("SkillStage", 2)
	preview:TryChangePage("HideText", 1)
	preview:TryChangePage("SkillLevel", 1)
	preview:TryChangePage("Equip", 0)
	preview:TryChangePage("Update", 0)
	preview:SetSelected(true)

	local objectReference = preview:GetComponent("ObjectReference")

	objectReference:GetRefValue("icon").url = sourceButton.dataFromUList.icon

	local previewRect = preview.rectTransform
	local center = Vector2(0.5, 0.5)

	previewRect.anchorMin = center
	previewRect.anchorMax = center
	previewRect.pivot = center
	previewRect.sizeDelta = sourceButton.rectTransform.rect.size
	previewRect.localRotation = Quaternion.identity

	previewRect:SetAsLastSibling()
	preview:SetActive(false)

	self.gpEquipIconTimer = self:startTimer(CallbackHandler(self, "refreshGamepadEquipIcon"), 0.02, true)

	self:refreshGamepadEquipIcon()
end

function PlayerSkillEquipComponent:getFocusedEquipSlot()
	local navMgr = pg.global.navMgr
	local target = navMgr and navMgr.CurrentFocusedUContent

	if IsNil(target) then
		return
	end

	local data = target.dataFromUList

	if not data or not data.isEquippedData then
		return
	end

	local found, slotButton = self:getEquipList(data.isCombat):TryGetChildAt(data.index - 1)

	if found and slotButton == target then
		return target
	end
end

function PlayerSkillEquipComponent:refreshGamepadEquipIcon()
	local preview = self.gpEquipIcon

	if not self.isOpen or not self.gpEquipFlow or IsNil(preview) or not self.gameObject.activeInHierarchy or not pg.game.input:isUsingGamepad() then
		self:setGamepadEquipFlow(false)

		return
	end

	local target = self:getFocusedEquipSlot()

	if IsNil(target) or target.dataFromUList.locked then
		preview:SetActive(false)

		return
	end

	local previewRect = preview.rectTransform
	local previewParent = previewRect.parent
	local targetRect = target.rectTransform
	local scale = targetRect.rect.size.x * targetRect.lossyScale.x / (previewRect.rect.size.x * previewParent.lossyScale.x)

	previewRect.localScale = Vector3(scale, scale, 1)
	previewRect.localPosition = previewParent:InverseTransformPoint(targetRect.position) + self.GAMEPAD_EQUIP_ICON_OFFSET

	if not preview.gameObject.activeSelf then
		preview:SetActive(true)
		preview:TryChangePage("button", 7)
	end
end

function PlayerSkillEquipComponent:onHide()
	self:setGamepadEquipFlow(false)
end

function PlayerSkillEquipComponent:onVisibleChange(visible)
	if not visible then
		self:setGamepadEquipFlow(false)
	end
end

function PlayerSkillEquipComponent:onDestroy()
	self:setGamepadEquipFlow(false)
end

function PlayerSkillEquipComponent:onNavFocusChanged()
	local navMgr = pg.global.navMgr

	if not navMgr then
		return
	end

	local group = navMgr.CurrentFocusedGroupName

	navMgr:SetConsoleBarState("focusOnSkillList", group == "ListSkill")
	navMgr:SetConsoleBarState("focusOnEquipList", NotNil(self:getFocusedEquipSlot()))

	if self.gpEquipFlow then
		self:refreshGamepadEquipIcon()
	end
end

function PlayerSkillEquipComponent:refreshSkillEquipPage()
	self.model:clearFilter()
	self:switchTab()
end

function PlayerSkillEquipComponent:switchTab()
	local isCombat = self.tabIndex == 1

	self.rootComp:TryChangePage("SkillType", isCombat and 0 or 1)
	self:refreshEquipSkillList()
	self:refreshSelectView()
	self:focusSkillListDefault()
end

function PlayerSkillEquipComponent:focusSkillListDefault()
	if not pg.game.input:isUsingGamepad() then
		return
	end

	local navMgr = pg.global.navMgr

	if not navMgr then
		return
	end

	self.ctrl:startTimer(function()
		navMgr:FocusGroupByName("ListSkill")
	end, 0.05)
end

function PlayerSkillEquipComponent:tryGamepadBackToSkillList()
	if not pg.game.input:isUsingGamepad() then
		return false
	end

	local navMgr = pg.global.navMgr

	if not navMgr then
		return false
	end

	if IsNil(self:getFocusedEquipSlot()) then
		return false
	end

	self:setGamepadEquipFlow(false)
	navMgr:FocusGroupByName("ListSkill")

	return true
end

function PlayerSkillEquipComponent:refreshEquipSkillList()
	self:setGamepadEquipFlow(false)

	local isCombat = self:getEquipTargetIsCombat()
	local dataList = self.model:getEquipSkillList(isCombat)

	self.skillList:SetList(dataList)

	local selectIndex = 0

	if self.defaultSelectSkillId then
		for k, v in ipairs(dataList) do
			if v.id == self.defaultSelectSkillId then
				selectIndex = k - 1

				break
			end
		end
	end

	local res, skBtn = self.skillList:TryGetChildAt(selectIndex)

	if res then
		self._suppressSkillFocusJump = true

		skBtn:OnClickSimulate()

		self._suppressSkillFocusJump = false
	end
end

function PlayerSkillEquipComponent:refreshSkillListView()
	self.model:refreshEquipSkillList(self:getEquipTargetIsCombat(), self.skillList.itemData)
	self.skillList:RefreshList()
	self.model:refreshEquippedSkillList(true, self.combatListUList.itemData)
	self.combatListUList:RefreshList()
	self.model:refreshEquippedSkillList(false, self.exploreListUList.itemData)
	self.exploreListUList:RefreshList()
end

function PlayerSkillEquipComponent:getEquipList(isCombat)
	return isCombat and self.combatListUList or self.exploreListUList
end

function PlayerSkillEquipComponent:getEquipTargetIsCombat()
	if not IsNil(self.selectEqButton) then
		return self.selectEqButton.dataFromUList.isCombat
	end

	return self.tabIndex == 1
end

function PlayerSkillEquipComponent:selectEquipSlot(button)
	local oldIsCombat = self:getEquipTargetIsCombat()
	local data = button.dataFromUList

	self.selectEqButton = button

	self:getEquipList(not data.isCombat):DeselectAll(false)
	self:getEquipList(data.isCombat):SelectItem(data.index - 1, false)

	if oldIsCombat ~= data.isCombat then
		self.model:refreshEquipSkillList(data.isCombat, self.skillList.itemData)
		self.skillList:RefreshList()
	end
end

function PlayerSkillEquipComponent:onRenderSkillItem(button, index, data)
	local oc = button:GetComponent("ObjectReference")
	local tLevel = oc:GetRefValue("txtLevel")
	local tName = oc:GetRefValue("txtName")
	local iIcon = oc:GetRefValue("icon")

	button.name = index
	button.draggable = false
	button.navForceNonInteractable = data.isEmpty == true

	button:TryChangePage("Equip", data.isEquipped and 1 or 0)

	if data.isEmpty then
		button:TryChangePage("SkillStage", 3)

		return
	end

	ClientTextUtils.setText(tName, data.name)

	local skillState = data.state

	if skillState == self.model.SKILL_STATE.CAN_UPGRADE then
		button:TryChangePage("Update", 1)
	else
		button:TryChangePage("Update", 0)
	end

	local iPbKey = oc:GetRefValue("keyHotKey")
	local showHotKey = data.keyBoard ~= nil and not pg.global.ui:runPlatformByMobile()

	iPbKey.gameObject:SetActiveEx(showHotKey)

	if showHotKey then
		iPbKey:SetHotKeyPaths(data.keyBoard)
	end

	if skillState == self.model.SKILL_STATE.CANT_UNLOCK_LEVEL_INSUFFICIENT or skillState == self.model.SKILL_STATE.CANT_UNLOCK_CONDITION_NOT_MEET then
		button:TryChangePage("SkillStage", 0)
		ClientTextUtils.setText(tLevel, "")
	elseif skillState == self.model.SKILL_STATE.CAN_UNLOCK then
		button:TryChangePage("SkillStage", 1)
		ClientTextUtils.setText(tLevel, string.format("0/%d", data.maxLv))
	else
		button:TryChangePage("SkillStage", 2)

		local nodeData = pg.me.skillNodeMap[data.id]

		ClientTextUtils.setText(tLevel, string.format("%d/%d", nodeData.lv, data.maxLv))

		button.draggable = true
	end

	iIcon.url = data.icon

	function button.luaBeginDrag()
		button:TryChangePage("SkillStage", 4)
		self:onClickSkillItem(button)

		local dragWidget = CS.XGUI.UComponent.draggingWidget

		if IsNil(dragWidget) then
			return
		end

		dragWidget:TryChangePage("HideText", 1)
		dragWidget:TryChangePage("Equip", 0)
		dragWidget:TryChangePage("Update", 0)
		dragWidget:TryChangePage("SkillLevel", 1)
	end

	function button.luaEndDrag(dropWidget)
		button:TryChangePage("SkillStage", 2)
		self:onDropSkillItem(button, dropWidget)
	end

	function button.luaClick(isFromNavigation)
		self:onClickSkillItem(button, isFromNavigation)
	end
end

function PlayerSkillEquipComponent:onClickSkillItem(button, isFromNavigation)
	self.selectSkButton = button

	self:refreshSkillView()
	self:refreshBtnState()

	if isFromNavigation == false and button.dataFromUList.level > 0 and not self._suppressSkillFocusJump and not self.selectGroupRequest and not self.addGroupRequest and not self.deleteGroupRequest and pg.game.input:isUsingGamepad() then
		local targetIdx = self:pickEquipTargetSlotIndex(button.dataFromUList)

		if targetIdx ~= nil then
			self:setGamepadEquipFlow(true)
			self:focusEquipSlot(targetIdx)
		end
	elseif isFromNavigation == true then
		self:setGamepadEquipFlow(false)
	end
end

function PlayerSkillEquipComponent:pickEquipTargetSlotIndex(selectedData)
	local itemData = self:getEquipList(self:getEquipTargetIsCombat()).itemData

	if IsNil(itemData) or itemData.Count == 0 then
		return nil
	end

	local count = itemData.Count
	local realId = selectedData and selectedData.realId

	if realId then
		for i = 0, count - 1 do
			local d = itemData[i]

			if d and not d.isEmpty and d.realId == realId then
				for j = 0, count - 1 do
					local other = itemData[j]

					if j ~= i and other and not other.locked then
						return j
					end
				end
			end
		end
	end

	for i = 0, count - 1 do
		local d = itemData[i]

		if d and d.isEmpty and not d.locked then
			return i
		end
	end

	for i = 0, count - 1 do
		local d = itemData[i]

		if d and not d.locked then
			return i
		end
	end

	return nil
end

function PlayerSkillEquipComponent:focusEquipSlot(idx0)
	if idx0 == nil then
		return
	end

	local res, slotBtn = self:getEquipList(self:getEquipTargetIsCombat()):TryGetChildAt(idx0)

	if not res or IsNil(slotBtn) then
		return
	end

	local navMgr = pg.global.navMgr

	if not navMgr then
		return
	end

	navMgr:FocusItem(slotBtn)
end

function PlayerSkillEquipComponent:refreshSkillView()
	local data = self.selectSkButton.dataFromUList

	ClientTextUtils.setText(self.skillNameUSDFText, data.name)
	ClientTextUtils.setText(self.levelUSDFText, ClientTextUtils.formatShortLevel(data.level or 0))
	ClientTextUtils.setText(self.textUSDFText, data.desc)

	self.videoPlayerUVideoPlayerX.videoLoop = true
	self.videoPlayerUVideoPlayerX.useAlpha = false
	self.videoPlayerUVideoPlayerX.resID = data.video

	self.skillListUList:SetList(data.attrs)
end

function PlayerSkillEquipComponent:onRenderElementItem(button, data)
	local oc = button:GetComponent("ObjectReference")

	if IsNil(oc) then
		return
	end

	local iName = oc:GetRefValue("txtName")

	ClientTextUtils.setText(iName, data.name)
end

function PlayerSkillEquipComponent:onRenderEquipSkillItem(button, index, data)
	local oc = button:GetComponent("ObjectReference")
	local iIcon = oc:GetRefValue("icon")
	local iPbKey = oc:GetRefValue("hotKeyContent")
	local isMobile = pg.global.ui:runPlatformByMobile()

	if data.locked then
		button:TryChangePage("Lock", 0)

		return
	else
		button:TryChangePage("Lock", 1)
	end

	button.name = index

	function button.luaClick(isFromNavigation)
		self:onClickEquipSkillItem(button, isFromNavigation)
	end

	if not isMobile then
		iPbKey:SetHotKeyPaths(data.fixedKeyBoard)
	end

	button:TryChangePage("BgType", data.isCombat and 0 or 1)

	local treePath = string.format(RedDotConst.RedDotPath.PLAYER_EQUIP_SKILL_LIST_ITEM, tostring(data.isCombat), data.index)
	local showRedDot = self.model:redDot_GetPlayerMainEquipState(data)

	pg.global.setRedDot(treePath, button, showRedDot, RedDotConst.RedDotStyle.POINT)

	if data.isEmpty then
		button:TryChangePage("isEmpty", 1)

		return
	end

	iIcon.url = data.icon

	button:TryChangePage("isEmpty", 0)
end

function PlayerSkillEquipComponent:onRenderSkillSource(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
end

function PlayerSkillEquipComponent:onClickEquipSkillItem(button, isFromNavigation)
	if button.dataFromUList.locked then
		return
	end

	self:selectEquipSlot(button)

	if self.gpEquipFlow and pg.game.input:isUsingGamepad() then
		if isFromNavigation == false then
			self:onEquipCombatClick()
		else
			self:refreshBtnState()
		end

		return
	end

	local dataList = self.skillList.itemData
	local idx = self.model:getEquipSkillItemIndex(dataList, button.dataFromUList.id)
	local res, skBtn = self.skillList:TryGetChildAt(idx)

	if res and not button.dataFromUList.isEmpty and skBtn.dataFromUList.id == button.dataFromUList.id then
		self._suppressSkillFocusJump = true

		skBtn:OnClickSimulate()

		self._suppressSkillFocusJump = false
	end

	self:refreshBtnState()
end

function PlayerSkillEquipComponent:refreshBtnState()
	if IsNil(self.selectSkButton) or IsNil(self.selectEqButton) then
		return
	end

	local data1 = self.selectSkButton.dataFromUList
	local data2 = self.selectEqButton.dataFromUList

	self.rootComp:TryChangePage("SkillBtn", 0)
	self.btnEquip:TryChangePage("button", 0)
	self.btnReplace:TryChangePage("button", 0)

	self.btnEquip.interactable = true
	self.btnReplace.interactable = true

	if data1.state == self.model.SKILL_STATE.CANT_UNLOCK_LEVEL_INSUFFICIENT or data1.state == self.model.SKILL_STATE.CANT_UNLOCK_CONDITION_NOT_MEET or data1.state == self.model.SKILL_STATE.CAN_UNLOCK then
		if data2.realId and data1.realId ~= data2.realId then
			self.btnReplace.interactable = false

			self.rootComp:TryChangePage("SkillBtn", 1)
			self.btnReplace:TryChangePage("button", 4)
		else
			self.btnEquip:TryChangePage("button", 4)

			self.btnEquip.interactable = false
		end
	elseif not data1.isEmpty and not data2.isEmpty then
		if data1.realId == data2.realId then
			self.btnEquip:TryChangePage("button", 4)

			self.btnEquip.interactable = false
		else
			self.rootComp:TryChangePage("SkillBtn", 1)
		end
	end
end

function PlayerSkillEquipComponent:onSwitchSkill()
	self:onEquipCombatClick()
end

function PlayerSkillEquipComponent:refreshSelectView()
	self:refreshOrderSelector()

	local isCombat = self.tabIndex == 1

	self:refreshBoxSelector(isCombat)
end

function PlayerSkillEquipComponent:switchToSkillTree()
	local data = self.selectSkButton.dataFromUList

	self.ctrl:openSkillTreePage(data.realId)
end

function PlayerSkillEquipComponent:onDropSkillItem(drag, drop)
	if IsNil(drop) then
		return
	end

	local dropData = drop.dataFromUList

	if not dropData or not dropData.isEquippedData or dropData.locked then
		return
	end

	self.selectSkButton = drag

	self:selectEquipSlot(drop)
	self:onEquipCombatClick()
end

function PlayerSkillEquipComponent:onBtnFilterSkill()
	self:setGamepadEquipFlow(false)
	pg.global.ui:open(UIConst.UI_ID_PLAYER_SKILL_FILTER, {
		filter = self.model:getFilter(),
		cancelCallback = function()
			return
		end,
		confirmCallback = function()
			self.rootComp:TryChangePage("State", self.model:parseFilter() and 1 or 0)
			self:switchTab()
		end
	})
end

function PlayerSkillEquipComponent:onBtnClearFilterSkill()
	self.model:clearFilter()
	self:switchTab()
	self.rootComp:TryChangePage("State", 0)
end

function PlayerSkillEquipComponent:refreshOrderSelector()
	local options = self.model:parseOrders()

	self.selectorFilter:SetOptions(options)

	self.selectorFilter.selectedIndex = self.model:getSelectOrderIndex()
end

function PlayerSkillEquipComponent:onBtnSelectOrderOption(selector)
	local selectedIndex = selector.selectedIndex

	self.model:selectOrder(selectedIndex)
	self:refreshEquipSkillList()
end

function PlayerSkillEquipComponent:onBtnSelector()
	if self.selectGroupRequest or self.addGroupRequest or self.deleteGroupRequest then
		self.selector:ClosePopup()

		return
	end

	local isCombat = self.tabIndex == 1

	self:refreshBoxSelector(isCombat)
	self:refreshSkillListView()
	self:refreshBtnState()
end

function PlayerSkillEquipComponent:refreshBoxSelector(isCombat)
	self:setGamepadEquipFlow(false)

	local options = self.model:getSkillGroupOptions(isCombat)

	function self.selector.luaRenderPopup(_, uList)
		self.popupGroupList = uList

		self:onRenderBoxPopup(uList, options)
	end

	self.refreshingSelector = true

	self.selector:SetOptions(options)
	self.selector:ForceSelect(self.model:getCurSkillIndex(isCombat) - 1, false)

	self.refreshingSelector = false

	if not IsNil(self.popupGroupList) then
		self:onRenderBoxPopup(self.popupGroupList, options)
	end

	local targetIsCombat = self:getEquipTargetIsCombat()
	local selectedIndex

	if not IsNil(self.selectEqButton) then
		selectedIndex = self.selectEqButton.dataFromUList.index
	end

	local combatDataList, combatIndex = self.model:getEquippedSkillList(true, self.defaultId)
	local exploreDataList, exploreIndex = self.model:getEquippedSkillList(false, self.defaultId)

	self.combatListUList:SetList(combatDataList)
	self.exploreListUList:SetList(exploreDataList)

	local index = selectedIndex or targetIsCombat and combatIndex or exploreIndex
	local res, eqBtn = self:getEquipList(targetIsCombat):TryGetChildAt(index - 1)

	if res then
		self:selectEquipSlot(eqBtn)

		if not self.defaultSelectSkillId then
			eqBtn:OnClickSimulate()
		end
	end

	self.defaultId = nil
	self.defaultSelectSkillId = nil
end

function PlayerSkillEquipComponent:onRenderBoxPopup(uList, options)
	uList.luaRenderItem = CallbackHandler(self, "onRenderGroupItem")

	uList:SetList(options)
end

function PlayerSkillEquipComponent:onRenderGroupItem(button, idx, data)
	local objectReference = button:GetComponent("ObjectReference")
	local nameUText = objectReference:GetRefValue("nameUText")
	local listSkillUList = objectReference:GetRefValue("listSkillUList")
	local listSkill1UList = objectReference:GetRefValue("listSkill1UList")
	local selectedUSDFText = objectReference:GetRefValue("selectedUSDFText")
	local btnRenameUButton = objectReference:GetRefValue("btnRenameUButton")
	local skillUWidget = objectReference:GetRefValue("skillUWidget")

	skillUWidget:SetActive(true)
	objectReference:GetRefValue("numCPUText"):SetActive(false)
	objectReference:GetRefValue("listUList"):SetActive(false)
	objectReference:GetRefValue("keyUWidget"):SetActive(false)
	btnRenameUButton:SetActive(not data.add)

	btnRenameUButton.luaClick = nil

	if not data.add then
		function btnRenameUButton.luaClick(isFromNavigation)
			if isFromNavigation then
				return
			end

			self:onBtnRenameGroupName(data.index)
		end
	end

	local isSelected = not data.add and data.index == self.model:getCurSkillIndex(self.tabIndex == 1)

	button:SetSelected(isSelected)
	button:TryChangePage("select", isSelected and 1 or 0)
	button:TryChangePage("inUse", isSelected and 1 or 0)
	button:TryChangePage("State", data.add and 1 or 0)
	nameUText:SetActive(not data.add)
	ClientTextUtils.setText(nameUText, data.label or "")
	ClientTextUtils.setText(selectedUSDFText, pg.getGameString("PET_MANAGEMENT_CHOOSE"))

	local combatSkills = {}
	local exploreSkills = {}

	if not data.add then
		for _, skill in ipairs(data.skills) do
			local skills = skill.isCombat and combatSkills or exploreSkills

			skills[#skills + 1] = skill
		end
	end

	listSkillUList:SetActive(not data.add)
	listSkill1UList:SetActive(not data.add)

	if not data.add then
		listSkillUList.visibility = CS.XGUI.EVisibility.HitTestInvisible
		listSkill1UList.visibility = CS.XGUI.EVisibility.HitTestInvisible
	end

	local renderSkillItem = CallbackHandler(self, "onRenderGroupSkillItem")

	listSkillUList.luaRenderItem = renderSkillItem
	listSkill1UList.luaRenderItem = renderSkillItem

	listSkillUList:SetList(combatSkills)
	listSkill1UList:SetList(exploreSkills)
end

function PlayerSkillEquipComponent:onRenderGroupSkillItem(button, index, data)
	button.draggable = false
	button.navForceNonInteractable = true

	button:TryChangePage("Equip", 0)
	button:TryChangePage("Update", 0)
	button:TryChangePage("HideText", 1)
	button:TryChangePage("SkillLevel", 1)
	button:TryChangePage("SkillStage", data.isEmpty and 3 or 2)

	local objectReference = button:GetComponent("ObjectReference")

	objectReference:GetRefValue("icon").url = data.icon or ""
end

function PlayerSkillEquipComponent:onBtnSelectGroupOption(selector)
	if self.refreshingSelector then
		return
	end

	self.selector:ClosePopup()

	local curIndex = self.model:getCurSkillIndex(self.tabIndex == 1)

	if self.selectGroupRequest or self.addGroupRequest or self.deleteGroupRequest then
		local index = self.selectGroupRequest and self.selectGroupRequest.index or curIndex

		self.selector:ForceSelect(index - 1, false)

		return
	end

	local optionData = selector.selectedItem

	if not optionData or optionData.add then
		self.selector:ForceSelect(curIndex - 1, false)

		if optionData and optionData.add then
			self:onSelectAddGroup()
		end

		return
	end

	local index = optionData.index
	local me = pg.me

	if not me.fightCustomAbilityIds[index] and not me.exploreCustomAbilityIds[index] then
		pg.global.showBubbleMessageRaw(pg.getGameString("FAILED"), 3)
		self.selector:ForceSelect(curIndex - 1, false)

		return
	end

	local request = {
		index = index
	}

	self.selectGroupRequest = request

	self:setGamepadEquipFlow(false)
	me:serverMsg("RPC_CS_SelectCustomAbilityGroup", index, CallbackHandler(self, "selectGroupCallback", request))
end

function PlayerSkillEquipComponent:selectGroupCallback(request, res)
	if self.selectGroupRequest ~= request then
		return
	end

	self.selectGroupRequest = nil

	if not self.ctrl or not self.isOpen then
		return
	end

	if not res then
		pg.global.showBubbleMessageRaw(pg.getGameString("FAILED"), 3)
	end

	self:onBtnSelector()
end

function PlayerSkillEquipComponent:onSelectAddGroup()
	if self.selectGroupRequest or self.addGroupRequest or self.deleteGroupRequest then
		return
	end

	self.selector:ClosePopup()

	local index = self.model:getNewSkillGroupIndex()

	if not index then
		pg.global.showBubbleMessageRaw(pg.getGameString("FAILED"), 3)
		self:onBtnSelector()

		return
	end

	local request = {
		index = index
	}

	self.addGroupRequest = request

	self:setGamepadEquipFlow(false)
	pg.global.showConfirmMsgRaw(pg.getGameString("SKILL_GROUP"), pg.getGameString("SKILL_GROUP_ADD"), CallbackHandler(self, "confirmAddGroup", request), false, CallbackHandler(self, "cancelAddGroup", request))
end

function PlayerSkillEquipComponent:cancelAddGroup(request)
	if self.addGroupRequest == request then
		self.addGroupRequest = nil
	end
end

function PlayerSkillEquipComponent:confirmAddGroup(request)
	if self.addGroupRequest ~= request or request.isSending then
		return
	end

	if not self.ctrl or not self.isOpen then
		self:cancelAddGroup(request)

		return
	end

	if self.model:getNewSkillGroupIndex() ~= request.index then
		self:cancelAddGroup(request)
		pg.global.showBubbleMessageRaw(pg.getGameString("FAILED"), 3)
		self:onBtnSelector()

		return
	end

	request.isSending = true

	pg.me:serverMsg("RPC_CS_AddCustomAbilityGroup", CallbackHandler(self, "addGroupCallback", request))
end

function PlayerSkillEquipComponent:addGroupCallback(request, res)
	if self.addGroupRequest ~= request then
		return
	end

	self.addGroupRequest = nil

	if not self.ctrl or not self.isOpen then
		return
	end

	pg.global.showBubbleMessageRaw(pg.getGameString(res and "SKILL_GROUP_ADD_SUCCESS" or "FAILED"), 3)
	self:onBtnSelector()
end

function PlayerSkillEquipComponent:onSelectDeleteGroup(data)
	if not self.ctrl or not self.isOpen or self.selectGroupRequest or self.addGroupRequest or self.deleteGroupRequest then
		return
	end

	local index = data and data.index

	if not self.model:canDeleteSkillGroup(index) then
		pg.global.showBubbleMessageRaw(pg.getGameString("FAILED"), 3)

		return
	end

	self.selector:ClosePopup()

	local request = {
		index = index,
		fightScheme = pg.me.fightCustomAbilityIds[index],
		exploreScheme = pg.me.exploreCustomAbilityIds[index]
	}

	self.deleteGroupRequest = request

	self:setGamepadEquipFlow(false)
	pg.global.showConfirmMsgRaw(pg.getGameString("SKILL_GROUP"), pg.getGameString("SKILL_GROUP_DEL"), CallbackHandler(self, "confirmDeleteGroup", request), false, CallbackHandler(self, "cancelDeleteGroup", request))
end

function PlayerSkillEquipComponent:cancelDeleteGroup(request)
	if self.deleteGroupRequest == request then
		self.deleteGroupRequest = nil
	end
end

function PlayerSkillEquipComponent:confirmDeleteGroup(request)
	if self.deleteGroupRequest ~= request or request.isSending then
		return
	end

	if not self.ctrl or not self.isOpen then
		self:cancelDeleteGroup(request)

		return
	end

	local me = pg.me

	if not self.model:canDeleteSkillGroup(request.index) or me.fightCustomAbilityIds[request.index] ~= request.fightScheme or me.exploreCustomAbilityIds[request.index] ~= request.exploreScheme then
		self:cancelDeleteGroup(request)
		pg.global.showBubbleMessageRaw(pg.getGameString("FAILED"), 3)
		self:onBtnSelector()

		return
	end

	request.isSending = true

	me:serverMsg("RPC_CS_DeleteCustomAbilityGroup", request.index, CallbackHandler(self, "deleteGroupCallback", request))
end

function PlayerSkillEquipComponent:deleteGroupCallback(request, res)
	if self.deleteGroupRequest ~= request then
		return
	end

	self.deleteGroupRequest = nil

	if not self.ctrl or not self.isOpen then
		return
	end

	pg.global.showBubbleMessageRaw(pg.getGameString(res and "SKILL_GROUP_DEL_SUCCESS" or "FAILED"), 3)
	self:onBtnSelector()
end

function PlayerSkillEquipComponent:onBtnRenameGroupName(index)
	if not self.ctrl or not self.isOpen or self.selectGroupRequest or self.addGroupRequest or self.deleteGroupRequest then
		return
	end

	index = index or self.model:getCurSkillIndex(self.tabIndex == 1)

	self.selector:ClosePopup()

	local submitted = false

	pg.global.ui:open(UIConst.UI_ID_PLAYER_RENAME, {
		mode = "Rename",
		placeholder = "",
		title = pg.getGameString("RENAME_TIPS_SKILL"),
		initialText = self.model:getSkillGroupName(index),
		confirmCallback = function(newName)
			if submitted or not self.ctrl or not self.isOpen then
				return
			end

			submitted = true

			pg.me:serverMsg("RPC_CS_UpdateCustomAbilityGroupName", index, newName, function(res)
				if not self.ctrl or not self.isOpen then
					return
				end

				if not res then
					pg.global.showBubbleMessageRaw(pg.getGameString("FAILED"), 3)

					return
				end

				self:renameFinished()
			end)
		end
	})
end

function PlayerSkillEquipComponent:renameFinished()
	self:onBtnSelector()
end

function PlayerSkillEquipComponent:onEquipCombatClick()
	self:setGamepadEquipFlow(false)

	if self.selectGroupRequest or self.addGroupRequest or self.deleteGroupRequest then
		return
	end

	if IsNil(self.selectSkButton) or IsNil(self.selectEqButton) then
		return
	end

	local data1 = self.selectSkButton.dataFromUList
	local data2 = self.selectEqButton.dataFromUList

	if data1 == nil or data2 == nil or not data2.isEquippedData or data2.locked then
		return
	end

	if data1.realId == data2.realId then
		return
	end

	if data1.realId == nil then
		return
	end

	local me = pg.me
	local serverOpcode = data2.isCombat and "RPC_CS_UpdateFightAbilityId" or "RPC_CS_UpdateExploreAbilityId"
	local schemeIndex = self.model:getCurSkillIndex(data2.isCombat)

	me:serverMsg(serverOpcode, data2.index, data1.realId, CallbackHandler(self, "switchCombatSkillCallback", self.selectEqButton, schemeIndex))
end

function PlayerSkillEquipComponent:switchCombatSkillCallback(slotBtn, schemeIndex, res)
	if not self.ctrl or not self.isOpen then
		return
	end

	if not res then
		pg.global.showBubbleMessageRaw(pg.getGameString("FAILED"), 3)

		return
	end

	pg.global.showBubbleMessageRaw(pg.getGameString("SUCCEED"), 3)

	if self.selectGroupRequest or self.addGroupRequest or self.deleteGroupRequest then
		return
	end

	self:refreshSkillListView()
	self:refreshBtnState()

	if IsNil(slotBtn) or self.model:getCurSkillIndex(slotBtn.dataFromUList.isCombat) ~= schemeIndex then
		return
	end

	local oc = slotBtn:GetComponent("ObjectReference")
	local iAnim = oc:GetRefValue("vAnimation")

	slotBtn:TryChangePage("Refresh", 1)
	UIUtils.PlayAnimation(iAnim, "VX_UI_Node_Skill_Refresh_01", function()
		if not IsNil(slotBtn) then
			slotBtn:TryChangePage("Refresh", 0)
		end
	end)
end

return PlayerSkillEquipComponent
