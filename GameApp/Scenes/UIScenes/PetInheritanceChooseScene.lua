-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Scenes\\UIScenes\\PetInheritanceChooseScene.lua

local ClientUtils = require("Utils.ClientUtils")
local Class = require("Core.Framework.Class")
local UISceneBase = require("GameApp.UIScene.UISceneBase")
local PetInheritanceChooseScene = Class.LightClass("PetInheritanceChooseScene", UISceneBase)
local ClientVirtualEntityUtils = require("Utils.ClientVirtualEntityUtils")
local ClientConst = require("Const.ClientConst")
local PetFirstShowData = require("Data.pet_first_show_data")
local PlayableConst = require("Common.Const.PlayableConst")
local PetResearchUtils = require("Guis.Utils.PetResearchUtils")
local Utils = require("Common.Utils.Utils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local AntialiasingMode = {
	TAA = 2,
	FSR = 1,
	NONE = 0
}

function PetInheritanceChooseScene:onStart(param)
	self.curEntity = nil
	self.curPetId = nil
	self.curPetTId = nil

	self:initScene(param)
end

function PetInheritanceChooseScene:initScene(param)
	local root = self.scene.transform:Find("Root")

	self.objectReference = root:GetComponent("ObjectReference")
	self.cameraCamera = self.objectReference:GetRefValue("cameraCamera")
	self.petPosTransform = self.objectReference:GetRefValue("petPosTransform")
	self.levelPetManagementEnvV2Transform = self.objectReference:GetRefValue("levelPetManagementEnvV2Transform")
	self.envVolumeV2Transform = self.objectReference:GetRefValue("envVolumeV2Transform")
	self.cameraXCameraData = self.objectReference:GetRefValue("cameraXCameraData")

	if self.cameraXCameraData and self.cameraXCameraData.m_AntialiasingMode ~= AntialiasingMode.FSR then
		-- block empty
	end

	self.scene.transform.position = Vector3(0, 5000, 0)

	if param and param.useLocalEnv then
		-- block empty
	end
end

function PetInheritanceChooseScene:setExRawImageProRef(rawImagePro)
	self:setRawImageProRef(rawImagePro)
end

function PetInheritanceChooseScene:reSetRawImageProRef()
	self:refreshAllRenderTextures()
end

function PetInheritanceChooseScene:setRawImageProRef(rawImagePro)
	self.rawImagePro = rawImagePro

	self:acquireRenderTextureFor("main", self.cameraCamera, rawImagePro)
end

function PetInheritanceChooseScene:previewPet(petId, force)
	if self.curPetId == petId and not force then
		return
	end

	self:clear()

	if not petId then
		return
	end

	local pet = pg.me.pets[petId]
	local petTId = pet.templateId
	local extraData = {
		isCreateEntUsePetId = pet ~= nil,
		petId = petId,
		label = pet.label,
		shinyStyle = pet.shinyStyle
	}

	PetManagementDataHelper.previewPetModel(petTId, self.petPosTransform, function(entity)
		if not entity then
			return
		end

		entity.eModel.modelShaderView:MultiPassUseExtraConfig(0)

		self.curEntity = entity
		self.curPetTId = petTId
		self.curPetId = petId
	end, extraData)
end

function PetInheritanceChooseScene:playPetIdle()
	if self.curEntity then
		self.curEntity:playAnimation("Idle")
	end
end

function PetInheritanceChooseScene:setModelVisible(visible)
	if self.curEntity then
		self.curEntity:setActive(ClientConst.MODEL_VISIBLE_KEY.UIScene, visible)
	end
end

function PetInheritanceChooseScene:clear()
	if self.curEntity and (self.curPetId or self.curPetTId) then
		ClientUtils.safeDestroy(self.curEntity)

		self.curEntity = nil
		self.curPetId = nil
		self.curPetTId = nil
	end
end

function PetInheritanceChooseScene:clearTexture()
	self:releaseRenderTextureByKey("main")
end

function PetInheritanceChooseScene:onDestroy()
	self:clearTexture()
	self:clear()
end

function PetInheritanceChooseScene:entActive(active)
	if self.curEntity then
		self.curEntity:setActive(ClientConst.MODEL_VISIBLE_KEY.UIScene, active)
	end
end

function PetInheritanceChooseScene:snapShotDraw()
	pg.global.cameraMgr:SnapShotDelay(function(texture)
		self.rawImagePro.texture = texture
	end, self.cameraCamera, self:getRenderTexture("main"))
end

function PetInheritanceChooseScene:setLocalEnv()
	self.levelPetManagementEnvV2Transform.gameObject:SetActiveEx(false)
	self.envVolumeV2Transform.gameObject:SetActiveEx(true)
end

return PetInheritanceChooseScene
