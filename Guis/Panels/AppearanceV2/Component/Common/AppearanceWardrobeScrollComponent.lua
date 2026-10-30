-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceV2\\Component\\Common\\AppearanceWardrobeScrollComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local AppearanceWardrobeScrollComponent = Class.LightClass("AppearanceWardrobeScrollComponent", UIComponent)
local TimerManager = require("Core.Timer.TimerManager")

function AppearanceWardrobeScrollComponent:onCtor()
	self._visible = true
	self.generation = 0
	self.disposed = false
end

function AppearanceWardrobeScrollComponent:clear()
	self.generation = self.generation + 1

	if self.frameId then
		TimerManager.delFrameCb(self.frameId)
	end

	self.frameId = nil
	self.list = nil
	self.wardrobe = nil
end

function AppearanceWardrobeScrollComponent:onHide()
	self:clear()
end

function AppearanceWardrobeScrollComponent:onDestroy()
	self.disposed = true

	self:clear()
end

function AppearanceWardrobeScrollComponent:edgeInList(listRect, rect, y)
	local point = rect:TransformPoint(CS.UnityEngine.Vector3(0, y, 0))

	return listRect:InverseTransformPoint(point).y
end

function AppearanceWardrobeScrollComponent:buttonTop(listRect, transform, bottom)
	if not transform or not transform.gameObject.activeInHierarchy then
		return bottom
	end

	local rect = transform:GetComponent("RectTransform")

	if rect and rect.rect.height > 0 then
		bottom = math.max(bottom, self:edgeInList(listRect, rect, rect.rect.yMax))
	end

	for i = 0, transform.childCount - 1 do
		bottom = self:buttonTop(listRect, transform:GetChild(i), bottom)
	end

	return bottom
end

function AppearanceWardrobeScrollComponent:fitNow(list, wardrobe, onlyIfChanged)
	if not NotNil(list) or not NotNil(wardrobe) or not list.gameObject.activeInHierarchy then
		return
	end

	local rect = list.rectTransform
	local root = wardrobe.transform:GetComponent("RectTransform")

	if not rect or not root then
		return
	end

	local layout = rect.parent and rect.parent:GetComponent("ULayoutBox") or list

	if not onlyIfChanged then
		CS.XGUI.LayoutMgr.ForceRebuildLayoutImmediate(layout)
	end

	local bottom = self:edgeInList(rect, root, root.rect.yMin)

	bottom = self:buttonTop(rect, wardrobe.transform:Find("LayoutBox/Btn"), bottom)

	local height = math.max(1, rect.rect.yMax - bottom)

	if onlyIfChanged and math.abs(rect.rect.height - height) < 0.5 then
		return
	end

	list:SetSizeY(height)

	list.ScrollType = CS.XGUI.EScrollType.Vertical

	CS.XGUI.LayoutMgr.ForceRebuildLayoutImmediate(layout)

	list.EnableDrag = true
end

function AppearanceWardrobeScrollComponent:fit(list, wardrobe)
	if self.disposed or not NotNil(list) or not NotNil(wardrobe) then
		return
	end

	self.list, self.wardrobe = list, wardrobe

	self:fitNow(list, wardrobe)

	if self.frameId then
		return
	end

	local generation = self.generation

	self.frameId = TimerManager.addNextFrameCb(function()
		if self.disposed or generation ~= self.generation then
			return
		end

		self.frameId = nil

		self:fitNow(self.list, self.wardrobe)
	end)
end

function AppearanceWardrobeScrollComponent:update(list, wardrobe)
	if self.disposed then
		return
	end

	self:fitNow(list or self.list, wardrobe or self.wardrobe, true)
end

return AppearanceWardrobeScrollComponent
