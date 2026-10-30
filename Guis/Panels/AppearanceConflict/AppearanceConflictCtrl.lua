-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceConflict\\AppearanceConflictCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientConst = require("Const.ClientConst")
local Time = require("Core.Common.Time")
local UIConst = require("Const.UIConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local HotkeyConst = require("Const.HotkeyConst")
local AppearanceConflictCtrl = Class.LightClass("AppearanceConflictCtrl", UICtrl)

AppearanceConflictCtrl.messages = {}

function AppearanceConflictCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.desc = info and info.desc or nil
	self.ensureCb = info and info.ensureCb or nil
	self.cancelCb = info and info.cancelCb or nil
	self.newClothesId = info and info.newClothesId or nil
	self.conflictIds = info and info.conflictIds or {}
end

function AppearanceConflictCtrl:addListener()
	function self.view.confirmBtn.luaClick()
		if self.hintCheckButton and self.hintCheckButton.isSelected then
			self:appearanceConflictTip()
		end

		if self.ensureCb then
			self.ensureCb()
		end

		self:closePanel()
	end

	function self.view.cancelBtn.luaClick()
		if self.cancelCb then
			self.cancelCb()
		end

		self:closePanel()
	end

	function self.view.leftList.luaRenderItem(button, index, data)
		self:renderAppearanceItem(button, index, data)
	end

	function self.view.rightList.luaRenderItem(button, index, data)
		self:renderAppearanceItem(button, index, data)
	end
end

function AppearanceConflictCtrl:closePanel()
	pg.global.ui:close(UIConst.UI_ID_APPEARANCE_CONFLICT)
end

function AppearanceConflictCtrl:refreshHintCheckBox()
	local listCheckBox = self.view.listCheckBox

	if not listCheckBox then
		return
	end

	listCheckBox:SetActiveFastestAndMarkIgnoreLayout(true)
	listCheckBox:SetActiveFastest(true, true)
	listCheckBox:SetList({
		{}
	})

	local buttons = listCheckBox:GetAllButtons()

	self.hintCheckButton = nil

	if not buttons or buttons.Length <= 0 then
		return
	end

	local checkButton = buttons[0]

	self.hintCheckButton = checkButton
	checkButton.buttonType = CS.XGUI.EButtonType.Check

	checkButton:TryChangePage("Stage", 0)
	checkButton:SetSelected(false)

	function checkButton.luaSelectChanged(isSelected)
		checkButton:TryChangePage("Stage", isSelected and 1 or 0)
	end

	local hintKeyBind = KeyBindingPro.GetOrAddKeyBindingByName(checkButton.gameObject, "nextTimeKeyBind")

	hintKeyBind.isVirtual = true
	hintKeyBind.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonWest
	hintKeyBind.priority = 30000

	function hintKeyBind.luaTrigger(inputInfo)
		if inputInfo.phase == "Performed" then
			checkButton.isSelected = not checkButton.isSelected
		end
	end

	local itemReference = checkButton:GetComponent("ObjectReference")
	local itemText = itemReference:GetRefValue("txtNameUSDFText")

	if itemText then
		ClientTextUtils.setText(itemText, string.format(pg.getGameString("DISABLE_HINT"), 1))
	end
end

function AppearanceConflictCtrl:onDestroy()
	UICtrl.onDestroy(self)
end

function AppearanceConflictCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	ClientTextUtils.setText(self.view.subTitle, self.desc or "")
	self:refreshHintCheckBox()

	if self.newClothesId then
		self.view.leftList:SetList({
			{
				itemId = self.newClothesId
			}
		})
	end

	local t = {}

	for _, itemId in pairs(self.conflictIds) do
		t[#t + 1] = {
			itemId = itemId
		}
	end

	self.view.rightList:SetList(t)
end

function AppearanceConflictCtrl:appearanceConflictTip()
	pg.global.prefsCacheUtils:setInt("appearanceConflictTip", Time.secondCache, ClientConst.CACHE_TYPE_FLAG.USER)
	pg.global.prefsCacheUtils:save()
end

function AppearanceConflictCtrl:renderAppearanceItem(button, index, data)
	local clothesInfo = LuaUIUtils.getClothesInfo(pg.me, data.itemId)
	local icon = clothesInfo.icon
	local quality = clothesInfo.quality
	local objectReference = button:GetComponent("ObjectReference")
	local itemIconUImage = objectReference:GetRefValue("itemIconUImage")
	local txtNumUText = objectReference:GetRefValue("txtNumUText")

	button:TryChangePage("Quality", quality)

	itemIconUImage.url = icon

	ClientTextUtils.setText(txtNumUText, "")

	function button.luaClick()
		pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
			id = data.itemId,
			targetRect = button
		})
	end
end

return AppearanceConflictCtrl
