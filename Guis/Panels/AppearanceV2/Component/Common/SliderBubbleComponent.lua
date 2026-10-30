-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceV2\\Component\\Common\\SliderBubbleComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local SliderBubbleComponent = Class.LightClass("SliderBubbleComponent", UIComponent)
local ClientTextUtils = require("Utils.ClientTextUtils")

SliderBubbleComponent.TYPE = {
	NONE = 2,
	COLOR = 1,
	NORMAL = 0
}

function SliderBubbleComponent:onCtor(info)
	self.type = info and info.type or self.TYPE.NORMAL
end

function SliderBubbleComponent:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.valueUBaseText = self.objectReference:GetRefValue("valueUBaseText")
	self.nameUBaseText = self.objectReference:GetRefValue("nameUBaseText")
	self.rUBaseText = self.objectReference:GetRefValue("rUBaseText")
	self.gUBaseText = self.objectReference:GetRefValue("gUBaseText")
	self.bUBaseText = self.objectReference:GetRefValue("bUBaseText")
	self.rootUComponent = self.objectReference:GetRefValue("rootUComponent")
end

function SliderBubbleComponent:initView()
	self.rootUComponent:TryChangePage("type", self.type)
	self.rootUComponent:SetActiveFastest(false)
end

function SliderBubbleComponent:initHide()
	self:clearAutoHideTimer()
	self.rootUComponent:SetActiveFastest(false)
end

function SliderBubbleComponent:clearAutoHideTimer()
	self:killTimer(self.autoHideTimer)

	self.autoHideTimer = nil
end

function SliderBubbleComponent:show()
	self:clearAutoHideTimer()

	if self.state ~= "show" then
		self.rootUComponent:SetActiveFastest(true)
		self.rootUComponent:TryChangePage("state", "show")
	end
end

function SliderBubbleComponent:hide()
	self:clearAutoHideTimer()

	if self.state ~= "hide" then
		self.rootUComponent:TryChangePage("state", "hide")
	end
end

function SliderBubbleComponent:setNormalValue(value, name)
	ClientTextUtils.setText(self.valueUBaseText, value)
	ClientTextUtils.setText(self.nameUBaseText, pg.getLocalizationText(name))
end

function SliderBubbleComponent:showToggleState(enabled, nameKey)
	local valueKey = enabled and "AVATAR_TOGGLE_ON" or "AVATAR_TOGGLE_OFF"

	if nameKey == "AVATAR_TOGGLE_CLOTHES" or nameKey == "AVATAR_TOGGLE_UI" then
		valueKey = enabled and "AVATAR_TOGGLE_VISIBLE" or "AVATAR_TOGGLE_INVISIBLE"
	end

	ClientTextUtils.setText(self.valueUBaseText, pg.getGameString(valueKey))
	ClientTextUtils.setText(self.nameUBaseText, pg.getGameString(nameKey))
	self:show()

	self.autoHideTimer = self:startTimer(function()
		self:hide()
	end, 2)
end

function SliderBubbleComponent:setColorValue(r, g, b)
	ClientTextUtils.setText(self.rUBaseText, r <= 1 and math.floor(r * 255 + 0.5) or r)
	ClientTextUtils.setText(self.gUBaseText, g <= 1 and math.floor(g * 255 + 0.5) or g)
	ClientTextUtils.setText(self.bUBaseText, b <= 1 and math.floor(b * 255 + 0.5) or b)
end

function SliderBubbleComponent:onDestroy()
	self:clearAutoHideTimer()
	UIComponent.onDestroy(self)
end

return SliderBubbleComponent
