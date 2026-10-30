-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomeCarModify\\HomeCarModifyCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("HomeCarModifyCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local HomeCarModifyTypeData = require("Data.home_car_modify_type_data")
local HomeCarModifyData = require("Data.home_car_modify_data")
local HomeCarSkinData = require("Data.home_car_skin_data")
local FuncIndexConfigData = require("Data.func_index_config_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local Const = require("Common.Const.Const")
local NoticeDef = require("Common.NoticeDef")
local ClientUtils = require("Utils.ClientUtils")
local Utils = require("Common.Utils.Utils")
local UIConst = require("Const.UIConst")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local HomeCampUtils = require("Common.Utils.HomeCampUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ItemSourceData = require("Data.item_source_data")
local TimerManager = require("Core.Timer.TimerManager")
local HotkeyConst = require("Const.HotkeyConst")
local HomeCarModifyCtrl = Class.LightClass("HomeCarModifyCtrl", UICtrl)

HomeCarModifyCtrl.SKIN_PREVIEW_DELAY = 0.15
HomeCarModifyCtrl.SKIN_CAMERA_MODE = 1
HomeCarModifyCtrl.PLAN_PAGE = {
	CUSTOM = 0,
	WHOLE = 1
}
HomeCarModifyCtrl.PLAN_TABS = {
	{
		text = "HOME_CAR_CUSTOM_PLAN",
		tIndex = 0,
		page = HomeCarModifyCtrl.PLAN_PAGE.CUSTOM
	},
	{
		text = "HOME_CAR_WHOLE_PLAN",
		tIndex = 1,
		page = HomeCarModifyCtrl.PLAN_PAGE.WHOLE
	}
}
HomeCarModifyCtrl.CUSTOM_CAMERA_TYPE = {
	UIConst.HOMECAR_MODE_IDX.MODIFYSHAPE,
	UIConst.HOMECAR_MODE_IDX.MODIFYTOP
}
HomeCarModifyCtrl.OBTAIN_PAGE = {
	LOCK = 2,
	GET = 1,
	UNLOCK = 0
}
HomeCarModifyCtrl.messages = {
	[MessageName.HOME_CAR_UPGRADE_STATE_CHANGED] = {
		"onHomeCarUpgradeStateChanged",
		true
	},
	[MessageName.HOME_CAR_SKIN_UNLOCKED] = {
		"onHomeCarSkinUnlocked",
		true
	}
}

function HomeCarModifyCtrl:onCreate(info)
	HomeCarModifyCtrl.super.onCreate(self, info)

	info = info or {}
	self.isModify = info.isModify
	self.basicInfo = info.basicInfo and Utils.deepCopyTable(info.basicInfo)

	if not self.basicInfo then
		self.basicInfo = self:initDefaultBaseInfo()
	end

	if info.homeMainPage then
		self.homeMainPage = info.homeMainPage
	end

	self.originalShapeInfo = Utils.deepCopyTable(self.basicInfo.carShapeInfo)
	self.originalSkinId = self.originalShapeInfo[Const.HOME_CAR_BASE_PART.Skin] or 0
	self.shapeInfo = Utils.deepCopyTable(self.originalShapeInfo)
	self.editSkinId = self.originalSkinId
	self.basicInfo.carShapeInfo = self.shapeInfo
	self.modelLevel = HomeLandUtils.getHomeCarModelLevel(self.basicInfo.level)

	self:initHomeCarEntity()

	if self.uiScene then
		self.uiScene:changeCarRotate(true)
	end
end

function HomeCarModifyCtrl:onHomeCarUpgradeStateChanged()
	if not self:checkUIShow() then
		return
	end

	local homeCarInfo = HomeLandUtils.getHomeCarInfo()

	self.basicInfo.upgradeEndTs = homeCarInfo.upgradeEndTs

	self.uiScene:refreshHomeCar(self.basicInfo)
end

function HomeCarModifyCtrl:onHomeCarSkinUnlocked()
	if not self:checkUIShow() or not self.isSkinPage then
		return
	end

	self:refreshSkinList()
	self:refreshSkinAction()
end

function HomeCarModifyCtrl:addListener()
	function self.view.widget.luaTryChangePage(controllerName, pageIndex)
		if controllerName == "Plan" then
			self:selectPlanPage(pageIndex)
		end
	end

	function self.view.btnBack.luaClick()
		self:closePanel()
	end

	function self.view.planTabList.luaRenderItem(button, index, data)
		self:rendererPlanTabItem(button, index, data)
	end

	function self.view.planTabList.luaClick(button, data)
		self.view.widget:TryChangePage("Plan", data.page)
	end

	function self.view.confirmBtn.luaClick()
		self:confirm()
	end

	self:setupConfirmGamepadAction(self.view.confirmBtn)

	function self.view.itemList.luaRenderItem(button, index, data)
		self:rendererPartItem(button, index, data)
	end

	function self.view.listPointUList.luaRenderItem(button, index, data)
		self:rendererPointItem(button, index, data)
	end

	function self.view.tabList.luaRenderItem(button, index, data)
		self:rendererTabItem(button, index, data)
	end

	function self.view.tabList.luaSelectedChanged(uList, isSelected)
		local data = uList.selectedItem

		if data then
			self:selectTabType(data.tabId)

			if data.cameraType then
				self.uiScene:switchCamera(data.cameraType, self.modelLevel)
			end
		end
	end

	function self.view.skinList.luaRenderItem(button, index, data)
		self:rendererSkinItem(button, index, data)
	end

	function self.view.skinCompleteBtn.luaClick()
		self:confirm()
	end

	self:setupConfirmGamepadAction(self.view.skinCompleteBtn)

	function self.view.skinGetBtn.luaClick(button)
		self:goToCurrentSkinSource(button)
	end

	self.view.itemTitle:SetActive(false)
end

function HomeCarModifyCtrl:setupConfirmGamepadAction(button)
	local objectReference = button:GetComponent("ObjectReference")
	local hotKeyContent = objectReference:GetRefValue("keyHotKeyContent")

	button:SetGamepadAction(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonNorth, hotKeyContent.gameObject)
end

function HomeCarModifyCtrl:closePanel()
	if self.uiScene then
		self.uiScene:switchCamera(UIConst.HOMECAR_MODE_IDX.MAINPAGE, self.modelLevel)
	end

	if self.homeMainPage and not IsNil(self.homeMainPage.view.widget) then
		self.homeMainPage:refreshHomeCarInfo()
	end

	self.view.widget:InvokeCallbackWithCallback(CS.XGUI.EInvokeTime.Custom1, function()
		self:close()
	end)
end

function HomeCarModifyCtrl:checkCommonQuit()
	if self.isModify then
		return true
	end

	return HomeCarModifyCtrl.super:checkCommonQuit(self)
end

function HomeCarModifyCtrl:onOpen(info)
	if self.isModify then
		self.view.btnBack:SetActive(true)
	else
		self.view.btnBack:SetActive(false)
	end

	self:initTabList()
	self.view.planTabList:SetActive(self.isModify == true)
	self.view.planTabList:SetList(HomeCarModifyCtrl.PLAN_TABS)

	local planPage = self.originalSkinId > 0 and HomeCarModifyCtrl.PLAN_PAGE.WHOLE or HomeCarModifyCtrl.PLAN_PAGE.CUSTOM

	self.view.planTabList:SelectItem(planPage, false)
	self.view.widget:TryChangePage("Plan", planPage, true, false)
	self:selectPlanPage(planPage)
end

function HomeCarModifyCtrl:initDefaultBaseInfo()
	local basicInfo = {}

	basicInfo.carShapeInfo = Utils.getDefaultCarShapeInfo()
	basicInfo.level = 1
	basicInfo.upgradeEndTs = 0

	return basicInfo
end

function HomeCarModifyCtrl:onDestroy()
	if self.skinPreviewTimer then
		TimerManager.removeTimer(self.skinPreviewTimer)

		self.skinPreviewTimer = nil
	end

	HomeCarModifyCtrl.super.onDestroy(self)

	self.homeMainPage = nil
end

function HomeCarModifyCtrl:confirm()
	if self.isModify then
		local skinId = self.isSkinPage and self.editSkinId or 0

		if self.isSkinPage and (not pg.me:checkFunctionUnlock(Const.FUNCTION_NAME.HOMECAR_SKIN) or not HomeCampUtils.checkCanUseCarSkin(pg.me, skinId)) then
			return
		end

		pg.me:setHomeCarShape(self.shapeInfo, function(noticeId, noticeArgs)
			if noticeId == NoticeDef.SUCCESS then
				self:closePanel()
			else
				ClientUtils.showBubbleMessageById(noticeId, Utils.safeUnpack(noticeArgs))
			end
		end)
	else
		pg.global.ui.homeCarName:setDefaultShapeInfo(self.shapeInfo)
		self:close()
	end
end

function HomeCarModifyCtrl:initTabList()
	local tabList = {}

	for tabId, tabInfo in pairs(HomeCarModifyTypeData) do
		local info = {
			tabId = tabId,
			icon = tabInfo.icon,
			name = tabInfo.name,
			cameraType = HomeCarModifyCtrl.CUSTOM_CAMERA_TYPE[tabId]
		}

		table.insert(tabList, info)
	end

	local function sortFunc(a, b)
		return a.tabId < b.tabId
	end

	table.sort(tabList, sortFunc)

	self.curTab = tabList[1].tabId

	self.view.tabList:SetList(tabList)
	self.view.tabList:SelectItem(0)
end

function HomeCarModifyCtrl:refreshModifyList()
	local subTabData = HomeCarModifyData[self.curTab]
	local modifyList = {}

	for subTabId, subTabInfo in pairs(subTabData) do
		local info = {
			tabId = self.curTab,
			subTabId = subTabId,
			icon = subTabInfo.icon,
			name = subTabInfo.name,
			partId = subTabInfo.partId,
			partValue = subTabInfo.partValue
		}

		table.insert(modifyList, info)
	end

	local function sortFunc(a, b)
		return a.subTabId < b.subTabId
	end

	table.sort(modifyList, sortFunc)

	self.modifyList = modifyList

	self.view.itemList:SetList(modifyList)
	self:refreshSelectPointList()
end

function HomeCarModifyCtrl:refreshSelectPointList()
	local pointList = {}

	for i = 1, #self.modifyList do
		local data = self.modifyList[i]

		table.insert(pointList, {
			subTabId = data.subTabId,
			partId = data.partId
		})
	end

	self.view.listPointUList:SetList(pointList)
end

function HomeCarModifyCtrl:rendererPartItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local lockUImage = objectReference:GetRefValue("lockUImage")

	lockUImage:SetActive(false)

	iconUImage.url = data.icon

	local curValue = self.shapeInfo[data.partId] or 0

	if curValue == data.subTabId then
		button:TryChangePage("State", 1)
	else
		button:TryChangePage("State", 0)
	end

	function button.luaClick()
		self:selectPartItem(data.partId, data.subTabId)
	end
end

function HomeCarModifyCtrl:rendererPointItem(button, index, data)
	local curValue = self.shapeInfo[data.partId] or 0

	if curValue == data.subTabId then
		button:TryChangePage("Selected", 1)
	else
		button:TryChangePage("Selected", 0)
	end
end

function HomeCarModifyCtrl:rendererPlanTabItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local text = pg.getGameString(data.text)

	ClientTextUtils.setText(objectReference:GetRefValue("name1"), text)
	ClientTextUtils.setText(objectReference:GetRefValue("name2"), text)
end

function HomeCarModifyCtrl:rendererTabItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local iconUImage = objectReference:GetRefValue("iconUImage")

	iconUImage.url = data.icon

	ClientTextUtils.setText(objectReference:GetRefValue("txtNameTextPlus"), pg.getLocalizationText(data.name))
end

function HomeCarModifyCtrl.sortSkinList(left, right)
	if left.sortGroup ~= right.sortGroup then
		return left.sortGroup < right.sortGroup
	end

	if left.sortId ~= right.sortId then
		return left.sortId < right.sortId
	end

	return left.skinId < right.skinId
end

function HomeCarModifyCtrl:refreshSkinList()
	self.skinListData = {}

	for skinId, skinInfo in pairs(HomeCarSkinData) do
		local unlocked = HomeCampUtils.checkCanUseCarSkin(pg.me, skinId)
		local sortGroup = unlocked and 2 or 3

		if skinId == self.originalSkinId then
			sortGroup = 1
		end

		table.insert(self.skinListData, {
			tIndex = 0,
			skinId = skinId,
			name = skinInfo.name,
			icon = skinInfo.icon,
			sortId = skinInfo.sortId or skinId,
			sortGroup = sortGroup,
			unlocked = unlocked
		})
	end

	table.sort(self.skinListData, HomeCarModifyCtrl.sortSkinList)
	table.insert(self.skinListData, {
		tIndex = 1
	})

	local selectedIndex = 0

	if self.editSkinId == 0 and self.skinListData[1] and self.skinListData[1].skinId then
		self.editSkinId = self.skinListData[1].skinId
	end

	for index, data in ipairs(self.skinListData) do
		if data.skinId == self.editSkinId then
			selectedIndex = index - 1

			break
		end
	end

	self.view.skinList:SetList(self.skinListData)
	self.view.skinList:SelectItem(selectedIndex, false)
	self:requestFocusSelectedSkin(selectedIndex)
end

function HomeCarModifyCtrl:requestFocusSelectedSkin(selectedIndex)
	self:startFrameTimer(function()
		if not self.isSkinPage or not self:checkUIShow() or not pg.game.input:isUsingGamepad() then
			return
		end

		self.view.skinList:GoToIndex(selectedIndex)

		local success, button = self.view.skinList:TryGetChildAt(selectedIndex)

		if not success or not button or IsNil(button) then
			return
		end

		local navMgr = pg.global.navMgr or CS.XGUI.Navigation.NavManager.Instance

		if navMgr then
			navMgr:FocusItem(button)
		end
	end, 1)
end

function HomeCarModifyCtrl:rendererSkinItem(button, index, data)
	if data.tIndex == 1 then
		local objectReference = button:GetComponent("ObjectReference")

		ClientTextUtils.setText(objectReference:GetRefValue("txtTipUBaseText"), pg.getGameString("UP_COMING"))

		button.luaClick = nil

		return
	end

	local objectReference = button:GetComponent("ObjectReference")

	ClientTextUtils.setText(objectReference:GetRefValue("txtNameUBaseText"), pg.getLocalizationText(data.name))

	objectReference:GetRefValue("iconUImage").url = data.icon

	objectReference:GetRefValue("lockUImage"):SetActive(not data.unlocked)

	button.isSelected = data.skinId == self.editSkinId

	button:TryChangePage("Lock", data.unlocked and 0 or 1)

	function button.luaClick()
		self:selectSkin(data)
	end
end

function HomeCarModifyCtrl:selectSkin(data)
	if self.editSkinId == data.skinId then
		return
	end

	self.editSkinId = data.skinId
	self.shapeInfo[Const.HOME_CAR_BASE_PART.Skin] = data.skinId

	self.view.skinList:RefreshList(true)
	self:refreshSkinAction()

	if self.skinPreviewTimer then
		TimerManager.removeTimer(self.skinPreviewTimer)
	end

	self.skinPreviewTimer = TimerManager.addTimer(HomeCarModifyCtrl.SKIN_PREVIEW_DELAY, function()
		self.skinPreviewTimer = nil

		if self.isSkinPage and self:checkUIShow() then
			self.uiScene:refreshHomeCar(self.basicInfo)
		end
	end)
end

function HomeCarModifyCtrl:refreshSkinAction()
	local skinInfo = HomeCarSkinData[self.editSkinId]
	local sourceId = tonumber(skinInfo.sourceId)
	local itemSourceInfo
	local sourceDesc = ""

	if sourceId > 0 then
		itemSourceInfo = ItemSourceData[sourceId]
		sourceDesc = pg.getLocalizationText(itemSourceInfo.desc)
	end

	if not pg.me:checkFunctionUnlock(Const.FUNCTION_NAME.HOMECAR_SKIN) then
		self.view.widget:TryChangePage("Obtain", HomeCarModifyCtrl.OBTAIN_PAGE.LOCK)

		local functionUnlockInfo = FuncIndexConfigData[Const.FUNCTION_NAME.HOMECAR_SKIN]

		ClientTextUtils.setText(self.view.skinLockDescUBaseText, pg.getLocalizationText(functionUnlockInfo.unlockDesc))

		return
	end

	if HomeCampUtils.checkCanUseCarSkin(pg.me, self.editSkinId) then
		self.view.widget:TryChangePage("Obtain", HomeCarModifyCtrl.OBTAIN_PAGE.UNLOCK)
	elseif itemSourceInfo and itemSourceInfo.type ~= LuaUIUtils.ITEM_SOURCE_TYPE_NONINTERACTIVE then
		self.view.widget:TryChangePage("Obtain", HomeCarModifyCtrl.OBTAIN_PAGE.GET)
		ClientTextUtils.setText(self.view.skinGetBtnText, pg.getGameString("GO_GET_ITEM"))
		ClientTextUtils.setText(self.view.skinGetDescUBaseText, sourceDesc)
	else
		self.view.widget:TryChangePage("Obtain", HomeCarModifyCtrl.OBTAIN_PAGE.LOCK)
		ClientTextUtils.setText(self.view.skinLockDescUBaseText, sourceDesc)
	end
end

function HomeCarModifyCtrl:goToCurrentSkinSource(button)
	local skinInfo = HomeCarSkinData[self.editSkinId]
	local sourceId = tonumber(skinInfo.sourceId)
	local itemSourceConfig = ItemSourceData[sourceId]
	local data = {
		clueSeekID = sourceId
	}

	table.merge(data, itemSourceConfig)
	LuaUIUtils.clueSeek(data, nil, button)
end

function HomeCarModifyCtrl:selectTabType(tabId)
	self.curTab = tabId

	self:refreshModifyList()
end

function HomeCarModifyCtrl:selectPlanPage(pageIndex)
	local isSkinPage = pageIndex == HomeCarModifyCtrl.PLAN_PAGE.WHOLE

	if isSkinPage then
		self.isSkinPage = true
		self.editSkinId = self.originalSkinId
		self.shapeInfo[Const.HOME_CAR_BASE_PART.Skin] = self.editSkinId

		self:refreshSkinList()

		self.shapeInfo[Const.HOME_CAR_BASE_PART.Skin] = self.editSkinId

		self:refreshSkinAction()
		self.uiScene:switchCamera(UIConst.HOMECAR_MODE_IDX.MODIFYSKIN, HomeCarModifyCtrl.SKIN_CAMERA_MODE)
		self.uiScene:refreshHomeCar(self.basicInfo)

		return
	end

	if self.isSkinPage then
		self.shapeInfo = Utils.deepCopyTable(self.originalShapeInfo)
		self.basicInfo.carShapeInfo = self.shapeInfo
	end

	self.isSkinPage = false
	self.shapeInfo[Const.HOME_CAR_BASE_PART.Skin] = 0

	self:refreshModifyList()
	self.uiScene:switchCamera(HomeCarModifyCtrl.CUSTOM_CAMERA_TYPE[self.curTab], self.modelLevel)
	self.uiScene:refreshHomeCar(self.basicInfo)
end

function HomeCarModifyCtrl:selectPartItem(partId, subTabId)
	if self.shapeInfo[partId] ~= subTabId then
		self.shapeInfo[partId] = subTabId
		self.shapeInfo[Const.HOME_CAR_BASE_PART.Skin] = 0

		self.view.itemList:RefreshList(true)
		self.view.listPointUList:RefreshList(true)
		self.uiScene:refreshHomeCar(self.basicInfo)
	end
end

function HomeCarModifyCtrl:initHomeCarEntity()
	self.uiScene:refreshHomeCar(self.basicInfo)
end

return HomeCarModifyCtrl
