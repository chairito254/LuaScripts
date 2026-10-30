-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\CTipArea\\ScreenCaptureShareItem.lua

local Time = require("Core.Common.Time")
local Class = require("Core.Framework.Class")
local CallbackHandler = require("Core.Common.CallbackHandler")
local UIConst = require("Const.UIConst")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local transferTimeout = 5
local ScreenCaptureShareItem = Class.LightClass("ScreenCaptureShareItem", BaseQueueItem)

function ScreenCaptureShareItem:onInit()
	self.uContainer = self.uWidget
	self.isContainerLoading = false
	self.isDestroyed = false
end

function ScreenCaptureShareItem:pushData(data)
	local now = Time.realSecondCache
	local runningData = self:firstRunItem()

	if runningData ~= nil then
		self:refreshRunningScreenshot(runningData, data, now)

		return
	end

	self:enqueueScreenshot(data)
end

function ScreenCaptureShareItem:refreshRunningScreenshot(runningData, data, now)
	if NotNil(runningData.sprite) and runningData.sprite ~= data.sprite then
		pg.global.mobileCameraMgr:DestroySpriteTexture(runningData.sprite)
	end

	runningData.sprite = data.sprite
	runningData.imageShareConfig = data.imageShareConfig
	runningData.endTime = now + data.imageShareConfig.stayTime

	if not self.uContainer:CheckURLLoaded() then
		return
	end

	self:renderItem(self.uContainer.content, runningData)
end

function ScreenCaptureShareItem:enqueueScreenshot(data)
	for _, queuedData in ipairs(self.dataQueue) do
		if NotNil(queuedData.sprite) and queuedData.sprite ~= data.sprite then
			pg.global.mobileCameraMgr:DestroySpriteTexture(queuedData.sprite)
		end
	end

	table.clearArray(self.dataQueue)
	self:enqueue(data)
end

function ScreenCaptureShareItem:onUpdate()
	self:tryPopupItem()
	self:refreshRemainTime()
end

function ScreenCaptureShareItem:tryPopupItem()
	if self:isQueueEmpty() or self:isReachTheLimit() then
		return
	end

	local data = self:dequeue()

	data.endTime = Time.realSecondCache + data.imageShareConfig.stayTime

	self:addRunItem(data)
	self:loadContent(data)
end

function ScreenCaptureShareItem:loadContent(data)
	if self.uContainer:CheckURLLoaded() then
		self:renderItem(self.uContainer.content, data)

		return
	end

	if self.isContainerLoading then
		return
	end

	self.isContainerLoading = true

	local uContainer = self.uContainer

	local function onContentLoaded(content)
		self.isContainerLoading = false

		if self.isDestroyed or self.uContainer ~= uContainer then
			uContainer:DestroyContent()

			return
		end

		if IsNil(content) or self:firstRunItem() ~= data or data.removing then
			return
		end

		self:renderItem(content, data)
	end

	uContainer:LoadDefaultUrlManually(onContentLoaded)
end

function ScreenCaptureShareItem:renderItem(content, data)
	local objectReference = content:GetComponent("ObjectReference")
	local btnShareUButton = objectReference:GetRefValue("btnShareUButton")
	local photoUImage = objectReference:GetRefValue("photoUImage")

	photoUImage.sprite = data.sprite

	local function onClick()
		self:onShareClick(data)
	end

	content.luaClick = onClick
	btnShareUButton.luaClick = onClick
end

function ScreenCaptureShareItem:refreshRemainTime()
	local data = self:firstRunItem()

	if data == nil then
		return
	end

	local now = Time.realSecondCache

	if data.transferPending then
		if data.transferDeadline and now >= data.transferDeadline then
			data.transferPending = false
			data.transferDeadline = nil

			self:recycleToast(data)
		end

		return
	end

	if now < data.endTime then
		return
	end

	self:recycleToast(data)
end

function ScreenCaptureShareItem:canAcceptCapture(context)
	local data = context.data

	return data.transferPending and not data.removing and NotNil(context.screenshotSprite)
end

function ScreenCaptureShareItem:onCaptureAccepted(context)
	if not self:canAcceptCapture(context) then
		return false
	end

	context.ownershipAccepted = true

	local data = context.data

	data.transferPending = false
	data.transferDeadline = nil
	data.captureOwnershipTransferred = true

	if not data.removing then
		self:recycleToast(data)
	end

	return true
end

function ScreenCaptureShareItem:onSharingClosed(context)
	local data = context.data

	if context.ownershipAccepted or not data.transferPending then
		return
	end

	data.transferPending = false
	data.transferDeadline = nil
end

function ScreenCaptureShareItem:onShareClick(data)
	pg.game.audio:triggerEvent("ui_sfx_button")

	local tipsCtrl = self.owner.owner.ctrl

	if data.removing or data.transferPending or tipsCtrl.screenCaptureShareComponent:isCapturePending() then
		return
	end

	local sharingCtrl = pg.global.ui:tryGetCtrlByUid(UIConst.UI_ID_HUD_SCREENSHOT_SHARING)

	if sharingCtrl and (sharingCtrl._blurGatePending or sharingCtrl:checkUIOpen() and not sharingCtrl:checkUIAssetReady()) then
		return
	end

	local context = {
		ownershipAccepted = false,
		data = data,
		screenshotSprite = data.sprite
	}

	data.transferPending = true
	data.transferDeadline = Time.realSecondCache + transferTimeout

	pg.global.ui:open(UIConst.UI_ID_HUD_SCREENSHOT_SHARING, {
		sprite = context.screenshotSprite,
		canAcceptCapture = CallbackHandler(self, "canAcceptCapture", context),
		onCaptureAccepted = CallbackHandler(self, "onCaptureAccepted", context)
	}, nil, CallbackHandler(self, "onSharingClosed", context))
end

function ScreenCaptureShareItem:recycleToast(data)
	if data.removing then
		return
	end

	data.removing = true

	if not data.transferPending and not data.captureOwnershipTransferred and NotNil(data.sprite) then
		pg.global.mobileCameraMgr:DestroySpriteTexture(data.sprite)

		data.sprite = nil
	end

	self.isContainerLoading = false

	self.uContainer:DestroyContent()
	self:removeItem(data)
end

function ScreenCaptureShareItem:onClearRunningList()
	for i = #self.runList, 1, -1 do
		local data = self.runList[i]

		data.transferPending = false
		data.transferDeadline = nil

		self:recycleToast(data)
	end
end

function ScreenCaptureShareItem:onClearDataQueue()
	for _, data in ipairs(self.dataQueue) do
		if NotNil(data.sprite) then
			pg.global.mobileCameraMgr:DestroySpriteTexture(data.sprite)

			data.sprite = nil
		end
	end

	table.clearArray(self.dataQueue)
end

function ScreenCaptureShareItem:onDestroy()
	self.isDestroyed = true

	BaseQueueItem.onDestroy(self)

	if NotNil(self.uContainer) then
		self.uContainer:DestroyContent()
	end

	self.uContainer = nil
end

return ScreenCaptureShareItem
