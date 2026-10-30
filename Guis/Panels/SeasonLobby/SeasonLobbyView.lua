-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\SeasonLobby\\SeasonLobbyView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local SeasonLobbyView = Class.LightClass("SeasonLobbyView", UIView)
local BTN_COUNT = 3

function SeasonLobbyView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnCloseUButton = objectReference:GetRefValue("btnCloseUButton")
	self.btnBPUButton = objectReference:GetRefValue("btnBPUButton")
	self.btnWeekMedalUButton = objectReference:GetRefValue("btnWeekMedalUButton")
	self.btnSeasonCatchUButton = objectReference:GetRefValue("btnSeasonCatchUButton")
	self.btnSeasonAchievementUButton = objectReference:GetRefValue("btnSeasonAchievementUButton")
	self.btnSeasonShopUButton = objectReference:GetRefValue("btnSeasonShopUButton")
	self.btnSeasonTipsUButton = objectReference:GetRefValue("btnSeasonTipsUButton")
	self.btnSeasonCalendarUButton = objectReference:GetRefValue("btnSeasonCalendarUButton")
	self.shopShowUImage = objectReference:GetRefValue("shopShowUImage")
	self.txtBackBtnUSDFText = objectReference:GetRefValue("txtBackBtnUSDFText")
	self.titleUWidget = objectReference:GetRefValue("titleUWidget")
	self.shopUWidget = objectReference:GetRefValue("shopUWidget")

	local titleReference = self.titleUWidget:GetComponent("ObjectReference")

	self.txtTitleUText = titleReference:GetRefValue("txtTitleUBaseText")
	self.txtSeasonCalendarUText = titleReference:GetRefValue("txtPeopleNumUBaseText")
	self.titleContentUScrollRect = titleReference:GetRefValue("scrollRectUScrollRect")
	self.countDownUCountDown = titleReference:GetRefValue("countDownUCountDown")
	self.txtShopBtnNameUSDFText = objectReference:GetRefValue("txtShopBtnNameUSDFText")
	self.iconSeasonCoinUImage = objectReference:GetRefValue("iconSeasonCoinUImage")
	self.txtSeasonCoinNumUFText = objectReference:GetRefValue("txtSeasonCoinNumUFText")
	self.seasonStageUCountDown = objectReference:GetRefValue("seasonStageUCountDown")
	self.iconSeasonCalendarUImage = objectReference:GetRefValue("iconSeasonCalendarUImage")
	self.weekMedalIconUImage = self:_getButtonIconUImage(self.btnWeekMedalUButton)
	self.battlePassIconUImage = self:_getButtonIconUImage(self.btnBPUButton)
	self.seasonAchievementIconUImage = self:_getButtonIconUImage(self.btnSeasonAchievementUButton)
end

function SeasonLobbyView:_getButtonIconUImage(button)
	if not button then
		return nil
	end

	local objectReference = button:GetComponent("ObjectReference")

	return objectReference and objectReference:GetRefValue("iconUImage") or nil
end

function SeasonLobbyView:registerObjects()
	return
end

function SeasonLobbyView:initView()
	return
end

function SeasonLobbyView:setSeasonTipsVisible(visible)
	local button = self.btnSeasonTipsUButton

	if not button then
		return
	end

	button:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, not visible)

	if not visible then
		button:SetActive(false)

		return
	end

	if button.activeCtrlValid then
		button:RefreshActiveCtrl()
	else
		button:SetActive(true)
	end
end

function SeasonLobbyView:setSeasonCatchVisible(visible)
	local button = self.btnSeasonCatchUButton

	if not button then
		return
	end

	button:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, not visible)

	if not visible then
		button:SetActive(false)

		return
	end

	if button.activeCtrlValid then
		button:RefreshActiveCtrl()
	else
		button:SetActive(true)
	end
end

function SeasonLobbyView:setShopImageUrl(imageUrl)
	if not self.shopShowUImage then
		return false
	end

	self.shopUWidget:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)

	self.shopShowUImage.url = imageUrl

	return true
end

function SeasonLobbyView:setSeasonEntryIconUrls(iconUrls)
	iconUrls = iconUrls or {}

	if self.weekMedalIconUImage then
		self.weekMedalIconUImage.url = iconUrls.weekMedal or ""
	end

	if self.battlePassIconUImage then
		self.battlePassIconUImage.url = iconUrls.battlePass or ""
	end

	if self.seasonAchievementIconUImage then
		self.seasonAchievementIconUImage.url = iconUrls.achievement or ""
	end
end

return SeasonLobbyView
