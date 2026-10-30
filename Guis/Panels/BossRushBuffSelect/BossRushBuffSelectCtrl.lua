-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\BossRushBuffSelect\\BossRushBuffSelectCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("BossRushBuffSelectCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local BossRushBuffSelectCtrl = Class.LightClass("BossRushBuffSelectCtrl", UICtrl)
local ClientTextUtils = require("Utils.ClientTextUtils")
local BossRushCycleData = require("Data.bossrush_cycle_data")
local BossRushUtils = require("Utils.BossRushUtils")
local BossRushBuffData = require("Data.bossrush_buff_data")
local UIConst = require("Const.UIConst")
local RedDotConst = require("Const.RedDotConst")
local Const = require("Common.Const.Const")
local LuaUIUtils = require("Utils.LuaUIUtils")
local CHOOSE_CLOSE_DELAY = 0.5
local RECOMMEND_SYNC_TIMEOUT = 5

BossRushBuffSelectCtrl.messages = {
	[MessageName.INPUT_DEVICE_CHANGED] = {
		"onInputDeviceChanged",
		true
	},
	[MessageName.SYNC_TEAM_INFO] = {
		"onTeamInfoChanged",
		true
	},
	[MessageName.BOSS_RUSH_TEAM_INFO_CHANGED] = {
		"onTeamInfoChanged",
		true
	},
	[MessageName.BOSS_RUSH_TEAM_BUFF_CHANGED] = {
		"onTeamBuffChanged",
		true
	},
	[MessageName.BOSS_RUSH_TEAM_RECOMMEND_BUFF_CHANGED] = {
		"onTeamRecommendBuffChanged",
		true
	}
}

function BossRushBuffSelectCtrl:onCreate(info)
	info = info or {}
	self.recommendMap = {}
	self.selectedBuffId = nil
	self.committedBuffs = {}
	self.recommendOrdersByBuffId = {}
	self.animateRecommendBuffIds = nil
	self.currentBuffList = {}
	self.selectPendingBuffId = nil
	self.chooseCloseTimerId = nil
	self.recommendPendingBuffId = nil
	self.recommendTimerId = nil

	UICtrl.onCreate(self, info)

	self.tab = info.tab or 0
	self.isShow = info.isShow == true
	self.allowSelect = info.allowSelect == true
	self.allowRecommend = info.allowRecommend == true
	self.buffIndex = info.buffIndex or 0
	self.interactiveBuffIndex = info.interactiveBuffIndex or 0

	self:refreshRoleState()
	self:reloadCommittedBuffs()
	self:rebuildRecommendOrders()

	if not self.canRecommendBuff then
		self.selectedBuffId = self.committedBuffs[1]
	end

	self.view.rootUComponent:TryChangePage("Tab", self.tab)
	self.view.rootUComponent:TryChangePage("Type", self.buffIndex)

	local key = RedDotConst.RedDotPath.BOSS_RUSH_MAIN_BUFF .. pg.me.curBossRushCycleId

	pg.me:setRedDotRecord(Const.CLIENT_KEY.BOSS_RUSH, key, false)
	self:initUI()

	if pg.game.input:isUsingGamepad() then
		self.view.btnInfoUButton.renderOpacity = 0.001
	else
		self.view.btnInfoUButton.renderOpacity = 1
	end
end

function BossRushBuffSelectCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:close()
	end

	function self.view.btnConfirmUButton.luaClick()
		self:confirmSelectedBuff()
	end

	function self.view.btnRecommendUButton.luaClick()
		self:toggleRecommendSelectedBuff()
	end

	function self.buffListScrollCallback()
		self:refreshOffscreenRecommendPanel()
	end

	self.view.listBuffUList:RegisterToScrollEvent(self.buffListScrollCallback)

	function self.view.buffSpecialTabUButton.luaClick()
		if not self.canSelectBuff then
			return
		end

		self.view.rootUComponent:TryChangePage("Type", 0)
		UIUtils.PlayAnimation(self.view.windowAnimation, true)
		self:refreshBuffList("specialBuffRef")
	end

	function self.view.buffNormalTabUButton.luaClick()
		if not self.canSelectBuff then
			return
		end

		self.view.rootUComponent:TryChangePage("Type", 1)
		UIUtils.PlayAnimation(self.view.windowAnimation, true)
		self:refreshBuffList("generalBuffRef")
	end

	self:bindHotKeyPerform("Raw/GamepadStart", function()
		self.view.btnInfoUButton:OnClickSimulate()
	end)
end

function BossRushBuffSelectCtrl:initUI()
	self.isOpen = BossRushUtils.checkIsOpen()
	self.cycleId = self.isOpen and pg.me.curBossRushCycleId or pg.me.nextBossRushCycleId
	self.cycleData = BossRushCycleData[self.cycleId]

	if not self.cycleData then
		logger:error("BossRushBuffSelectCtrl:initUI no cycle data for id:", self.cycleId)

		return
	end

	self.view.btnConfirmUButton:SetActive(self.canSelectBuff)
	self.view.btnRecommendUButton:SetActive(false)
	self.view.panelRecommendUWidget:SetActive(false)
	self.view.panelRecommendLeftUWidget:SetActive(false)

	function self.view.listTabUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local name1 = objectReference:GetRefValue("name1")
		local name2 = objectReference:GetRefValue("name2")

		ClientTextUtils.setText(name1, data.name)
		ClientTextUtils.setText(name2, data.name)
	end

	function self.view.listTabUList.luaClick(button, data)
		self.tab = data.tab

		self.view.rootUComponent:TryChangePage("Tab", data.tab)
		self:refreshActionButtons()
		self:refreshOffscreenRecommendPanel()

		if data.tab == 0 then
			UIUtils.PlayAnimation(self.view.windowAnimation, true)
		end
	end

	local tabData = {
		{
			selected = true,
			tIndex = 0,
			tab = 0,
			name = pg.getGameString("BOSS_RUSH_BATTLE_BUFF")
		},
		{
			tIndex = 2,
			tab = 1,
			name = pg.getGameString("BOSS_RUSH_HELP_BUFF")
		}
	}

	self.view.listTabUList:SetList(tabData)
	self.view.listTabUList:SelectItem(self.tab)

	local tabCheckData = {
		{
			selected = true,
			tIndex = 0,
			key = "specialBuffRef",
			label = pg.getGameString("BOSS_RUSH_SPECIAL_BUFF")
		},
		{
			key = "generalBuffRef",
			tIndex = 2,
			label = pg.getGameString("BOSS_RUSH_NORMAL_BUFF")
		}
	}

	function self.view.listTabCheckUList.luaClick(button, data)
		self:refreshBuffList(data.key)
	end

	self.view.listTabCheckUList:SetList(tabCheckData)
	self.view.listTabCheckUList:SelectItem(self.buffIndex)

	function self.view.listBuffUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local iconUImage = objectReference:GetRefValue("iconUImage")
		local nameUBaseText = objectReference:GetRefValue("nameUBaseText")
		local contentUScrollRect = objectReference:GetRefValue("contentUScrollRect")
		local textLockTipsUSDFText = objectReference:GetRefValue("textLockTipsUSDFText")
		local textStarNumUSDFText = objectReference:GetRefValue("textStarNumUSDFText")
		local starNumULayoutBox = objectReference:GetRefValue("starNumULayoutBox")
		local textLvUSDFText = objectReference:GetRefValue("textLvUSDFText")
		local textLockUSDFText = objectReference:GetRefValue("textLockUSDFText")
		local recommendList = objectReference:GetRefValue("listUList")

		ClientTextUtils.setText(textLockUSDFText, pg.getGameString("BOSS_RUSH_CHALLENGE_TIP3"))

		local canClick = self.canPickCandidate and self:isCurrentBuffInteractive() and data.isUnlock ~= false

		button.navForceInteractable = not canClick

		button:SetInteractableNoNavRefresh(canClick)

		local equippedBuffId = self.selectPendingBuffId or self.committedBuffs[1]
		local choosePage = tonumber(data.buffId) == tonumber(equippedBuffId) and 1 or 0

		if self.canRecommendBuff then
			button:TryChangePage("Choose", choosePage, false, false, true)
		else
			button:TryChangePage("Choose", choosePage)
		end

		local recommendOrders = self.recommendOrdersByBuffId[data.buffId] or {}

		if #recommendOrders > 0 then
			local recommendPage = math.min(#recommendOrders, 3) - 1
			local playRecommendAnimation = self.animateRecommendBuffIds and self.animateRecommendBuffIds[data.buffId] == true

			if playRecommendAnimation then
				button:TryChangePage("Recommend", recommendPage)
			else
				button:TryChangePage("Recommend", recommendPage, true, false, false)
			end
		end

		function recommendList.luaRenderItem(item, itemIndex, recommendData)
			item:TryChangePage("Teammate", recommendData.order - 1)
		end

		recommendList:SetList(recommendOrders)

		local buffInfo = BossRushBuffData[data.buffId]

		if buffInfo then
			ClientTextUtils.setText(nameUBaseText, pg.getLocalizationText(buffInfo.buffName or ""))
			ClientTextUtils.setText(textLockTipsUSDFText, ClientTextUtils.getGameString("BOSS_RUSH_CHALLENGE_TIP2"))
			ClientTextUtils.setText(contentUScrollRect.content:GetComponent("UBaseText"), pg.getLocalizationText(buffInfo.desc or ""))

			if buffInfo.Bufflevel ~= nil then
				ClientTextUtils.setText(textLvUSDFText, ClientTextUtils.formatShortLevel(buffInfo.Bufflevel))
			else
				ClientTextUtils.setText(textLvUSDFText, "")
			end

			iconUImage.url = buffInfo.buffIcon or ""

			if data.isUnlock ~= nil then
				local isLock = data.isUnlock == false
				local unlockNeedNum = data.needStar or 0

				if unlockNeedNum > 0 then
					ClientTextUtils.setText(textStarNumUSDFText, unlockNeedNum)
				end

				starNumULayoutBox:SetActive(unlockNeedNum > 0)
				button:TryChangePage("Lock", isLock and 0 or 1)
				button:TryChangePage("Content", isLock and unlockNeedNum > 0 and 1 or #recommendOrders > 0 and 2 or 0)
			else
				starNumULayoutBox:SetActive(false)
				button:TryChangePage("Lock", 1)
				button:TryChangePage("Content", #recommendOrders > 0 and 2 or 0)
			end
		end
	end

	function self.view.listBuffUList.luaClick(button, data)
		if not self.canPickCandidate then
			pg.global.showBubbleMessageRaw(pg.getGameString("BOSS_RUSH_BUFF_CANT_SELECT_BUFF"))

			return
		end

		if not self:isCurrentBuffInteractive() or data.isUnlock == false then
			return
		end

		if self.selectedBuffId == data.buffId then
			return
		end

		self.selectedBuffId = data.buffId

		self:refreshActionButtons()
	end

	function self.view.listBuffUList.luaFinishLayout()
		self:refreshOffscreenRecommendPanel()
	end

	self:refreshBuffList(self.buffIndex == 0 and "specialBuffRef" or "generalBuffRef")
	self:renderHelpBuff(self.view.supportBuff1ObjectReference, 1)
	self:renderHelpBuff(self.view.supportBuff2ObjectReference, 2)

	if self.buffIndex == 1 then
		LuaUIUtils.bindCommonTipInfo(self.view.btnInfoUButton, pg.getGameString("BOSS_RUSH_BUFF_SELECT_TIP2"))
	else
		LuaUIUtils.bindCommonTipInfo(self.view.btnInfoUButton, pg.getGameString("BOSS_RUSH_BUFF_SELECT_TIP"))
	end
end

function BossRushBuffSelectCtrl:refreshBuffList(key)
	self.curBuffIndex = key == "specialBuffRef" and 1 or 2

	local buffList = {}

	if key == "specialBuffRef" then
		buffList = BossRushUtils.getSpecialBuffList(self.isOpen)
	else
		buffList = BossRushUtils.getNormalBuffList()
	end

	self.currentBuffList = buffList

	self.view.listBuffUList:SetList(buffList)

	if self.canRecommendBuff then
		self:refreshMemberBuffSelection()
	end

	self:refreshBuffSelected()
	self:refreshActionButtons()
	self:refreshOffscreenRecommendPanel()
end

function BossRushBuffSelectCtrl:refreshBuffSelected()
	self.view.rootUComponent:TryChangePage("State", (self.isShow or not self:isCurrentBuffInteractive()) and 1 or 0)

	local selectBuffs = self.committedBuffs
	local isReadOnlyBuff = not self.canSelectBuff or not self:isCurrentBuffInteractive()
	local isEmpty1 = true

	if selectBuffs[1] then
		local buffInfo = BossRushBuffData[selectBuffs[1]]

		if buffInfo then
			isEmpty1 = false

			ClientTextUtils.setText(self.view.specialBuffUBaseText, pg.getLocalizationText(buffInfo.buffName or ""))

			self.view.specialBuffUImage.url = buffInfo.buffIcon or ""
		end
	end

	self.view.buffSpecialTabUButton:TryChangePage("Empty", isEmpty1 and 1 or 0)
	self.view.buffSpecialTabUButton:TryChangePage("isShow", isReadOnlyBuff and 1 or 0)

	self.view.buffSpecialTabUButton.interactable = not isReadOnlyBuff

	local isEmpty2 = true

	if selectBuffs[2] then
		local buffInfo = BossRushBuffData[selectBuffs[2]]

		if buffInfo then
			isEmpty2 = false

			ClientTextUtils.setText(self.view.normalBuffUBaseText, pg.getLocalizationText(buffInfo.buffName or ""))

			self.view.normalBuffUImage.url = buffInfo.buffIcon or ""
		end
	end

	self.view.buffNormalTabUButton:TryChangePage("Empty", isEmpty2 and 1 or 0)
	self.view.buffNormalTabUButton:TryChangePage("isShow", isReadOnlyBuff and 1 or 0)

	self.view.buffNormalTabUButton.interactable = not isReadOnlyBuff
end

function BossRushBuffSelectCtrl:renderHelpBuff(objRef, index)
	local buffId = self.cycleData.miniGameBuffRef and self.cycleData.miniGameBuffRef[index]

	if not buffId then
		return
	end

	local titleUBaseText = objRef:GetRefValue("titleUBaseText")
	local petNameUBaseText = objRef:GetRefValue("petNameUBaseText")
	local contentUScrollRect = objRef:GetRefValue("contentUScrollRect")
	local iconUImage = objRef:GetRefValue("iconUImage")
	local rootUComponent = objRef:GetRefValue("rootUComponent")
	local objectReference = contentUScrollRect.content:GetComponent("ObjectReference")
	local textLockDetailUBaseText = objectReference:GetRefValue("textLockDetailUBaseText")
	local textDetailUBaseText = objectReference:GetRefValue("textDetailUBaseText")
	local buffInfo = BossRushBuffData[buffId]

	if buffInfo then
		ClientTextUtils.setText(titleUBaseText, pg.getLocalizationText(buffInfo.buffName or ""))
		ClientTextUtils.setText(petNameUBaseText, pg.getLocalizationText(buffInfo.petName or ""))
		ClientTextUtils.setText(textLockDetailUBaseText, pg.getGameString("BOSS_RUSH_HELP_BUFF_LOCK_DESC_" .. index))
		ClientTextUtils.setText(textDetailUBaseText, pg.getLocalizationText(buffInfo.desc or ""))

		iconUImage.url = buffInfo.buffIcon or ""
	end
end

function BossRushBuffSelectCtrl:onDestroy()
	self:clearRecommendPending()

	if self.chooseCloseTimerId then
		self:killTimer(self.chooseCloseTimerId)

		self.chooseCloseTimerId = nil
	end

	if self.view and self.view.listBuffUList and self.buffListScrollCallback then
		self.view.listBuffUList:UnRegisterToScrollEvent(self.buffListScrollCallback)

		self.view.listBuffUList.luaFinishLayout = nil
		self.buffListScrollCallback = nil
	end

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_BOSS_RUSH_CHALLENGE) then
		pg.global.ui.bossRushChallenge:refreshBuffInfo()
	end

	UICtrl.onDestroy(self)
end

function BossRushBuffSelectCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
end

function BossRushBuffSelectCtrl:onShow()
	return
end

function BossRushBuffSelectCtrl:onHide()
	return
end

function BossRushBuffSelectCtrl:onInputDeviceChanged(deviceType)
	if pg.game.input:isUsingGamepad() then
		self.view.btnInfoUButton.renderOpacity = 0.001
	else
		self.view.btnInfoUButton.renderOpacity = 1
	end
end

function BossRushBuffSelectCtrl:refreshRoleState()
	local isInTeam = pg.me:isInTeam()

	self.canSelectBuff = self.allowSelect and (not isInTeam or pg.me:isTeamLeader())
	self.canRecommendBuff = self.allowRecommend and isInTeam and not pg.me:isTeamLeader()
	self.canPickCandidate = self.canSelectBuff or self.canRecommendBuff
end

function BossRushBuffSelectCtrl:reloadCommittedBuffs()
	local selectBatBuffs = pg.me.space and pg.me.space.selectBatBuffs or {}

	self.committedBuffs[1] = selectBatBuffs[1]
	self.committedBuffs[2] = selectBatBuffs[2]
end

function BossRushBuffSelectCtrl:rebuildRecommendOrders()
	local recommendMap = self:getRecommendMapSnapshot()
	local changedBuffIds = {}

	for entityId, buffId in pairs(self.recommendMap) do
		if recommendMap[entityId] ~= buffId then
			changedBuffIds[buffId] = true
		end
	end

	self.recommendOrdersByBuffId = {}

	for entityId, buffId in pairs(recommendMap) do
		if self.recommendMap[entityId] ~= buffId then
			changedBuffIds[buffId] = true
		end

		local order = pg.me:getTeamOrderByEntityId(entityId)

		if order then
			local orders = self.recommendOrdersByBuffId[buffId] or {}

			self.recommendOrdersByBuffId[buffId] = orders

			table.insert(orders, {
				order = order
			})
		end
	end

	for _, orders in pairs(self.recommendOrdersByBuffId) do
		table.sort(orders, function(a, b)
			return a.order < b.order
		end)
	end

	self.recommendMap = recommendMap
	self.myRecommendedBuffId = recommendMap[tostring(pg.me.id)]

	if self.canRecommendBuff and self.selectedBuffId == nil then
		self.selectedBuffId = self.myRecommendedBuffId
	end

	if not self.canRecommendBuff or self.recommendPendingBuffId == (self.myRecommendedBuffId or 0) then
		self:clearRecommendPending()
	end

	return changedBuffIds
end

function BossRushBuffSelectCtrl:refreshActionButtons()
	local showRecommend = self.canRecommendBuff and self.tab == 0 and self:isCurrentBuffInteractive()
	local showSeasonMemberTip = self.tab == 0 and self.curBuffIndex == 2 and pg.me:isInTeam() and not pg.me:isTeamLeader()

	self.view.btnConfirmUButton:SetActive(self.canSelectBuff)
	self.view.btnRecommendUButton:SetActive(showRecommend)
	self.view.textInfoUSDFText:SetActive(showSeasonMemberTip)
	self.view.listTabCheckUList:SetActive(not self.canRecommendBuff or not not self:isCurrentBuffInteractive())
	self.view.consoleBarConsoleBar:SetState("canSelect", self.canPickCandidate, true)

	local canConfirm = self.canSelectBuff and self.selectedBuffId ~= nil and self.selectedBuffId ~= self.committedBuffs[1] and self.selectPendingBuffId == nil

	self.view.btnConfirmUButton.interactable = canConfirm
	self.view.btnConfirmUButton.visualInteractable = canConfirm

	local isCancelRecommend = self.selectedBuffId ~= nil and tonumber(self.selectedBuffId) == tonumber(self.myRecommendedBuffId)

	self.view.btnRecommendUButton:TryChangePage("State", isCancelRecommend and 1 or 0)
	ClientTextUtils.setText(self.view.btnCRecommendText, pg.getGameString(isCancelRecommend and "BOSS_RUSH_BUFF_UN_RECOMMEND" or "BOSS_RUSH_BUFF_RECOMMEND"))

	local canRecommend = showRecommend and self.selectedBuffId ~= nil and self.recommendPendingBuffId == nil

	self.view.btnRecommendUButton.interactable = canRecommend
	self.view.btnRecommendUButton.visualInteractable = canRecommend
end

function BossRushBuffSelectCtrl:refreshOffscreenRecommendPanel()
	local showRightPanel = false
	local showLeftPanel = false
	local isTeamLeader = pg.me:isInTeam() and pg.me:isTeamLeader()

	if isTeamLeader and self.tab == 0 and self:isCurrentBuffInteractive() then
		local success, minIndex, maxIndex = self.view.listBuffUList:TryGetVisualRange()

		if success then
			for index, data in ipairs(self.currentBuffList) do
				if self.recommendOrdersByBuffId[data.buffId] then
					showRightPanel = showRightPanel or maxIndex < index - 1
					showLeftPanel = showLeftPanel or minIndex > index - 1
				end
			end
		end
	end

	self.view.panelRecommendUWidget:SetActive(showRightPanel)
	self.view.panelRecommendLeftUWidget:SetActive(showLeftPanel)
end

function BossRushBuffSelectCtrl:onTeamBuffChanged()
	local oldEquippedBuffId = self.selectPendingBuffId or self.committedBuffs[1]

	self:reloadCommittedBuffs()

	local newEquippedBuffId = self.committedBuffs[1]

	if self.selectPendingBuffId == newEquippedBuffId then
		self.selectPendingBuffId = nil
	end

	self:refreshBuffSelected()
	self:refreshBuffRows({
		[oldEquippedBuffId or 0] = true,
		[newEquippedBuffId or 0] = true
	})
	self:refreshActionButtons()
end

function BossRushBuffSelectCtrl:onTeamInfoChanged()
	self:refreshRoleState()
	self:rebuildRecommendOrders()
	self:refreshBuffSelected()
	self:refreshBuffRows()

	if self.canRecommendBuff then
		self:refreshMemberBuffSelection()
	end

	self:refreshActionButtons()
	self:refreshOffscreenRecommendPanel()
end

function BossRushBuffSelectCtrl:onTeamRecommendBuffChanged()
	local changedBuffIds = self:rebuildRecommendOrders()

	self.animateRecommendBuffIds = changedBuffIds

	self:refreshBuffRows(changedBuffIds)

	self.animateRecommendBuffIds = nil

	self:refreshActionButtons()
	self:refreshOffscreenRecommendPanel()
end

function BossRushBuffSelectCtrl:confirmSelectedBuff()
	if not self.canSelectBuff or not self.selectedBuffId or self.selectPendingBuffId ~= nil or self.selectedBuffId == self.committedBuffs[1] then
		return
	end

	local oldEquippedBuffId = self.committedBuffs[1]

	self.selectPendingBuffId = self.selectedBuffId

	self:refreshBuffRows({
		[oldEquippedBuffId or 0] = true,
		[self.selectPendingBuffId] = true
	})
	self:refreshActionButtons()
	pg.me:bossRushSelectBattleBuffs({
		self.selectedBuffId
	})
	self:closeAfterChooseAnimation()
end

function BossRushBuffSelectCtrl:toggleRecommendSelectedBuff()
	self:refreshRoleState()

	if not self.canRecommendBuff or self.tab ~= 0 or not self:isCurrentBuffInteractive() or not self.selectedBuffId or self.recommendPendingBuffId ~= nil then
		return
	end

	local isCancelRecommend = tonumber(self.selectedBuffId) == tonumber(self.myRecommendedBuffId)
	local recommendBuffId = isCancelRecommend and 0 or tonumber(self.selectedBuffId) or self.selectedBuffId

	self.recommendPendingBuffId = recommendBuffId
	self.recommendTimerId = self:startTimer(function()
		self:clearRecommendPending()
		self:refreshActionButtons()
	end, RECOMMEND_SYNC_TIMEOUT)

	self:refreshActionButtons()
	pg.me:bossRushRecommendBattleBuff(recommendBuffId)
end

function BossRushBuffSelectCtrl:closeAfterChooseAnimation()
	if self.chooseCloseTimerId then
		return
	end

	for index, data in ipairs(self.currentBuffList or {}) do
		if data.buffId == self.selectPendingBuffId then
			local exists, button = self.view.listBuffUList:TryGetChildAt(index - 1)

			if exists then
				button:InvokeCallback(CS.XGUI.EInvokeTime.User1)

				self.chooseCloseTimerId = self:startTimer(function()
					self.chooseCloseTimerId = nil

					self:close()
				end, CHOOSE_CLOSE_DELAY)

				return
			end

			break
		end
	end

	self:close()
end

function BossRushBuffSelectCtrl:getRecommendMapSnapshot()
	local recommendMap = pg.me.space and pg.me.space.recommendBatBuffs or {}

	if recommendMap.getRawTable then
		recommendMap = recommendMap:getRawTable()
	end

	local snapshot = {}
	local teamInfo = pg.me:getCurTeamInfo()

	for _, uid in ipairs(teamInfo and teamInfo.sortList or {}) do
		local memberInfo = teamInfo.membersInfo[uid]

		if memberInfo and uid ~= teamInfo.leaderUid then
			local entityId = tostring(memberInfo.entityId)
			local buffId = tonumber(recommendMap[entityId])

			if buffId and buffId > 0 then
				snapshot[entityId] = buffId
			end
		end
	end

	return snapshot
end

function BossRushBuffSelectCtrl:refreshMemberBuffSelection()
	local selectedIndex = -1

	for index, data in ipairs(self.currentBuffList or {}) do
		if tonumber(data.buffId) == tonumber(self.selectedBuffId) then
			selectedIndex = index - 1

			break
		end
	end

	self.view.listBuffUList:SelectItem(selectedIndex, false)
end

function BossRushBuffSelectCtrl:refreshBuffRows(changedBuffIds)
	for index, data in ipairs(self.currentBuffList) do
		if not changedBuffIds or changedBuffIds[data.buffId] then
			self.view.listBuffUList:RefreshElement(index - 1)
		end
	end
end

function BossRushBuffSelectCtrl:isCurrentBuffInteractive()
	return self.curBuffIndex == self.interactiveBuffIndex + 1
end

function BossRushBuffSelectCtrl:clearRecommendPending()
	self:killTimer(self.recommendTimerId)

	self.recommendTimerId = nil
	self.recommendPendingBuffId = nil
end

return BossRushBuffSelectCtrl
