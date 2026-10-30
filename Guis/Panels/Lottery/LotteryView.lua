-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Lottery\\LotteryView.lua

local logger = require("Core.Log.LoggerManager").getLogger("LotteryView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local ClientCashShopUtils = require("Utils.ClientCashShopUtils")
local LotteryView = Class.LightClass("LotteryView", UIView)

function LotteryView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.rootUComponent = objectReference:GetRefValue("rootUComponent")
	self.greenUContainer = objectReference:GetRefValue("greenUContainer")
	self.redUContainer = objectReference:GetRefValue("redUContainer")
	self.rewardUContainer = objectReference:GetRefValue("rewardUContainer")
	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.btnShowALLUI = objectReference:GetRefValue("btnShowALLUI")
	self.txtBack = objectReference:GetRefValue("txtBack")
	self.btnInfoUButton = objectReference:GetRefValue("btnInfoUButton")
	self.listCurrencyUList = objectReference:GetRefValue("listCurrencyUList")
	self.vXBlackScreenAnimation = objectReference:GetRefValue("vXBlackScreenAnimation")
	self.vXBlackScreenUWidget = NotNil(self.vXBlackScreenAnimation) and self.vXBlackScreenAnimation.transform:GetComponent("UWidget") or nil
	self._sceneBlackScreenToken = 0

	if NotNil(self.vXBlackScreenUWidget) then
		self.vXBlackScreenUWidget:SetActive(false)
	end

	self.maskLeftUImage = objectReference:GetRefValue("maskLeftUImage")
	self.maskRightUImage = objectReference:GetRefValue("maskRightUImage")
end

function LotteryView:registerObjects()
	return
end

function LotteryView:initView()
	self:setAllUIHidden(false)
	self:setLotteryContainerActive("greenUContainer", false)
	self:setLotteryContainerActive("redUContainer", false)
	self:setLotteryContainerActive("rewardUContainer", false)
end

function LotteryView:setMaskColor(bannerMask)
	ClientCashShopUtils.setImageColorByHex(self.maskLeftUImage, bannerMask)
	ClientCashShopUtils.setImageColorByHex(self.maskRightUImage, bannerMask)
end

function LotteryView:setAllUIHidden(hidden)
	self.rootUComponent:TryChangePage("Display", hidden == true and 1 or 0)
end

function LotteryView:setSceneBlackScreenVisible(visible)
	if IsNil(self.vXBlackScreenUWidget) then
		return
	end

	self._sceneBlackScreenToken = self._sceneBlackScreenToken + 1

	local requestToken = self._sceneBlackScreenToken

	if visible then
		self.vXBlackScreenUWidget:SetActive(true)
		self.vXBlackScreenUWidget:InvokeCallback(CS.XGUI.EInvokeTime.Show)

		return
	end

	if self.vXBlackScreenUWidget:CheckHasEvent(CS.XGUI.EInvokeTime.Hide) then
		self.vXBlackScreenUWidget:InvokeCallbackWithCallback(CS.XGUI.EInvokeTime.Hide, function()
			if self._sceneBlackScreenToken ~= requestToken or IsNil(self.vXBlackScreenUWidget) then
				return
			end

			self.vXBlackScreenUWidget:SetActive(false)
		end)
	else
		self.vXBlackScreenUWidget:SetActive(false)
	end
end

function LotteryView:setLotteryContainerActive(containerName, active)
	local container = self[containerName]

	if not container then
		logger:error("LotteryView 找不到配置的容器, containerName=%s", tostring(containerName))

		return false
	end

	container.gameObject:SetActiveEx(active)

	return true
end

function LotteryView:openMainContainer(mainContainerName, rewardContainerName)
	if rewardContainerName then
		self:setLotteryContainerActive(rewardContainerName, false)
	end

	return self:setLotteryContainerActive(mainContainerName, true)
end

function LotteryView:openRewardContainer(mainContainerName, rewardContainerName)
	if mainContainerName then
		self:setLotteryContainerActive(mainContainerName, false)
	end

	return self:setLotteryContainerActive(rewardContainerName, true)
end

return LotteryView
