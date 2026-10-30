-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\BTipArea\\HelpTipsItem.lua

local Class = require("Core.Framework.Class")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientConst = require("Const.ClientConst")
local UIConst = require("Const.UIConst")
local Time = require("Core.Common.Time")
local GmToolUtils = require("Utils.GmToolUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PlayerHeadIconData = require("Data.player_head_icon_data")
local HotkeyConst = require("Const.HotkeyConst")
local SysConfigData = require("Data.sys_config_data")
local GuidenceItemData = require("Data.guidence_item_data")
local FuncIdConfigData = require("Data.func_index_config_data")
local FuncToMenuIdData = require("Data.func_to_menu_id_data")
local NormalFuncToMenuIdData = require("Data.normal_func_to_menu_id_data")
local FuncMenuListData = require("Data.func_menu_list_data")
local FuncMenuCommonData = require("Data.func_menu_common_use_data")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("HelpTipsItem")
local HelpTipsItem = Class.LightClass("HelpTipsItem", BaseQueueItem)
local Const = require("Common.Const.Const")

function HelpTipsItem:onInit()
	self:setMaxLimit(1)

	self.uContainer = self.uWidget
end

function HelpTipsItem:pushData(data)
	if data.isFuncUnlock then
		local funcId, funcData = self:_getFuncMenuData(data.funcName)

		if not funcId or not funcData then
			if LoggerManager.checkLogger(LoggerConst.WARN) then
				logger:warn("func unlock tips menu data not found, use empty display, funcName:%s", tostring(data.funcName))
			end
		else
			data.funcId = funcId
			data.funcData = funcData
		end
	end

	self:enqueue(data)
end

function HelpTipsItem:onUpdate()
	self:tryPopupItem()
	self:refreshRemainTime()
end

function HelpTipsItem:tryPopupItem()
	if self:isQueueEmpty() or self:isReachTheLimit() then
		return
	end

	self:setVisible(true)

	local data = self:dequeue()

	data.duration = data.duration or SysConfigData.helpTime or 5

	if data.isFuncUnlock then
		data.duration = SysConfigData.GUIDE_UNLOCK_SIDE_TIME or data.duration
	end

	data.endTime = Time.realSecondCache + data.duration

	self:addRunItem(data)
	self:initUContainer(data)
end

function HelpTipsItem:refreshRemainTime()
	if not self:isRunning() then
		return
	end

	local data = self.runList[1]
	local curTime = Time.realSecondCache

	if curTime < data.endTime then
		return
	end

	self:recycleToast(data)
end

function HelpTipsItem:onClearRunningList(force)
	self:clearRecycleRunningList(force)
end

function HelpTipsItem:recycleToast(data, force)
	self:requestRecycle(data, force, CS.XGUI.EInvokeTime.User2)
end

function HelpTipsItem:initUContainer(data)
	if not self.uContainer:CheckURLLoaded() then
		self.uContainer:LoadDefaultUrlManually(self:guardRunCallback(data, function(loadedItem)
			if IsNil(loadedItem) or self.uContainer.content ~= loadedItem then
				return
			end

			self:renderItem(loadedItem, data)
		end))
	else
		self:renderItem(self.uContainer.content, data)
	end
end

function HelpTipsItem:renderItem(item, data)
	data.endTime = Time.realSecondCache + data.duration

	if data.isFuncUnlock then
		item:TryChangePage("Type", 1)
		self:renderItem_FuncUnlock(item, data)
	else
		item:TryChangePage("Type", 0)
		self:renderItem_Help(item, data)
	end
end

function HelpTipsItem:renderItem_Help(item, data)
	local oc = item:GetComponent("ObjectReference")
	local arrowUWidget = oc:GetRefValue("arrowUWidget")
	local contentText = oc:GetRefValue("contentText")
	local enterUButton = oc:GetRefValue("enterUButton")
	local keyHotKeyContent = oc:GetRefValue("keyHotKeyContent")
	local progressUProgress = oc:GetRefValue("progressUProgress")
	local keyUWidget = oc:GetRefValue("keyUWidget")
	local helpId = data.helpId

	enterUButton.luaClick = self:guardRunCallback(data, function()
		pg.global.ui:open(UIConst.UI_ID_HELP, {
			helpId = helpId
		})
		self:clearRunningList()
	end, item)

	LuaUIUtils.bindHotKey(enterUButton.gameObject, HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadY, function()
		enterUButton.luaClick()
	end)
	LuaUIUtils.bindHotKey(enterUButton.gameObject, HotkeyConst.INPUT_MAP_ACTION_KEY.Cancel, self:guardRunCallback(data, function()
		self:clearRunningList()
	end, item))

	local guideData = GuidenceItemData[helpId]

	if not guideData then
		self:clearRunningList()

		return
	end

	if pg.global.ui.uiMgr:CheckIsMobileInteract() then
		ClientTextUtils.setText(contentText, pg.getFormatText(pg.getGameString("ENTRY_HELP_SIMPLE_MOBILE"), pg.getLocalizationText(guideData.name)))
		arrowUWidget:SetActiveFastest(true)
		keyUWidget:SetActiveFastest(false)
	else
		ClientTextUtils.setText(contentText, pg.getFormatText(pg.getGameString("ENTRY_HELP_SIMPLE"), pg.getLocalizationText(guideData.name)))
		arrowUWidget:SetActiveFastest(false)
		keyUWidget:SetActiveFastest(true)
		LuaUIUtils.bindHotKey(enterUButton.gameObject, "Hud/HelpTipEnter", self:guardRunCallback(data, function()
			enterUButton.luaClick()
		end, item), keyHotKeyContent)
	end

	progressUProgress.maxValue = 1
	progressUProgress.minValue = 0
	progressUProgress.value = 1

	progressUProgress:ProgressToValue(0, nil, data.duration, 0, CS.DG.Tweening.Ease.Linear)
end

function HelpTipsItem:renderItem_FuncUnlock(item, data)
	local objectReference = item:GetComponent("ObjectReference")
	local contentText = objectReference:GetRefValue("contentText")
	local progressUProgress = objectReference:GetRefValue("progressUProgress")
	local arrowUWidget = objectReference:GetRefValue("arrowUWidget")
	local keyHotKeyContent = objectReference:GetRefValue("keyHotKeyContent")
	local enterUButton = objectReference:GetRefValue("enterUButton")
	local keyUWidget = objectReference:GetRefValue("keyUWidget")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local lockUImage = objectReference:GetRefValue("lockUImage")

	item:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)

	local funcData = data.funcData
	local iconPath = funcData and (funcData.img or funcData.icon or funcData.hudIcon)

	if iconPath then
		iconUImage:SetActive(true)

		iconUImage.url = iconPath
	else
		iconUImage:SetActive(false)
	end

	ClientTextUtils.setText(contentText, funcData and funcData.name and pg.getLocalizationText(funcData.name) or "")

	enterUButton.luaClick = self:guardRunCallback(data, function()
		self:clearRunningList()
		self:_jumpFuncUnlock(data)
	end, item)

	LuaUIUtils.bindHotKey(enterUButton.gameObject, HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadY, function()
		enterUButton.luaClick()
	end)
	self:bindEnterLongPress("Hud/FuncUnlockEnter", enterUButton, keyHotKeyContent)
	LuaUIUtils.bindHotKey(enterUButton.gameObject, HotkeyConst.INPUT_MAP_ACTION_KEY.Cancel, self:guardRunCallback(data, function()
		self:clearRunningList()
	end, item))

	if pg.global.ui.uiMgr:CheckIsMobileInteract() then
		arrowUWidget:SetActiveFastest(true)
		keyUWidget:SetActiveFastest(false)
	else
		arrowUWidget:SetActiveFastest(false)
		keyUWidget:SetActiveFastest(true)
		LuaUIUtils.bindHotKey(enterUButton.gameObject, "Hud/HelpTipEnter", self:guardRunCallback(data, function()
			enterUButton.luaClick()
		end, item), keyHotKeyContent)
	end

	progressUProgress.maxValue = 1
	progressUProgress.minValue = 0
	progressUProgress.value = 1

	progressUProgress:ProgressToValue(0, nil, data.duration, 0, CS.DG.Tweening.Ease.Linear)
end

function HelpTipsItem:bindEnterLongPress(path, enterUButton, keyHotKeyContent)
	keyHotKeyContent:SetHotKeyPaths(path)
	LuaUIUtils.waitHotKeyContentObjectReference(self, keyHotKeyContent, function(objectReference)
		if IsNil(enterUButton) or IsNil(keyHotKeyContent) then
			return
		end

		self:clearHotKeyBindByPath(keyHotKeyContent.gameObject, path)
		self:bindHotKeyItemLongPress(objectReference, {
			path = path,
			hotKeyObject = keyHotKeyContent.gameObject,
			longPressFunc = function()
				if self.uWidget.gameObject.activeSelf and enterUButton.luaClick then
					enterUButton.luaClick()
				end
			end
		})
	end)
end

function HelpTipsItem:_jumpFuncUnlock(data)
	local funcConfig = FuncIdConfigData[data.funcName]

	if funcConfig and funcConfig.eventID then
		pg.me:doEvent(funcConfig.eventID)

		return
	end

	if data.funcUnlockType == UIConst.FuncUnlockType.OpenFuncMenu then
		if not data.funcId then
			if LoggerManager.checkLogger(LoggerConst.WARN) then
				logger:warn("jump func menu failed, funcId is nil, funcName:%s", tostring(data.funcName))
			end

			return
		end

		pg.global.ui.hudV2:openFuncMenu(data.funcId)

		return
	end

	if data.funcUnlockType == UIConst.FuncUnlockType.OpenUI then
		if not data.uiId then
			if LoggerManager.checkLogger(LoggerConst.WARN) then
				logger:warn("jump func unlock ui failed, uiId is nil, funcName:%s", tostring(data.funcName))
			end

			return
		end

		pg.global.ui:open(data.uiId)

		return
	end

	if data.funcUnlockType == UIConst.FuncUnlockType.OpenUnlockGuide then
		if not data.unlockGuideInfo then
			if LoggerManager.checkLogger(LoggerConst.WARN) then
				logger:warn("jump func unlock guide failed, guide info is nil, funcName:%s", tostring(data.funcName))
			end

			return
		end

		pg.global.ui:open(UIConst.UI_ID_FUNC_MENU_UNLOCK, data.unlockGuideInfo)

		return
	end

	if LoggerManager.checkLogger(LoggerConst.WARN) then
		logger:warn("jump func unlock failed, invalid func unlock type, funcName:%s, type:%s", tostring(data.funcName), tostring(data.funcUnlockType))
	end
end

function HelpTipsItem:_getFuncMenuData(funcName)
	local funcId = FuncToMenuIdData[funcName]

	if funcId then
		return funcId, FuncMenuListData[funcId]
	end

	funcId = NormalFuncToMenuIdData[funcName]

	if funcId then
		return funcId, FuncMenuCommonData[funcId]
	end
end

function HelpTipsItem:GMPushData(data)
	data.helpId = 101
end

function HelpTipsItem:onRecycleFinished(data, reason)
	if data.isFuncUnlock then
		self.funcUnlockView = nil
	end

	if not self:isQueueEmpty() then
		self:setVisible(false)
	end
end

return HelpTipsItem
