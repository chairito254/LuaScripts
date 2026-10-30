-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LeyLinesTreeActivity\\LeyLinesTreeActivityCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local SeasonCalendarModel = require("Guis.Panels.SeasonCalendar.SeasonCalendarModel")
local SeasonTreeActivityItemRenderer = require("Guis.Panels.SeasonCalendar.SeasonTreeActivityItemRenderer")
local LeyLinesTreeActivityCtrl = Class.LightClass("LeyLinesTreeActivityCtrl", UICtrl)

LeyLinesTreeActivityCtrl.modelClz = SeasonCalendarModel

function LeyLinesTreeActivityCtrl:addListener()
	if self.view.btnClose then
		function self.view.btnClose.luaClick()
			self:dismiss()
		end
	end
end

function LeyLinesTreeActivityCtrl:refreshTips()
	if not self.view.txtTips then
		return
	end

	local text = pg.getGameString("FC_DUNGEON_QUIT_TEXT_OLD") or ""

	ClientTextUtils.setText(self.view.txtTips, text)
end

function LeyLinesTreeActivityCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:refreshTips()

	local moduleData = info and info.moduleData or self.model:getTreeActivityModuleData()

	SeasonTreeActivityItemRenderer.renderList(self.view.listUList, self.model:getTreeActivityList(moduleData))
end

return LeyLinesTreeActivityCtrl
