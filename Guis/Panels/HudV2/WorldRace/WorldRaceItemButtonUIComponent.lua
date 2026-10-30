-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HudV2\\WorldRace\\WorldRaceItemButtonUIComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local MessageName = require("Const.MessageName")
local DungeonConst = require("Common.Const.DungeonConst")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local WorldRacingPropData = require("Data.world_racing_prop_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local NoticeDef = require("Common.NoticeDef")
local SysNoticeData = require("Data.sys_notice_data")
local WorldRaceItemButtonUIComponent = Class.LightClass("WorldRaceItemButtonUIComponent", UIComponent)

WorldRaceItemButtonUIComponent.messages = {
	[MessageName.WORLD_RACE_ITEM_CHANGED] = {
		"refresh",
		true
	},
	[MessageName.WORLD_RACE_MULTI_RANK_CHANGED] = {
		"refresh",
		true
	},
	[MessageName.DUNGEON_STATE_CHANGE] = {
		"refresh",
		true
	},
	[MessageName.DUNGEON_TEAMMATEVIEW_CHANGE] = {
		"refresh",
		true
	},
	[MessageName.ROGUE_EXTRA_TEMP_PET_STATE_CHANGE] = {
		"refresh",
		true
	}
}

function WorldRaceItemButtonUIComponent:onCtor()
	self._alive = true
	self._isExploreButton = self.extInfo and self.extInfo.isExploreButton == true or false

	local layout = self.ctrl.ctrl

	layout._worldRaceItemUseState = layout._worldRaceItemUseState or {}
	self._useState = layout._worldRaceItemUseState
end

function WorldRaceItemButtonUIComponent:findObjects()
	self.container = self.transform:GetComponent("UContainer")
end

function WorldRaceItemButtonUIComponent:initView()
	self:refresh()
end

function WorldRaceItemButtonUIComponent:_canShow()
	local space = pg.space

	if not pg.me or not space or not space.racingDungeonGetMode or space:racingDungeonGetMode() ~= WorldRaceDungeonConst.MODE.MULTI or space.status ~= DungeonConst.STATUS.PLAYING or pg.me.inTeammateView then
		return false
	end

	for _, playerId in ipairs(space.finishedPlayerIds or {}) do
		if playerId == pg.me.id then
			return false
		end
	end

	local exploreBtn = self.ctrl.ctrl.exploreBtn
	local useExploreButton = exploreBtn ~= nil and exploreBtn.isInExploreMode == true and exploreBtn.normalBtnVisible == true and exploreBtn.worldRaceItemButton ~= nil and exploreBtn.worldRaceItemButton._alive == true

	return self._isExploreButton == useExploreButton
end

function WorldRaceItemButtonUIComponent:refresh()
	if not self._alive then
		return
	end

	local visible = self:_canShow()

	self.container:SetActive(visible)

	if not visible then
		return
	end

	if not self.container:CheckURLLoaded() then
		if self._loading then
			return
		end

		self._loading = true

		self.container:LoadDefaultUrlManually(function(item)
			self:onItemLoaded(item)
		end)

		return
	end

	if not self.button then
		self:onItemLoaded(self.container.content)

		return
	end

	local prop = WorldRacingPropData[pg.me.racingItemId or WorldRaceDungeonConst.EMPTY_ITEM_ID]

	self.iconUImage:SetActive(prop ~= nil)

	self.iconUImage.url = prop and prop.propIcon or ""

	if self.txtNameUText then
		ClientTextUtils.setText(self.txtNameUText, prop and prop.propName and pg.getLocalizationText(prop.propName) or "")
	end

	self.button:TryChangePage("Ready", prop and 1 or 0)

	self.button.interactable = not pg.me.isUsingExtraTempPet
end

function WorldRaceItemButtonUIComponent:onItemLoaded(item)
	if not self._alive then
		return
	end

	self._loading = false

	if IsNil(item) or self.container.content ~= item then
		return
	end

	local objectReference = item:GetComponent("ObjectReference")

	self.button = objectReference:GetRefValue("specialUButton")
	self.iconUImage = objectReference:GetRefValue("iconUImage")
	self.txtNameUText = objectReference:GetRefValue("txtNameUText")
	self.keyBinding = objectReference:GetRefValue("btnNormalKeyBindingPro")
	self.hotKeyContent = objectReference:GetRefValue("keyHotKeyContent")

	local countDown = objectReference:GetRefValue("countDown")
	local multiCountDown = objectReference:GetRefValue("countDownMultiSkillUCountDown")

	countDown:Stop()
	countDown:SetActive(false)
	multiCountDown:Stop()
	multiCountDown:SetActive(false)

	self.keyBinding.actionPath = "Hud/SkillR"
	self.keyBinding.isVirtual = false

	self.hotKeyContent:SetHotKeyPaths("Hud/SkillR")

	self.button.enabledLongPress = false

	function self.button.luaClick()
		self:onClick()
	end

	self:refresh()
end

function WorldRaceItemButtonUIComponent:onClick()
	if not self._alive or self._useState.requesting or not self:_canShow() then
		return
	end

	if pg.me.isUsingExtraTempPet then
		return
	end

	if not WorldRacingPropData[pg.me.racingItemId or WorldRaceDungeonConst.EMPTY_ITEM_ID] then
		return
	end

	local canUse, errno = pg.space:checkWorldRaceFunctionItemSpace(pg.me.racingItemId)

	if not canUse then
		local notice = SysNoticeData[errno]

		if notice then
			pg.global.ui.tips:showWorldRaceTextTip(pg.getLocalizationText(notice.text))
		end

		return
	end

	local useState = self._useState

	useState.requesting = true

	self:refresh()
	pg.me:serverMsg("RPC_CS_WorldRaceMultiUseFunctionItem", function(errno)
		useState.requesting = false

		if not self._alive then
			return
		end

		self:refresh()

		if errno ~= NoticeDef.SUCCESS and self:_canShow() then
			local notice = SysNoticeData[errno]

			if notice then
				pg.global.ui.tips:showWorldRaceTextTip(pg.getLocalizationText(notice.text))
			end
		end
	end)
end

function WorldRaceItemButtonUIComponent:onDestroy()
	self._alive = false

	if not IsNil(self.button) then
		self.button.luaClick = nil
	end

	self.button = nil
	self.container = nil
	self.iconUImage = nil
	self.txtNameUText = nil
	self.keyBinding = nil
	self.hotKeyContent = nil
end

return WorldRaceItemButtonUIComponent
