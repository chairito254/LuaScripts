-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueAutoUnlockPopup\\RogueAutoUnlockPopupCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local RogueDifficultyData = require("Data.rogue_difficulty_data")
local RogueUtils = require("Utils.RogueUtils")
local RogueAutoUnlockPopupCtrl = Class.LightClass("RogueAutoUnlockPopupCtrl", UICtrl)

function RogueAutoUnlockPopupCtrl:addListener()
	function self.view.confirmBtn.luaClick()
		self:close()
	end

	function self.view.listUList.luaRenderItem(button, index, data)
		self:renderDifficultyItem(button, index, data)
	end
end

function RogueAutoUnlockPopupCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	local autoUnlockLabel = info and info.autoUnlockLabel or 2
	local seasonId = info and info.seasonId

	self:initView(autoUnlockLabel, seasonId)
end

function RogueAutoUnlockPopupCtrl:initView(autoUnlockLabel, seasonId)
	self.difficultyLevelMap = self:getDifficultyLevelMap(seasonId)

	local listData = self:getDifficultyList(autoUnlockLabel)

	self.view.listUList:SetList(listData)

	local description = "上赛季通关全部元素塔 {0} 难度，已自动解锁新元素塔难度\n新赛季【首通奖励】重置，每个元素塔 {1} {2} 难度的【首通奖励】已发至邮箱。"

	ClientTextUtils.setText(self.view.textContentUSDFText, pg.getFormatText(description, self:getLabelName(autoUnlockLabel), self:getLabelNames(autoUnlockLabel)))
end

function RogueAutoUnlockPopupCtrl:getLabelNames(maxDifficultyLabel)
	maxDifficultyLabel = tonumber(maxDifficultyLabel) or -1

	local labelNames = {}

	for difficultyLabel = 0, maxDifficultyLabel - 1 do
		if self.difficultyLevelMap[difficultyLabel] then
			labelNames[#labelNames + 1] = self:getLabelName(difficultyLabel)
		end
	end

	return unpack(labelNames)
end

function RogueAutoUnlockPopupCtrl:getDifficultyLevelMap(seasonId)
	local difficultyLevelMap = {}
	local towerElementType

	for _, levelId in ipairs(RogueUtils.getRogueLevelIdsBySeason(seasonId)) do
		local levelData = RogueDifficultyData[levelId]

		if levelData then
			towerElementType = towerElementType or levelData.elementType

			if levelData.elementType == towerElementType and difficultyLevelMap[levelData.difficultyLabel] == nil then
				difficultyLevelMap[levelData.difficultyLabel] = levelData
			end
		end
	end

	return difficultyLevelMap
end

function RogueAutoUnlockPopupCtrl:getDifficultyList(maxDifficultyLabel)
	local difficultyList = {}

	for difficultyLabel = 0, tonumber(maxDifficultyLabel) or -1 do
		local levelData = self.difficultyLevelMap[difficultyLabel]

		if levelData then
			difficultyList[#difficultyList + 1] = {
				difficultyLabel = levelData.difficultyLabel
			}
		end
	end

	return difficultyList
end

function RogueAutoUnlockPopupCtrl:renderDifficultyItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")

	ClientTextUtils.setText(txtNameUSDFText, self:getLabelName(data.difficultyLabel))
end

function RogueAutoUnlockPopupCtrl:getLabelName(difficultyLabel)
	local levelData = self.difficultyLevelMap and self.difficultyLevelMap[difficultyLabel]

	return levelData and pg.getLocalizationText(levelData.difficulty) or ""
end

return RogueAutoUnlockPopupCtrl
