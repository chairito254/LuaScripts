-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TopLogo\\Component\\TopLogoWeakComponent.lua

local Class = require("Core.Framework.Class")
local EventConst = require("Const.EventConst")
local UIConst = require("Const.UIConst")
local TopLogoConst = require("Const.TopLogoConst")
local TopLogoItemComponent = require("Guis.Panels.TopLogo.Component.TopLogoItemComponent")
local SysConfigData = require("Data.sys_config_data")
local TopLogoWeakComponent = Class.LightClass("TopLogoWeakComponent", TopLogoItemComponent)

function TopLogoWeakComponent:onCtor()
	self.commandVisible = false
	self.scale = 1
	self.offsetXY = nil

	function self.onContainerLoaded(isSuccess)
		if isSuccess then
			self:applyTransform()
		end
	end

	self:refreshVisible()
end

function TopLogoWeakComponent:getComponentName()
	return UIConst.TOPLOGO_COMPONENT.WEAK
end

function TopLogoWeakComponent:getInitMaxDistance()
	return SysConfigData.PUPPET_HEALTH_DISTANCE
end

function TopLogoWeakComponent:shouldBeActive()
	return self:shouldForceTopLogoVisible()
end

function TopLogoWeakComponent:shouldForceTopLogoVisible()
	return self.commandVisible == true and self:isActive()
end

function TopLogoWeakComponent:innerGetVisible()
	return TopLogoWeakComponent.super.innerGetVisible(self) and self.commandVisible == true
end

function TopLogoWeakComponent:applyTransform()
	if not self:checkContainerLoaded() or IsNil(self.refUContainer) then
		return
	end

	local content = self.refUContainer.content
	local contentRectTransform = NotNil(content) and content:GetComponent("RectTransform")

	if NotNil(contentRectTransform) then
		local offsetXY = self.offsetXY
		local offsetX = offsetXY and offsetXY[1] or 0
		local offsetY = offsetXY and offsetXY[2] or 0

		contentRectTransform:SetAnchoredPositionEx(offsetX, offsetY)
		contentRectTransform:SetLocalScaleEx(self.scale, self.scale, self.scale)
	end
end

function TopLogoWeakComponent:initUI()
	TopLogoWeakComponent.super.initUI(self)
	self:applyTransform()
end

function TopLogoWeakComponent:setWeakState(isActive, scale, offsetXY)
	self.commandVisible = isActive == true
	self.scale = scale == nil and 1 or scale
	self.offsetXY = offsetXY

	self:refreshVisible()
	self:notifyActiveStateChanged(self:shouldBeActive())
	self:notifyMaxDistanceChanged()

	if self.topLogoItem then
		self.topLogoItem:refreshTopLogoVisible()
	end
end

function TopLogoWeakComponent:refreshTopLogoInfo()
	if not self.commandVisible or not self:checkFinalVisible() then
		return
	end

	if self:checkContainerLoaded() then
		self:applyTransform()

		return
	end

	self:checkAndLoadUContainerUrlSupportAsync(self.onContainerLoaded, TopLogoConst.REF_CONTAINER_LOADED_CALLBACK_GROUP.CB_FUNC1)
end

function TopLogoWeakComponent:addEntityListener()
	function self.onWeakChanged(isActive, scale, offsetXY)
		self:setWeakState(isActive, scale, offsetXY)
	end

	if self.entity and self.entity.eventEmitter then
		self.entity.eventEmitter:addEventListener(EventConst.TOPLOGO_WEAK, self.onWeakChanged)
	end
end

function TopLogoWeakComponent:onDestroy()
	if self.entity and self.entity.eventEmitter then
		self.entity.eventEmitter:removeEventListener(EventConst.TOPLOGO_WEAK, self.onWeakChanged)
	end

	self.onWeakChanged = nil
	self.onContainerLoaded = nil

	TopLogoWeakComponent.super.onDestroy(self)
end

return TopLogoWeakComponent
