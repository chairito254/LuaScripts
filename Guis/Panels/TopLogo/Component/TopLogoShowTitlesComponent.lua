-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TopLogo\\Component\\TopLogoShowTitlesComponent.lua

local Class = require("Core.Framework.Class")
local Const = require("Common.Const.Const")
local UIConst = require("Const.UIConst")
local Time = require("Core.Common.Time")
local ShowTitleData = require("Data.show_title_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ShowTitleUtils = require("Utils.ShowTitleUtils")
local TopLogoConst = require("Const.TopLogoConst")
local TopLogoItemComponent = require("Guis.Panels.TopLogo.Component.TopLogoItemComponent")
local SHOW_TITLE_NEAR_DISTANCE = 5
local NEAREST_STALE_FRAMES = 30
local NEAREST_SWITCH_MARGIN = 0.5
local s_nearestCandidates = {}
local s_nearestWinner
local s_nearestElectFrame = -1

local function electNearestTitleComp()
	local frameCount = Time.frameCount

	if s_nearestElectFrame == frameCount then
		return s_nearestWinner
	end

	s_nearestElectFrame = frameCount

	local best, bestDist, winnerDist

	for comp in pairs(s_nearestCandidates) do
		local distance = comp.m_nearestDistance

		if distance and distance <= SHOW_TITLE_NEAR_DISTANCE and frameCount - (comp.m_nearestDistanceFrame or 0) <= NEAREST_STALE_FRAMES then
			if comp == s_nearestWinner then
				winnerDist = distance
			end

			if not bestDist or distance < bestDist then
				best, bestDist = comp, distance
			end
		else
			s_nearestCandidates[comp] = nil
		end
	end

	if best ~= s_nearestWinner and winnerDist and bestDist and winnerDist - bestDist < NEAREST_SWITCH_MARGIN then
		best = s_nearestWinner
	end

	s_nearestWinner = best

	return best
end

local TopLogoShowTitlesComponent = Class.LightClass("TopLogoShowTitlesComponent", TopLogoItemComponent)

function TopLogoShowTitlesComponent:onCtor()
	self:m_refreshShowTitleData()
	self:refreshVisible()
end

function TopLogoShowTitlesComponent:onDestroy()
	s_nearestCandidates[self] = nil

	if s_nearestWinner == self then
		s_nearestWinner = nil
		s_nearestElectFrame = -1
	end

	self.m_refreshShowTitlesCallback = nil

	TopLogoShowTitlesComponent.super.onDestroy(self)
end

function TopLogoShowTitlesComponent:resetRender()
	self.baseUImage = nil
	self.txtTitleUSDFText = nil
	self.m_refreshShowTitlesCallback = nil
	self.m_titleContentDirty = true

	TopLogoShowTitlesComponent.super.resetRender(self)
end

function TopLogoShowTitlesComponent:getComponentName()
	return UIConst.TOPLOGO_COMPONENT.SHOW_TITLES
end

function TopLogoShowTitlesComponent:m_getCombatComponent()
	return self.topLogoItem and self.topLogoItem:peekToplogoComponent(UIConst.TOPLOGO_COMPONENT.COMBAT)
end

function TopLogoShowTitlesComponent:shouldBeActive()
	if not TopLogoShowTitlesComponent.super.shouldBeActive(self) or string.isNilOrEmpty(self.titleText) then
		return false
	end

	local combatComponent = self:m_getCombatComponent()

	return combatComponent ~= nil and combatComponent:shouldBeActive()
end

function TopLogoShowTitlesComponent:m_isNearestLimited()
	return not self._isMainPlayer
end

function TopLogoShowTitlesComponent:onTopLogoCompUpdate()
	if not self:m_isNearestLimited() or string.isNilOrEmpty(self.titleText) then
		s_nearestCandidates[self] = nil

		return
	end

	local distance = self.compDistance

	if distance and distance <= SHOW_TITLE_NEAR_DISTANCE then
		self.m_nearestDistance = distance
		self.m_nearestDistanceFrame = Time.frameCount
		s_nearestCandidates[self] = true
	else
		s_nearestCandidates[self] = nil
	end
end

function TopLogoShowTitlesComponent:innerGetVisible()
	if not TopLogoShowTitlesComponent.super.innerGetVisible(self) then
		return false
	end

	if string.isNilOrEmpty(self.titleText) then
		return false
	end

	if self:m_isNearestLimited() and (s_nearestCandidates[self] == nil or electNearestTitleComp() ~= self) then
		return false
	end

	local combatComponent = self:m_getCombatComponent()

	return combatComponent ~= nil and combatComponent:isPlayerNameVisible()
end

function TopLogoShowTitlesComponent:getInitMaxDistance()
	if string.isNilOrEmpty(self.titleText) then
		return nil
	end

	local combatComponent = self:m_getCombatComponent()

	return combatComponent and combatComponent:getInitMaxDistance() or nil
end

function TopLogoShowTitlesComponent:findObjects()
	local objectReference = self.refUContainer.content:GetComponent("ObjectReference")

	self.baseUImage = objectReference:GetRefValue("baseUImage")
	self.txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
end

function TopLogoShowTitlesComponent:initUI()
	TopLogoShowTitlesComponent.super.initUI(self)
	self:m_refreshTitleContent(true)
end

function TopLogoShowTitlesComponent:refreshShowTitles()
	self:m_refreshShowTitleData()

	if string.isNilOrEmpty(self.titleText) then
		local refUContainer = self.refUContainer

		self:resetRender()

		if NotNil(refUContainer) then
			refUContainer:SetActiveFastestAndMarkIgnoreLayout(false)
		end
	end

	self:refreshVisible()
	self:notifyActiveStateChanged(self:shouldBeActive())
end

function TopLogoShowTitlesComponent:refreshTopLogoInfo()
	if not self:checkFinalVisible() then
		return
	end

	if self:checkContainerLoaded() then
		self:m_refreshTitleContent()

		return
	end

	if not self.m_refreshShowTitlesCallback then
		function self.m_refreshShowTitlesCallback(isSuccess)
			if isSuccess and self:checkFinalVisible() then
				self:m_refreshTitleContent()
			end
		end
	end

	self:checkAndLoadUContainerUrlSupportAsync(self.m_refreshShowTitlesCallback, TopLogoConst.REF_CONTAINER_LOADED_CALLBACK_GROUP.CB_FUNC1)
end

function TopLogoShowTitlesComponent:onLanguageChanged()
	TopLogoShowTitlesComponent.super.onLanguageChanged(self)
	self:refreshShowTitles()
end

function TopLogoShowTitlesComponent:getShowTitleData()
	local entity = self.entity

	return entity and entity.showTitles, entity and entity.showTitleExtra, entity and entity.isWholeTitle
end

function TopLogoShowTitlesComponent:m_refreshShowTitleData()
	local showTitles, showTitleExtra, isWholeTitle = self:getShowTitleData()
	local titleText = ShowTitleUtils.getShowTitleText(showTitles, showTitleExtra, isWholeTitle)
	local backgroundUrl = self:m_getTitleBackgroundUrl(showTitles, isWholeTitle)

	if self.titleText ~= titleText or self.backgroundUrl ~= backgroundUrl then
		self.m_titleContentDirty = true
	end

	self.titleText = titleText
	self.backgroundUrl = backgroundUrl
end

function TopLogoShowTitlesComponent:m_getTitleBackgroundUrl(showTitles, isWholeTitle)
	local backgroundId = showTitles and showTitles[Const.SHOW_TITLE_TYPE.Background]
	local wholeTitleId = showTitles and showTitles[Const.SHOW_TITLE_TYPE.Whole]
	local backgroundData = backgroundId and ShowTitleData[backgroundId]
	local wholeTitleData = wholeTitleId and ShowTitleData[wholeTitleId]
	local backgroundUrl = backgroundData and backgroundData.bgRes

	if isWholeTitle and wholeTitleData and not string.isNilOrEmpty(wholeTitleData.bgRes) then
		backgroundUrl = wholeTitleData.bgRes
	end

	return backgroundUrl or ""
end

function TopLogoShowTitlesComponent:m_refreshTitleContent(force)
	if not force and not self.m_titleContentDirty then
		return
	end

	if NotNil(self.txtTitleUSDFText) then
		ClientTextUtils.setText(self.txtTitleUSDFText, self.titleText)
	end

	if NotNil(self.baseUImage) then
		local showBackground = not string.isNilOrEmpty(self.backgroundUrl)

		self.baseUImage:SetActive(showBackground)

		if showBackground then
			self.baseUImage.url = self.backgroundUrl
		end
	end

	self.m_titleContentDirty = false
end

return TopLogoShowTitlesComponent
