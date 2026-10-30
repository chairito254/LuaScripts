-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LevelBreakthroughTip\\LevelBreakthroughTipCtrl.lua

local UIConst = require("Const.UIConst")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local NoticeDef = require("Common.NoticeDef")
local ItemData = require("Data.item_data")
local ItemUtils = require("Common.Utils.ItemUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local LevelBreakthroughTipCtrl = Class.LightClass("LevelBreakthroughTipCtrl", UICtrl)
local PLAN_TEXT_KEY = "PET_SEASON_CRYSTAL_PLAN"
local SIGN_PAGE_SELECTED = 5
local SIGN_PAGE_DISABLED = 9

LevelBreakthroughTipCtrl.messages = {}

function LevelBreakthroughTipCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	info = info or {}
	self.ensureCb = info.ensureCb
	self.cancelCb = info.cancelCb
	self.m_confirmed = false
	self.showPlanToggle = info.showPlanToggle == true
	self.planToggleSelected = info.planToggleSelected == true
	self.m_listInited = false
	self.rows = self:m_copyRows(info.rows)
end

function LevelBreakthroughTipCtrl:m_copyRows(rawRows)
	local rows = {}

	for _, raw in ipairs(rawRows or {}) do
		local sources = {}

		for _, src in ipairs(raw.sources or {}) do
			sources[#sources + 1] = {
				locked = false,
				id = src.id,
				ownNum = src.ownNum or 0,
				needNum = src.needNum or 0,
				selected = src.selected ~= false
			}
		end

		local row = {
			lackRemain = 0,
			selectable = raw.selectable == true and #sources > 1,
			isSeasonalCrystal = raw.isSeasonalCrystal == true,
			oriItemId = raw.oriItemId,
			deficit = raw.deficit or raw.oriNum or 0,
			sources = sources
		}

		if row.selectable then
			self:m_recomputeSelectableRow(row)
		end

		rows[#rows + 1] = row
	end

	return rows
end

function LevelBreakthroughTipCtrl:m_recomputeSelectableRow(row)
	local lack = row.deficit or 0

	for _, src in ipairs(row.sources) do
		src.needNum = 0

		if src.selected and lack > 0 then
			local take = math.min(src.ownNum or 0, lack)

			src.needNum = take
			lack = lack - take
		end
	end

	row.lackRemain = lack

	for _, src in ipairs(row.sources) do
		src.locked = false

		if src.selected then
			local remain = row.deficit or 0

			for _, other in ipairs(row.sources) do
				if other ~= src and other.selected and remain > 0 then
					remain = remain - math.min(other.ownNum or 0, remain)
				end
			end

			src.locked = remain > 0
		end
	end
end

function LevelBreakthroughTipCtrl:onShow()
	self:m_refreshPlanToggle()
	self:m_refreshRows()
end

function LevelBreakthroughTipCtrl:m_refreshRows()
	local list = self.view.listUList

	if not NotNil(list) then
		return
	end

	if not self.m_listInited then
		self.m_listInited = true

		list:SetList(self.rows or {})

		return
	end

	if list.RefreshList then
		list:RefreshList()

		return
	end

	list:SetList(self.rows or {})
end

function LevelBreakthroughTipCtrl:m_fillItemVisual(data)
	local itemConfig = ItemData[data.id] or {}

	data.quality = itemConfig.quality or 0
	data.iconName = LuaUIUtils.getIconByIconId(itemConfig.icon)

	if data.ownNum == nil then
		data.ownNum = ItemUtils.getItemCountById(pg.me, data.id)
	end
end

function LevelBreakthroughTipCtrl:m_openItemTip(button, data)
	if pg.global.ui:checkUIShow(UIConst.UI_ID_COMMON_ITEM_TIP) then
		pg.global.ui:close(UIConst.UI_ID_COMMON_ITEM_TIP)

		return
	end

	pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
		id = data.id,
		num = data.ownNum,
		targetRect = button,
		closeOnJumpToSource = function()
			self:closePanel()
		end
	})
end

function LevelBreakthroughTipCtrl:m_applySignState(container, page)
	if not NotNil(container) then
		return
	end

	local function applyPage()
		local content = container.content

		if not NotNil(content) or not content.TryChangePage then
			return
		end

		pcall(function()
			local propertyInfo = content:GetType():GetProperty("visualInteractable")

			if propertyInfo then
				propertyInfo:SetValue(content, page ~= SIGN_PAGE_DISABLED, nil)
			end
		end)

		if content.SetSelected then
			content:SetSelected(true)
		end

		content:TryChangePage("button", page)

		if NotNil(content.transform) then
			local rayBox = content.transform:Find("RayBox")

			if NotNil(rayBox) and NotNil(rayBox.gameObject) then
				rayBox.gameObject:SetActiveEx(false)
			end
		end
	end

	if container.CheckURLLoaded and container:CheckURLLoaded() then
		applyPage()

		return
	end

	if container.LoadDefaultUrlManually then
		container:LoadDefaultUrlManually(applyPage)
	end
end

function LevelBreakthroughTipCtrl:m_renderItem(button, data, isSource, row)
	local objectReference = button:GetComponent("ObjectReference")
	local itemIconUImage = objectReference:GetRefValue("itemIconUImage")
	local txtNumUText = objectReference:GetRefValue("txtNumUBaseText")
	local signAddUContainer = LuaUIUtils.safeGetRefValue(objectReference, "selectedUContainer")

	if not NotNil(signAddUContainer) then
		signAddUContainer = LuaUIUtils.safeGetRefValue(objectReference, "signAddUContainer")
	end

	self:m_fillItemVisual(data)

	if txtNumUText then
		txtNumUText.disabledLocalization = true
	end

	local showCheck = isSource and row and row.selectable

	button.enabledTooltip = false
	button.luaTooltipPopup = nil

	function button.luaClick()
		if showCheck then
			self:m_onClickSourceItem(data, row)

			return
		end

		self:m_openItemTip(button, data)
	end

	if not showCheck then
		function button.luaTooltipPopup(_, open)
			button.isSelected = open
		end
	else
		button.isSelected = false
	end

	if button.TryChangePage then
		button:TryChangePage("Quality", data.quality or 0)
	end

	if itemIconUImage then
		itemIconUImage.url = data.iconName
	end

	local needNum = data.needNum or 0
	local ownNum = data.ownNum or 0
	local numText

	if isSource then
		local needText = tostring(needNum)

		if ownNum < needNum then
			needText = string.format("<color=#ff5959>%s</color>", needText)
		end

		numText = string.format("%s/%s", needText, tostring(ownNum))
	else
		numText = tostring(needNum)
	end

	if txtNumUText then
		ClientTextUtils.setText(txtNumUText, numText)
	end

	if NotNil(signAddUContainer) then
		local showSign = showCheck and data.selected == true

		signAddUContainer:SetActive(showSign)

		if showSign then
			local page = SIGN_PAGE_SELECTED

			if data.locked then
				page = SIGN_PAGE_DISABLED
			end

			self:m_applySignState(signAddUContainer, page)
		end
	end
end

function LevelBreakthroughTipCtrl:m_onClickSourceItem(data, row)
	if pg.global.ui:checkUIShow(UIConst.UI_ID_COMMON_ITEM_TIP) then
		pg.global.ui:close(UIConst.UI_ID_COMMON_ITEM_TIP)
	end

	if data.selected and data.locked then
		pg.global.showBubbleMessageById(NoticeDef.PET_SEASON_CRYSTAL_UNCHECK_LACK)

		return
	end

	data.selected = not data.selected

	self:m_recomputeSelectableRow(row)
	self:m_refreshRows()
end

function LevelBreakthroughTipCtrl:m_renderRow(button, _, row)
	local objectReference = button:GetComponent("ObjectReference")
	local leftList = objectReference:GetRefValue("rewardItemList1UList")
	local rightList = objectReference:GetRefValue("rewardItemList2UList")

	if leftList then
		function leftList.luaRenderItem(itemButton, _, data)
			self:m_renderItem(itemButton, data, true, row)
		end

		leftList:SetList(row.sources or {})
	end

	if rightList then
		function rightList.luaRenderItem(itemButton, _, data)
			self:m_renderItem(itemButton, data, false, row)
		end

		local ownNum = ItemUtils.getItemCountById(pg.me, row.oriItemId)

		rightList:SetList({
			{
				id = row.oriItemId,
				ownNum = ownNum,
				needNum = row.deficit or 0
			}
		})
	end
end

function LevelBreakthroughTipCtrl:m_setPlanButtonText(button)
	if not NotNil(button) then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")

	if not NotNil(objectReference) then
		return
	end

	local textWidget = LuaUIUtils.safeGetRefValue(objectReference, "txtNameUText")

	if not NotNil(textWidget) then
		return
	end

	textWidget.disabledLocalization = true

	ClientTextUtils.setText(textWidget, pg.getGameString(PLAN_TEXT_KEY))
end

function LevelBreakthroughTipCtrl:m_refreshPlanToggle()
	local button = self.view.btnAllSelectedUButton

	if not NotNil(button) then
		return
	end

	local show = self.showPlanToggle == true

	button:SetActive(show)

	if not show then
		return
	end

	self:m_setPlanButtonText(button)

	button.buttonType = CS.XGUI.EButtonType.Check

	function button.luaSelectChanged(isSelected)
		self.planToggleSelected = isSelected == true
	end

	button.isSelected = self.planToggleSelected == true
end

function LevelBreakthroughTipCtrl:m_hasInvalidRow()
	for _, row in ipairs(self.rows or {}) do
		if row.selectable then
			if (row.lackRemain or 0) > 0 then
				return true
			end
		else
			for _, src in ipairs(row.sources or {}) do
				if (src.ownNum or 0) < (src.needNum or 0) then
					return true
				end
			end
		end
	end

	return false
end

function LevelBreakthroughTipCtrl:m_collectExcludeItemList()
	local result = {}
	local seen = {}

	for _, row in ipairs(self.rows or {}) do
		if row.selectable then
			for _, src in ipairs(row.sources or {}) do
				if not src.selected and src.id and not seen[src.id] then
					seen[src.id] = true
					result[#result + 1] = src.id
				end
			end
		end
	end

	return result
end

function LevelBreakthroughTipCtrl:destroy()
	return
end

function LevelBreakthroughTipCtrl:addListener()
	if NotNil(self.view.listUList) then
		function self.view.listUList.luaRenderItem(button, index, data)
			self:m_renderRow(button, index, data)
		end
	end

	if NotNil(self.view.btnCancelUButton) then
		function self.view.btnCancelUButton.luaClick()
			self:closePanel()
		end
	end

	if NotNil(self.view.btnConfirmUButton) then
		function self.view.btnConfirmUButton.luaClick()
			if self:m_hasInvalidRow() then
				pg.global.showBubbleMessageById(NoticeDef.ITEM_COUNT_LACK)

				return
			end

			self.m_confirmed = true

			if self.ensureCb then
				local remember = self.showPlanToggle == true and self.planToggleSelected == true

				self.ensureCb(self:m_collectExcludeItemList(), remember)
			end

			self:closePanel()
		end
	end

	if NotNil(self.view.btnCloseUButton) then
		function self.view.btnCloseUButton.luaClick()
			self:closePanel()
		end
	end
end

function LevelBreakthroughTipCtrl:closePanel()
	pg.global.ui:close(UIConst.UI_ID_LEVEL_BREAKTHROUGH_TIP)
end

function LevelBreakthroughTipCtrl:onDestroy()
	if not self.m_confirmed then
		local cancelCb = self.cancelCb

		self.cancelCb = nil

		if cancelCb then
			cancelCb()
		end
	end

	self:destroy()
	UICtrl.onDestroy(self)
end

return LevelBreakthroughTipCtrl
