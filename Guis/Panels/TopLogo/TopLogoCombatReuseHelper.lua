-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TopLogo\\TopLogoCombatReuseHelper.lua

local TimerManager = require("Core.Timer.TimerManager")
local IsNil = IsNil
local NotNil = NotNil
local TopLogoCombatReuseHelper = {}

function TopLogoCombatReuseHelper.stopBuffCell(button)
	if IsNil(button) then
		return
	end

	local refs = button:GetComponent("ObjectReference")
	local countdown = NotNil(refs) and refs:GetRefValue("countDownUCountDown") or nil

	if NotNil(countdown) then
		countdown:Stop()
	end

	if NotNil(button.anim) then
		button.anim:Stop()
	end
end

function TopLogoCombatReuseHelper.resetContent(component)
	if component.topLogoBuffTimer then
		component:killTimer(component.topLogoBuffTimer)

		component.topLogoBuffTimer = nil
	end

	if component.delayHideBuffTimer then
		component:killTimer(component.delayHideBuffTimer)

		component.delayHideBuffTimer = nil
	end

	component.appearFromTopLogoBuffInfo = nil
	component.isBuffAppearing = false

	if NotNil(component.topLogoBuffUButton) then
		local button = component.topLogoBuffUButton

		TopLogoCombatReuseHelper.stopBuffCell(button)

		local follow = button:GetComponent("UFollowEnt")

		if NotNil(follow) then
			follow:AttachToTrans(nil)
		end

		button:SetActive(false)
	end

	component.m_statusEffectBuffReqId = (component.m_statusEffectBuffReqId or 0) + 1

	component:m_clearElementToplogoContainerLoadInfo()

	component.curSpecialStateBuffInsId = nil

	if component.buffDisappearHintTimer then
		for _, timerId in pairs(component.buffDisappearHintTimer) do
			TimerManager.removeTimer(timerId)
		end

		component.buffDisappearHintTimer = nil
	end

	if NotNil(component.buffUList) then
		local buttons = component.buffUList:GetAllButtons()

		for i = 0, buttons.Length - 1 do
			TopLogoCombatReuseHelper.stopBuffCell(buttons[i])
		end

		component.buffUList:SetList({})

		component.buffUList.luaRenderItem = nil
		component.buffUList.luaSetToPool = nil
	end

	if NotNil(component.rootUComponent) then
		component:safeSetActiveFastest(component.rootUComponent, false)
	end

	if NotNil(component.listElementUList) then
		component.listElementUList:SetList({})

		component.listElementUList.luaRenderItem = nil

		if NotNil(component.listElementLocUWidget) then
			component.listElementUList.transform:SetParent(component.listElementLocUWidget.transform, false)

			component.listElementUList.transform.localPosition = Vector3.zero
		end
	end

	if NotNil(component.levelUWidget) and NotNil(component.levelLocUWidget) then
		component.levelUWidget.transform:SetParent(component.levelLocUWidget.transform, false)
		component.levelUWidget.transform:SetSiblingIndex(0)
	end

	if NotNil(component.levelLocUWidget) and component.levelLocUWidgetInitLocalPos then
		component.levelLocUWidget.transform.localPosition = component.levelLocUWidgetInitLocalPos
	end

	if NotNil(component.listElementLocUWidget) and component.listElementLocUWidgetInitLocalPos then
		component.listElementLocUWidget.transform.localPosition = component.listElementLocUWidgetInitLocalPos
	end

	if NotNil(component.teamLocUWidget) and NotNil(component.teamLocUWidgetOriginalParent) then
		local rect = component.teamLocUWidget.transform

		rect:SetParent(component.teamLocUWidgetOriginalParent, false)
		rect:SetSiblingIndex(0)

		rect.anchorMin = component.teamLocUWidgetOriginalAnchorMin
		rect.anchorMax = component.teamLocUWidgetOriginalAnchorMax
		rect.localPosition = component.teamLocUWidgetOriginalLocalPos
	end

	for _, fieldName in ipairs({
		"bloodContainer",
		"statusEffectUContainer",
		"elementToplogoUContainer",
		"onlineIDUContainer"
	}) do
		local container = component[fieldName]

		if NotNil(container) then
			container:DestroyContent()
		end
	end
end

return TopLogoCombatReuseHelper
