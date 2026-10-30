-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Scenes\\UIScenes\\PetShinyScene.lua

local Class = require("Core.Framework.Class")
local UISceneBase = require("GameApp.UIScene.UISceneBase")
local ClientSimpleVirtualEntity = require("Entities.ClientSimpleVirtualEntity")
local ClientVirtualEntityUtils = require("Utils.ClientVirtualEntityUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local PetTransmogUtils = require("GameApp.PetTransmog.PetTransmogUtils")
local ClientUtils = require("Utils.ClientUtils")
local ClientConst = require("Const.ClientConst")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local PetShinyStyleData = require("Data.pet_shiny_style_data")
local UIMirrorEntity = CS.FunPlus.WorldX.GUIS.Panels.UIMirrorEntity
local PetShinyScene = Class.LightClass("PetShinyScene", UISceneBase)

PetShinyScene.CAMERA = {
	FIRST = "VCameraFirst",
	SELECT_PET = "VCameraSelectPet"
}
PetShinyScene.PET_LOCAL_POSITION = {
	0,
	0,
	0
}

function PetShinyScene:onCtor()
	self.displayRequestId = 0
	self.sceneCreated = false
	self.petVisible = true
end

function PetShinyScene:onStart()
	local rootTransform = self.scene.transform:Find("Global")

	self.objectReference = rootTransform:GetComponent("ObjectReference")
	self.camera = self.objectReference:GetRefValue("camera")
	self.uICameraCamera = self.camera
	self.petsParentTransform = self.objectReference:GetRefValue("petsParentTransform")
	self.mirrorPetsParentTransform = self.objectReference:GetRefValue("mirrorPetsParentTransform")
	self.cameraGoDict = {
		[self.CAMERA.FIRST] = self.objectReference:GetRefValue("vCameraFirstTransform").gameObject,
		[self.CAMERA.SELECT_PET] = self.objectReference:GetRefValue("vCameraSelectPetTransform").gameObject
	}
	self.curVCamera = nil

	for _, cameraGo in pairs(self.cameraGoDict) do
		cameraGo:SetActiveEx(false)
	end

	pg.game.input:setEnabledViewCtrl(false, ClientConst.ViewControl.APPEARANCE)

	self.viewControlDisabled = true
	self.sceneCreated = true
end

function PetShinyScene:onEnabled()
	pg.global.cameraMgr:SetUISceneCamera(self.camera)
	pg.game.camera:setUICameraObject(self.camera)
end

function PetShinyScene:switchCamera(isSelectPet)
	local cameraName = isSelectPet and self.CAMERA.SELECT_PET or self.CAMERA.FIRST
	local cameraGo = self.cameraGoDict[cameraName]

	if self.curVCamera == cameraGo then
		return
	end

	if self.curVCamera then
		self.curVCamera:SetActiveEx(false)
	end

	self.curVCamera = cameraGo

	self.curVCamera:SetActiveEx(true)
end

function PetShinyScene:isCreated()
	return self.sceneCreated
end

function PetShinyScene:getCurEntity()
	return self.mainEnt
end

function PetShinyScene:getPetLocalPosition()
	local pos = self.PET_LOCAL_POSITION

	return Vector3(pos[1], pos[2], pos[3])
end

function PetShinyScene:getAppearanceCacheKey(petInfo)
	return string.format("%s_%s_%s_%s_%s_%s_%s", petInfo.templateId, petInfo.label, petInfo.gender, petInfo.shinyStyle, petInfo.shinyEffectReplace, PetTransmogUtils.getSchemeModelCacheKey(petInfo.templateId, petInfo.selectTransmogScheme), petInfo.previewUnknown and 1 or 0)
end

function PetShinyScene:setSceneDisplayPet(petId, previewStyle, previewEffectReplace, previewUnknown)
	assert(self.sceneCreated, "PetShinyScene: scene is not ready")

	if petId == nil then
		self:clearPetPreview()

		return true
	end

	local petInfo = pg.me:getPetInfo(petId)

	if not petInfo then
		self:clearPetPreview()

		return false
	end

	local label = petInfo.label or 0
	local shinyStyle = Utils.isLabelShiny(label) and (petInfo.shinyStyle or 0) or 0

	if previewStyle ~= nil then
		label = bit.bor(label, Const.PET_LABEL_MASK.SHINY)
		shinyStyle = previewStyle
	end

	local shinyEffectReplace = previewEffectReplace

	if shinyEffectReplace == nil then
		shinyEffectReplace = petInfo.shinyEffectReplace or ""
	end

	if previewUnknown then
		label = Const.PET_LABEL_MASK.NORMAL
		shinyStyle = 0
		shinyEffectReplace = ""
	end

	local appearance = {
		templateId = petInfo.templateId,
		label = label,
		gender = petInfo.gender or 0,
		shinyStyle = shinyStyle,
		shinyEffectReplace = shinyEffectReplace,
		previewUnknown = previewUnknown == true,
		selectTransmogScheme = Utils.deepCopyTable(PetTransmogUtils.getSelectedScheme(petInfo))
	}
	local appearanceKey = self:getAppearanceCacheKey(appearance)

	if self.appearanceKey == appearanceKey then
		self.petId = petId

		return true
	end

	if self.curShowPetTemplateId ~= appearance.templateId then
		self:clearPetPreview()
	end

	self.petId = petId
	self.curShowPetTemplateId = appearance.templateId
	self.appearanceKey = appearanceKey
	self.displayRequestId = self.displayRequestId + 1

	local requestId = self.displayRequestId

	self.mainEnt = self.mainEnt or self:createDisplayEntity(appearance, self.petsParentTransform)
	self.mirrorEnt = self.mirrorEnt or self:createDisplayEntity(appearance, self.mirrorPetsParentTransform)
	self.mainEnt.petShinyReadyRequestId = nil
	self.mirrorEnt.petShinyReadyRequestId = nil

	self:setEntityVisible(self.mainEnt, false)
	self:setEntityVisible(self.mirrorEnt, false)
	self:refreshPetModelAppearance(self.mainEnt, appearance, requestId)
	self:refreshPetModelAppearance(self.mirrorEnt, appearance, requestId)

	return true
end

function PetShinyScene:createDisplayEntity(appearance, parentTransform)
	local configData = ClientVirtualEntityUtils.getPetUISceneConfig(appearance.templateId)
	local ent = ClientSimpleVirtualEntity.new()

	ent:setConfigData(configData)

	local initInfo = {
		isIgnoreEffectLod = true,
		templateId = appearance.templateId,
		label = appearance.label,
		gender = appearance.gender,
		shinyStyle = appearance.shinyStyle
	}

	ent:init(initInfo)
	ent:postInit(initInfo)
	ent:start()
	self:setEntityVisible(ent, false)
	ent:setModelLayer(ClientConst.LayerDefine.LAYER_UI_SCENE)
	ent:setLodTickEnable(Const.LOD_TICK_KEY.DEFAULT, false)
	ent:setRendererLod(0)

	local eModel = ent.eModel

	eModel:SetTransformParent(parentTransform, false)

	local pos = self:getPetLocalPosition()

	eModel:SetTransformLocalPosition(pos.x, pos.y, pos.z)
	eModel:SetTransformLocalRotation(0, 0, 0, 1)
	eModel:SetTransformLocalScale()

	return ent
end

function PetShinyScene:refreshPetModelAppearance(ent, appearance, requestId)
	local eModel = ent.eModel
	local modelView = eModel.modelModelView

	eModel.RootRotationScale = Vector3(0, 0, 0)
	modelView.luaOnModelRefreshFinshed = nil

	if ent.petShinyPreviewUnknown then
		self:restoreMirrorHologramDepth(ent)

		ent.petShinyPreviewUnknown = nil

		eModel.modelShaderView:SetOverrideMaterial("")
		eModel.modelShaderView:SetMultiPassRenderEnable(true)
	end

	PetManagementDataHelper.refreshPetModelAppearance(ent, appearance.templateId, {
		applyAnimController = true,
		canAttachEffs = false,
		modelNeedBones = true,
		useTemplateFallback = true,
		useTransmogScheme = true,
		configData = ClientVirtualEntityUtils.getPetUISceneConfig(appearance.templateId),
		petInfo = appearance,
		transmogScheme = appearance.selectTransmogScheme
	})
	eModel.modelShaderView:SetMultiPassForce32Layer(true)

	function modelView.luaOnModelRefreshFinshed()
		self:onPetModelReady(ent, requestId, appearance.previewUnknown)
	end

	if modelView.firstLoaded then
		self:onPetModelReady(ent, requestId, appearance.previewUnknown)
	end
end

function PetShinyScene:onPetModelReady(ent, requestId, previewUnknown)
	if not self.sceneCreated or requestId ~= self.displayRequestId or ent ~= self.mainEnt and ent ~= self.mirrorEnt or ent.petShinyReadyRequestId == requestId then
		return
	end

	ent.eModel.modelModelView.luaOnModelRefreshFinshed = nil

	ent.eModel:PlayDefaultAnimation(Const.COMPONENT_IDX_PLAYABLE, true)

	if previewUnknown then
		ent.petShinyPreviewUnknown = true

		local shaderView = ent.eModel.modelShaderView

		shaderView:SetMultiPassRenderEnable(false)

		local materialPath = PetManagementDataHelper.getPetHandbookMat()

		if ent == self.mirrorEnt then
			local materialName = materialPath:sub(2, -5)

			ent.petShinyMirrorMaterialName = materialName

			shaderView:SetMaterialProperty(materialName, "_ZTest", 8)
			shaderView:SetMaterialProperty(materialName, "_ZTestMobile", 8)
		end

		shaderView:SetOverrideMaterial(materialPath, function()
			self:onPetAppearanceReady(ent, requestId)
		end)
	else
		self:onPetAppearanceReady(ent, requestId)
	end
end

function PetShinyScene:restoreMirrorHologramDepth(ent)
	local materialName = ent.petShinyMirrorMaterialName

	if not materialName then
		return
	end

	local shaderView = ent.eModel.modelShaderView

	shaderView:SetMaterialProperty(materialName, "_ZTest", 4)
	shaderView:SetMaterialProperty(materialName, "_ZTestMobile", 4)

	ent.petShinyMirrorMaterialName = nil
end

function PetShinyScene:onPetAppearanceReady(ent, requestId)
	if not self.sceneCreated or requestId ~= self.displayRequestId or ent ~= self.mainEnt and ent ~= self.mirrorEnt or ent.petShinyReadyRequestId == requestId then
		return
	end

	ent.petShinyReadyRequestId = requestId

	self:refreshMirrorBinding(requestId)
end

function PetShinyScene:refreshMirrorBinding(requestId)
	local mainEnt = self.mainEnt
	local mirrorEnt = self.mirrorEnt

	if not mainEnt or not mirrorEnt or mainEnt.petShinyReadyRequestId ~= requestId or mirrorEnt.petShinyReadyRequestId ~= requestId then
		return
	end

	UIMirrorEntity.Create(mirrorEnt.eModel.animator, mainEnt.eModel.animator)
	self:setEntityVisible(mainEnt, self.petVisible)
	self:setEntityVisible(mirrorEnt, self.petVisible)
end

function PetShinyScene:setEntityVisible(ent, visible)
	ent:setModelVisible(ClientConst.MODEL_VISIBLE_KEY.UIScene, visible)
end

function PetShinyScene:setPetRootActive(active)
	self.petVisible = active

	local ready = self.mainEnt ~= nil and self.mirrorEnt ~= nil and self.mainEnt.petShinyReadyRequestId == self.displayRequestId and self.mirrorEnt.petShinyReadyRequestId == self.displayRequestId

	if self.mainEnt then
		self:setEntityVisible(self.mainEnt, active and ready)
	end

	if self.mirrorEnt then
		self:setEntityVisible(self.mirrorEnt, active and ready)
	end
end

function PetShinyScene:rotatePreviewEntity(deltaAngle)
	if self.mainEnt then
		self.mainEnt.eModel:RotateAroundTransform(deltaAngle)
	end

	if self.mirrorEnt then
		self.mirrorEnt.eModel:RotateAroundTransform(deltaAngle)
	end
end

function PetShinyScene:destroyDisplayEntity(ent)
	if not ent then
		return
	end

	self:setEntityVisible(ent, false)

	ent.eModel.modelModelView.luaOnModelRefreshFinshed = nil

	self:restoreMirrorHologramDepth(ent)
	ent:clearPetShinyAppearance()
	ClientUtils.safeDestroy(ent)
end

function PetShinyScene:clearPetPreview()
	self.displayRequestId = self.displayRequestId + 1

	local mainEnt = self.mainEnt
	local mirrorEnt = self.mirrorEnt

	self.mainEnt = nil
	self.mirrorEnt = nil
	self.petId = nil
	self.curShowPetTemplateId = nil
	self.appearanceKey = nil

	self:destroyDisplayEntity(mainEnt)
	self:destroyDisplayEntity(mirrorEnt)
end

function PetShinyScene:onDestroy()
	self.sceneCreated = false

	if self.curVCamera then
		self.curVCamera:SetActiveEx(false)

		self.curVCamera = nil
	end

	self.cameraGoDict = nil

	self:clearPetPreview()

	if self.viewControlDisabled then
		pg.game.input:setEnabledViewCtrl(true, ClientConst.ViewControl.APPEARANCE)

		self.viewControlDisabled = false
	end
end

return PetShinyScene
