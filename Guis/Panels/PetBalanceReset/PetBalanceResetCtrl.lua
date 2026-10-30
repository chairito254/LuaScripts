-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetBalanceReset\\PetBalanceResetCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local ClientConst = require("Const.ClientConst")
local UIConst = require("Const.UIConst")
local Time = require("Core.Common.Time")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local ItemUtils = require("Common.Utils.ItemUtils")
local PetBalanceResetUtils = require("Common.Utils.PetBalanceResetUtils")
local PetAttributeCalcUtils = require("Common.Utils.PetAttributeCalcUtils")
local PetBalanceResetText = require("Utils.PetBalanceResetText")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementUtils = require("Utils.PetManagementUtils")
local PetData = require("Data.pet_data")
local PetBalanceResetCtrl = Class.LightClass("PetBalanceResetCtrl", UICtrl)
local CONFIRM_HIDE_PREFS_KEY = "petBalanceResetConfirmHideTs"
local CONFIRM_HIDE_SECONDS = 86400

PetBalanceResetCtrl.messages = {
	[MessageName.ON_PET_BALANCE_RESET] = {
		"onPetBalanceReset",
		true
	}
}

function PetBalanceResetCtrl:checkOpenExtra(info)
	if not info or type(info.petId) ~= "string" or info.petId == "" then
		return false
	end

	return true
end

function PetBalanceResetCtrl:addListener()
	self:bindCommonCloseHotKey(function()
		self:close()
	end)

	function self.view.btnClockUButton.luaClick()
		self:close()
	end

	function self.view.btnEnterUButton.luaClick()
		self:onEnter()
	end

	function self.view.listUList.luaRenderItem(button, _, data)
		LuaUIUtils.renderItem(button, data)
	end
end

function PetBalanceResetCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.petId = info.petId
	self._hintSelected = nil

	self:refreshView()
	self:_restartCountdown()
end

function PetBalanceResetCtrl:onDestroy()
	self:_stopCountdown()
	UICtrl.onDestroy(self)
end

function PetBalanceResetCtrl:onHide()
	self:_stopCountdown()
	UICtrl.onHide(self)
end

function PetBalanceResetCtrl:onPetBalanceReset(body)
	if not Utils.isTable(body) or body.petId ~= self.petId then
		return
	end

	if body.success then
		self:close()

		return
	end

	self:refreshView()
end

function PetBalanceResetCtrl:refreshView()
	ClientTextUtils.setText(self.view.txtTitleUSDFText, PetBalanceResetText.get("PET_BALANCE_RESET_TITLE"))
	ClientTextUtils.setText(self.view.txtContentUSDFText, PetBalanceResetText.get("PET_BALANCE_RESET_DESC"))
	ClientTextUtils.setText(self.view.imgArrowUSDFText, PetBalanceResetText.get("PET_BALANCE_RESET_TITLE"))
	ClientTextUtils.setText(self.view.btnClockNameUText, pg.getGameString("BATTLEPASS_BUYLEVEL_CANCEL"))
	ClientTextUtils.setText(self.view.btnEnterNameUText, pg.getGameString("PETTRANSMOGRIFY_DELETE_ENTER_OK"))

	self._blockReason = nil
	self._rewardCount = 0

	local manage = pg.game.petManage
	local state = manage and manage:getVisiblePetBalanceResetState(self.petId)

	if manage and manage.balanceResetRequester and not manage.balanceResetRequester:isIdle() then
		self._blockReason = "pending"
	elseif not state then
		self._blockReason = "unavailable"
	end

	self:_refreshCountdownText(state)

	local beforeInfo, afterInfo = self:_buildSnapshots()

	self:_renderSide(self.view.leftPetRemoveUComponent, beforeInfo)
	self:_renderSide(self.view.rightPetRemoveUComponent, afterInfo)
	self.view.listUList:SetList(self._rewardItems or {})
end

function PetBalanceResetCtrl:onEnter()
	self:refreshView()

	if self._blockReason == "pending" then
		pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_RESULT_PENDING"), 2)

		return
	end

	if self._blockReason then
		pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_UNAVAILABLE"), 2)

		return
	end

	if self._rewardCount <= 0 then
		pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_EMPTY"), 2)

		return
	end

	local hintShowTs = pg.global.prefsCacheUtils:getInt(CONFIRM_HIDE_PREFS_KEY, 0, ClientConst.CACHE_TYPE_FLAG.USER)

	if hintShowTs + CONFIRM_HIDE_SECONDS > Time.secondCache then
		self:_submit()

		return
	end

	self._hintSelected = nil

	pg.global.showConfirmMsgRaw(PetBalanceResetText.get("PET_BALANCE_RESET_TITLE"), PetBalanceResetText.get("PET_BALANCE_RESET_DESC"), function()
		if self._hintSelected then
			pg.global.prefsCacheUtils:setInt(CONFIRM_HIDE_PREFS_KEY, Time.secondCache, ClientConst.CACHE_TYPE_FLAG.USER)
			pg.global.prefsCacheUtils:save()
		end

		self:_submit()
	end, false, nil, nil, nil, {
		hint = true,
		hintDesc = string.format(pg.getGameString("DISABLE_HINT"), 1),
		hintCb = function(isSelected)
			if isSelected then
				self._hintSelected = true
			else
				self._hintSelected = nil
			end
		end
	})
end

function PetBalanceResetCtrl:_submit()
	self:refreshView()

	if self._blockReason == "pending" then
		pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_RESULT_PENDING"), 2)

		return
	end

	if self._blockReason then
		pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_UNAVAILABLE"), 2)

		return
	end

	if self._rewardCount <= 0 then
		pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_EMPTY"), 2)

		return
	end

	local manage = pg.game.petManage

	if not manage then
		return
	end

	local started, reason = manage:tryPetBalanceReset(self.petId)

	if started then
		return
	end

	if reason == "pending" or reason == "busy" then
		pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_RESULT_PENDING"), 2)

		return
	end

	pg.global.showBubbleMessageRaw(PetBalanceResetText.get("PET_BALANCE_RESET_UNAVAILABLE"), 2)
end

function PetBalanceResetCtrl:_buildSnapshots()
	self._rewardItems = {}

	local player = pg.me
	local petInfo = player and player.pets and player.pets[self.petId]

	if not petInfo then
		return nil, nil
	end

	local counts, resetData = ItemUtils.getPetBalanceResetBackItem(player, self.petId, true, petInfo)
	local items = {}

	for itemId, num in pairs(counts) do
		local count = tonumber(num) or 0

		if count > 0 then
			items[#items + 1] = {
				id = itemId,
				num = count
			}
		end
	end

	table.sort(items, function(left, right)
		return tostring(left.id) < tostring(right.id)
	end)

	self._rewardItems = items
	self._rewardCount = #items

	local beforeInfo = PetBalanceResetUtils.buildPreview(petInfo, {})
	local afterInfo = PetBalanceResetUtils.buildPreview(petInfo, resetData)

	return beforeInfo, afterInfo
end

function PetBalanceResetCtrl:_renderSide(component, snapshot)
	if not NotNil(component) or not snapshot then
		return
	end

	local objectReference = component:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	self:_renderQuality(component, snapshot)

	local levelText = objectReference:GetRefValue("txtLevelUSDFText")

	if NotNil(levelText) then
		ClientTextUtils.setText(levelText, ClientTextUtils.formatShortLevel(snapshot.level or 0))
	end

	self:_renderStars(objectReference, snapshot)

	local detail = objectReference:GetRefValue("detailUWidget")

	if NotNil(detail) then
		self:_renderDimension(detail, snapshot)
	end

	self:_renderHead(objectReference, snapshot)
	self:_bindDetailTips(objectReference, snapshot)
end

function PetBalanceResetCtrl:_renderQuality(component, snapshot)
	local ratingStage = snapshot.propertyScoreStage or 1

	if ratingStage < 1 then
		ratingStage = 1
	end

	if ratingStage > 4 then
		ratingStage = 4
	end

	component:TryChangePage("Quality", ratingStage - 1)
end

function PetBalanceResetCtrl:_renderStars(objectReference, snapshot)
	local starUContainer = objectReference:GetRefValue("starUContainer")

	if not NotNil(starUContainer) then
		return
	end

	local resonanceInfo = snapshot.resonanceInfo
	local stage = resonanceInfo and resonanceInfo.resonanceStage or 0
	local level = resonanceInfo and resonanceInfo.resonanceLevel or 0

	if stage <= 0 and level <= 0 then
		starUContainer:SetActive(false)

		return
	end

	starUContainer:SetActive(true)

	local petId = snapshot.id

	starUContainer:SetUrlWithCallback(LuaUIUtils.getStarItemUrl(stage), function()
		if not NotNil(starUContainer) then
			return
		end

		local starUCont = starUContainer.content

		if not NotNil(starUCont) then
			return
		end

		local PetResonaceStarComponent = require("Guis.Panels.PetTrainingNew.Component.SubNodeComps.PetResonaceStarComponent")
		local starComp = PetResonaceStarComponent.new(starUCont)

		if not starComp then
			return
		end

		starComp:updateAndRefresh(petId, {
			stage = stage,
			lv = level,
			pos = UIConst.STARCOMP_POS.PETINFO
		}, true)

		local maxStage, maxLv = PetManagementUtils.getResonanceMaxStageLv()
		local isMax = maxStage and maxLv and maxStage <= stage and maxLv <= level

		if not isMax then
			starUCont:TryChangePage("State", 1)
		end
	end)
end

function PetBalanceResetCtrl:_renderHead(objectReference, snapshot)
	local head = objectReference:GetRefValue("petHeadUComponent")

	if not NotNil(head) then
		return
	end

	local headReference = head:GetComponent("ObjectReference")

	if not headReference then
		return
	end

	local petData = PetData[snapshot.templateId] or {}
	local iconUImage = headReference:GetRefValue("iconUImage")

	if NotNil(iconUImage) then
		iconUImage.url = LuaUIUtils.getPetIcon(petData.iconName, LuaUIUtils.PET_ICON, snapshot.label, snapshot.gender)
	end

	local shinyStyle = snapshot.shinyStyle or 0

	if Utils.isLabelShiny(snapshot.label) then
		if shinyStyle == Const.PET_SHINY_STYLE.BLACK then
			head:TryChangePage("isFlash", 2)
		elseif shinyStyle == Const.PET_SHINY_STYLE.WHITE then
			head:TryChangePage("isFlash", 3)
		else
			head:TryChangePage("isFlash", 1)
		end
	else
		head:TryChangePage("isFlash", 0)
	end

	local umbralUContainer = headReference:GetRefValue("umbralUContainer")

	if NotNil(umbralUContainer) then
		if Utils.isLabelDark(snapshot.label) then
			umbralUContainer:SetActive(true)
			umbralUContainer:LoadDefaultUrlManually()
		else
			umbralUContainer:SetActive(false)
		end
	end

	local imgBgBattle = headReference:GetRefValue("imgBgBattle")

	if NotNil(imgBgBattle) then
		imgBgBattle:SetActive(false)
	end
end

function PetBalanceResetCtrl:_bindDetailTips(objectReference, snapshot)
	local btnTips = objectReference:GetRefValue("btnTipsUButton")

	if not NotNil(btnTips) then
		return
	end

	function btnTips.luaClick()
		pg.global.ui:open(UIConst.UI_ID_PET_PROPERTY, {
			curPetId = snapshot.id,
			sourcePetInfo = snapshot
		})
	end
end

local DIMENSION_LEVEL_KEYS = {
	"hpLv",
	"atkLv",
	"defLv",
	"regenLv",
	"defMagLv",
	"atkMagLv"
}
local DIMENSION_NUM_KEYS = {
	"hpNum",
	"atkNum",
	"defNum",
	"regenNum",
	"defMagNum",
	"atkMagNum"
}

function PetBalanceResetCtrl:_renderDimension(detail, snapshot)
	local objectReference = detail:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	local defaultRadar = objectReference:GetRefValue("defaultRadar")

	if not defaultRadar then
		return
	end

	local baseProperty = snapshot.basePropertyList

	for index = Const.BASE_PROPERTY_HP_IDX, Const.BASE_PROPERTY_ATK_MAG_IDX do
		local levelText = objectReference:GetRefValue(DIMENSION_LEVEL_KEYS[index])
		local prop = baseProperty and baseProperty[index]

		if levelText and prop then
			ClientTextUtils.setText(levelText, tostring(prop.indLv or 0))
		end
	end

	if not pg.game.petManage then
		return
	end

	snapshot.calculatedAttributeMap, snapshot.extraSrcMap = PetAttributeCalcUtils.getAttributeMapByPetInfoWithoutEntity(pg.me, snapshot)

	local propLevels = pg.game.petManage:getPetPropLevels(snapshot)
	local defaultRatio = {}
	local addedRatio = {}
	local trained = 0

	for index = Const.BASE_PROPERTY_HP_IDX, Const.BASE_PROPERTY_ATK_MAG_IDX do
		local propLevel = propLevels[index] or {}
		local maxLevel = propLevel.max or 1

		if maxLevel <= 0 then
			maxLevel = 1
		end

		defaultRatio[index] = (propLevel.complexBaseLv or 0) / maxLevel
		addedRatio[index] = (propLevel.baseAndActiveTotalLv or 0) / maxLevel

		if (propLevel.learnt or 0) > 0 then
			trained = trained + 1
		end

		local numText = objectReference:GetRefValue(DIMENSION_NUM_KEYS[index])

		if numText and propLevel.propDisplayVal then
			ClientTextUtils.setText(numText, tostring(math.ceil(propLevel.propDisplayVal)))
		end
	end

	defaultRadar:SetSixProps(defaultRatio[Const.BASE_PROPERTY_HP_IDX], defaultRatio[Const.BASE_PROPERTY_ATK_IDX], defaultRatio[Const.BASE_PROPERTY_DEF_IDX], defaultRatio[Const.BASE_PROPERTY_EP_REGEN_FORCE_IDX], defaultRatio[Const.BASE_PROPERTY_DEF_MAG_IDX], defaultRatio[Const.BASE_PROPERTY_ATK_MAG_IDX])

	local addedRadar = objectReference:GetRefValue("addedRadar")

	if not addedRadar then
		return
	end

	addedRadar:SetSixProps(addedRatio[Const.BASE_PROPERTY_HP_IDX], addedRatio[Const.BASE_PROPERTY_ATK_IDX], addedRatio[Const.BASE_PROPERTY_DEF_IDX], addedRatio[Const.BASE_PROPERTY_EP_REGEN_FORCE_IDX], addedRatio[Const.BASE_PROPERTY_DEF_MAG_IDX], addedRatio[Const.BASE_PROPERTY_ATK_MAG_IDX])

	if addedRadar.transform and addedRadar.transform.gameObject then
		addedRadar.transform.gameObject:SetActiveEx(trained > 0)
	end
end

function PetBalanceResetCtrl:_refreshCountdownText(state)
	if not self.view.txtDrowUSDFText then
		return
	end

	if not state then
		ClientTextUtils.setText(self.view.txtDrowUSDFText, PetBalanceResetText.get("PET_BALANCE_RESET_UNAVAILABLE"))

		return
	end

	local left = math.max((tonumber(state.endTime) or 0) - Time.secondCache, 0)

	ClientTextUtils.setText(self.view.txtDrowUSDFText, self:_formatCountdown(left))
end

function PetBalanceResetCtrl:_formatCountdown(seconds)
	local count, unitKey = PetBalanceResetUtils.getCountdownUnitKey(seconds)
	local template = PetBalanceResetText.get("PET_BALANCE_RESET_TIME_LEFT")
	local value = tostring(count) .. pg.getGameString(unitKey)

	if not string.find(template, "{0}", 1, true) then
		return template .. value
	end

	return pg.getFormatText(template, value)
end

function PetBalanceResetCtrl:_restartCountdown()
	self:_stopCountdown()

	self._countdownTimerId = self:startTimer(function()
		local manage = pg.game.petManage
		local state = manage and manage:getVisiblePetBalanceResetState(self.petId)

		if not state then
			self._blockReason = "unavailable"
		end

		self:_refreshCountdownText(state)
	end, 1, true)
end

function PetBalanceResetCtrl:_stopCountdown()
	if self._countdownTimerId then
		self:killTimer(self._countdownTimerId)

		self._countdownTimerId = nil
	end
end

return PetBalanceResetCtrl
