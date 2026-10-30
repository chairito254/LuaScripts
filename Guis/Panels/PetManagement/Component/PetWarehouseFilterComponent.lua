-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManagement\\Component\\PetWarehouseFilterComponent.lua

local Class = require("Core.Framework.Class")
local Utils = require("Common.Utils.Utils")
local UIConst = require("Const.UIConst")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PetWarehouseQuery = require("GameApp.PetManage.PetWarehouseQuery")
local PetWarehouseFilterComponent = Class.LightClass("PetWarehouseFilterComponent")

function PetWarehouseFilterComponent:ctor(owner)
	self.owner = owner
	self.active = false
	self.version = 0
	self.query = {
		sortId = 0,
		isDescending = true,
		filter = {
			keyword = "",
			elements = {}
		}
	}
	self.showLabelInfo = false
end

function PetWarehouseFilterComponent:bind()
	local owner = self.owner

	self.panel = owner.transform:GetComponent("UComponent")

	local node = owner.transform:Find("Panel/FilterSelect")

	if NotNil(node) then
		self.filterPanel = node:GetComponent("UComponent")
	end

	self.button = owner.objectReference:GetRefValue("btnFilterUButton")
	self.countText = owner.objectReference:GetRefValue("txtFilterUSDFText")

	if NotNil(self.button) then
		function self.button.luaClick()
			self:open()
		end
	end

	self.clearButton = owner.objectReference:GetRefValue("btnXUButton")

	if NotNil(self.clearButton) then
		function self.clearButton.luaClick()
			self:clear()
		end
	end

	self.batchButton = owner.objectReference:GetRefValue("btnSwitchUButton")

	if NotNil(self.batchButton) then
		function self.batchButton.luaClick()
			self:open()
		end
	end

	self.batchClearButton = owner.objectReference:GetRefValue("btnX2UButton")

	if NotNil(self.batchClearButton) then
		function self.batchClearButton.luaClick()
			self:clear()
		end
	end

	self:refreshUI()
end

function PetWarehouseFilterComponent:canInteract()
	local owner = self.owner

	if owner._destroyed or not owner._visible or not owner.manager then
		return false
	end

	local player = owner.manager:getPlayer()

	if not player or player.destroyed or owner.batch:isBusy() then
		return false
	end

	return not owner.batch.active or owner.batch:isCurrent()
end

function PetWarehouseFilterComponent:invalidate()
	self.version = self.version + 1
end

function PetWarehouseFilterComponent:destroy()
	self:invalidate()

	if NotNil(self.button) then
		self.button.luaClick = nil
	end

	if NotNil(self.clearButton) then
		self.clearButton.luaClick = nil
	end

	if NotNil(self.batchButton) then
		self.batchButton.luaClick = nil
	end

	if NotNil(self.batchClearButton) then
		self.batchClearButton.luaClick = nil
	end
end

function PetWarehouseFilterComponent:apply(filter, sortId, isDescending, showLabelInfo)
	if not self:canInteract() then
		return
	end

	self:invalidate()

	self.showLabelInfo = showLabelInfo == true
	self.query = {
		filter = Utils.deepCopyTable(filter or {}),
		sortId = sortId or 0,
		isDescending = isDescending ~= false
	}
	self.query.filter.elements = self.query.filter.elements or {}
	self.query.filter.keyword = self.query.filter.keyword or ""
	self.active = self.query.sortId ~= 0

	for key, value in pairs(self.query.filter) do
		if value == true or key == "keyword" and value ~= nil and value ~= "" then
			self.active = true
		end
	end

	for _, selected in pairs(self.query.filter.elements or {}) do
		if selected then
			self.active = true
		end
	end

	self.snapshot = nil
	self.results = nil

	self.owner:clearPetSelection()

	self.owner.batch.selected = {}
	self.owner.batch.selectionOrder = 0

	local selector = self.owner.listSelectorUSelector

	if NotNil(selector) and selector.isPopup then
		selector:ClosePopup(true)
	end

	self.owner:refreshWarehouse()
end

function PetWarehouseFilterComponent:clear()
	self:apply({}, 0, true, false)
end

function PetWarehouseFilterComponent:open()
	local owner = self.owner

	if not self:canInteract() then
		return
	end

	local manager = owner.manager
	local player = manager:getPlayer()

	if not player or player.destroyed then
		return
	end

	self:invalidate()

	local version = self.version

	pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT_FILTER, {
		disableSessionCache = true,
		filterType = UIConst.PET_SLOT_DISPLAY_TYPE.Normal,
		filter = Utils.deepCopyTable(self.query.filter),
		sortId = self.query.sortId,
		isDescending = self.query.isDescending,
		allowedSortIds = PetWarehouseQuery.SUPPORTED_SORT_IDS,
		doFilterCallback = function(filter, sortId, isDescending, showLabelInfo)
			if not self:canInteract() or self.version ~= version or owner.manager ~= manager or manager:getPlayer() ~= player or player.destroyed then
				return
			end

			self:apply(filter, sortId, isDescending, showLabelInfo)
		end
	})
end

function PetWarehouseFilterComponent:getResults()
	local snapshot = self.owner.manager and self.owner.manager:getSnapshot()

	if not self.results or self.snapshot ~= snapshot then
		self.snapshot = snapshot
		self.results = PetWarehouseQuery:build(snapshot or {}, self.query)
		self.resultIds = {}

		for _, data in ipairs(self.results) do
			self.resultIds[data.id] = true
		end
	end

	return self.results
end

function PetWarehouseFilterComponent:contains(petId)
	self:getResults()

	return self.resultIds[petId] == true
end

function PetWarehouseFilterComponent:setButtonGamepadHintVisible(button, visible)
	if IsNil(button) then
		return
	end

	if button.SetHotkeyForceHidden then
		button:SetHotkeyForceHidden(not visible)
	end

	if visible and button.RefreshNavGroupHotkeyVisible then
		button:RefreshNavGroupHotkeyVisible()
	end
end

function PetWarehouseFilterComponent:refreshFilterGamepadHints()
	local inBatch = false

	if self.owner.batch and self.owner.batch.active == true then
		inBatch = true
	end

	self:setButtonGamepadHintVisible(self.button, not inBatch)
	self:setButtonGamepadHintVisible(self.clearButton, not inBatch and self.active)
	self:setButtonGamepadHintVisible(self.batchButton, inBatch)
	self:setButtonGamepadHintVisible(self.batchClearButton, inBatch and self.active)
end

function PetWarehouseFilterComponent:refreshUI()
	local page = self.active and 1 or 0
	local interactable = self:canInteract()

	if NotNil(self.panel) then
		self.panel:TryChangePage("TxtTitleState", page)
	end

	if NotNil(self.filterPanel) then
		self.filterPanel:TryChangePage("FilterState", page)
	end

	if NotNil(self.button) then
		self.button:TryChangePage("FilterState", page)

		self.button.interactable = interactable
	end

	if NotNil(self.clearButton) then
		self.clearButton.interactable = interactable
	end

	if NotNil(self.batchButton) then
		local switchPage = 1

		if self.active then
			switchPage = 0
		end

		self.batchButton:TryChangePage("SwitchList", switchPage)

		self.batchButton.interactable = interactable
	end

	if NotNil(self.batchClearButton) then
		local visible = self.owner.batch.active and self.active

		self.batchClearButton:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, not visible)
		self.batchClearButton:SetActiveFastest(visible, true)

		self.batchClearButton.interactable = interactable
	end

	local selector = self.owner.listSelectorUSelector

	if NotNil(selector) then
		selector:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, self.active)
	end

	if self.active and NotNil(self.countText) then
		local cntStr = tostring(#self:getResults())
		local title = pg.getFormatText(pg.getGameString(PetWarehouseConst.PetWarehouseText.FILTER_COUNT), cntStr)

		if pg.game.setting:getShowDebugId() then
			title = cntStr .. "-" .. title
		end

		ClientTextUtils.setText(self.countText, title)
	end

	self:refreshFilterGamepadHints()
end

return PetWarehouseFilterComponent
