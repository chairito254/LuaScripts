-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AvatarPreview\\AvatarPreviewCtrl.lua

local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local PlayableConst = require("Common.Const.PlayableConst")
local UICtrl = require("Guis.UICtrl")
local UISceneConst = require("GameApp.UIScene.UISceneConst")
local AppearanceData = require("Data.appearance_data")
local AppearancePointEnum = require("Data.appearance_point_enum")
local AppearanceSuitData = require("Data.appearance_suit_data")
local AvatarUtils = require("Guis.Utils.AvatarUtils")
local AvatarShareService = require("Guis.Utils.AvatarShareService")
local ClientModelUtils = require("Utils.ClientModelUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Const = require("Common.Const.Const")
local AvatarPreviewCtrl = Class.LightClass("AvatarPreviewCtrl", UICtrl)
local ClientTextUtils = require("Utils.ClientTextUtils")

AvatarPreviewCtrl.messages = {}

function AvatarPreviewCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.entityId = info.presetKey
	self.avatarScene = pg.game.uiScene:getScene(UISceneConst.AVATAR_SCENE)
	self.isCreateRolePreview = not pg.me
	self.originHairData = nil
	self.previewStateRestored = false
	self.autoSavePauseScene = nil
	self.autoSavePauseToken = nil
end

function AvatarPreviewCtrl:addListener()
	function self.view.backUButton.luaClick()
		self:closePanel()
	end

	function self.view.tabUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local nameUText = objectReference:GetRefValue("nameUText")

		ClientTextUtils.setText(nameUText, data.text)
	end

	function self.view.tabUList.luaClick(button, data)
		self.view.rootUComponent:TryChangePage("Preview", data.pageIdx)

		local presetData = self.avatarScene:getPresetData()

		if data.pageIdx == 0 then
			ClientTextUtils.setText(self.view.titleShadowUSDFText, pg.getGameString("APPEARANCE_CLOTHES"))

			local suitList = self.model:getSuitList(presetData.body)

			self.view.selectUList:SetList(suitList)

			local suitId = self.avatarScene:getCurSuitId(self.entityId)

			for index, suitInfo in ipairs(suitList) do
				if suitInfo.suitId == suitId then
					local res, tabBtn = self.view.selectUList:TryGetChildAt(index - 1)

					if res then
						tabBtn:OnClickSimulate()
					end

					break
				end
			end
		elseif data.pageIdx == 1 then
			ClientTextUtils.setText(self.view.titleShadowUSDFText, pg.getGameString("CREATE_PLAYER_ANIMATION"))

			local actionList = self.model:getAnimationList(presetData.body)

			self.view.actionUList:SetList(actionList)

			local res, tabBtn = self.view.actionUList:TryGetChildAt(0)

			if res then
				tabBtn:OnClickSimulate()
			end
		end
	end

	function self.view.selectUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local iconUImage = objectReference:GetRefValue("iconUImage")

		if data.icon then
			iconUImage.url = data.icon

			button:TryChangePage("State", "Normal")
		else
			button:TryChangePage("State", "Null")
		end
	end

	function self.view.selectUList.luaClick(button, data)
		if not data.suitId then
			self:unEquipSuit()
		else
			self:equipSuit(data.suitId)
		end

		if data.name then
			self.view.informationUWidget:SetActiveFastest(true)
			ClientTextUtils.setText(self.view.infoNameUText, pg.getLocalizationText(data.name))
		else
			self.view.informationUWidget:SetActiveFastest(false)
		end
	end

	function self.view.actionUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local iconUImage = objectReference:GetRefValue("iconUImage")

		if data.icon then
			iconUImage.url = data.icon

			button:TryChangePage("State", "Normal")
		else
			button:TryChangePage("State", "Null")
		end
	end

	function self.view.actionUList.luaClick(button, data)
		if self.view.actionUList.selectedItem == data then
			return
		end

		self.view.informationUWidget:SetActiveFastest(false)

		if not data.state then
			self:stopAnimation()
		else
			self:playAnimation(data.state)
		end

		if data.name then
			self.view.informationUWidget:SetActiveFastest(true)
			ClientTextUtils.setText(self.view.infoNameUText, pg.getLocalizationText(data.name))
		else
			self.view.informationUWidget:SetActiveFastest(false)
		end
	end

	function self.view.nextUButton.luaClick()
		self:closePanel()
	end

	if not pg.me then
		self.view.backgroundSelectorUSelector:SetActiveFastest(false)
	else
		AvatarUtils.renderBackGroundSwitchSelector(self.view.backgroundSelectorUSelector, true)
	end
end

function AvatarPreviewCtrl:onDestroy()
	self:restorePreviewState()
	UICtrl.onDestroy(self)

	self.avatarScene = nil
end

function AvatarPreviewCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.previewStateRestored = false

	self:pauseCreateRoleAutoSave()
	self:captureOriginHairData()
	self.avatarScene:addCameraZoomKeyBinding(self.view.gameObject)
end

function AvatarPreviewCtrl:onShow()
	self:refreshPage()
	self.avatarScene:setAvatarCameraModeFar()
end

function AvatarPreviewCtrl:onHide()
	return
end

function AvatarPreviewCtrl:onVisibleChange(visible)
	if visible then
		self.avatarScene:registerGesture(self.uid, {
			maskRayBoxTrans = self.view.maskRayBoxTrans
		})
	else
		self.avatarScene:unRegisterGesture(self.uid)
	end
end

function AvatarPreviewCtrl:closePanel()
	self:restorePreviewState()
	self:dismiss()
end

function AvatarPreviewCtrl:pauseCreateRoleAutoSave()
	if not self.isCreateRolePreview or not self.avatarScene then
		return
	end

	local scene = self.avatarScene

	scene.avatarPreviewAutoSaveGeneration = (scene.avatarPreviewAutoSaveGeneration or 0) + 1

	if not scene.avatarPreviewAutoSaveOwner then
		scene.avatarPreviewAutoSavePrevious = scene.pauseAutoSave
	end

	scene.avatarPreviewAutoSaveOwner = scene.avatarPreviewAutoSaveGeneration
	scene.pauseAutoSave = true
	self.autoSavePauseScene = scene
	self.autoSavePauseToken = scene.avatarPreviewAutoSaveOwner
end

function AvatarPreviewCtrl:resumeCreateRoleAutoSave(scene, token)
	scene = scene or self.autoSavePauseScene
	token = token or self.autoSavePauseToken

	if not scene or not token then
		return
	end

	if scene.avatarPreviewAutoSaveOwner == token then
		scene.pauseAutoSave = scene.avatarPreviewAutoSavePrevious
		scene.avatarPreviewAutoSaveOwner = nil
		scene.avatarPreviewAutoSavePrevious = nil
	end

	if self.autoSavePauseScene == scene and self.autoSavePauseToken == token then
		self.autoSavePauseScene = nil
		self.autoSavePauseToken = nil
	end
end

function AvatarPreviewCtrl:captureOriginHairData()
	if not self.isCreateRolePreview or not self.avatarScene then
		return
	end

	local entity = self.avatarScene:getEntity(self.entityId)
	local hairSnapshot = AvatarShareService.encodeHairData(entity, self.avatarScene, self.entityId)

	self.originHairData = hairSnapshot and hairSnapshot.hairData or nil
end

function AvatarPreviewCtrl:restoreDefaultClothes()
	if not self.avatarScene then
		return
	end

	local presetData = self.avatarScene:getPresetData()
	local suitId = presetData.defaultSuit
	local params = {
		entityId = self.entityId
	}

	for _, clothesId in ipairs(AppearanceSuitData[suitId].appearanceList) do
		table.insert(params, {
			isApply = true,
			clothesId = clothesId
		})
	end

	self.avatarScene:changeClothes(params)
end

function AvatarPreviewCtrl:restorePreviewState()
	if self.previewStateRestored then
		return
	end

	self.previewStateRestored = true

	local autoSaveScene = self.autoSavePauseScene
	local autoSavePauseToken = self.autoSavePauseToken

	if not self.avatarScene then
		self:resumeCreateRoleAutoSave(autoSaveScene, autoSavePauseToken)

		return
	end

	self:restoreDefaultClothes()

	local waitingForHairRestore = false

	if self.isCreateRolePreview then
		self:clearSuitAccessoriesAndKit()

		waitingForHairRestore = self:restoreOriginHair(function()
			self:resumeCreateRoleAutoSave(autoSaveScene, autoSavePauseToken)
		end)
	end

	self:stopAnimation()

	if not waitingForHairRestore then
		self:resumeCreateRoleAutoSave(autoSaveScene, autoSavePauseToken)
	end
end

function AvatarPreviewCtrl:refreshPage()
	local tabList = self.model:getTabList()

	self.view.tabUList:SetList(tabList)

	local res, btn = self.view.tabUList:TryGetChildAt(0)

	if res then
		btn:OnClickSimulate()
	end
end

function AvatarPreviewCtrl:unEquipSuit()
	local entity = self.avatarScene:getEntity(self.entityId)
	local params = {}

	for partId = AppearancePointEnum.Coat, AppearancePointEnum.Shoes do
		local clothesId = self.avatarScene:getCurClothesId(self.entityId, partId)

		if clothesId then
			table.insert(params, {
				isApply = false,
				clothesId = clothesId
			})

			entity.curShow.customShow[partId] = 0
		end
	end

	params.entityId = self.entityId

	self.avatarScene:changeClothes(params)

	if self.isCreateRolePreview then
		self:clearSuitAccessoriesAndKit()
		self:restoreOriginHair()
	end
end

function AvatarPreviewCtrl:equipSuit(suitId)
	local entity = self.avatarScene:getEntity(self.entityId)
	local params = {}

	for partId = AppearancePointEnum.Coat, AppearancePointEnum.Shoes do
		local clothesId = self.avatarScene:getCurClothesId(self.entityId, partId)

		if clothesId then
			table.insert(params, {
				isApply = false,
				clothesId = clothesId
			})

			entity.curShow.customShow[partId] = 0
		end
	end

	local suitData = AppearanceSuitData[suitId] or {}

	for _, clothesId in ipairs(suitData.appearanceList) do
		table.insert(params, {
			isApply = true,
			clothesId = clothesId
		})

		local partId = AppearanceData[clothesId].partId

		entity.curShow.customShow[partId] = clothesId
	end

	params.entityId = self.entityId

	self.avatarScene:changeClothes(params)

	if self.isCreateRolePreview then
		self:applySuitHair(suitData.hair)
		self:applySuitAccessoriesAndKit(suitData)
	end
end

function AvatarPreviewCtrl:restoreOriginHair(onComplete)
	if not self.originHairData then
		if onComplete then
			onComplete()
		end

		return false
	end

	local entity = self.avatarScene and self.avatarScene:getEntity(self.entityId)

	return AvatarShareService.restoreHairData(entity, self.originHairData, onComplete)
end

function AvatarPreviewCtrl:applySuitHair(hairId)
	if not hairId then
		self:restoreOriginHair()

		return
	end

	local entity = self.avatarScene:getEntity(self.entityId)
	local hairData = {
		customShow = LuaUIUtils.getDefaultHairPartIds(hairId),
		hairInfo = {}
	}

	AvatarShareService.restoreHairData(entity, hairData)
end

function AvatarPreviewCtrl:getAvailableJewelrySlot(accessoryData, usedSlots)
	local slotId = accessoryData.partId

	if slotId and slotId >= AppearancePointEnum.Jewelry1 and slotId <= AppearancePointEnum.Jewelry10 and not usedSlots[slotId] then
		return slotId
	end

	for _, optionalSlotId in ipairs(accessoryData.optionalPoints or {}) do
		if optionalSlotId >= AppearancePointEnum.Jewelry1 and optionalSlotId <= AppearancePointEnum.Jewelry10 and not usedSlots[optionalSlotId] then
			return optionalSlotId
		end
	end

	for candidateSlotId = AppearancePointEnum.Jewelry1, AppearancePointEnum.Jewelry10 do
		if not usedSlots[candidateSlotId] then
			return candidateSlotId
		end
	end
end

function AvatarPreviewCtrl:clearSuitAccessoriesAndKit(skipRefresh)
	local entity = self.avatarScene and self.avatarScene:getEntity(self.entityId)

	if not entity then
		return
	end

	for partId = AppearancePointEnum.Jewelry1, AppearancePointEnum.Jewelry10 do
		entity:cancelCustomShow(partId, true)
	end

	for partId = AppearancePointEnum.FootPrint, AppearancePointEnum.Effect do
		entity:cancelCustomShow(partId, true)
	end

	if not skipRefresh then
		self:refreshSuitAccessoriesAndKit(entity)
	end
end

function AvatarPreviewCtrl:applySuitAccessoriesAndKit(suitData)
	local entity = self.avatarScene:getEntity(self.entityId)

	self:clearSuitAccessoriesAndKit(true)

	local usedSlots = {}
	local hideJewelryList = suitData.shopHideJewelryList or {}

	for _, accessoryId in ipairs(suitData.jewelryList or {}) do
		if not table.contains(hideJewelryList, accessoryId) then
			local accessoryData = AppearanceData[accessoryId]
			local slotId = self:getAvailableJewelrySlot(accessoryData, usedSlots)

			usedSlots[slotId] = true

			entity:setCustomShow(accessoryId, true, slotId)
		end
	end

	for _, kitId in ipairs(suitData.kit or {}) do
		entity:setCustomShow(kitId, true)
	end

	self:refreshSuitAccessoriesAndKit(entity)
end

function AvatarPreviewCtrl:refreshSuitAccessoriesAndKit(entity)
	local modelView = entity.eModel.modelModelView

	ClientModelUtils.initAttachModelInfo(entity)
	modelView:RefreshModels()
end

function AvatarPreviewCtrl:playAnimation(state)
	local entity = self.avatarScene:getEntity(self.entityId)

	entity:playAnimation(PlayableConst[state], true, nil, nil, PlayableConst.AnimationLayer.HUMAN_LAYER_FULLBODY)
end

function AvatarPreviewCtrl:stopAnimation()
	local entity = self.avatarScene and self.avatarScene:getEntity(self.entityId)

	if not entity then
		return
	end

	local curState = entity:getCurrentPlayableState(PlayableConst.AnimationLayer.HUMAN_LAYER_FULLBODY)

	if curState and curState.Key ~= PlayableConst.Show_Idle then
		curState:Stop()
	end
end

return AvatarPreviewCtrl
