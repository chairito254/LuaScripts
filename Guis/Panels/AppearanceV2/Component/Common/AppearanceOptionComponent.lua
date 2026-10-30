-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceV2\\Component\\Common\\AppearanceOptionComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local AppearanceFormConfig = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceFormConfig")
local AppearanceTailorConfig = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceTailorConfig")
local AppearanceData = require("Data.appearance_data")
local AppearanceSuitFormData = require("Data.appearance_suit_form_data")
local ItemData = require("Data.item_data")
local CustomTriggerData = require("Data.custom_trigger_data")
local SysNoticeData = require("Data.sys_notice_data")
local NoticeDef = require("Common.NoticeDef")
local AddressDataConst = require("Const.AddressDataConst")
local AppearanceOptionComponent = Class.LightClass("AppearanceOptionComponent", UIComponent)

AppearanceOptionComponent.ROW_TEMPLATE_INDEX = {
	form = 0,
	crop = 1
}

function AppearanceOptionComponent:onCtor()
	self._visible = true
	self.generation = 0
	self.buttons = {}
	self.buttonAutoTransitions = {}
	self.lists = {}
end

function AppearanceOptionComponent:clear()
	self.generation = self.generation + 1

	for button, click in pairs(self.buttons) do
		if NotNil(button) and button.luaClick == click then
			self:setOptionLockOverride(button, nil)

			button.enableAutoTransition = self.buttonAutoTransitions[button]
			button.luaClick = nil
			button.luaRenderTooltip = nil
			button.enabledTooltip = false
			button.luaPress = nil
			button.luaLongPress = nil
			button.luaBeginLongPress = nil

			if button.isTooltipOpen then
				button:CloseTooltip()
			end
		end
	end

	for list, renderItem in pairs(self.lists) do
		if NotNil(list) and list.luaRenderItem == renderItem then
			list.luaRenderItem = nil
			list.luaClick = nil
		end
	end

	self.buttons = {}
	self.buttonAutoTransitions = {}
	self.lists = {}
end

function AppearanceOptionComponent:onHide()
	if self.suspended then
		return
	end

	self.suspended = true

	self:clear()
end

function AppearanceOptionComponent:onVisibleChange(visible)
	if visible then
		self:onShow()
	else
		self:onHide()
	end
end

function AppearanceOptionComponent:onShow()
	if self.disposed or not self.suspended then
		return
	end

	self.suspended = false

	local binding = self.binding

	if binding and NotNil(binding.list) then
		self:renderSections(binding.list, binding.sections)
	end
end

function AppearanceOptionComponent:onDestroy()
	self.binding = nil
	self.disposed = true

	self:clear()
end

function AppearanceOptionComponent:resolveForms(itemId, appearanceData, suitData, formData)
	local config = suitData and suitData[itemId] or appearanceData and appearanceData[itemId]
	local formIds = config and config.form

	if formIds == nil then
		return {}
	end

	return AppearanceFormConfig.buildList(formIds, formData or AppearanceSuitFormData)
end

function AppearanceOptionComponent:getFormIcon(itemId, index, appearanceData, suitData, formData)
	if type(index) ~= "number" or index < 1 or index % 1 ~= 0 then
		return nil
	end

	local forms, err = self:resolveForms(itemId, appearanceData, suitData, formData)

	if not forms then
		return nil, err
	end

	return forms[index] and forms[index].icon or nil
end

function AppearanceOptionComponent:buildForms(itemId, appearanceData, suitData, formData)
	local suit = suitData and suitData[itemId]

	if not suit then
		return nil
	end

	local extraForms, err = self:resolveForms(itemId, appearanceData, suitData, formData)

	if not extraForms then
		return nil, err
	end

	local forms = {
		{
			index = 0,
			itemId = itemId,
			label = pg.getGameString("APPEARANCE_FORM_PREVIEW_DEFAULT")
		}
	}

	for index, form in ipairs(extraForms) do
		forms[#forms + 1] = {
			index = index,
			formId = form.id,
			itemId = itemId,
			icon = form.icon,
			initialClaim = form.initialClaim,
			limit = form.limit,
			label = form.name ~= nil and ClientTextUtils.getLocalizationText(form.name) or ""
		}
	end

	return forms
end

function AppearanceOptionComponent:buildCropOptions(itemId, appearanceData)
	local config = appearanceData and appearanceData[itemId]

	if not config or config.type ~= 2 or not AppearanceFormConfig.isConfigTable(config.tailor) then
		return nil
	end

	local options = {}

	for index in ipairs(config.tailor) do
		local option = AppearanceTailorConfig.getOption(config, index)

		if option then
			options[#options + 1] = {
				index = index,
				itemId = itemId,
				meshes = option.meshes,
				icon = option.icon,
				initialClaim = option.initialClaim,
				label = option.name ~= nil and ClientTextUtils.getLocalizationText(option.name) or tostring(index)
			}
		end
	end

	if #options == 0 then
		return nil
	end

	table.insert(options, 1, {
		index = 0,
		itemId = itemId,
		meshes = {},
		label = pg.getGameString("APPEARANCE_FORM_PREVIEW_DEFAULT")
	})

	return options
end

function AppearanceOptionComponent:buildCropRows(itemId, appearanceData, suitData)
	local suit = suitData and suitData[itemId]
	local members = suit and suit.appearanceList or {
		itemId
	}
	local rows = {}

	if not AppearanceFormConfig.isConfigTable(members) then
		return rows
	end

	local included = {}

	for _, memberId in ipairs(members) do
		local options = not included[memberId] and self:buildCropOptions(memberId, appearanceData)

		if options then
			included[memberId] = true

			local config = appearanceData[memberId]
			local partId = config.partId or config.points and config.points[1]

			rows[#rows + 1] = {
				itemId = memberId,
				partId = partId,
				forms = options,
				titleKey = suit and partId and "APPEARANCE_CUT_" .. partId or "APPEARANCE_CUT",
				tIndex = AppearanceOptionComponent.ROW_TEMPLATE_INDEX.crop
			}
		end
	end

	table.sort(rows, function(left, right)
		if left.partId ~= right.partId then
			return (left.partId or 0) < (right.partId or 0)
		end

		return left.itemId < right.itemId
	end)

	return rows
end

function AppearanceOptionComponent:isOptionAvailable(data)
	if data.index == 0 then
		return true
	end

	if data.formId then
		local player = pg.me

		return data.initialClaim == 1 or player and player.appearanceInfo and player.appearanceInfo[data.formId] ~= nil or false
	end

	return AppearanceTailorConfig.isUnlocked(pg.me, data.itemId, data.index, AppearanceData)
end

function AppearanceOptionComponent:getLockedTip(conditionId)
	local condition = CustomTriggerData[conditionId]
	local note = condition and condition.note

	if note ~= nil and note ~= 0 and note ~= "" then
		local text = ClientTextUtils.getLocalizationText(note)

		if text ~= nil and text ~= "" then
			return text
		end
	end

	local notice = SysNoticeData[NoticeDef.BADGE_MAIN_IS_LOCK]

	return ClientTextUtils.getLocalizationText(notice.text)
end

function AppearanceOptionComponent:getOptionTipItemId(data)
	if data.index == 0 or not self:isOptionAvailable(data) then
		return nil
	end

	local id = data.formId

	if id and ItemData[id] then
		return id
	end
end

function AppearanceOptionComponent:hideEquippedMark(button, refs)
	local mark = refs:GetRefValue("imgBatchUImage")

	if not mark then
		local selected = button.transform:Find("Widget/Addon/Selected")

		mark = selected and selected:GetComponent("UImage")
	end

	if mark then
		local color = mark.color

		color.a = 0
		mark.color = color

		mark.gameObject:SetActiveEx(false)
	end
end

function AppearanceOptionComponent:refreshOptionLock(button, data)
	local mark = button.transform:Find("Widget/Addon/OptionLock")

	if mark then
		mark.gameObject:SetActiveEx(false)
	end

	local available = self:isOptionAvailable(data)

	button.enableAutoTransition = available and self.buttonAutoTransitions[button] or false

	local page = available and (button.isSelected and 5 or 0) or 4

	button:TryChangePage("button", page)
	self:setOptionLockOverride(button, not available)
end

function AppearanceOptionComponent:setOptionLockOverride(button, locked)
	local lock = button.transform:Find("Widget/Contect/Btn/Lock") or button.transform:Find("Widget/Addon/Lock")
	local mask = button.transform:Find("Widget/Contect/Btn/ImgDisable") or button.transform:Find("Widget/Addon/ImgDisable")

	for _, visual in pairs({
		lock = lock,
		mask = mask
	}) do
		local image = visual:GetComponent("UImage")

		if image then
			image:SetForceActive(CS.XGUI.ForceActiveSource.Business, locked == true)
			image:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, locked == false)

			if locked ~= nil then
				image:SetActive(locked)
			end
		end
	end
end

function AppearanceOptionComponent:refreshSelection(list, selectedIndex)
	for index = 0, list.itemCount - 1 do
		local exists, button = list:TryGetChildAt(index)

		if exists then
			local data = list:GetData(index)
			local selected = data.index == selectedIndex

			button.isSelected = selected

			local refs = button:GetComponent("ObjectReference")

			self:hideEquippedMark(button, refs)
			self:refreshOptionLock(button, data)
		end
	end
end

function AppearanceOptionComponent:isCurrent(generation)
	return not self.disposed and generation == self.generation
end

function AppearanceOptionComponent:bindTooltip(button, data, generation)
	button.enabledTooltip = false
	button.luaRenderTooltip = nil

	local itemId = self:getOptionTipItemId(data)

	if not itemId then
		return nil
	end

	button.tooltipMode = 4
	button.tooltipTemplateUrl = AddressDataConst.UI_TOOLTIP_ITEM_POP

	function button.luaRenderTooltip(_, tooltip)
		if not self:isCurrent(generation) then
			return
		end

		LuaUIUtils.refreshItemInfo(tooltip, {
			skipConditionConvert = true,
			id = itemId,
			targetRect = button
		}, button)
	end

	button.enabledTooltip = true

	return itemId
end

function AppearanceOptionComponent:selectOption(button, cards, data, binding, generation, tipItemId)
	if not self:isCurrent(generation) then
		return
	end

	if tipItemId and not button.isTooltipOpen then
		button:OpenTooltip()
	end

	if not self:isCurrent(generation) then
		return
	end

	if not self:isOptionAvailable(data) then
		self:refreshSelection(cards, binding.state.selectedIndex)
		pg.global.showBubbleMessageRaw(self:getLockedTip(data.limit))

		return
	end

	if not binding.onSelected or binding.onSelected(data) == false then
		return
	end

	if not self:isCurrent(generation) then
		return
	end

	binding.state.selectedIndex = data.index

	self:refreshSelection(cards, data.index)
end

function AppearanceOptionComponent:renderCard(button, cards, data, binding, generation)
	if not self:isCurrent(generation) then
		return
	end

	button.luaClick = nil

	if button.isTooltipOpen then
		button:CloseTooltip()
	end

	if not self:isCurrent(generation) then
		return
	end

	if self.buttonAutoTransitions[button] == nil then
		self.buttonAutoTransitions[button] = button.enableAutoTransition
	end

	local refs = button:GetComponent("ObjectReference")

	refs:GetRefValue("itemIconUImage").url = data.icon or LuaUIUtils.getIconByItemId(data.itemId)

	local label = refs:GetRefValue("txtNumUText") or refs:GetRefValue("txtNumUBaseText")

	ClientTextUtils.setText(label, data.label)

	if label then
		label:SetActive(data.label ~= nil and data.label ~= "")
	end

	button:TryChangePage("Quality", 0)

	button.isSelected = data.index == binding.state.selectedIndex

	self:hideEquippedMark(button, refs)
	self:refreshOptionLock(button, data)

	local tipItemId = self:bindTooltip(button, data, generation)

	button.enabledLongPress = false
	button.luaPress = nil
	button.luaLongPress = nil
	button.luaBeginLongPress = nil

	function button.luaClick()
		self:selectOption(button, cards, data, binding, generation, tipItemId)
	end

	self.buttons[button] = button.luaClick
end

function AppearanceOptionComponent:renderSections(list, sections)
	if self.disposed then
		return
	end

	self:clear()

	self.binding = {
		list = list,
		sections = sections
	}

	if self.suspended then
		return
	end

	local generation = self.generation

	list.luaClick = nil

	function list.luaRenderItem(row, _, section)
		if not self:isCurrent(generation) then
			return
		end

		local refs = row:GetComponent("ObjectReference")

		ClientTextUtils.setText(refs:GetRefValue("txtNameUSDFText"), pg.getGameString(section.titleKey or "APPEARANCE_FORM_PREVIEW"))

		local cards = refs:GetRefValue("listUList")

		cards.luaClick = nil

		function cards.luaRenderItem(button, _, data)
			self:renderCard(button, cards, data, section, generation)
		end

		self.lists[cards] = cards.luaRenderItem

		cards:SetList(section.forms)
	end

	self.lists[list] = list.luaRenderItem

	list:SetList(sections)
end

function AppearanceOptionComponent:render(list, forms, state, onSelected, titleKey)
	local sections = {}

	if forms then
		sections[1] = {
			forms = forms,
			state = state or {},
			onSelected = onSelected,
			titleKey = titleKey,
			tIndex = AppearanceOptionComponent.ROW_TEMPLATE_INDEX.form
		}
	end

	self:renderSections(list, sections)
end

function AppearanceOptionComponent:renderCrop(list, options, state, onSelected)
	local sections = {}

	if options then
		sections[1] = {
			titleKey = "APPEARANCE_CUT",
			forms = options,
			state = state or {},
			onSelected = onSelected,
			tIndex = AppearanceOptionComponent.ROW_TEMPLATE_INDEX.crop
		}
	end

	self:renderSections(list, sections)
end

return AppearanceOptionComponent
