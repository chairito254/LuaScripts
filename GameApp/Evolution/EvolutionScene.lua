-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Evolution\\EvolutionScene.lua

local Class = require("Core.Framework.Class")
local CallbackHandler = require("Core.Common.CallbackHandler")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ID_EVO_SCENE_MOVE_CAMERA = "evoSceneMoveCamera"
local EvolutionScene = Class.LightClass("EvolutionScene")

function EvolutionScene:ctor(resId, pos, rot, isolateWorldCamera)
	self.resId = resId
	self.pos = pos
	self.rot = rot
	self.isolateWorldCamera = isolateWorldCamera == true
end

function EvolutionScene:startLoad(callback)
	local extraData = {
		dontDestroy = true
	}

	if self.isolateWorldCamera then
		extraData.createCallback = CallbackHandler(self, "onSceneCreated")
	end

	self.scene = pg.game.cutscene:playCutscene(self.resId, self.resId, self.pos, self.rot, nil, nil, extraData)

	if self.isolateWorldCamera and not self.scene then
		error("EvolutionScene failed to create isolated scene: " .. self.resId)
	end

	self:onCutsceneLoaded(callback)
end

function EvolutionScene:onSceneCreated(scene)
	self.scene = scene

	local root = scene.cutscene.prefabRoot
	local objectReference = root:GetComponent("ObjectReference")
	local renderCamera = objectReference:GetRefValue("camera001Camera")
	local refCamera = objectReference:GetRefValue("gameObjectRefVirtualCameraBehavior")

	refCamera.enabled = false
	self.renderCamera = renderCamera

	local streamingType = typeof(CS.UnityEngine.StreamingController)

	self.streamingController = self.renderCamera:GetComponent(streamingType)

	if IsNil(self.streamingController) then
		self.streamingController = self.renderCamera.gameObject:AddComponent(streamingType)
	end

	self.streamingController.enabled = true
end

function EvolutionScene:destroy()
	local scene = self.scene

	self.scene = nil
	self.mainCamera = nil
	self.cameraTarget = nil

	if self.isolateWorldCamera then
		local root = scene and scene.cutscene and scene.cutscene.prefabRoot

		if not IsNil(root) then
			root.gameObject:SetActiveEx(false)
		end

		if not IsNil(self.streamingController) then
			self.streamingController.enabled = false
		end
	end

	if scene then
		scene:destroy()
	end

	self.renderCamera = nil
	self.streamingController = nil
end

function EvolutionScene:onCutsceneLoaded(cb)
	self:initMainCamera()

	if cb then
		cb()
	end
end

function EvolutionScene:initMainCamera()
	if self.scene then
		local objectReference = self.scene.cutscene.prefabRoot:GetComponent("ObjectReference")

		if objectReference then
			self.mainCamera = objectReference:GetRefValue("mainCamera")
			self.cameraTarget = objectReference:GetRefValue("cameraTarget")
		end
	end
end

function EvolutionScene:setCameraOffset(offSet)
	if self.mainCamera then
		local oriPos = self.mainCamera.transform.position
		local newPos = oriPos + offSet

		self.mainCamera.transform.position = newPos
	end
end

function EvolutionScene:setCameraTarget(offset)
	if self.cameraTarget then
		local oriPos = self.cameraTarget.transform.position
		local newPos = oriPos + offset

		self.cameraTarget.transform.position = newPos
	end
end

function EvolutionScene:tweenMoveCamera(moveDelta)
	if not moveDelta or IsNil(self.mainCamera) then
		return
	end

	local cameraTs = self.mainCamera.transform
	local oriPos = cameraTs.position
	local targetPos = oriPos + moveDelta

	DoTweenAnimMgr.GlobalMove(cameraTs, LuaUIUtils.TweenId(ID_EVO_SCENE_MOVE_CAMERA), targetPos, 0.75, 0, CS.DG.Tweening.Ease.__CastFrom(6), nil, nil, false)
end

return EvolutionScene
