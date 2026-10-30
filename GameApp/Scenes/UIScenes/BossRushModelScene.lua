-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Scenes\\UIScenes\\BossRushModelScene.lua

local ClientUtils = require("Utils.ClientUtils")
local Class = require("Core.Framework.Class")
local UISceneBase = require("GameApp.UIScene.UISceneBase")
local ClientVirtualEntityUtils = require("Utils.ClientVirtualEntityUtils")
local ClientConst = require("Const.ClientConst")
local BossRushModelScene = Class.LightClass("BossRushModelScene", UISceneBase)

function BossRushModelScene:onStart(param)
	self.objectReference = self.scene.transform:GetComponent("ObjectReference")
	self.cam = self.objectReference:GetRefValue("cam")
	self.pos = self.objectReference:GetRefValue("pos")
	self.scene.transform.position = Vector3(0, 5000, 0)
	self.bossModels = {}
end

function BossRushModelScene:setModel(modelInfo)
	if modelInfo then
		if not self.bossModels[modelInfo.templateId] then
			local entity = ClientVirtualEntityUtils.createSimpleVirtualNpc(modelInfo)

			entity.eModel:SetTransformParent(self.pos, false)
			entity.eModel:SetTransformLocalPosition()
			entity:setModelLayer(ClientConst.LayerDefine.LAYER_UI_SCENE)

			self.bossModels[modelInfo.templateId] = entity
		end

		for templateId, entity in pairs(self.bossModels) do
			entity.eModel:SetActiveEx(templateId == modelInfo.templateId)
		end
	end
end

function BossRushModelScene:setRawImageProRef(rawImagePro)
	self:acquireRenderTextureFor("main", self.cam, rawImagePro)
end

function BossRushModelScene:onDestroy()
	for key, value in pairs(self.bossModels) do
		ClientUtils.safeDestroy(value)
	end

	self.bossModels = {}
end

return BossRushModelScene
