-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\CFTipArea\\ShortCutKeyItem.lua

local Class = require("Core.Framework.Class")
local BaseAreaItem = require("Guis.Panels.Tips.Items.BaseAreaItem")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientConst = require("Const.ClientConst")
local TipAreaConst = require("Guis.Panels.Tips.TipAreaConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local AbilityConst = require("Common.Const.AbilityConst")
local StringEx = require("Core.Framework.String")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local HUD_EMPTY_SHORTCUT = "___hud_empty___"
local HUD_TRANSFORM_MODE_PREFIX = "HudTransformMode"
local ShortCutKeyItem = Class.LightClass("ShortCutKeyItem", BaseAreaItem)

function ShortCutKeyItem:onInit()
	self.state = nil
	self.hideFlags = {}
	self.redirectGo = nil
	self.redirectActionPath = nil
	self.redirectEntryActive = false

	if pg.global.ui:runPlatformByMobile() then
		self:setHideFlag(TipAreaConst.TipItemFlag.ItemFlag_Mobile, true)
	end
end

function ShortCutKeyItem:setVisible(visible)
	self:setHideFlag(TipAreaConst.TipItemFlag.ItemFlag_Default, not visible)
end

function ShortCutKeyItem:setHideFlag(flag, hide)
	if hide then
		self.hideFlags[flag] = true
	else
		self.hideFlags[flag] = nil
	end

	self:refreshVisible()
end

function ShortCutKeyItem:refreshVisible()
	local visible = true

	for _, _ in pairs(self.hideFlags) do
		visible = false

		break
	end

	BaseAreaItem.setVisible(self, visible)
	self:refreshRunState()
end

function ShortCutKeyItem:onSetVisible()
	self:_refreshRedirectGoVisible()
end

function ShortCutKeyItem:refreshRunState()
	if pg.global.ui:runPlatformByMobile() then
		self.run_state = TipAreaConst.ITEM_RUN_STATE.EMPTY

		return
	end

	if self.visible then
		self.run_state = TipAreaConst.ITEM_RUN_STATE.RUN_FIXED
	else
		self.run_state = TipAreaConst.ITEM_RUN_STATE.WAITING
	end
end

function ShortCutKeyItem:onUpdate()
	if pg.me == nil then
		self.state = nil

		self:setVisible(false)

		return
	end

	self:setVisible(true)
end

function ShortCutKeyItem:refreshShortCutKey(force)
	local state = self:getCurHudStateName()

	if self.state == state and force == false then
		return
	end

	self.state = state

	self:_applyShortcutData(state)
end

function ShortCutKeyItem:onClearRunningList()
	self:setVisible(false)
end

function ShortCutKeyItem:getCurHudStateName()
	local player = pg.me

	if player == nil then
		return
	end

	if pg.global.ui.hudV2.isAimUIShootVisible then
		return "HudAimShootUI"
	end

	if pg.global.ui.tips.isAimUIVisible then
		return "HudAimUI"
	end

	if pg.space and pg.space:isNpcDuel() then
		return "HudNpcDuel"
	end

	if pg.space and pg.space:isPlayerDuel() then
		return "HudPlayerDuel"
	end

	if not pg.game.input:isUsingGamepad() and pg.me.space and pg.me.space:isHomeland() and pg.me.space:isSelfHomeland(pg.me) then
		return "HudHomeland"
	end

	if pg.game.controller:isInControlEnt() then
		if pg.me:EXTRA_TEMP_PET_ST() then
			local petEnt = pg.me:getCurPetEntity()

			if petEnt then
				return petEnt:getConfigData().hudTransformMode or "HudTransformMode"
			end

			return "HudTransformMode"
		end

		local petEntity = pg.getEntity(pg.me.clientExploreEntId)
		local pawnEntity = pg.getEntity(pg.pawn.id)

		if petEntity and petEntity:CLIMB_ST() then
			return "HudClimb"
		end

		if petEntity and petEntity:CLIMB_WATERFALL_ST() then
			return "HudClimbWaterfall"
		end

		if petEntity and petEntity:SWIM_ST() then
			return "HudSwimPet"
		end

		if petEntity and petEntity:GLIDE_ST() then
			return "HudGlidePet"
		end

		if pawnEntity and pawnEntity:CLIMB_WATERFALL_ST() then
			return "HudClimbWaterfall"
		end

		if pawnEntity and pawnEntity:CLIMB_ST() then
			return "HudClimb"
		end

		if pawnEntity and pawnEntity:SWIM_ST() then
			return "HudSwimPet"
		end

		if pawnEntity and pawnEntity:GLIDE_ST() then
			return "HudGlidePet"
		end

		if pawnEntity and pawnEntity:FLY_ST() then
			return "HudFly"
		end

		if pg.me and pg.me:PET_SPECIAL_VISION_ST() then
			return "HudSpecialVision"
		end

		if pg.game.interaction.canClimbHere then
			return "HudConnectionCanClimbHereMode"
		end

		if ToBool(pg.game.controller.lockHelper.forceLockActorId) then
			if pg.game.controller.lockHelper.mode == ClientConst.LockMode.ModeA then
				return "HudConnectionLockModeA"
			elseif pg.game.controller.lockHelper.mode == ClientConst.LockMode.ModeB then
				return "HudConnectionLockModeB"
			end
		end

		if pg.space and pg.space:isGrabEgg() then
			return "HudConnectionModeGrabEgg"
		end

		if pg.space and pg.space:isRogueEnv() then
			return "HudConnectionModeRogue"
		end

		return "HudConnectionMode"
	end

	if player:CLIMB_ST() then
		return "HudClimb"
	end

	if player:SWIM_ST() then
		return "HudSwim"
	end

	if player:isInCatchMode() then
		return "HudCatch"
	end

	if player:SKATEBOARD_ST() then
		return "HudSkate"
	end

	if player:MAGNESIS_ST() then
		return "HudGrabItem"
	end

	if player:MAGNESIS_READY_ST() then
		return "HudMagnesisReady"
	end

	if player:FLY_ST() then
		return "HudFly"
	end

	if pg.game.interaction.canClimbHere then
		return "HudGoCanClimbHereMode"
	end

	if player:RIDING_ST() or player:SPECIAL_VEHICLE_RIDE_ST() then
		return "HudRiding"
	end

	if ToBool(pg.game.controller.lockHelper.forceLockActorId) then
		if pg.game.controller.lockHelper.mode == ClientConst.LockMode.ModeA then
			return "HudNotConnectionLockModeA"
		elseif pg.game.controller.lockHelper.mode == ClientConst.LockMode.ModeB then
			return "HudNotConnectionLockModeB"
		end
	end

	if player:isThrowItem() then
		return HUD_EMPTY_SHORTCUT
	end

	if pg.space and pg.space:isGrabEgg() then
		return "HudGoModeGrabEgg"
	end

	if pg.space and pg.space:isRogueEnv() then
		return "HudGoModeRogue"
	end

	return "HudGoMode"
end

function ShortCutKeyItem:onInputDeviceChanged(deviceType)
	if pg.global.ui:runPlatformByMobile() then
		self:setHideFlag(TipAreaConst.TipItemFlag.ItemFlag_Mobile, true)
	else
		self:setHideFlag(TipAreaConst.TipItemFlag.ItemFlag_Mobile, false)
	end

	self:refreshShortCutKey(true)
end

function ShortCutKeyItem:_applyShortcutData(state)
	if state == nil then
		return
	end

	if IsNil(self.uWidget) then
		return
	end

	if self.redirectActionPath == nil or IsNil(self.redirectGo) then
		local shortcutData = self:_getShortcutData(state)

		function self.uWidget.luaRenderItem(button, idx, data)
			local objectReference = button.transform:GetComponent("ObjectReference")
			local key = objectReference:GetRefValue("keyHotKeyContent")

			key.useRawBindingPath = false

			key:SetHotKeyPaths(table.concat(data.actionPaths, "|"))

			local btnTips = objectReference:GetRefValue("btnTipsUText")
			local nameUSDFText = objectReference:GetRefValue("nameUSDFText")

			if data.tIndex == 1 then
				local localizedDesc = pg.getLocalizationText(data.desc or "")
				local descData = StringEx.split(localizedDesc, "###")
				local hasSplit = #descData > 1
				local name = hasSplit and descData[1] or ""
				local desc = hasSplit and table.concat(descData, "###", 2) or localizedDesc

				if nameUSDFText and name then
					ClientTextUtils.setText(nameUSDFText, name)
				end

				ClientTextUtils.setText(btnTips, desc)
			else
				ClientTextUtils.setText(btnTips, pg.getLocalizationText(data.desc))
			end
		end

		self.uWidget:SetList(shortcutData)

		return
	end

	local filtered = {}
	local found = false

	if state ~= HUD_EMPTY_SHORTCUT then
		local rawData = self:_getShortcutData(state)

		for _, entry in ipairs(rawData) do
			if entry.actionPaths and entry.actionPaths[1] == self.redirectActionPath then
				found = true
			else
				filtered[#filtered + 1] = entry
			end
		end
	end

	function self.uWidget.luaRenderItem(button, idx, data)
		local objectReference = button.transform:GetComponent("ObjectReference")
		local key = objectReference:GetRefValue("keyHotKeyContent")
		local btnTips = objectReference:GetRefValue("btnTipsUText")
		local nameUSDFText = objectReference:GetRefValue("nameUSDFText")

		key.useRawBindingPath = false

		key:SetHotKeyPaths(table.concat(data.actionPaths, "|"))

		if data.tIndex == 1 then
			local localizedDesc = pg.getLocalizationText(data.desc or "")
			local descData = StringEx.split(localizedDesc, "###")
			local hasSplit = #descData > 1
			local name = hasSplit and descData[1] or ""
			local desc = hasSplit and descData[2] or localizedDesc

			if nameUSDFText and name then
				ClientTextUtils.setText(nameUSDFText, name)
			end

			ClientTextUtils.setText(btnTips, desc)
		else
			ClientTextUtils.setText(btnTips, pg.getLocalizationText(data.desc))
		end
	end

	self.uWidget:SetList(filtered)

	self.redirectEntryActive = found

	self:_refreshRedirectGoVisible()
end

function ShortCutKeyItem:_getShortcutData(state)
	local shortcutData = LuaUIUtils.getShortcutDataByState(state)

	if not string.startsWith(state or "", HUD_TRANSFORM_MODE_PREFIX) then
		return shortcutData
	end

	for _, data in ipairs(shortcutData) do
		data.tIndex = 1
	end

	return shortcutData
end

function ShortCutKeyItem:_refreshRedirectGoVisible()
	if IsNil(self.redirectGo) then
		return
	end

	local show = self.realVisible and self.redirectEntryActive

	self.redirectGo:SetActiveEx(show)
end

function ShortCutKeyItem:bindRedirect(targetGo, actionPath)
	if IsNil(targetGo) or string.isNilOrEmpty(actionPath) then
		return
	end

	self.redirectGo = targetGo
	self.redirectActionPath = actionPath
	self.redirectEntryActive = false

	targetGo:SetActiveEx(false)
	self:_applyShortcutData(self.state)
end

function ShortCutKeyItem:clearRedirect()
	if not IsNil(self.redirectGo) then
		self.redirectGo:SetActiveEx(false)
	end

	self.redirectGo = nil
	self.redirectActionPath = nil
	self.redirectEntryActive = false

	self:_applyShortcutData(self.state)
end

return ShortCutKeyItem
