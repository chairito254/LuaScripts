-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetReport\\PetReportModel.lua

local logger = require("Core.Log.LoggerManager").getLogger("PetReportModel")
local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local ClientConst = require("Const.ClientConst")
local Const = require("Common.Const.Const")
local ItemConst = require("Common.Const.ItemConst")
local ItemUtils = require("Common.Utils.ItemUtils")
local PetCaptureReportSortData = require("Data.pet_capture_report_sort_data")
local DropData = require("Data.drop_data")
local TimerManager = require("Core.Timer.TimerManager")
local UIConst = require("Const.UIConst")
local CurrencyAutoData = require("Data.currency_auto_change_data")
local AttributeConst = require("Common.Const.AttributeConst")
local Utils = require("Common.Utils.Utils")
local PetReportModel = Class.LightClass("PetReportModel", UIModel)

function PetReportModel:setReportData(info)
	self.hasCatchReport = info.hasCatchReport
	self.reportShinyCoin = info.reportShinyCoin or 0
	self.reportBossCoin = info.reportBossCoin or 0
	self.allReportPointArea = info.allReportPointArea or {}
	self.hasAnyPoint = #self.allReportPointArea > 0
	self.isFirstEnter = not pg.me.isUIOpened[UIConst.UI_ID_PET_REPORT]
end

function PetReportModel:ctor()
	self.countryId = 300001
	self.CATCH_NUM_TOPIC_ID = 1
	self.SHINING_STAR_TOPIC_ID = Const.CATCH_REPORT_SHINING_STAR
	self.SHINY_TOPIC_ID = 3
	self._tempDropMap = {}
end

function PetReportModel:sendOpenedRPC()
	if self.isFirstEnter then
		pg.me:serverMsg("RPC_CS_UpdateUIOpened", UIConst.UI_ID_PET_REPORT, true)
	end
end

function PetReportModel:sendRpc()
	if self.hasCatchReport then
		TimerManager.addTimer(0.3, function()
			local releaseData = {
				PetReportModel.getPetReleaseState(1),
				PetReportModel.getPetReleaseState(2),
				(PetReportModel.getPetReleaseState(3))
			}

			pg.me:serverMsg("RPC_CS_PetCatchReport", releaseData)
		end)
	end

	if self.hasAnyPoint then
		for _, info in ipairs(self.allReportPointArea) do
			pg.me:reportPetResearch(info.areaId)
		end
	end
end

function PetReportModel:updateReportMoneyAddRatio()
	self.reportMoneyAddRatio = pg.me.actorCombatAttribute:getAttribValue(AttributeConst.catch_report_money_add_ratio) or 0
end

function PetReportModel:getCatchReportPetInfoForSettlement(catchPet)
	local petId = catchPet.petId
	local player = pg.me

	return player.pets[petId] or player.simplifyPets and player.simplifyPets[petId] or catchPet
end

function PetReportModel:getCatchReportTypesForSettlement(catchPet, label, templateId)
	local reportTypes = {}
	local reportTypeSet = {}

	for _, reportType in pairs(catchPet.reportTypes or {}) do
		if reportType ~= Const.CATCH_REPORT_ELITE and reportType ~= Const.CATCH_REPORT_SHINY and reportType ~= Const.CATCH_REPORT_ONCE and reportType ~= Const.CATCH_REPORT_RAINBOW and not reportTypeSet[reportType] then
			reportTypeSet[reportType] = true
			reportTypes[#reportTypes + 1] = reportType
		end
	end

	if not reportTypeSet[Const.CATCH_REPORT_COUNT] then
		reportTypes[#reportTypes + 1] = Const.CATCH_REPORT_COUNT
	end

	if Utils.isLabelElite(label) then
		reportTypes[#reportTypes + 1] = Const.CATCH_REPORT_ELITE
	end

	if Utils.isLabelShiny(label) then
		reportTypes[#reportTypes + 1] = Const.CATCH_REPORT_SHINY
	end

	if Utils.isLabelDark(label) then
		reportTypes[#reportTypes + 1] = Const.CATCH_REPORT_ONCE
	end

	if Utils.isAnyRainbowTypeByTemplateId(templateId) then
		reportTypes[#reportTypes + 1] = Const.CATCH_REPORT_RAINBOW
	end

	return reportTypes
end

function PetReportModel:getTopicData()
	local ret = {}

	for idx, v in ipairs(PetCaptureReportSortData) do
		local topicData = {
			topicIdx = idx,
			icon = v.icon,
			iconNoNum = v.iconNone,
			name = pg.getLocalizationText(v.name),
			factor = self:getReportCoinFactor(idx, nil, false),
			factorShiny = self:getReportCoinFactor(idx, nil, true),
			otherItem1 = v.itemReward1,
			otherItem2 = v.itemReward2
		}

		if idx == self.SHINING_STAR_TOPIC_ID then
			topicData.tierFactors = {}
			topicData.tierShinyFactors = {}

			for tier = 1, 3 do
				topicData.tierFactors[tier] = self:getReportCoinFactor(idx, tier, false)
				topicData.tierShinyFactors[tier] = self:getReportCoinFactor(idx, tier, true)
			end
		end

		table.insert(ret, topicData)
	end

	return ret
end

function PetReportModel:getReportCoinFactor(topicId, shiningStarTier, isShinyTime)
	local cfgData = PetCaptureReportSortData[topicId]
	local factorKey = isShinyTime and "factorWithShiny" or "factor"

	if topicId == self.SHINING_STAR_TOPIC_ID then
		if shiningStarTier == 2 then
			factorKey = factorKey .. "2"
		elseif shiningStarTier == 3 then
			factorKey = factorKey .. "3"
		end
	end

	local factor = cfgData[factorKey]

	if isShinyTime then
		factor = factor or 0
	end

	return factor and factor * (1 + self.reportMoneyAddRatio)
end

function PetReportModel.getDropInfo(dropId)
	local ret = {}

	if DropData[dropId] then
		local displayReward = DropData[dropId].displayReward

		if displayReward then
			for idx, data in ipairs(displayReward) do
				table.insert(ret, {
					itemId = data[1],
					count = data[2]
				})
			end
		end
	end

	return ret
end

function PetReportModel:getRewardInitDataInPhase1()
	local ret = {}

	ret[1] = {
		originCount = 0,
		count = 0,
		itemId = ItemConst.ITEM_SPECIAL_MONEY_COIN
	}

	for idx, v in ipairs(PetCaptureReportSortData) do
		self:_setItemRewardItemId(v.itemReward1, ret)
	end

	return ret
end

function PetReportModel:getRewardInitDataInShinyTime()
	local ret = {}

	ret[1] = {
		originCount = 0,
		count = 0,
		itemId = ItemConst.ITEM_SPECIAL_MONEY_COIN
	}

	for idx, v in ipairs(PetCaptureReportSortData) do
		self:_setItemRewardItemId(v.itemReward2, ret)
	end

	return ret
end

function PetReportModel.getPetNotBeReleaseData()
	local ret = {}

	ret[1] = {
		icon = "$UI_Icon_PetBelong_Shine.png",
		name = pg.getGameString("FILTER_SHINY")
	}
	ret[2] = {
		icon = "$UI_Icon_PetBelong_Rainbow.png",
		name = pg.getGameString("FILTER_RAINBOW")
	}
	ret[3] = {
		icon = "$UI_Icon_PetBelong_Boss.png",
		name = pg.getGameString("FILTER_BOSS")
	}

	return ret
end

function PetReportModel.getPetReleaseData()
	local ret = {}

	ret[1] = {
		rating = 1,
		icon = "$UI_Img_PetAccess_Green.png"
	}
	ret[2] = {
		rating = 2,
		icon = "$UI_Img_PetAccess_Blue.png"
	}
	ret[3] = {
		rating = 3,
		icon = "$UI_Img_PetAccess_Purple.png"
	}

	return ret
end

local PREFS_PET_RELEASE = "PET_RELEASE_%s"

function PetReportModel.getPetReleaseState(ratingIndex)
	return pg.global.prefsCacheUtils:getBool(string.format(PREFS_PET_RELEASE, ratingIndex), false, ClientConst.CACHE_TYPE_FLAG.USER)
end

function PetReportModel.setPetReleaseState(ratingIndex, isSelected)
	return pg.global.prefsCacheUtils:setBool(string.format(PREFS_PET_RELEASE, ratingIndex), isSelected, ClientConst.CACHE_TYPE_FLAG.USER)
end

function PetReportModel:calcCoinCountInPhase1(countMap, reportMap, shiningStarTier)
	for _, id in pairs(reportMap) do
		if id ~= self.SHINY_TOPIC_ID then
			local cfgData = PetCaptureReportSortData[id]
			local factor = self:getReportCoinFactor(id, shiningStarTier, false)

			countMap[ItemConst.ITEM_SPECIAL_MONEY_COIN] = (countMap[ItemConst.ITEM_SPECIAL_MONEY_COIN] or 0) + factor

			if cfgData.itemReward1 then
				if self._tempDropMap[cfgData.itemReward1] == nil then
					self._tempDropMap[cfgData.itemReward1] = self.getDropInfo(cfgData.itemReward1)
				end

				for _, v in ipairs(self._tempDropMap[cfgData.itemReward1]) do
					if PetReportModel.isCurrencyUnlocked(v.itemId) then
						countMap[v.itemId] = (countMap[v.itemId] or 0) + v.count
					end
				end
			end
		end
	end
end

function PetReportModel:calcCoinCountInPhase2(countMap, reportMap, shiningStarTier)
	for _, id in pairs(reportMap) do
		if id ~= self.CATCH_NUM_TOPIC_ID then
			local cfgData = PetCaptureReportSortData[id]
			local factor = self:getReportCoinFactor(id, shiningStarTier, true)

			countMap[ItemConst.ITEM_SPECIAL_MONEY_COIN] = (countMap[ItemConst.ITEM_SPECIAL_MONEY_COIN] or 0) + factor

			if cfgData.itemReward2 then
				if self._tempDropMap[cfgData.itemReward2] == nil then
					self._tempDropMap[cfgData.itemReward2] = self.getDropInfo(cfgData.itemReward2)
				end

				for _, v in ipairs(self._tempDropMap[cfgData.itemReward2]) do
					if PetReportModel.isCurrencyUnlocked(v.itemId) then
						countMap[v.itemId] = (countMap[v.itemId] or 0) + v.count
					end
				end
			end
		end
	end
end

function PetReportModel:_setItemRewardItemId(dropId, ret)
	if dropId and DropData[dropId] then
		local displayReward = DropData[dropId].displayReward

		if displayReward then
			for idx, data in ipairs(displayReward) do
				if PetReportModel.isCurrencyUnlocked(data[1]) then
					ret[#ret + 1] = {
						originCount = 0,
						count = 0,
						itemId = data[1]
					}
				end
			end
		end
	end
end

function PetReportModel.isCurrencyUnlocked(itemId)
	local data = CurrencyAutoData[itemId]

	if not data or not data.initTitle then
		return true
	end

	return pg.me.starTitle >= data.initTitle
end

return PetReportModel
