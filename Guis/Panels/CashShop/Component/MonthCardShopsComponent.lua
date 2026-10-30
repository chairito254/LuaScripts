-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CashShop\\Component\\MonthCardShopsComponent.lua

local logger = require("Core.Log.LoggerManager").getLogger("MonthCardShopsComponent")
local Class = require("Core.Framework.Class")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientCashShopUtils = require("Utils.ClientCashShopUtils")
local RechargeUtils = require("GameApp.Recharge.RechargeUtils")
local RechargeConst = require("GameApp.Recharge.RechargeConst")
local CashShopConst = require("Const.CashShopConst")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local ActivityConst = require("Common.Const.ActivityConst")
local BattlePassData = require("Data.event_battlepass_data")
local CashShopContainerComponent = require("Guis.Panels.CashShop.Component.CashShopContainerComponent")
local PlatformBridgeLuaFacade = CS.FunPlus.WorldX.SDK.Platform.PlatformBridgeLuaFacade
local MonthCardShopsComponent = Class.LightClass("MonthCardShopsComponent", CashShopContainerComponent)

function MonthCardShopsComponent:findObjects()
	if not self:checkContentLoaded() then
		return
	end

	CashShopContainerComponent.findObjects(self)

	local contentTransform = self.transform:GetChild(0)
	local objectReference = contentTransform:GetComponent("ObjectReference")

	self.monthlyCard = objectReference:GetRefValue("monthlyCard")
	self.battlePassRootTransform = contentTransform
	self.rootUComponent = objectReference:GetRefValue("rootUComponent")

	self:_refreshBattlePassSeasonObjects()
end

function MonthCardShopsComponent:_refreshBattlePassSeasonObjects(phase)
	if not self.battlePassRootTransform then
		return false
	end

	phase = tonumber(phase)

	if not phase or phase <= 0 then
		local actData = ActivityUtils.getActivityData(pg.me, ActivityConst.EventType.BattlePass)

		phase = actData and actData.activityBase and tonumber(actData.activityBase.activityPhase)
	end

	if not phase or phase <= 0 then
		self.battlePassTransform = nil
		self.moneyListUButton = nil

		return false
	end

	self.battlePassTransform = LuaUIUtils.getBattlePassSeasonTransform(self.battlePassRootTransform, phase)

	if not self.battlePassTransform then
		self.moneyListUButton = nil

		return false
	end

	local battlePassObjectReference = self.battlePassTransform:GetComponent("ObjectReference")

	if not battlePassObjectReference then
		self.moneyListUButton = nil

		logger:error("MonthCardShopsComponent battle pass ObjectReference not found, phase:%s", tostring(phase))

		return false
	end

	self.moneyListUButton = battlePassObjectReference:GetRefValue("moneyListUButton")

	return true
end

function MonthCardShopsComponent:_resolveSceneBg(itemUIBack)
	local shopType = self._currentGroupData and self._currentGroupData.shopType

	if shopType and shopType - 1 == CashShopConst.CardShopType.BattlePass then
		local actData = ActivityUtils.getActivityData(pg.me, ActivityConst.EventType.BattlePass)
		local phase = actData and actData.activityBase and actData.activityBase.activityPhase
		local bpData = phase and BattlePassData[phase]

		if bpData and not string.isNilOrEmpty(bpData.purchaseBG) then
			return CashShopConst.SceneBgType.SCENE_3D, bpData.purchaseBG
		end
	end

	return CashShopContainerComponent._resolveSceneBg(self, itemUIBack)
end

function MonthCardShopsComponent:_showBattlePassPet(appearanceData)
	if self._groupSwitchEmpty or self.ctrl.curComponent ~= self then
		return
	end

	local avatarComponent = self.ctrl.avatarComponent

	if not avatarComponent then
		return
	end

	local actData = ActivityUtils.getActivityData(pg.me, ActivityConst.EventType.BattlePass)
	local phase = actData and actData.activityBase and actData.activityBase.activityPhase
	local bpData = phase and BattlePassData[phase]

	if not bpData or not bpData.passPetModelingId then
		return
	end

	local idx = CashShopConst.PetActionType.CashShopBuy
	local animKey = bpData.passPetMovementId and bpData.passPetMovementId[idx]
	local posXYZ = bpData.postionIndex and bpData.postionIndex[idx]
	local rotXYZ = bpData.rotationIndex and bpData.rotationIndex[idx]
	local scaleXYZ = bpData.scaleIndex and bpData.scaleIndex[idx]

	avatarComponent:showPetByModelingId(bpData.passPetModelingId, animKey, posXYZ, rotXYZ, scaleXYZ, nil, nil, appearanceData, 0)
end

function MonthCardShopsComponent:setGroupContentEmpty(empty)
	local wasEmpty = self._groupSwitchEmpty

	CashShopContainerComponent.setGroupContentEmpty(self, empty)

	if empty then
		local cashShopMoneyList = self.ctrl.view.moneyListUButton

		cashShopMoneyList.gameObject:SetActiveEx(true)

		if self._showingBP then
			RechargeUtils.setupMoneyList(cashShopMoneyList)
		end

		self._showingBP = false

		self:HideStoreIcon()

		if self.ctrl._refreshBPRotateConsoleBar then
			self.ctrl:_refreshBPRotateConsoleBar()
		end
	elseif wasEmpty and self.entered then
		self:ShowStoreIcon()
	end
end

function MonthCardShopsComponent:refreshPage()
	if self._groupSwitchEmpty or not self:checkContentLoaded() then
		return
	end

	local actData = ActivityUtils.getActivityData(pg.me, ActivityConst.EventType.BattlePass)
	local phase = actData and actData.activityBase and actData.activityBase.activityPhase or 0
	local bpActive = phase ~= 0

	if not bpActive and not ClientCashShopUtils.isShopTabGroupEnabled(401) then
		self:setGroupContentEmpty(true)

		return
	end

	if bpActive then
		self:_refreshBattlePassSeasonObjects(phase)
	else
		self.battlePassTransform = nil
		self.moneyListUButton = nil
	end

	if not bpActive and self._groupList then
		local curShopType = self._currentGroupData and self._currentGroupData.shopType

		if curShopType and curShopType - 1 == CashShopConst.CardShopType.BattlePass then
			for i, g in ipairs(self._groupList) do
				if g.shopType and g.shopType - 1 == CashShopConst.CardShopType.MonthCard then
					self._currentGroupData = g
					self._currentGroupId = g.id
					self.categoryId = g.id

					self.ctrl:refreshGroupCurrency(g.id, self)

					if self.listGroupTab then
						self.listGroupTab:SelectItem(i - 1)
					end

					break
				end
			end
		end
	end

	local showType = self._currentGroupData and self._currentGroupData.shopType
	local showIndex = (showType or CashShopConst.CardShopType.MonthCard + 1) - 1

	if not bpActive then
		if self.listGroupTab then
			self.listGroupTab.gameObject:SetActiveEx(false)
		end

		showIndex = CashShopConst.CardShopType.MonthCard
	elseif self.listGroupTab and self._groupList and #self._groupList > 0 then
		self.listGroupTab.gameObject:SetActiveEx(true)
	end

	local showBattlePass = showIndex == CashShopConst.CardShopType.BattlePass

	self.rootUComponent:TryChangePage("Type", showIndex)

	local cashShopMoneyList = self.ctrl.view.moneyListUButton

	cashShopMoneyList.gameObject:SetActiveEx(not showBattlePass)

	if self.moneyListUButton then
		self.moneyListUButton.gameObject:SetActiveEx(showBattlePass)
	end

	if showBattlePass then
		if self.moneyListUButton then
			RechargeUtils.setupMoneyList(self.moneyListUButton)
		end
	else
		RechargeUtils.setupMoneyList(cashShopMoneyList)
	end

	self:_syncEnvironment(showBattlePass)

	if showIndex == CashShopConst.CardShopType.MonthCard then
		self._showingBP = false

		if self.monthlyCard then
			local productInfo = RechargeUtils.getProductsInfo()

			self._monthCardRenderContext = LuaUIUtils.renderMonthCard(self.monthlyCard, function()
				self.ctrl:showFriendList(30023, productInfo)
			end, self._monthCardRenderContext)

			local avatarComponent = self.ctrl.avatarComponent

			if avatarComponent then
				avatarComponent:hideAllEntities()
			end

			self._showingModel = false

			self:_syncBackground()
		end
	else
		self:_syncBackground()
		self:_showBattlePassPet()

		self._showingBP = true

		if self.battlePassTransform then
			ClientCashShopUtils.renderBPInfo(self.battlePassTransform, function(type)
				local rechargeInfo = RechargeUtils.getProductsInfo(RechargeConst.RECHARGE_TYPE.BP, type)

				if rechargeInfo then
					pg.game.recharge:requestBuy(rechargeInfo.packageId, rechargeInfo.productId, rechargeInfo.cfgInfo and rechargeInfo.cfgInfo.des or "", CashShopConst.CategoryType.MONTHLYCARD)
				end
			end, function(data)
				self:_showBattlePassPet(data and data.appearanceData)
			end, true)
		end
	end

	if self.ctrl._refreshBPRotateConsoleBar then
		self.ctrl:_refreshBPRotateConsoleBar()
	end
end

function MonthCardShopsComponent:isShowingBP()
	return self._showingBP == true
end

function MonthCardShopsComponent:_getMonthCardInvokeTarget()
	return self.rootUComponent
end

function MonthCardShopsComponent:onBattlePassChange()
	self:refreshGroupTabs()
end

function MonthCardShopsComponent:HideStoreIcon()
	if pg.setPSIconUIVisiable("MonthCardShopsComponent", false) == false and PlatformBridgeLuaFacade.supportsCommerce() then
		PlatformBridgeLuaFacade.HideStoreIcon()
	end
end

function MonthCardShopsComponent:ShowStoreIcon()
	if PlatformBridgeLuaFacade.supportsCommerce() then
		PlatformBridgeLuaFacade.DisplayStoreIcon(1)
	end

	pg.setPSIconUIVisiable("MonthCardShopsComponent", true)
end

function MonthCardShopsComponent:onExitPage()
	self.entered = false

	CashShopContainerComponent.onExitPage(self)

	local cashShopMoneyList = self.ctrl.view.moneyListUButton

	cashShopMoneyList.gameObject:SetActiveEx(true)

	if self._showingBP then
		RechargeUtils.setupMoneyList(cashShopMoneyList)
	end

	self:HideStoreIcon()
end

function MonthCardShopsComponent:onEnterPage(tabId)
	self.entered = true

	CashShopContainerComponent.onEnterPage(self, tabId)

	if not self._groupSwitchEmpty then
		self:ShowStoreIcon()
	end
end

function MonthCardShopsComponent:onDestroy()
	self.entered = false

	CashShopContainerComponent.onDestroy(self)
	self:HideStoreIcon()
end

function MonthCardShopsComponent:onVisibleChange(visible)
	logger:info("MonthCardShopsComponent:onVisibleChange visible:%s, self.entered:%s", tostring(visible), tostring(self.entered))
	CashShopContainerComponent.onVisibleChange(self, visible)

	if visible and self.entered and not self._groupSwitchEmpty then
		self:ShowStoreIcon()
	else
		self:HideStoreIcon()
	end
end

return MonthCardShopsComponent
