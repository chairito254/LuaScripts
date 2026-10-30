-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PhotographyStudioEdit\\Component\\StudioFuncCameraModeUIComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PhotographyStudioUtils = require("Utils.PhotographyStudioUtils")
local StudioFuncCameraModeUIComponent = Class.LightClass("StudioFuncCameraModeUIComponent", UIComponent)

StudioFuncCameraModeUIComponent.CameraModes = {
	{
		cameraModeId = 0,
		label = "PHOTO_FREE_CAMERA"
	},
	{
		cameraModeId = 1,
		label = "PHOTO_WIDE_ANGLE"
	},
	{
		cameraModeId = 2,
		label = "PHOTO_FISH_EYE_CAMERA"
	}
}

function StudioFuncCameraModeUIComponent:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.scrollRectUScrollRect = objectReference:GetRefValue("scrollRectUScrollRect")
	objectReference = self.scrollRectUScrollRect.content.transform:GetComponent("ObjectReference")
	self.cameraModeUList = objectReference:GetRefValue("cameraModeUList")
	self.cameraModeParamUList = objectReference:GetRefValue("cameraModeParamUList")
end

function StudioFuncCameraModeUIComponent:initView()
	self.cameraModeParams = {
		{
			selected = false,
			paramId = 0,
			label = "PHOTO_GRID"
		}
	}
	self.showReferenceLine = false

	self.view.referenceLineUWidget:SetActive(false)

	function self.cameraModeUList.luaRenderItem(button, index, data)
		button:TryChangePage("CameraMode", data.cameraModeId)

		local objectReference = button:GetComponent("ObjectReference")
		local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")

		ClientTextUtils.setText(txtNameUBaseText, pg.getGameString(data.label))
	end

	function self.cameraModeUList.luaClick(button, data)
		if self.model:getCameraMode() == data.cameraModeId then
			return
		end

		self:setCameraMode(data.cameraModeId)
		self.ctrl:showParamTip(1, pg.getGameString("PHOTO_LENS"), pg.getGameString(data.label))
		self.ctrl:recordHistoryStep("camera_mode")
	end

	function self.cameraModeParamUList.luaRenderItem(button, index, data)
		button:TryChangePage("CameraModeParam", data.paramId)
	end

	function self.cameraModeParamUList.luaClick(button, data)
		self.showReferenceLine = not self.showReferenceLine
		data.selected = self.showReferenceLine

		self.view.referenceLineUWidget:SetActive(self.showReferenceLine)
		self.ctrl:showParamTip(1, pg.getGameString(data.label), pg.getGameString(data.selected and "PHOTO_SHOW" or "PHOTO_HIDE"))
	end

	self:setCameraMode(self.model:getCameraMode())
end

function StudioFuncCameraModeUIComponent:refreshUI()
	self.cameraModeUList:SetList(self.CameraModes)
	self.cameraModeParamUList:SetList(self.cameraModeParams)
	self.cameraModeUList:SelectItem(self.model:getCameraMode())

	self.haveRefreshed = true
end

function StudioFuncCameraModeUIComponent:setCameraMode(cameraMode)
	cameraMode = tonumber(cameraMode) or self.model.CameraModeIds.FreeCamera

	if cameraMode ~= self.model.CameraModeIds.WideAngle and cameraMode ~= self.model.CameraModeIds.FishEye then
		cameraMode = self.model.CameraModeIds.FreeCamera
	end

	self.model:setCameraMode(cameraMode)
	PhotographyStudioUtils.applyCameraModeToCamera(self.ctrl:getPhotoCameraMode(), cameraMode, self.view.zoom.value)

	if self.haveRefreshed then
		self.cameraModeUList:SelectItem(cameraMode)
	end
end

function StudioFuncCameraModeUIComponent:applyPreset(preset)
	self:setCameraMode(preset and preset.photoCameraMode)
end

function StudioFuncCameraModeUIComponent:saveToPreset(preset)
	preset.photoCameraMode = self.model:getCameraMode()
end

return StudioFuncCameraModeUIComponent
