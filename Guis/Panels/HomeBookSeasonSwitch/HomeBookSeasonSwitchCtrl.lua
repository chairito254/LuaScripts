-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomeBookSeasonSwitch\\HomeBookSeasonSwitchCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local HomeBookDataUtils = require("Utils.HomeBookDataUtils")
local HomeBookSeasonSwitchCtrl = Class.LightClass("HomeBookSeasonSwitchCtrl", UICtrl)

function HomeBookSeasonSwitchCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function HomeBookSeasonSwitchCtrl:addListener()
	if self.view.btnBackUButton then
		function self.view.btnBackUButton.luaClick()
			self:closePanel()
		end
	end

	if self.view.listUList then
		function self.view.listUList.luaRenderItem(button, index, data)
			self:renderSeasonCard(button, data)
		end
	end
end

function HomeBookSeasonSwitchCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self.model:setContext(info)
	self:refreshView()
end

function HomeBookSeasonSwitchCtrl:getListTemplateCount()
	local list = self.view.listUList

	if not list then
		return nil
	end

	if list.GetTemplateCount then
		return list:GetTemplateCount()
	end

	return nil
end

function HomeBookSeasonSwitchCtrl:refreshView()
	if self.view.tMPUSDFText then
		local title = ""
		local seasonId = self.model.currentSeasonId

		if seasonId then
			local card = HomeBookDataUtils.getSeasonSwitchCardData(seasonId, seasonId)

			title = card and card.name or ""
		end

		ClientTextUtils.setText(self.view.tMPUSDFText, title)
	end

	if not self.view.listUList then
		return
	end

	self.view.listUList:SetList(self.model:getCardList(self:getListTemplateCount()))
end

function HomeBookSeasonSwitchCtrl:renderSeasonCard(button, data)
	if not button or not data then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")

	if objectReference then
		local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
		local txtNumUSDFText = objectReference:GetRefValue("txtNumUSDFText")

		if txtNameUSDFText then
			ClientTextUtils.setText(txtNameUSDFText, data.name or "")
		end

		if txtNumUSDFText then
			ClientTextUtils.setText(txtNumUSDFText, data.progressText or "")
		end
	end

	local isSelected = data.isSelected == true
	local iconSel = button.transform:Find("Btn/IconSel")

	if iconSel then
		iconSel.gameObject:SetActiveEx(isSelected)
	end

	function button.luaClick()
		self:onClickSeasonCard(data)
	end
end

function HomeBookSeasonSwitchCtrl:onClickSeasonCard(data)
	if not data or not data.seasonId then
		return
	end

	local seasonId = data.seasonId
	local onSelect = self.model.onSelect

	if data.isSelected then
		self:closePanel()

		return
	end

	self:closePanel()

	if onSelect then
		onSelect(seasonId)
	end
end

return HomeBookSeasonSwitchCtrl
