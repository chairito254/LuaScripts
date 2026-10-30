-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\SpecialTrainSectionUnlocked\\SpecialTrainSectionUnlockedCtrl.lua

local UICtrl = require("Guis.UICtrl")
local Class = require("Core.Framework.Class")
local ClientTextUtils = require("Utils.ClientTextUtils")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local QuestConst = require("Common.Const.QuestConst")
local SpecialTrainBlockData = require("Data.special_train_block_data")
local SpecialTrainSectionUnlockedCtrl = Class.LightClass("SpecialTrainSectionUnlockedCtrl", UICtrl)
local AUTO_CLOSE_TIME = 3
local BLOCK_UNLOCK_SFX = {
	[QuestConst.SPECIAL_TRAIN_BLOCK_ID.WATER] = "SFX_UI_WaterWorld_Unlock"
}

function SpecialTrainSectionUnlockedCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function SpecialTrainSectionUnlockedCtrl:addListener()
	local exitBinding = KeyBindingPro.GetOrAddKeyBindingByName(self.view.transform.gameObject, "SpecialTrainSectionUnlockedCtrl")

	exitBinding.actionPath = "Common/Cancel"
	exitBinding.isVirtual = true

	function exitBinding.luaTrigger(inputInfo)
		if inputInfo.phase == "Performed" then
			self:closeSelf()
		end
	end
end

function SpecialTrainSectionUnlockedCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	if info ~= nil then
		self.blockId = info.blockId
		self.closeCallback = info.closeCallback
	end

	self:showPanel()
end

function SpecialTrainSectionUnlockedCtrl:showPanel()
	local blockData = SpecialTrainBlockData[self.blockId]

	if blockData and blockData.blockName then
		ClientTextUtils.setText(self.view.blockName, pg.getLocalizationText(blockData.blockName))
	end

	ClientTextUtils.setText(self.view.textUSDFText, pg.getGameString("HOMELAND_PLOT_UNLOCKED"))

	local sfxEvent = BLOCK_UNLOCK_SFX[self.blockId]

	if sfxEvent then
		pg.game.audio:triggerEvent(sfxEvent)
	end

	self:startTimer(function()
		self:closeSelf()
	end, AUTO_CLOSE_TIME)
end

function SpecialTrainSectionUnlockedCtrl:closeSelf()
	if self.isSelfClosed then
		return
	end

	self.isSelfClosed = true

	local closeCallback = self.closeCallback

	self.closeCallback = nil

	self:dismiss()

	if closeCallback then
		closeCallback()
	end
end

function SpecialTrainSectionUnlockedCtrl:onClosePanel()
	self:closeSelf()
end

function SpecialTrainSectionUnlockedCtrl:onHide()
	return
end

function SpecialTrainSectionUnlockedCtrl:onDestroy()
	self.blockId = nil
	self.closeCallback = nil
	self.isSelfClosed = nil

	UICtrl.onDestroy(self)
end

return SpecialTrainSectionUnlockedCtrl
