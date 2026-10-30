-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Component\\BuffToastListComponent.lua

local UIComponent = require("Guis.Helper.UIComponent")
local Class = require("Core.Framework.Class")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local BuffToastListComponent = Class.LightClass("BuffToastListComponent", UIComponent)
local DEFAULT_DURATION = 3

function BuffToastListComponent:findObjects()
	self.container = self.transform:GetComponent("UContainer")
end

function BuffToastListComponent:initView()
	if self.uWidget then
		self.uWidget:SetActive(true)
	end

	self:hideImmediately()
end

function BuffToastListComponent:onShow()
	if self.container and self.container.content then
		LuaUIUtils.setUIVisible(self.container.content, true)
	end
end

function BuffToastListComponent:onHide()
	if self.container and self.container.content then
		LuaUIUtils.setUIVisible(self.container.content, false)
	end
end

function BuffToastListComponent:showBuffList(buffList, duration, colorIndex)
	if not buffList or #buffList == 0 then
		self:hideImmediately()

		return
	end

	self.showRequestId = (self.showRequestId or 0) + 1

	local requestId = self.showRequestId

	if not self.container:CheckURLLoaded() then
		self.container:LoadDefaultUrlManually(function()
			if requestId ~= self.showRequestId then
				return
			end

			self:registerObjectInner()
			self:showBuffListInternal(buffList, duration, colorIndex)
		end)
	else
		if not self.listToastUList then
			self:registerObjectInner()
		end

		self:showBuffListInternal(buffList, duration, colorIndex)
	end
end

function BuffToastListComponent:registerObjectInner()
	local objectReference = self.container.content:GetComponent("ObjectReference")

	self.listToastUList = objectReference:GetRefValue("listToastUList")

	function self.listToastUList.luaRenderItem(button, index, data)
		self:renderBuffItem(button, index, data)
	end
end

function BuffToastListComponent:showBuffListInternal(buffList, duration, colorIndex)
	self.colorIndex = colorIndex or 0
	self.buffList = buffList

	self.listToastUList:SetList(buffList)
	self:show()
	self:clearHideTimer()

	self.hideTimerId = self:startTimer(function()
		local firedTimerId = self.hideTimerId

		self.hideTimerId = nil

		if firedTimerId then
			self._timerIds[firedTimerId] = nil
		end

		self:playOutAnimationAndHide()
	end, duration or DEFAULT_DURATION)
end

function BuffToastListComponent:renderBuffItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local buffIconUImage = objectReference:GetRefValue("buffIconUImage")
	local titleUSDFText = objectReference:GetRefValue("titleUSDFText")
	local subInfoUSDFText = objectReference:GetRefValue("subInfoUSDFText")

	button:TryChangePage("Color", data.colorIndex or self.colorIndex)

	buffIconUImage.url = data.buffEffectTag or data.buffIcon or ""

	ClientTextUtils.setText(titleUSDFText, data.buffName and pg.getLocalizationText(data.buffName) or "")
	ClientTextUtils.setText(subInfoUSDFText, data.buffDesc and pg.getLocalizationText(data.buffDesc) or "")

	local anim = objectReference:GetRefValue("anim")

	if anim then
		UIUtils.PlayAnimation(anim, "VX_Node_HUD_BattleRoom_Buff_Toast_In")
	end
end

function BuffToastListComponent:clearHideTimer()
	if self.hideTimerId then
		self:killTimer(self.hideTimerId)

		self.hideTimerId = nil
	end
end

function BuffToastListComponent:playOutAnimationAndHide()
	self.showRequestId = (self.showRequestId or 0) + 1

	local requestId = self.showRequestId
	local animations = {}

	for index = 0, self.listToastUList.itemCount - 1 do
		local found, button = self.listToastUList:TryGetChildAt(index)

		if found and NotNil(button) then
			local objectReference = button:GetComponent("ObjectReference")
			local anim = objectReference:GetRefValue("anim")

			if anim then
				animations[#animations + 1] = anim
			end
		end
	end

	if #animations == 0 then
		self:hideImmediately()

		return
	end

	local pendingCount = #animations

	for _, anim in ipairs(animations) do
		UIUtils.PlayAnimation(anim, "VX_Node_HUD_BattleRoom_Buff_Toast_Out", function()
			if requestId ~= self.showRequestId then
				return
			end

			pendingCount = pendingCount - 1

			if pendingCount == 0 then
				self:hideImmediately()
			end
		end)
	end
end

function BuffToastListComponent:hideImmediately()
	self.showRequestId = (self.showRequestId or 0) + 1

	self:clearHideTimer()

	self.buffList = nil

	self:hide()
end

return BuffToastListComponent
