-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManualShare\\PetManualShareCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local PetOverviewModel = require("Guis.Panels.PetOverview.PetOverviewModel")
local PetResearchUtils = require("Guis.Utils.PetResearchUtils")
local PetProtoTypeData = require("Data.pet_prototype_data")
local PlayerHeadFrameData = require("Data.player_head_frame_data")
local LuaUIUtils = require("Utils.LuaUIUtils")
local TimerManager = require("Core.Timer.TimerManager")
local Time = require("Core.Common.Time")
local ClientTextUtils = require("Utils.ClientTextUtils")
local Utils = require("Common.Utils.Utils")
local Const = require("Common.Const.Const")
local AddressDataConst = require("Const.AddressDataConst")
local PetManualShareCtrl = Class.LightClass("PetManualShareCtrl", UICtrl)

PetManualShareCtrl.OUTPUT_WIDTH = 1080
PetManualShareCtrl.ROW_CAPACITY = 8
PetManualShareCtrl.RESOURCE_CHECK_INTERVAL = 0.2
PetManualShareCtrl.LIST_BUILD_BUDGET_US = 8000
PetManualShareCtrl.LIST_BUILD_MAX_ITEMS_PER_FRAME = 16

function PetManualShareCtrl:getUIViewParent()
	self.captureCanvas = pg.global.mobileCameraMgr:CreateLongUICaptureCanvas(self.uiMgr.panelLayer)

	return self.captureCanvas
end

function PetManualShareCtrl:closeImmediately()
	if self.captureCanvas then
		if self.view then
			self.view.captureCanvas = self.captureCanvas
		else
			pg.global.mobileCameraMgr:ReleaseLongUICaptureCanvas(self.captureCanvas)
		end

		self.captureCanvas = nil
	end

	UICtrl.closeImmediately(self)
end

function PetManualShareCtrl:onCreate(info)
	self.view.captureCanvas = self.captureCanvas
	self.captureCanvas = nil
	self.view.widget.renderOpacity = 0
	self.view.widget.disableAllTweenEffect = true
	self.pendingPageImages = {}

	local images = self.view.transform:GetComponentsInChildren(typeof(CS.XGUI.UImage), true)

	for index = 0, images.Length - 1 do
		local image = images[index]

		if IsNil(image:GetComponentInParent(typeof(CS.XGUI.UContainer))) then
			self.pendingPageImages[#self.pendingPageImages + 1] = image
		end
	end

	self.pendingPageContainers = {}

	local containers = self.view.transform:GetComponentsInChildren(typeof(CS.XGUI.UContainer), true)

	for index = 0, containers.Length - 1 do
		local container = containers[index]

		if container.enableLoadOnInit then
			self.pendingPageContainers[#self.pendingPageContainers + 1] = container
		end
	end

	UICtrl.onCreate(self, info)
end

function PetManualShareCtrl:addListener()
	local function renderPetItem(button, index, data)
		self:_renderPetItem(button, data)
	end

	local listPetUList = self.view.listPetUList

	listPetUList.groupType = CS.XGUI.EGroupType.None
	listPetUList.enabledItemTooltip = false

	listPetUList:SetEnableCustomInterval(false)

	function listPetUList.luaRenderItem(button, index, data)
		button.enableInputActon = false
		button.disableAllTweenEffect = true

		button:SetSelected(false)

		local objectReference = button:GetComponent("ObjectReference")
		local groupUList = objectReference:GetRefValue("groupUList")

		groupUList.groupType = CS.XGUI.EGroupType.None
		groupUList.enabledItemTooltip = false

		groupUList:SetEnableCustomInterval(false)

		groupUList.luaRenderItem = renderPetItem

		local rowCapacity = self.ROW_CAPACITY - data.tIndex
		local itemWidth = groupUList:GetTemplateItem(0).rectTransform.rect.width

		groupUList:SetSizeX(itemWidth * rowCapacity + groupUList.colSpacing * (rowCapacity - 1))
		groupUList:SetList(nil)

		self.listBuildState.groupList = groupUList
	end
end

function PetManualShareCtrl:onDestroy()
	self:_stopListBuild()

	local request = self.captureRequest

	self.captureRequest = nil

	if self.captureFrameId then
		TimerManager.delFrameCb(self.captureFrameId)

		self.captureFrameId = nil
	end

	self:killTimer(self.prepareTimer)

	self.prepareTimer = nil
	self.pendingPageImages = nil
	self.pendingPageContainers = nil
	self.pendingHeadFrame = nil

	if request then
		request.finished = true

		if request.captureStarted then
			request.captureStarted = false

			pg.global.mobileCameraMgr:CancelLongUICapture()
		end
	end

	UICtrl.onDestroy(self)
end

function PetManualShareCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	local request = info.shareRequest

	self.captureRequest = request
	request.pendingImages = 0
	request.listReady = false

	local ok, errorMessage = pcall(self._preparePage, self, info)

	if not ok then
		request.error = tostring(errorMessage)
	end

	self.prepareTimer = self:startTimer(function()
		self:_runCaptureStep(request, self._prepareCapture)
	end, self.RESOURCE_CHECK_INTERVAL, true)
end

function PetManualShareCtrl:_preparePage(info)
	self.areaId = info.areaId or PetResearchUtils.getLastPetResearchAreaId()
	self.showTab = info.showTab or PetResearchUtils.getLastPetShowTab()

	self.view.widget:TryChangePage("Type", self.showTab == PetResearchUtils.PET_SHOW_TAB.SPECIES and 0 or 1, true)
	self:refreshBasicInfo()
	self:_stopListBuild()

	local groups = PetOverviewModel.getPetOverviewData(self.areaId, self.showTab, self.ROW_CAPACITY)

	self.view.listPetUList:SetList(nil)

	local request = self.captureRequest

	if #groups == 0 then
		request.listReady = true

		return
	end

	self.listBuildState = {
		petIndex = 1,
		groupIndex = 1,
		groups = groups
	}
	self.listBuildFrameId = TimerManager.addRepeatNextFrameCb(function()
		self:_runCaptureStep(request, self._appendListBatch)
	end)
end

function PetManualShareCtrl:_runCaptureStep(request, action)
	if self.captureRequest ~= request or request.finished then
		return
	end

	if not request.error and not request.cancelled then
		local ok, errorMessage = pcall(action, self, request)

		if not ok then
			request.error = tostring(errorMessage)
		end
	end

	if request.error or request.cancelled then
		self:_finishCapture(request, "")
	end
end

function PetManualShareCtrl:_appendListBatch(request)
	local state = self.listBuildState
	local startTime = Time.getMicrosecond()

	for index = 1, self.LIST_BUILD_MAX_ITEMS_PER_FRAME do
		local group = state.groups[state.groupIndex]

		if not state.groupList then
			self.view.listPetUList:AddElement(group)

			if not state.groupList then
				request.error = "Pet manual share row did not initialize its pet list."

				return
			end
		else
			state.groupList:AddElement(group.groupData[state.petIndex])

			state.petIndex = state.petIndex + 1
		end

		if request.error or request.cancelled or request.finished then
			return
		end

		if state.petIndex > #group.groupData then
			state.groupIndex = state.groupIndex + 1
			state.petIndex = 1
			state.groupList = nil
		end

		if state.groupIndex > #state.groups then
			request.listReady = true

			self:_stopListBuild()

			return
		end

		if Time.getMicrosecond() - startTime >= self.LIST_BUILD_BUDGET_US then
			return
		end
	end
end

function PetManualShareCtrl:_stopListBuild()
	if self.listBuildFrameId then
		TimerManager.delFrameCb(self.listBuildFrameId)

		self.listBuildFrameId = nil
	end

	self.listBuildState = nil
end

function PetManualShareCtrl:_renderPetItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local imgPetUImage = objectReference:GetRefValue("imgPetUImage")
	local btnMapViewUButton = objectReference:GetRefValue("btnMapViewUButton")
	local flashUContainer = objectReference:GetRefValue("flashUContainer")
	local displayTemplateId, label, shinyStyle = PetResearchUtils.getPetDisplayFormLabelTemplateId(data.templateId, self.showTab, self.areaId)
	local petData = PetProtoTypeData[displayTemplateId]

	if Utils.isLabelShiny(label) then
		flashUContainer:SetActive(true)

		if shinyStyle == Const.PET_SHINY_STYLE.WHITE then
			self:_loadCaptureFlash(flashUContainer, AddressDataConst.UI_PET_FLASH_OVERVIEW_WHITE)
		elseif shinyStyle == Const.PET_SHINY_STYLE.BLACK then
			self:_loadCaptureFlash(flashUContainer, AddressDataConst.UI_PET_FLASH_OVERVIEW_BLACK)
		else
			self:_loadCaptureFlash(flashUContainer, AddressDataConst.UI_PET_FLASH_OVERVIEW)
		end
	else
		flashUContainer:SetActive(false)
	end

	self:_loadCaptureImage(imgPetUImage, LuaUIUtils.getPetIcon(petData.iconName, LuaUIUtils.PET_ICON, label))

	button.enableInputActon = false
	button.enabledTooltip = false
	button.disableAllTweenEffect = true

	button:SetSelected(false)

	local statePage = data.state - 1

	if data.state == PetResearchUtils.PET_STATE_IS_AllSTAR then
		statePage = PetResearchUtils.PET_STATE_IS_CATCH - 1
	end

	button:TryChangePage("State", statePage, true)
	btnMapViewUButton:SetActive(false)
end

function PetManualShareCtrl:_loadCaptureFlash(container, url)
	local request = self.captureRequest

	request.pendingImages = request.pendingImages + 1

	container:SetUrlWithCallback(url, function(content)
		if self.captureRequest ~= request or request.finished or request.cancelled then
			return
		end

		local ok, errorMessage = pcall(self._loadCaptureFlashImages, self, content)

		request.pendingImages = request.pendingImages - 1

		if not ok then
			request.error = tostring(errorMessage)
		end
	end)
end

function PetManualShareCtrl:_loadCaptureFlashImages(content)
	if IsNil(content) then
		return
	end

	local images = content.transform:GetComponentsInChildren(typeof(CS.XGUI.UImage), false)

	for index = 0, images.Length - 1 do
		local image = images[index]
		local url = image.defaultImageUrl

		if image.isVisible and not string.isNilOrEmpty(url) then
			self:_loadCaptureImage(image, url)
		end
	end
end

function PetManualShareCtrl:_loadCaptureImage(image, url)
	local request = self.captureRequest

	request.pendingImages = request.pendingImages + 1

	local completed = false

	image:SetUrlWithCallback(url, function()
		if self.captureRequest == request and not request.finished and not completed then
			completed = true
			request.pendingImages = request.pendingImages - 1
		end
	end, function()
		if self.captureRequest == request and not request.finished and not completed then
			completed = true
			request.pendingImages = request.pendingImages - 1

			local images = self.pendingPageImages

			for index = #images, 1, -1 do
				if images[index] == image then
					table.remove(images, index)
				end
			end
		end
	end, true)
end

function PetManualShareCtrl:_arePageImagesReady()
	local headFrame = self.pendingHeadFrame

	if headFrame then
		if not headFrame.container:CheckURLLoaded(headFrame.url) then
			return false
		end

		self.pendingHeadFrame = nil
	end

	local images = self.pendingPageImages

	for index = #images, 1, -1 do
		local image = images[index]
		local ready = not image.gameObject.activeInHierarchy or not image.isVisible

		if not ready then
			local sprite = image.sprite

			ready = not string.isNilOrEmpty(image.url) and NotNil(sprite) and NotNil(sprite.texture)
		end

		if ready then
			table.remove(images, index)
		end
	end

	local containers = self.pendingPageContainers

	for index = #containers, 1, -1 do
		local container = containers[index]

		if not container.gameObject.activeInHierarchy or not container.isVisible or not container.enableLoadOnInit or container:CheckURLLoaded() then
			table.remove(containers, index)
		end
	end

	return #images == 0 and #containers == 0
end

function PetManualShareCtrl:_prepareCapture(request)
	if not request.listReady or request.pendingImages > 0 or not self:_arePageImagesReady() then
		return
	end

	self:killTimer(self.prepareTimer)

	self.prepareTimer = nil

	local list = self.view.listPetUList

	CS.XGUI.LayoutMgr.ForceRebuildLayoutImmediate(list)

	self.captureFrameId = self:startFrameTimer(function()
		self.captureFrameId = nil

		self:_runCaptureStep(request, self._captureAndSave)
	end, 1)
end

function PetManualShareCtrl:_captureAndSave(request)
	request.captureStarted = true

	pg.global.mobileCameraMgr:CaptureLongUIToAlbum(self.view.widget.rectTransform, self.OUTPUT_WIDTH, function(path)
		if self.captureRequest ~= request or request.finished then
			return
		end

		request.captureStarted = false

		self:_finishCapture(request, path)
	end)
end

function PetManualShareCtrl:_finishCapture(request, path)
	if self.captureRequest ~= request or request.finished then
		return
	end

	request.savedPath = path
	request.finished = true

	self:closeImmediately()
end

function PetManualShareCtrl:refreshBasicInfo()
	ClientTextUtils.setText(self.view.txtNameUSDFText, LuaUIUtils.getMeDisplayName())
	ClientTextUtils.setText(self.view.txtUIDUSDFText, string.format("UID: %s", pg.me.uid))

	local request = self.captureRequest

	request.pendingImages = request.pendingImages + 1

	self.view.playerHeadUContainer:LoadDefaultUrlManually(function(uWidget)
		if self.captureRequest ~= request or request.finished or request.cancelled then
			return
		end

		local ok, errorMessage = pcall(self.renderPlayerHead, self, uWidget)

		request.pendingImages = request.pendingImages - 1

		if not ok then
			request.error = tostring(errorMessage)
		end
	end)
	ClientTextUtils.setText(self.view.txtCatalogUSDFText, pg.getGameString("PET_OVERVIEW"))
	ClientTextUtils.setText(self.view.txtFormUSDFText, pg.getGameString(self:_getShowTabText()))

	local numInfos = PetResearchUtils.getAreaPetCollectInfo(self.areaId, self.showTab)
	local numRef = {
		self.view.itemObjectReference,
		self.view.item2ObjectReference,
		self.view.item3ObjectReference
	}

	for idx, data in ipairs(numInfos) do
		local objectReference = numRef[idx]

		self:_loadCaptureImage(objectReference:GetRefValue("imgIconUImage"), data.icon)
		ClientTextUtils.setText(objectReference:GetRefValue("txtNumberUSDFText"), data.num)
	end
end

function PetManualShareCtrl:renderPlayerHead(content)
	local data = {
		playerInfo = pg.me
	}

	LuaUIUtils.renderPlayerAvatarImages(content, data, true)

	local objectReference = content:GetComponent("ObjectReference")
	local avatarUImage = objectReference:GetRefValue("avatarUImage")
	local avatarFrameUImage = objectReference:GetRefValue("avatarFrameUImage")
	local headFrameUContainer = objectReference:GetRefValue("headFramUContainer")

	if NotNil(avatarUImage) then
		self.pendingPageImages[#self.pendingPageImages + 1] = avatarUImage
	end

	local frameData = PlayerHeadFrameData[data.avatarFrameIconId or 1]

	if frameData.isDynamic == 1 and NotNil(headFrameUContainer) then
		self.pendingHeadFrame = {
			container = headFrameUContainer,
			url = frameData.res
		}
	elseif NotNil(avatarFrameUImage) then
		self.pendingPageImages[#self.pendingPageImages + 1] = avatarFrameUImage
	end
end

function PetManualShareCtrl:_getShowTabText()
	if self.showTab == PetResearchUtils.PET_SHOW_TAB.SPECIES then
		return "PET_SPECIES_SHOW"
	end

	return "PET_FORM_SHOW"
end

function PetManualShareCtrl:onShow()
	return
end

function PetManualShareCtrl:onHide()
	return
end

return PetManualShareCtrl
