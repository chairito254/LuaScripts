-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetShiny\\Component\\PetShinySelectComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local PetManagementUtils = require("Utils.PetManagementUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local Utils = require("Common.Utils.Utils")
local MessageName = require("Const.MessageName")
local TimerManager = require("Core.Timer.TimerManager")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local UIConst = require("Const.UIConst")
local UISceneConst = require("GameApp.UIScene.UISceneConst")
local AddressDataConst = require("Const.AddressDataConst")
local PetShinySelectComponent = Class.LightClass("PetShinySelectComponent", UIComponent)

PetShinySelectComponent.INFO_PREVIEW_POSITION = {
	0,
	1000,
	0
}
PetShinySelectComponent.messages = {
	[MessageName.PET_BOX_MAP_UPDATE] = {
		"refreshPetList"
	},
	[MessageName.PET_BOX_MAP_SEQUENCE_UPDATE] = {
		"refreshPetList"
	},
	[MessageName.ON_BOX_NAME_CHANGE] = {
		"refreshPetList"
	},
	[MessageName.PET_CUSTOM_NAME_CHANGED] = {
		"refreshPetList"
	},
	[MessageName.PET_FAVORITE_CHANGE] = {
		"refreshPetList"
	},
	[MessageName.PET_FAVORITE_TYPE_CHANGE] = {
		"refreshPetList"
	},
	[MessageName.INPUT_DEVICE_CHANGED] = {
		"scheduleGamepadSelection"
	}
}

function PetShinySelectComponent:enter(tabId, petId, selectTabId)
	self:hide()

	self.tabId = tabId
	self.selectTabId = selectTabId
	self.browsePetId = petId

	self:show()
end

function PetShinySelectComponent:isCurrent()
	return self.ctrl ~= nil and self:checkUIShow() and self.ctrl.curMode == 2
end

function PetShinySelectComponent:onShow()
	if not self:isCurrent() then
		return
	end

	self.view.petListObjectReference:GetRefValue("midPanelUComponent"):TryChangePage("Destroy", 1)
	self.view.petListObjectReference:GetRefValue("midPanelUComponent"):SetActiveFastest(false)
	self.view.detailUContainerUContainer:SetActiveFastest(false)
	self:releasePetTemplate()
	self:refreshConfirmButton()

	local request = {}

	self.loadRequest = request

	local container = self.view.detailUContainerUContainer

	if container:CheckURLLoaded() then
		self:preparePetTemplate(container.content, request)

		return
	end

	container:LoadDefaultUrlManually(function(content)
		if self.loadRequest ~= request or not self:isCurrent() then
			return
		end

		self:preparePetTemplate(content, request)
	end)
end

function PetShinySelectComponent:preparePetTemplate(content, request)
	content.enableNavRegion = false

	local infoTransform = content.transform:GetComponent("ObjectReference"):GetRefValue("panelTransform")
	local infoReference = infoTransform:GetComponent("ObjectReference")
	local containers = {
		infoReference:GetRefValue("panelAbilityUContainer"),
		infoReference:GetRefValue("panelSkillUContainer"),
		infoReference:GetRefValue("panelInfoUContainer")
	}
	local remaining = #containers

	local function onLoaded()
		if self.loadRequest ~= request or not self:isCurrent() then
			return
		end

		remaining = remaining - 1

		if remaining == 0 then
			self:loadPetPreviewScene(content, request)
		end
	end

	for _, container in ipairs(containers) do
		if container:CheckURLLoaded() then
			onLoaded()
		else
			container:LoadDefaultUrlManually(onLoaded)
		end
	end
end

function PetShinySelectComponent:loadPetPreviewScene(content, request)
	local scene = pg.game.uiScene:getUISceneInst(UISceneConst.PET_MANAGEMENT_PREVIEW_SCENE, AddressDataConst.PET_MANAGEMENT_PREVIEW_SCENE_Prefab, nil, {
		uiId = UIConst.UI_ID_PET_SHINY
	})

	self.petPreviewScene = scene

	scene:bindUICtrlKey(self.ctrl.module)
	scene:startLoad(function(succeed)
		if self.loadRequest ~= request or self.petPreviewScene ~= scene or not self:isCurrent() then
			return
		end

		self.previewFrameId = TimerManager.addNextFrameCb(function()
			self.previewFrameId = nil

			self:onPetPreviewSceneLoaded(scene, content, request, succeed)
		end)
	end)
end

function PetShinySelectComponent:onPetPreviewSceneLoaded(scene, content, request, succeed)
	if self.loadRequest ~= request or self.petPreviewScene ~= scene or not self:isCurrent() then
		return
	end

	self.loadRequest = nil

	if not succeed then
		self:releasePetTemplate()

		return
	end

	local position = self.INFO_PREVIEW_POSITION

	scene.scene.transform.position = Vector3(position[1], position[2], position[3])

	scene:setLocalEnv()
	pg.game.uiScene:switchToScene(scene.name, true, true, true, self.ctrl.module)
	self:initPetTemplate(content)
end

function PetShinySelectComponent:onHide()
	self:releasePetTemplate()
end

function PetShinySelectComponent:onDestroy()
	self:releasePetTemplate()
end

function PetShinySelectComponent:releasePetTemplate()
	self.loadRequest = nil

	if self.previewFrameId then
		TimerManager.delFrameCb(self.previewFrameId)

		self.previewFrameId = nil
	end

	if self.gamepadFrameId then
		TimerManager.delFrameCb(self.gamepadFrameId)

		self.gamepadFrameId = nil
	end

	PetManagementUtils.destroyTemplate(self)

	local scene = self.petPreviewScene

	self.petPreviewScene = nil

	if scene and not scene.expire then
		scene:removeUICtrlKey(self.ctrl.module)
		pg.game.uiScene:switchOutScene(scene.name, false, nil, self.ctrl.module)
	end
end

function PetShinySelectComponent:initPetTemplate(content)
	local detailReference = content.transform:GetComponent("ObjectReference")
	local infoTransform = detailReference:GetRefValue("panelTransform")
	local listReference = self.view.petListObjectReference

	listReference:GetRefValue("midPanelUComponent"):SetNavGroupItemFocusStateOverride(true, CS.XGUI.Navigation.NavFocusState.Select)
	PetManagementUtils.destroyTemplate()
	PetManagementUtils.setListButtonDelegateTable({
		selectedChanged = function(data, button)
			self:onSelectedPetChanged(data, button)
		end,
		renderExtraLogic = function(button, index, data)
			self:renderPetListItem(button, data)
		end,
		canGamepadSwitchPetBoxPage = function()
			return self:isCurrent() and PetManagementUtils.isContextOwner(self)
		end,
		onGamepadPetBoxPageSwitched = function()
			self:scheduleGamepadSelection()
		end
	}, self)

	local function onRendered()
		self:onPetListRendered()
	end

	PetManagementUtils.onNormalListRenderFinished = onRendered
	PetManagementUtils.onFilterListRenderFinished = onRendered

	PetManagementUtils.initTemplate(infoTransform, listReference.transform, {
		isForbidPetPropUseBtn = true,
		defaultSelectTabIndex = 0,
		owner = self,
		uiScene = self.petPreviewScene,
		contextRestoreCb = function()
			if self:isCurrent() then
				self:onShow()
			end
		end,
		selectPetId = self.browsePetId,
		ctrlConfig = {
			isForbidUBtnDrag = true,
			isForbidFavoriteBtn = true
		}
	})

	if self.browsePetId then
		self.petPreviewScene:previewPet(self.browsePetId)
	end

	self:refreshConfirmButton()
	listReference:GetRefValue("midPanelUComponent"):SetActiveFastest(true)
	self.view.detailUContainerUContainer:SetActiveFastest(true)
end

function PetShinySelectComponent:renderPetListItem(button, data)
	button.draggable = false

	function button.luaNavFocused()
		if self:isCurrent() and pg.game.input:isUsingGamepad() and not button.isSelected then
			button:OnClickSimulate(true)
		end
	end

	local canSelect = self.model:checkSelectPet(data.id, self.selectTabId)
	local text = button:GetComponent("ObjectReference"):GetRefValue("txtUsedUSDFText")

	ClientTextUtils.setText(text, pg.getGameString("INVENTORY_PETPROP_CANTUSE"))
	text:SetActive(not canSelect)
	button:TryChangePage("state", canSelect and 0 or 1)
end

function PetShinySelectComponent:onSelectedPetChanged(data, button)
	if not self:isCurrent() then
		return
	end

	self.browsePetId = data and not data.isEmpty and data.id or nil

	if button and self.browsePetId then
		button:TryChangePage("button", 5)
	end

	if self.petPreviewScene and self.browsePetId == nil then
		self.petPreviewScene:clear()
	end

	self:refreshConfirmButton()
	self.ctrl:restorePetPreview()
end

function PetShinySelectComponent:onPetListRendered()
	if not self:isCurrent() or not PetManagementUtils.isContextOwner(self) then
		return
	end

	local selectedIndex

	for index, data in ipairs(PetManagementUtils.petInfos) do
		if self.browsePetId ~= nil and data.id == self.browsePetId then
			selectedIndex = index - 1

			break
		end
	end

	if selectedIndex ~= nil then
		PetManagementUtils.setSelectedPet(selectedIndex)
	end

	self:scheduleGamepadSelection()
end

function PetShinySelectComponent:refreshPetList()
	if not self:isCurrent() or not PetManagementUtils.isContextOwner(self) then
		return
	end

	PetManagementUtils.refreshPetList()
	PetManagementUtils._refreshBoxSelector()
	self:refreshConfirmButton()
end

function PetShinySelectComponent:refreshConfirmButton()
	local canSelect = self.model:checkSelectPet(self.browsePetId, self.selectTabId)
	local textKey = "PET_SHINY_CANT_USE"

	if canSelect then
		local petInfo = pg.me.pets[self.browsePetId]

		textKey = Utils.isLabelShiny(petInfo.label) and "PET_SHINY_TAB2" or "PET_SHINY_TAB1"
	end

	canSelect = canSelect and self.ctrl.shinyOperation == nil

	ClientTextUtils.setText(self.view.btnConfirmNameUText, pg.getGameString(textKey))

	self.view.btnConfirmUButton.interactable = canSelect
	self.view.btnConfirmUButton.visualInteractable = canSelect
end

function PetShinySelectComponent:confirmSelection()
	if not self:isCurrent() then
		return
	end

	if self.ctrl.shinyOperation or not self.model:checkSelectPet(self.browsePetId, self.selectTabId) then
		self:refreshConfirmButton()

		return
	end

	local slot, box = LuaUIUtils.getPetBelongBoxAndSlotId(self.browsePetId)

	if not slot or not box then
		self:onSelectedPetChanged(nil)

		return
	end

	if LuaUIUtils.checkWarehousePetOperationLocked(self.browsePetId, PetWarehouseConst.PetWarehouseText.CULTIVATE_FORBIDDEN) or PetManagementUtils.checkHomePetOperationLocked(self.browsePetId) then
		return
	end

	self.ctrl:confirmSelectPet(self.browsePetId, self.tabId)
end

function PetShinySelectComponent:scheduleGamepadSelection()
	if self.gamepadFrameId then
		TimerManager.delFrameCb(self.gamepadFrameId)

		self.gamepadFrameId = nil
	end

	if not self:isCurrent() or not pg.game.input:isUsingGamepad() then
		return
	end

	self.gamepadFrameId = TimerManager.addNextFrameCb(function()
		self.gamepadFrameId = nil

		self:refreshGamepadSelection()
	end)
end

function PetShinySelectComponent:refreshGamepadSelection()
	if not self:isCurrent() or not pg.game.input:isUsingGamepad() or not PetManagementUtils.isContextOwner(self) then
		return
	end

	local focused = CS.XGUI.Navigation.NavManager.Instance.CurrentFocusedUContent
	local buttons, lastIndex = PetManagementUtils._getPetListButtons()

	if not focused or not buttons then
		return
	end

	for index = 0, lastIndex do
		if buttons[index] == focused then
			focused:OnClickSimulate(true)

			return
		end
	end
end

return PetShinySelectComponent
