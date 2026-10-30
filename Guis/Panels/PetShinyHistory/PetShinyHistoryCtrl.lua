-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetShinyHistory\\PetShinyHistoryCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("PetShinyHistoryCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientUtils = require("Utils.ClientUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetShinyFunctionBaseData = require("Data.pet_shiny_function_base_data")
local PetShinyStyleData = require("Data.pet_shiny_style_data")
local PetShinyHistoryCtrl = Class.LightClass("PetShinyHistoryCtrl", UICtrl)

PetShinyHistoryCtrl.DEFAULT_PAGE_SIZE = 5
PetShinyHistoryCtrl.messages = {}

function PetShinyHistoryCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function PetShinyHistoryCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		self:dismiss()
	end

	function self.view.btnCornerCloseUButton.luaClick()
		self:dismiss()
	end

	function self.view.listUList.luaRenderItem(button, index, data)
		self:onRenderItem(button, index, data)
	end

	function self.view.numSelectorUNumSelector.luaValueChanged(pageIndex)
		self.curPageIndex = math.max(1, math.min(pageIndex, self:getTotalPages()))

		self:refreshHistoryPage()
	end
end

function PetShinyHistoryCtrl:onDestroy()
	self.historyRequest = nil

	UICtrl.onDestroy(self)
end

function PetShinyHistoryCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.petId = info.petId
	self.historyRecords = {}

	local pageCapacity = self.view.listUList:GetPageCapacity()

	self.pageSize = pageCapacity > 0 and pageCapacity or self.DEFAULT_PAGE_SIZE

	self:initPageNumSelector()
	self:requestHistory()
end

function PetShinyHistoryCtrl:requestHistory()
	local request = {
		uid = pg.me.uid,
		petId = self.petId
	}

	self.historyRequest = request

	local key = tostring(request.uid) .. "/" .. tostring(request.petId) .. ".json"

	ClientUtils.pullResource("pet_shiny_reroll", key, function(_, data)
		if self.historyRequest ~= request or not self:checkUIOpen() or self.view.widget.isClosing or not pg.me or pg.me.uid ~= request.uid then
			return
		end

		self.historyRequest = nil

		self:setHistoryData(data)
		self:initPageNumSelector()
	end)
end

function PetShinyHistoryCtrl:setHistoryData(data)
	if data == nil then
		self.historyRecords = {}

		return
	end

	self.historyRecords = data.records

	table.sort(self.historyRecords, function(a, b)
		return a.recordTime > b.recordTime
	end)
end

function PetShinyHistoryCtrl:onShow()
	local timeLimit = PetShinyFunctionBaseData[2].timeLimit

	ClientTextUtils.setText(self.view.txtTitleUBaseText, pg.getGameString("PET_SHINY_REROLL_HISTORY"))
	ClientTextUtils.setText(self.view.textUBaseText, pg.getFormatText(pg.getGameString("PET_SHINY_REROLL_HISTORY_DESC"), tostring(timeLimit)))
	ClientTextUtils.setText(self.view.txtNameUBaseText, pg.getGameString("PET_SHINY_REROLL_RESULT"))
	ClientTextUtils.setText(self.view.txtCostUBaseText, pg.getGameString("PET_SHINY_REROLL_REWARD"))
	ClientTextUtils.setText(self.view.txtTimeUBaseText, pg.getGameString("PET_SHINY_REROLL_TIME"))
end

function PetShinyHistoryCtrl:onHide()
	return
end

function PetShinyHistoryCtrl:onRenderItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtQuality = objectReference:GetRefValue("txtQuality")
	local txtName = objectReference:GetRefValue("txtName")
	local txtTime = objectReference:GetRefValue("txtTime")

	ClientTextUtils.setText(txtQuality, pg.getLocalizationText(PetShinyStyleData[data.shinyStyle].name))
	ClientTextUtils.setText(txtName, self:getReturnRewardText(data.itemList))
	ClientTextUtils.setText(txtTime, LuaUIUtils.timeStampToUtcString(data.recordTime))
end

function PetShinyHistoryCtrl:getReturnRewardText(itemList)
	if #itemList == 0 then
		return "--"
	end

	local texts = {}

	for _, item in ipairs(itemList) do
		texts[#texts + 1] = string.format("%s×%s", LuaUIUtils.getNameByItemId(item.itemId, true), ClientTextUtils.getFormatNumber(item.count))
	end

	return table.concat(texts, "、")
end

function PetShinyHistoryCtrl:getTotalPages()
	return math.max(1, math.ceil(#self.historyRecords / self.pageSize))
end

function PetShinyHistoryCtrl:initPageNumSelector()
	self.curPageIndex = 1

	self.view.numSelectorUNumSelector:SetAllValue(1, 1, self:getTotalPages(), 1, false)
	self:refreshHistoryPage()
end

function PetShinyHistoryCtrl:refreshHistoryPage()
	local pageRecords = {}
	local firstIndex = (self.curPageIndex - 1) * self.pageSize + 1
	local lastIndex = math.min(firstIndex + self.pageSize - 1, #self.historyRecords)

	for index = firstIndex, lastIndex do
		pageRecords[#pageRecords + 1] = self.historyRecords[index]
	end

	self.view.widget:TryChangePage("Empty", #self.historyRecords == 0 and 1 or 0)
	self.view.listUList:SetList(pageRecords)
end

return PetShinyHistoryCtrl
