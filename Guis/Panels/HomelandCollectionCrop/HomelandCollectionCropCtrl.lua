-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandCollectionCrop\\HomelandCollectionCropCtrl.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local logger = require("Core.Log.LoggerManager").getLogger("HomelandCollectionCropCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientUtils = require("Utils.ClientUtils")
local Time = require("Core.Common.Time")
local TimeUtils = require("Common.Utils.TimeUtils")
local Utils = require("Common.Utils.Utils")
local UIConst = require("Const.UIConst")
local RedDotConst = require("Const.RedDotConst")
local NoticeDef = require("Common.NoticeDef")
local HomeSeasonData = require("Data.home_season_data")
local HomeSeasonMutationCategoryData = require("Data.home_season_mutation_category_data")
local HomeSeasonMutationCollectionData = require("Data.home_season_mutation_collection_data")
local HomeSeasonMutationCollectionRewardData = require("Data.home_season_mutation_collection_reward_data")
local HomelandConfigData = require("Data.homeland_config_data")
local HomeSeasonConfigData = require("Data.home_season_config_data")
local HomeSeasonUtils = require("Utils.HomeSeasonUtils")
local HomeSeasonMutationCountLevelData = require("Data.home_season_mutation_count_level_data")
local HomeSeasonMutationHarvestIndexData = require("Data.home_season_mutation_harvest_index_data")
local HomeSeasonModuleData = require("Data.home_season_module_data")
local CATEGORY_CARD_COUNT = 2
local REMAIN_TIME_REFRESH_INTERVAL = 1
local HomelandCollectionCropCtrl = Class.LightClass("HomelandCollectionCropCtrl", UICtrl)

HomelandCollectionCropCtrl.messages = {
	[MessageName.HOME_SEASON_MUTATION_COLLECTION_CHANGE] = {
		"onMutationCollectionChanged",
		true
	},
	[MessageName.HOME_SEASON_CROP_HARVEST_COUNT_CHANGE] = {
		"onMutationHarvestCountChanged",
		true
	},
	[MessageName.HOME_SEASON_CHANGE] = {
		"refreshMutationBonus",
		true
	},
	[MessageName.ITEM_COUNT_MAP_CHANGE] = {
		"onMutationCropItemCountChanged",
		true
	},
	[MessageName.HOMELAND_ITEM_MAP_CHANGED] = {
		"onMutationCropItemCountChanged",
		true
	}
}

function HomelandCollectionCropCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.exchangeShopId = info and info.exchangeShopId or HomeSeasonConfigData.SeasonShopType or 51
	self.seasonId = info and info.seasonId or pg.me and pg.me.homeSeasonId or 0
	self.isReceivingReward = false
	self.moduleId = info.moduleId

	if not self.seasonId or self.seasonId == 0 then
		self:close()

		return
	end

	self.categoryList = self:getCategoryList()

	local seasonInfo = HomeSeasonData[self.seasonId] or {}

	self.seasonEndTime = Utils.getConfigTimeOfAreaByData(seasonInfo.endDayTime, seasonInfo.endDayTimeRefId)

	self:refreshCollectionCropPageInfo()
	self:startRemainTimeTimer()
end

function HomelandCollectionCropCtrl:addListener()
	self.view.btnMutationUButton.enabledTooltip = true
	self.view.btnMutationUButton.tooltipMode = CS.XGUI.ETooltipMode.Click

	function self.view.btnMutationUButton.luaRenderTooltip(button, popup)
		self.mutationTooltip = popup

		self:refreshMutationBonus()
	end

	function self.view.btnMutationUButton.luaTooltipPopup(button, isOpen)
		if not isOpen then
			self.mutationTooltip = nil
		end
	end

	function self.view.btnBackUButton.luaClick()
		self:close()
	end

	function self.view.btnDecomposeUButton.luaClick()
		if not self:hasDecomposableCrop() then
			pg.global.showBubbleMessageRaw(pg.getGameString("HOMELAND_SEASON_CROP_NO_DECOMPOSABLE_CROP"))

			return
		end

		pg.global.ui:open(UIConst.UI_ID_HOME_SEASON_COLLECTIONCROP_DECOMPOSE)
	end

	function self.view.btnExchangeUButton.luaClick()
		if LuaUIUtils.checkFuncTemporaryDisable(UIConst.UI_ID_SHOP_MAIN) then
			return
		end

		pg.global.ui:open(UIConst.UI_ID_SHOP_MAIN, {
			shopTags = {
				self.exchangeShopId
			},
			shopTag = HomeSeasonConfigData.SeasonShopType or 51
		})
	end

	function self.view.listUList.luaRenderItem(button, index, data)
		self:renderRewardItem(button, index, data)
	end

	function self.view.card1UButton.luaClick()
		self:openCategoryDetail(1)
	end

	function self.view.card2UButton.luaClick()
		self:openCategoryDetail(2)
	end
end

function HomelandCollectionCropCtrl:hasDecomposableCrop()
	for itemId, collectionInfo in pairs(HomeSeasonMutationCollectionData) do
		if collectionInfo.seasonId == self.seasonId then
			local itemCount = ClientUtils.getItemCountById(itemId)

			if pg.me:isInSelfHomeland() then
				itemCount = itemCount + ClientUtils.getHomelandItemCountById(itemId)
			end

			if itemCount > 0 then
				return true
			end
		end
	end

	return false
end

function HomelandCollectionCropCtrl:refreshCategoryCardRedDot(index, categoryData)
	if not index or not categoryData then
		return
	end

	local cardButton = self.view["card" .. index .. "UButton"]
	local redDotPath = string.format(RedDotConst.RedDotPath.HOME_SEASON_MUTATION_CATEGORY_CARD, self.seasonId, index)
	local showRedDot = HomeSeasonUtils.hasCollectableHomeSeasonMutationCrop(pg.me, self.seasonId, categoryData.typeId) or false

	pg.global.setRedDot(redDotPath, cardButton, showRedDot, RedDotConst.RedDotStyle.POINT)
end

function HomelandCollectionCropCtrl:openCategoryDetail(index)
	local categoryData = self.categoryList and self.categoryList[index]

	if not categoryData then
		return
	end

	pg.global.ui:open(UIConst.UI_ID_HOME_SEASON_COLLECTIONCROP_DETAIL, {
		typeId = categoryData.typeId,
		moduleId = self.moduleId
	})
end

function HomelandCollectionCropCtrl:getCategoryList()
	local categoryList = {}

	for typeId, categoryInfo in pairs(HomeSeasonMutationCategoryData or EMPTY_TABLE) do
		if categoryInfo.seasonId == self.seasonId then
			categoryList[#categoryList + 1] = {
				typeId = typeId,
				name = categoryInfo.name,
				icon = categoryInfo.icon,
				maxCount = categoryInfo.num or 0
			}
		end
	end

	table.sort(categoryList, function(a, b)
		return a.typeId < b.typeId
	end)

	return categoryList
end

function HomelandCollectionCropCtrl:getRewardListData(currentTotalStar)
	local rewardReceivedMap = pg.me and pg.me.homeSeasonMutationRewardReceived or {}
	local rewardListData = {}
	local maxRewardStar = 0

	for rewardId, rewardInfo in pairs(HomeSeasonMutationCollectionRewardData or EMPTY_TABLE) do
		if rewardInfo.seasonId == self.seasonId then
			local needPoint = rewardInfo.needPoint or 0

			rewardListData[#rewardListData + 1] = {
				id = rewardId,
				numMax = needPoint,
				rewardId = rewardInfo.reward,
				isReceived = rewardReceivedMap[rewardId] == true,
				canReceive = needPoint <= currentTotalStar
			}
			maxRewardStar = math.max(maxRewardStar, needPoint)
		end
	end

	table.sort(rewardListData, function(a, b)
		if a.numMax == b.numMax then
			return a.id < b.id
		end

		return a.numMax < b.numMax
	end)

	local previousNeedPoint = 0

	for _, rewardData in ipairs(rewardListData) do
		rewardData.numMin = previousNeedPoint
		previousNeedPoint = rewardData.numMax
	end

	return rewardListData, maxRewardStar
end

function HomelandCollectionCropCtrl:refreshCollectionCropPageInfo()
	if not self.seasonId or self.seasonId == 0 then
		return
	end

	local moduleInfo = HomeSeasonModuleData[self.moduleId]

	if moduleInfo then
		ClientTextUtils.setText(self.view.tMPUSDFText, ClientTextUtils.getLocalizationText(moduleInfo.name))
	else
		ClientTextUtils.setText(self.view.tMPUSDFText, "")
	end

	ClientTextUtils.setText(self.view.txtDecomposeUSDFText, pg.getGameString("CONSOLE_BAR_DECOMPOSE"))
	ClientTextUtils.setText(self.view.txtExchangeUSDFText, pg.getGameString("HOMELAND_SEASON_CROP_EXCHANGE"))

	local countBySeasonType = pg.me.homeSeasonMutationCountBySeasonType or {}
	local starBySeason = pg.me.homeSeasonMutationStarBySeason or {}
	local categoryCountMap = countBySeasonType[self.seasonId] or {}
	local currentTotalStar = starBySeason[self.seasonId] or 0
	local rewardListData, maxRewardStar = self:getRewardListData(currentTotalStar)

	for index = 1, CATEGORY_CARD_COUNT do
		local categoryData = self.categoryList[index]
		local iconImage = self.view["iconUImage" .. index]
		local nameText = self.view["txtNameUSDFText" .. index]
		local progressText = self.view["txtNumUSDFText" .. index]
		local cardButton = self.view["card" .. index .. "UButton"]

		if categoryData then
			local collectedCount = categoryCountMap[categoryData.typeId] or 0

			cardButton:TryChangePage("Finish", collectedCount >= categoryData.maxCount and 1 or 0)

			if iconImage and nameText and progressText then
				iconImage.url = categoryData.icon or ""

				ClientTextUtils.setText(nameText, ClientTextUtils.getLocalizationText(categoryData.name))
				ClientTextUtils.setText(progressText, string.format("%d/%d", collectedCount, categoryData.maxCount))
			end
		else
			cardButton:TryChangePage("Finish", 0)

			if iconImage and nameText and progressText then
				iconImage.url = ""

				ClientTextUtils.setText(nameText, "")
				ClientTextUtils.setText(progressText, "")
			end
		end

		self:refreshCategoryCardRedDot(index, categoryData)
	end

	self.view.rootComponent:TryChangePage("FillColorSwitch", currentTotalStar > 0 and 0 or 1)
	ClientTextUtils.setText(self.view.txtNumUSDFText, pg.getFormatText(pg.getGameString("HOME_BOOK_COLLECTION_PROGRESS_COUNT"), currentTotalStar, maxRewardStar))
	ClientTextUtils.setText(self.view.progressNameText, pg.getGameString("HOME_BOOK_COLLECTION_PROGRESS"))
	self.view.listCurrencyUList:SetActive(false)
	self.view.listUList:SetList(rewardListData)
	self:refreshRemainTime()
end

function HomelandCollectionCropCtrl:renderRewardItem(button, index, data)
	if not data then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local rewardItemUButton = objectReference:GetRefValue("rewardItemUButton")
	local numUSDFText = objectReference:GetRefValue("numUSDFText")
	local progress2UProgress = objectReference:GetRefValue("progress2UProgress")
	local starBySeason = pg.me.homeSeasonMutationStarBySeason or {}
	local currentTotalStar = starBySeason[self.seasonId] or 0

	progress2UProgress.maxValue = 1
	progress2UProgress.minValue = 0

	if currentTotalStar >= data.numMax then
		progress2UProgress.value = 1
	elseif currentTotalStar < data.numMin or data.numMax <= data.numMin then
		progress2UProgress.value = 0
	else
		progress2UProgress.value = (currentTotalStar - data.numMin) / (data.numMax - data.numMin)
	end

	ClientTextUtils.setText(numUSDFText, data.numMax)

	local rewardList = LuaUIUtils.getRewardItemByDropId(data.rewardId[1])
	local renderData = rewardList[1]

	if not renderData then
		rewardItemUButton:SetActive(false)

		return
	end

	rewardItemUButton:SetActive(true)

	if data.isReceived then
		renderData.state = 1
	elseif data.canReceive then
		renderData.state = 2
	else
		renderData.state = 0
	end

	renderData.extraFunc = nil

	if data.canReceive and not data.isReceived then
		function renderData.extraFunc()
			self:receiveAllRewards()
		end
	end

	LuaUIUtils.renderRewardItem(rewardItemUButton, renderData)

	local redDotPath = string.format(RedDotConst.RedDotPath.HOME_SEASON_MUTATION_REWARD_ITEM, self.seasonId, data.id)
	local showRedDot = data.canReceive and not data.isReceived

	pg.global.setRedDot(redDotPath, rewardItemUButton, showRedDot, RedDotConst.RedDotStyle.REWARD)
end

function HomelandCollectionCropCtrl:receiveAllRewards()
	if self.isReceivingReward then
		return
	end

	local starBySeason = pg.me.homeSeasonMutationStarBySeason or {}
	local currentTotalStar = starBySeason[self.seasonId] or 0
	local rewardListData = self:getRewardListData(currentTotalStar)
	local rewardIds = {}

	for _, rewardData in ipairs(rewardListData) do
		if rewardData.canReceive and not rewardData.isReceived then
			table.insert(rewardIds, rewardData.id)
		end
	end

	if #rewardIds == 0 then
		return
	end

	self.isReceivingReward = true

	pg.me:reqReceiveHomeSeasonMutationReward(rewardIds, function(result)
		self.isReceivingReward = false

		if result ~= NoticeDef.SUCCESS then
			return
		end

		local redDotPath = string.format(RedDotConst.RedDotPath.HOME_SEASON_ITEM_COLLECT_ENTRY, self.seasonId)

		pg.global.refreshRedDotState(redDotPath)

		if self.view then
			self:refreshCollectionCropPageInfo()
		end
	end)
end

function HomelandCollectionCropCtrl:onMutationCollectionChanged()
	if not self.view then
		return
	end

	self:refreshCollectionCropPageInfo()
end

function HomelandCollectionCropCtrl:onMutationCropItemCountChanged(data)
	if not self.view or not data then
		return
	end

	local changedItemId = data.itemId or data.genId
	local collectionInfo = changedItemId and HomeSeasonMutationCollectionData[changedItemId]

	if not collectionInfo or collectionInfo.seasonId ~= self.seasonId then
		return
	end

	for index, categoryData in ipairs(self.categoryList) do
		if categoryData.typeId == collectionInfo.typeid then
			self:refreshCategoryCardRedDot(index, categoryData)

			return
		end
	end
end

function HomelandCollectionCropCtrl:getMutationBonusData()
	local player = pg.me
	local now = Time.secondCache or Time.getSecond()

	if not player or not pg.space or not player:isInSelfHomeland() or self.seasonId ~= player.homeSeasonId or not HomeSeasonUtils.isSeasonAvailable(player, now) or self.seasonEndTime and now >= self.seasonEndTime then
		return
	end

	local levels = HomeSeasonMutationHarvestIndexData.countLevelsBySeason[self.seasonId]

	if not levels or #levels == 0 then
		return
	end

	local harvestCount = pg.space:getHomeSeasonCropHarvestCount(self.seasonId)
	local level = 0

	for i = #levels, 1, -1 do
		if harvestCount >= levels[i].itemNum then
			level = i

			break
		end
	end

	local currentLevel = levels[level]
	local nextLevel = levels[level + 1]
	local maxCount = levels[#levels].itemNum

	return {
		level = level,
		isMax = nextLevel == nil,
		progress = string.format("%d/%d", math.min(harvestCount, maxCount), nextLevel and nextLevel.itemNum or maxCount),
		currentConfig = currentLevel and HomeSeasonMutationCountLevelData[currentLevel.levelId],
		nextConfig = nextLevel and HomeSeasonMutationCountLevelData[nextLevel.levelId]
	}
end

function HomelandCollectionCropCtrl:refreshMutationBonus()
	if not self.view then
		return
	end

	local button = self.view.btnMutationUButton
	local data = self:getMutationBonusData()

	self.view.mutationKeyUWidget:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, data == nil)

	if not data then
		button:CloseTooltip()
		button:SetActive(false)

		self.mutationTooltip = nil

		return
	end

	button:SetActive(true)
	button:TryChangePage("Level", data.level > 0 and 1 or 0)

	local levelText = data.isMax and pg.getGameString("PET_TRAINING_MAX") or pg.getGameString("LEVEL_LITE") .. data.level

	ClientTextUtils.setText(self.view.mutationCountText, data.progress)
	ClientTextUtils.setText(self.view.mutationLevelText, levelText)

	if self.mutationTooltip and not UIUtils.IsNull(self.mutationTooltip) then
		self:renderMutationBonusTooltip(self.mutationTooltip, data, levelText)
	end
end

function HomelandCollectionCropCtrl:onMutationHarvestCountChanged(data)
	if data and data.seasonId == self.seasonId then
		self:refreshMutationBonus()
	end
end

function HomelandCollectionCropCtrl:appendMutationBonusRows(rows, config, isNext)
	if not config then
		return
	end

	rows[#rows + 1] = {
		tIndex = 0,
		textKey = isNext and "SEASON_MUTE_NEXT_LEVEL" or "SEASOM_MUTE_CURR_BUFF",
		isNext = isNext
	}

	for mutationType = 1, 4 do
		local ratio = config["showRatio" .. mutationType]

		if ratio and ratio > 0 then
			rows[#rows + 1] = {
				tIndex = 1,
				textKey = "SEASON_MUTE_RATIO_TYPE" .. mutationType,
				ratio = ratio,
				isNext = isNext
			}
		end
	end
end

function HomelandCollectionCropCtrl:renderMutationBonusRow(button, data)
	local refs = button:GetComponent("ObjectReference")

	ClientTextUtils.setText(refs:GetRefValue("txtTitleUSDFText"), pg.getGameString(data.textKey))
	button:TryChangePage(data.tIndex == 0 and "BuffTitle" or "Buff", data.isNext and 0 or 1)

	if data.tIndex == 1 then
		ClientTextUtils.setText(refs:GetRefValue("txtNumUSDFText"), string.format("+%g%%", data.ratio * 100))
	end
end

function HomelandCollectionCropCtrl:renderMutationBonusTooltip(popup, data, levelText)
	local content = popup:GetComponent("ObjectReference"):GetRefValue("contectUWidget")
	local refs = content:GetComponent("ObjectReference")

	ClientTextUtils.setText(refs:GetRefValue("txtTitleUSDFText"), pg.getGameString("SEASON_MUTE_RATIO_TITLE"))

	local detailsScroll = refs:GetRefValue("scrollRectUScrollRect")

	ClientTextUtils.setText(detailsScroll.content, pg.getGameString("SEASON_MUTE_RATIO_DESC"))
	ClientTextUtils.setText(refs:GetRefValue("numTitleText"), pg.getGameString("SEASOM_MUTE_CURR_LEVEL"))
	ClientTextUtils.setText(refs:GetRefValue("txtNumUSDFText"), data.progress)
	ClientTextUtils.setText(refs:GetRefValue("levelText"), levelText)
	refs:GetRefValue("levelUComponent"):TryChangePage("Level", data.level > 0 and 1 or 0)

	local rows = {}

	self:appendMutationBonusRows(rows, data.currentConfig, false)
	self:appendMutationBonusRows(rows, data.nextConfig, true)

	if data.isMax then
		rows[#rows + 1] = {
			tIndex = 0,
			textKey = "FULL_LEVELED"
		}
	end

	local list = refs:GetRefValue("listBonusUList")

	function list.luaRenderItem(button, index, row)
		self:renderMutationBonusRow(button, row)
	end

	list:SetList(rows)
end

function HomelandCollectionCropCtrl:onShow()
	UICtrl.onShow(self)
	self:refreshMutationBonus()
end

function HomelandCollectionCropCtrl:onHide()
	UICtrl.onHide(self)
	self.view.btnMutationUButton:CloseTooltip()

	self.mutationTooltip = nil
end

function HomelandCollectionCropCtrl:refreshRemainTime()
	self:refreshMutationBonus()

	if not self.seasonId or self.seasonId == 0 then
		ClientTextUtils.setText(self.view.txtTipsUSDFText, "")
		self:stopRemainTimeTimer()

		return
	end

	local remainTime = 0

	if self.seasonEndTime then
		remainTime = math.max(0, self.seasonEndTime - (Time.secondCache or Time.getSecond()))
	end

	local remainTimeText = TimeUtils.getRemainTimeShort(remainTime)

	ClientTextUtils.setText(self.view.txtTipsUSDFText, pg.getFormatText(pg.getGameString("HOMELAND_SEASON_CROP_REMAIN_TIME"), remainTimeText))

	if remainTime <= 0 then
		self:stopRemainTimeTimer()
	end
end

function HomelandCollectionCropCtrl:startRemainTimeTimer()
	self:stopRemainTimeTimer()
	self:refreshRemainTime()

	if self.seasonEndTime and self.seasonEndTime > (Time.secondCache or Time.getSecond()) then
		self.remainTimeTimer = self:startTimer(function()
			if self.view then
				self:refreshRemainTime()
			end
		end, REMAIN_TIME_REFRESH_INTERVAL, true)
	end
end

function HomelandCollectionCropCtrl:stopRemainTimeTimer()
	if self.remainTimeTimer then
		self:killTimer(self.remainTimeTimer)

		self.remainTimeTimer = nil
	end
end

function HomelandCollectionCropCtrl:onDestroy()
	self.mutationTooltip = nil

	self:stopRemainTimeTimer()
	UICtrl.onDestroy(self)
end

return HomelandCollectionCropCtrl
