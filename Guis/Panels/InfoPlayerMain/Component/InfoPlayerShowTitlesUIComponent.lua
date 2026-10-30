-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\InfoPlayerMain\\Component\\InfoPlayerShowTitlesUIComponent.lua

local Class = require("Core.Framework.Class")
local AddressDataConst = require("Const.AddressDataConst")
local UICardRenderUtils = require("Guis.Utils.UICardRenderUtils")
local InfoPlayerShowTitlesUIComponent = Class.LightClass("InfoPlayerShowTitlesUIComponent")

InfoPlayerShowTitlesUIComponent.EXTRA_HEIGHT = 0.1
InfoPlayerShowTitlesUIComponent.PLAYER_BODY_NAME = "PlayerBody"

function InfoPlayerShowTitlesUIComponent:ctor(ctrl)
	self.ctrl = ctrl
	self.view = ctrl.view
end

function InfoPlayerShowTitlesUIComponent:getFollowHeight(entity)
	local configData = entity:getConfigData()
	local scale = entity.curModelScale or 1

	if configData.topLogoHeight and configData.topLogoHeight > 0 then
		return configData.topLogoHeight * scale
	end

	if configData.topLogoOffsetNoScale then
		return configData.topLogoOffsetNoScale
	end

	if configData.topLogoOffset then
		return configData.topLogoOffset * scale
	end

	return entity:getHeight() * scale + InfoPlayerShowTitlesUIComponent.EXTRA_HEIGHT
end

function InfoPlayerShowTitlesUIComponent:ensureTitleWidget()
	if self.titleWidget and NotNil(self.titleWidget) then
		return true
	end

	local item = self.view:addPrefabWithPathSync(self.view.transform, AddressDataConst.TOPLOGO_COMP_RES_SHOW_TITLES)

	if not item or not NotNil(item.gameObject) then
		return false
	end

	self.titleGameObject = item.gameObject

	self.titleGameObject.transform:SetAsFirstSibling()

	self.titleWidget = self.titleGameObject:GetComponent("UWidget")

	return NotNil(self.titleWidget)
end

function InfoPlayerShowTitlesUIComponent:setSceneCamera(sceneCamera)
	if not self.sceneCamera then
		self.previousSceneCamera = pg.global.cameraMgr.uiSceneCameraInst
	end

	pg.global.cameraMgr:SetUISceneCamera(sceneCamera)

	self.sceneCamera = sceneCamera
end

function InfoPlayerShowTitlesUIComponent:clearSceneCamera()
	if self.sceneCamera and pg.global.cameraMgr.uiSceneCameraInst == self.sceneCamera then
		pg.global.cameraMgr:SetUISceneCamera(self.previousSceneCamera)
	end

	self.sceneCamera = nil
	self.previousSceneCamera = nil
end

function InfoPlayerShowTitlesUIComponent:show(entity, sceneCamera, showTitles, showTitleExtra, isWholeTitle, resolvedFriendTitleName)
	if not entity or entity.destroyed or not entity.eModel or not sceneCamera or not self:ensureTitleWidget() then
		self:hide()

		return
	end

	local followTrans = entity.eModel.transform:Find(InfoPlayerShowTitlesUIComponent.PLAYER_BODY_NAME)

	if not followTrans then
		self:hide()

		return
	end

	UICardRenderUtils.renderShowTitle(self.titleWidget, showTitles, showTitleExtra, isWholeTitle, resolvedFriendTitleName)
	self:setSceneCamera(sceneCamera)

	self.followComponent = CS.FunPlus.WorldX.GUIS.Panels.UFollowEnt.Create(self.titleGameObject, followTrans, 0, self:getFollowHeight(entity), 0, 0)

	self.followComponent:ForceInitWidget()
	self.followComponent:SetVisible(true)
end

function InfoPlayerShowTitlesUIComponent:hide()
	if self.followComponent then
		self.followComponent:AttachToTrans(nil)
		self.followComponent:SetVisible(false)
	end

	if self.titleWidget and NotNil(self.titleWidget) then
		self.titleWidget:SetActive(false)
	end

	self:clearSceneCamera()
end

function InfoPlayerShowTitlesUIComponent:destroy()
	self:hide()

	if self.view and self.titleGameObject and NotNil(self.titleGameObject) then
		self.view:destroyInstance(self.titleGameObject)
	end

	self.followComponent = nil
	self.titleWidget = nil
	self.titleGameObject = nil
	self.view = nil
	self.ctrl = nil
end

return InfoPlayerShowTitlesUIComponent
