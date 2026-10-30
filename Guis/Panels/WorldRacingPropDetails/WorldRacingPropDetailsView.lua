-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRacingPropDetails\\WorldRacingPropDetailsView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local WorldRacingPropDetailsView = Class.LightClass("WorldRacingPropDetailsView", UIView)

function WorldRacingPropDetailsView:findObjects()
	UIView.findObjects(self)

	local objectReference = self.transform:GetComponent("ObjectReference")
	local popupObjectReference = objectReference:GetRefValue("popupObjectReference")

	self.titleUBaseText = popupObjectReference:GetRefValue("titleText")
	self.btnCloseUButton = popupObjectReference:GetRefValue("rightUpCornerCloseBtn")
	self.propListUList = objectReference:GetRefValue("propListUList")
	self.propNameUBaseText = objectReference:GetRefValue("propNameUBaseText")
	self.descUScrollRect = objectReference:GetRefValue("descUScrollRect")
	self.propDescUBaseText = self.descUScrollRect.content
	self.videoPlayer = objectReference:GetRefValue("videoPlayer")
	self.photoUImage = objectReference:GetRefValue("photoUImage")
end

function WorldRacingPropDetailsView:initView()
	self:setVideoPlaceholderVisible(true)

	self.videoPlayer.autoOpen = false

	local color = self.videoPlayer.color

	self.videoPlayer.color = Color(color.r, color.g, color.b, 0)
end

function WorldRacingPropDetailsView:setVideoPlaceholderVisible(visible)
	if visible then
		self.photoUImage.url = ""
		self.photoUImage.url = "$ui_img_white.png"
		self.photoUImage.color = Color(0.8962264, 0.8962264, 0.8962264, 1)
	end

	self.photoUImage.gameObject:SetActiveEx(visible)
end

return WorldRacingPropDetailsView
