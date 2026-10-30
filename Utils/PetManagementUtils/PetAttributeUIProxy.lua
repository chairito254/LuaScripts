-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetAttributeUIProxy.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local Const = require("Common.Const.Const")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local PetData = require("Data.pet_data")
local PetConfigData = require("Data.pet_config_data")
local PetPropLevelMaxData = require("Data.pet_prop_level_max")
local Utils = require("Common.Utils.Utils")
local TimerManager = require("Core.Timer.TimerManager")
local NoticeDef = require("Common.NoticeDef")
local ItemUtils = require("Common.Utils.ItemUtils")
local ItemConst = require("Common.Const.ItemConst")
local BaseProperty = require("CustomTypes.BaseProperty")

return function(PetManagementUtils)
	function PetManagementUtils._setTotalAttribute(petId)
		local pet = pg.me:getPetInfo(petId)

		if pet == nil then
			return
		end

		local propLevels = pg.game.petManage:getPetPropLevels(pet)

		for i = Const.BASE_PROPERTY_HP_IDX, Const.BASE_PROPERTY_ATK_MAG_IDX do
			local propName = pg.getLocalizationText(propLevels[i].l18nNameKey or "")

			ClientTextUtils.setText(PetManagementUtils.propTitleGroup[i], propName)
			ClientTextUtils.setText(PetManagementUtils.propTitle2Group[i], propName)
		end

		PetManagementUtils.renderPetAttributeInner(pet, PetManagementUtils, nil, nil, PetManagementUtils.param)
		PetManagementUtils._ratioAttribute(pet)
		LuaUIUtils.applyPetSeasonLimitedBadge(PetManagementUtils.detail, pet.petPrototypeId or pet.templateId)
	end

	function PetManagementUtils._ratioAttribute(pet)
		if not pet or pet.isCatchReporting and pet:isCatchReporting() then
			PetManagementUtils.root:TryChangePage("NotVerified", 1)
		else
			PetManagementUtils.root:TryChangePage("NotVerified", 0)
		end

		if not PetManagementUtils.newRatioNodeUComp then
			return
		end

		PetManagementUtils.setPetRatioUINode(pet, PetManagementUtils.newRatioNodeUComp)
	end

	function PetManagementUtils._previewMaxLevel(needModify)
		local pet = pg.me:getPetInfo(PetManagementUtils.petId)

		if pet == nil then
			return
		end

		if needModify then
			PetManagementUtils.previewed = not PetManagementUtils.previewed
		end

		PetManagementUtils.root:TryChangePage("MaxLevel", PetManagementUtils.previewed and 1 or 0)
		PetManagementUtils.addedRadar.transform.gameObject:SetActiveEx(true)

		if PetManagementUtils.previewed then
			Utils.genBasePropertyPreview(pet, Const.PROP_PREVIEW_MAX_LEVEL, {}, function(result)
				local addedRatioGroup = {}

				for i = Const.BASE_PROPERTY_HP_IDX, Const.BASE_PROPERTY_ATK_MAG_IDX do
					ClientTextUtils.setText(PetManagementUtils.propNumGroup[i], result[i].displayValue)
					ClientTextUtils.setText(PetManagementUtils.propLevelGroup[i], result[i].indLv)

					if result[i].iLvLn > 0 then
						PetManagementUtils.propCmpGroup[i]:TryChangePage("State", 1)
						PetManagementUtils.propLevelCmpGroup[i]:TryChangePage("State", 1)
					else
						PetManagementUtils.propCmpGroup[i]:TryChangePage("State", 0)
						PetManagementUtils.propLevelCmpGroup[i]:TryChangePage("State", 0)
					end

					if result[i].indLv >= PetPropLevelMaxData[i] then
						PetManagementUtils.propCmpGroup[i]:TryChangePage("State", 2)
						PetManagementUtils.propLevelCmpGroup[i]:TryChangePage("State", 2)
					end

					addedRatioGroup[i] = result[i].indLv / PetPropLevelMaxData[i]
				end

				PetManagementUtils.addedRadar:SetSixProps(addedRatioGroup[Const.BASE_PROPERTY_HP_IDX], addedRatioGroup[Const.BASE_PROPERTY_ATK_IDX], addedRatioGroup[Const.BASE_PROPERTY_DEF_IDX], addedRatioGroup[Const.BASE_PROPERTY_EP_REGEN_FORCE_IDX], addedRatioGroup[Const.BASE_PROPERTY_DEF_MAG_IDX], addedRatioGroup[Const.BASE_PROPERTY_ATK_MAG_IDX])
			end)
		else
			PetManagementUtils._setTotalAttribute(PetManagementUtils.petId)
		end
	end

	function PetManagementUtils.generatePetAttributeRef(button)
		local ret = {}
		local objectReference = button:GetComponent("ObjectReference")
		local hpNum = objectReference:GetRefValue("hpNum")
		local atkNum = objectReference:GetRefValue("atkNum")
		local defNum = objectReference:GetRefValue("defNum")
		local regenNum = objectReference:GetRefValue("regenNum")
		local defMagNum = objectReference:GetRefValue("defMagNum")
		local atkMagNum = objectReference:GetRefValue("atkMagNum")

		ret.propNumGroup = {
			hpNum,
			atkNum,
			defNum,
			regenNum,
			defMagNum,
			atkMagNum
		}

		local hpCmp = objectReference:GetRefValue("hpCmp")
		local atkCmp = objectReference:GetRefValue("atkCmp")
		local defCmp = objectReference:GetRefValue("defCmp")
		local regenCmp = objectReference:GetRefValue("regenCmp")
		local defMagCmp = objectReference:GetRefValue("defMagCmp")
		local atkMagCmp = objectReference:GetRefValue("atkMagCmp")

		ret.propCmpGroup = {
			hpCmp,
			atkCmp,
			defCmp,
			regenCmp,
			defMagCmp,
			atkMagCmp
		}

		local hpLevelCmp = objectReference:GetRefValue("hpLevelCmp")
		local atkLevelCmp = objectReference:GetRefValue("atkLevelCmp")
		local defLevelCmp = objectReference:GetRefValue("defLevelCmp")
		local regenLevelCmp = objectReference:GetRefValue("regenLevelCmp")
		local defMagLevelCmp = objectReference:GetRefValue("defMagLevelCmp")
		local atkMagLevelCmp = objectReference:GetRefValue("atkMagLevelCmp")

		ret.propLevelCmpGroup = {
			hpLevelCmp,
			atkLevelCmp,
			defLevelCmp,
			regenLevelCmp,
			defMagLevelCmp,
			atkMagLevelCmp
		}

		local hpLv = objectReference:GetRefValue("hpLv")
		local atkLv = objectReference:GetRefValue("atkLv")
		local defLv = objectReference:GetRefValue("defLv")
		local regenLv = objectReference:GetRefValue("regenLv")
		local defMagLv = objectReference:GetRefValue("defMagLv")
		local atkMagLv = objectReference:GetRefValue("atkMagLv")

		ret.propLevelGroup = {
			hpLv,
			atkLv,
			defLv,
			regenLv,
			defMagLv,
			atkMagLv
		}

		local hpUpUBaseText = objectReference:GetRefValue("hpUpUBaseText")
		local atkUpUBaseText = objectReference:GetRefValue("atkUpUBaseText")
		local defUpUBaseText = objectReference:GetRefValue("defUpUBaseText")
		local regenUpUBaseText = objectReference:GetRefValue("regenUpUBaseText")
		local defMsgUpUBaseText = objectReference:GetRefValue("defMsgUpUBaseText")
		local atkMsgUpUBaseText = objectReference:GetRefValue("atkMsgUpUBaseText")

		ret.propNumUpGroup = {
			hpUpUBaseText,
			atkUpUBaseText,
			defUpUBaseText,
			regenUpUBaseText,
			defMsgUpUBaseText,
			atkMsgUpUBaseText
		}
		ret.defaultRadar = objectReference:GetRefValue("defaultRadar")
		ret.addedRadar = objectReference:GetRefValue("addedRadar")
		ret.btnDetailUButton = objectReference:GetRefValue("btnDetailUButton")

		return ret
	end

	function PetManagementUtils.renderPetAttribute(pet, button, individualPropUpMap, individualLevelUpMap, extraInfo)
		PetManagementUtils.renderPetAttributeInner(pet, PetManagementUtils.generatePetAttributeRef(button), individualPropUpMap, individualLevelUpMap, extraInfo)
	end

	function PetManagementUtils.clearPetAttributeTimer()
		if PetManagementUtils.propLevelUpTimer then
			for _, timer in pairs(PetManagementUtils.propLevelUpTimer) do
				TimerManager.removeTimer(timer)
			end
		end
	end

	function PetManagementUtils.handleAttributeTimer(index)
		if PetManagementUtils.propLevelUpTimer == nil then
			PetManagementUtils.propLevelUpTimer = {}
		end

		if PetManagementUtils.propLevelUpTimer[index] then
			TimerManager.removeTimer(PetManagementUtils.propLevelUpTimer[index])
		end
	end

	function PetManagementUtils.renderPetAttributeInner(petInfo, refContainer, individualPropUpMap, individualLevelUpMap, extraInfo)
		if petInfo == nil then
			return
		end

		if not refContainer.propNumGroup then
			return
		end

		local baseProperty = petInfo.basePropertyList
		local propertyEnhanced = Utils.isPetPropertyEnhanced(petInfo)
		local templateId = petInfo.templateId
		local petData = PetData[templateId]
		local recommend = petData.recommend_attr
		local propLevels = pg.game.petManage:getPetPropLevels(petInfo)
		local isHideVx = extraInfo and extraInfo.isHideVx or false

		PetManagementUtils.defaultRatioGroup = {}
		PetManagementUtils.addedRatioGroup = {}

		local isTrained = 0

		for i = Const.BASE_PROPERTY_HP_IDX, Const.BASE_PROPERTY_ATK_MAG_IDX do
			local propLevelInfo = propLevels[i]
			local baseAndLearnMax = propLevelInfo.max or 1
			local displayBaseLevel = propLevelInfo.complexBaseLv or 0
			local baseAndActiveTotalLv = propLevelInfo.baseAndActiveTotalLv or 0
			local displayLearnLevel = propLevelInfo.learnt or 0
			local displayValue = baseProperty[i].displayValue
			local petManagementDisplayValue = propLevelInfo.propDisplayVal
			local legacyDisplayValue = displayValue ~= nil and displayValue or petManagementDisplayValue
			local totalValue = extraInfo and extraInfo.usePetManagementDisplayValue and math.ceil(petManagementDisplayValue) or math.floor(legacyDisplayValue)

			if refContainer.propNumUpGroup and individualPropUpMap and individualPropUpMap[i] then
				local increaseValue = math.floor(individualPropUpMap[i] or 0)
				local oldValue = totalValue - increaseValue

				ClientTextUtils.setText(refContainer.propNumGroup[i], math.max(oldValue, 0))

				if increaseValue > 0 then
					local curIndex = i + 10

					PetManagementUtils.handleAttributeTimer(curIndex)
					ClientTextUtils.setText(refContainer.propNumUpGroup[i], "+" .. increaseValue)

					PetManagementUtils.propLevelUpTimer[curIndex] = TimerManager.addTimer(1, function()
						PetManagementUtils.propLevelUpTimer[curIndex] = nil

						refContainer.propCmpGroup[curIndex - 10]:InvokeCallback(CS.XGUI.EInvokeTime.User1)
					end)
				end
			else
				ClientTextUtils.setText(refContainer.propNumGroup[i], totalValue)
			end

			if individualLevelUpMap and individualLevelUpMap[i] then
				local totalValue = baseAndActiveTotalLv
				local increaceValue = individualLevelUpMap[i]
				local oldValue = totalValue - increaceValue

				ClientTextUtils.setText(refContainer.propLevelGroup[i], oldValue)
				PetManagementUtils.handleAttributeTimer(i)

				local curIndex = i

				PetManagementUtils.propLevelUpTimer[curIndex] = TimerManager.addTimer(1, function()
					PetManagementUtils.propLevelUpTimer[curIndex] = nil

					refContainer.propLevelCmpGroup[curIndex]:InvokeCallback(CS.XGUI.EInvokeTime.User1)
					ClientTextUtils.setText(refContainer.propLevelGroup[curIndex], baseProperty[curIndex].indLv or 0)
				end)
			else
				ClientTextUtils.setText(refContainer.propLevelGroup[i], baseAndActiveTotalLv)
			end

			refContainer.propCmpGroup[i].luaTooltipPopup = function(_, flag)
				refContainer.propCmpGroup[i]:TryChangePage("Selected", flag and 1 or 0)
			end
			refContainer.propCmpGroup[i].luaRenderTooltip = function(_, component)
				PetManagementUtils.customRefreshBuffInfoTooltip(component, PetManagementDataHelper.BuffInfoToolTipType.Cultivate, {
					index = i,
					recommend = recommend,
					propertyEnhanced = propertyEnhanced,
					propLevel = propLevels[i]
				})
			end

			if displayLearnLevel > 0 then
				refContainer.propCmpGroup[i]:TryChangePage("State", 1)
				refContainer.propLevelCmpGroup[i]:TryChangePage("State", 1)
			else
				refContainer.propCmpGroup[i]:TryChangePage("State", 0)
				refContainer.propLevelCmpGroup[i]:TryChangePage("State", 0)
			end

			if LuaUIUtils.tableContains(recommend, i) then
				refContainer.propCmpGroup[i]:TryChangePage("GoodState", 1)
			else
				refContainer.propCmpGroup[i]:TryChangePage("GoodState", 0)
			end

			refContainer.propLevelCmpGroup[i]:TryChangePage("Updated", propertyEnhanced and 1 or 0)

			if propertyEnhanced then
				refContainer.propLevelCmpGroup[i]:TryChangePage("State", 1)
			end

			if baseAndLearnMax <= baseAndActiveTotalLv then
				refContainer.propCmpGroup[i]:TryChangePage("State", 2)
				refContainer.propLevelCmpGroup[i]:TryChangePage("State", 2)
			end

			PetManagementUtils.defaultRatioGroup[i] = displayBaseLevel / baseAndLearnMax
			PetManagementUtils.addedRatioGroup[i] = baseAndActiveTotalLv / baseAndLearnMax

			if displayLearnLevel > 0 then
				isTrained = isTrained + 1
			end

			if NotNil(PetManagementUtils.btnDetailUButton) then
				function PetManagementUtils.btnDetailUButton.luaClick()
					PetManagementUtils._openPropertyPanel(petInfo.id)
				end
			end
		end

		refContainer.defaultRadar:SetSixProps(PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_HP_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_ATK_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_DEF_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_EP_REGEN_FORCE_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_DEF_MAG_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_ATK_MAG_IDX])
		refContainer.addedRadar:SetSixProps(PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_HP_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_ATK_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_DEF_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_EP_REGEN_FORCE_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_DEF_MAG_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_ATK_MAG_IDX])
		refContainer.addedRadar.transform.gameObject:SetActiveEx(isTrained > 0)

		if isHideVx then
			for k, v in pairs(refContainer and refContainer.propCmpGroup or EMPTY_TABLE) do
				local vx = v and v.transform:Find("VX")

				if NotNil(vx) then
					vx:SetLocalScaleEx(0, 0, 0)
				end
			end
		end

		if NotNil(refContainer.btnDetailUButton) then
			function refContainer.btnDetailUButton.luaClick()
				PetManagementUtils._openPropertyPanel(petInfo.id)
			end
		end
	end

	function PetManagementUtils.isSnapshotShowMaxShine(petInfo, pageIndex)
		if pageIndex ~= 3 or not Utils.isTable(petInfo) then
			return false
		end

		local maxLv = PetConfigData.individualPropEnhanceMax or 0

		if maxLv <= 0 or not petInfo.templateId then
			return false
		end

		local basePropertyList = petInfo.basePropertyList

		if not Utils.isTable(basePropertyList) then
			return false
		end

		local function getBaseLv(propId)
			local propInfo = basePropertyList[propId]

			if not Utils.isTable(propInfo) or propInfo.indLv == nil then
				return 0
			end

			return BaseProperty.getBaseIndividualLevel(propInfo) or 0
		end

		local petData = PetData[petInfo.templateId] or {}
		local recommend = petData.recommend_attr or {}
		local processCnt = 0
		local checkedPropIds = {}

		for _, recommendId in ipairs(recommend) do
			if recommendId and not checkedPropIds[recommendId] then
				checkedPropIds[recommendId] = true

				if maxLv > getBaseLv(recommendId) then
					return false
				end

				processCnt = processCnt + 1

				if processCnt >= 2 then
					return true
				end
			end
		end

		for propId = Const.BASE_PROPERTY_HP_IDX, Const.BASE_PROPERTY_ATK_MAG_IDX do
			if not checkedPropIds[propId] and maxLv <= getBaseLv(propId) then
				processCnt = processCnt + 1

				if processCnt >= 2 then
					return true
				end
			end
		end

		return false
	end

	function PetManagementUtils.setPetRatioUINode(petInfo, refUComp, forbidTooltip, isDecodeJson, isPlayCrownVx)
		if not petInfo then
			return
		end

		local isForbidPetPropUseBtn = PetManagementUtils.param and PetManagementUtils.param.isForbidPetPropUseBtn

		if not forbidTooltip then
			local ctrlConfig = PetManagementUtils.param and PetManagementUtils.param.ctrlConfig or {}
			local ctrlForbid = ctrlConfig.isForbidRatioToolTip or false

			if ctrlForbid then
				forbidTooltip = true
			end
		end

		if not petInfo.id and not forbidTooltip then
			return
		end

		local petId = petInfo.id
		local refObjComp = refUComp and refUComp.transform
		local refObj = refObjComp and refObjComp:GetComponent("ObjectReference")
		local uIPetInfoPanelQualityUComponent = refObj and refObj:GetRefValue("uIPetInfoPanelQualityUComponent")

		if not uIPetInfoPanelQualityUComponent then
			return
		end

		local txtNameUSDFText = refObj and refObj:GetRefValue("txtNameUSDFText")
		local btnTipsUButton = refObj and refObj:GetRefValue("btnTipsUButton")
		local iconPurpleUImage = refObj and refObj:GetRefValue("iconPurpleUImage")
		local iconUImage = refObj and refObj:GetRefValue("iconUImage")
		local particleStarUWidget = refObj and refObj:GetRefValue("particleStarUWidget")
		local iconMaxUWidget = refObj and refObj:GetRefValue("iconMaxUWidget")
		local glassesTs = iconUImage and iconUImage.transform and iconUImage.transform:Find("IconGlasses")
		local isCatchReporting = true

		if isDecodeJson then
			isCatchReporting = petInfo.isCatchReporting == true or petInfo.isCatchReportingStatus == true
		else
			isCatchReporting = LuaUIUtils.isCatchReportingPet(petInfo)
		end

		if isCatchReporting then
			uIPetInfoPanelQualityUComponent:TryChangePage("NotVerified", 1)
			uIPetInfoPanelQualityUComponent:TryChangePage("IsMax", UIConst.PET_CROWN_STATE.NONE)
		else
			uIPetInfoPanelQualityUComponent:TryChangePage("NotVerified", 0)

			local PetInfo = require("CustomTypes.PetInfo")
			local pageIndex, ratingStr = 0, ""

			if not isDecodeJson then
				pageIndex, ratingStr = petInfo:getPropRatingResult()

				TimerManager.addNextFrameCb(function()
					if IsNil(iconPurpleUImage) or IsNil(iconUImage) then
						return
					end

					local isShowShineTip = pg.game.petManage:getIsShowShineTip(petInfo)

					LuaUIUtils.safeSetUWidgetActive(iconPurpleUImage, isShowShineTip)
					LuaUIUtils.safeSetUWidgetActive(iconUImage, not isShowShineTip)
					LuaUIUtils.safeSetUWidgetActive(particleStarUWidget, pageIndex == 3 or isShowShineTip)

					local isShowMaxShine = pageIndex == 3 and pg.game.petManage:getIsShowMaxShineTip(petInfo) or false
					local liveGlasses = glassesTs

					if IsNil(liveGlasses) then
						local iconTransform = iconUImage.transform

						if NotNil(iconTransform) then
							liveGlasses = iconTransform:Find("IconGlasses")
						end
					end

					if IsNil(liveGlasses) then
						return
					end

					LuaUIUtils.safeSetGameObjectActive(liveGlasses.gameObject, isShowMaxShine)
				end)
			else
				pageIndex, ratingStr = PetInfo.staticGetPropRatingResult(petInfo)

				LuaUIUtils.safeSetUWidgetActive(iconPurpleUImage, false)
				LuaUIUtils.safeSetUWidgetActive(iconUImage, true)
				LuaUIUtils.safeSetUWidgetActive(particleStarUWidget, false)

				local isShowMaxShine = PetManagementUtils.isSnapshotShowMaxShine(petInfo, pageIndex)

				TimerManager.addNextFrameCb(function()
					if IsNil(iconUImage) then
						return
					end

					local liveGlasses = glassesTs

					if IsNil(liveGlasses) then
						local iconTransform = iconUImage.transform

						if NotNil(iconTransform) then
							liveGlasses = iconTransform:Find("IconGlasses")
						end
					end

					if IsNil(liveGlasses) then
						return
					end

					LuaUIUtils.safeSetGameObjectActive(liveGlasses.gameObject, isShowMaxShine)
				end)
			end

			ratingStr = pg.getGameString(ratingStr)

			uIPetInfoPanelQualityUComponent:TryChangePage("Quality", pageIndex)
			ClientTextUtils.setText(txtNameUSDFText, ratingStr)

			local maxPageIndex = pg.game.petManage:getPetCrownStatePageIndex(petInfo)

			LuaUIUtils.safeTryChangePage(uIPetInfoPanelQualityUComponent, "IsMax", maxPageIndex)

			if maxPageIndex == 1 and isPlayCrownVx then
				iconMaxUWidget:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
			end
		end

		if btnTipsUButton then
			btnTipsUButton.enabledTooltip = not forbidTooltip

			if not forbidTooltip then
				function btnTipsUButton.luaRenderTooltip(_, component)
					local objectReference = component:GetComponent("ObjectReference")
					local newRatioNodeUComp = objectReference:GetRefValue("newRatioNodeUComp")
					local petIconUImage = objectReference:GetRefValue("petIconUImage")
					local txtTipsUSDFText = objectReference:GetRefValue("txtTipsUSDFText")
					local txtBaseUSDFText = objectReference:GetRefValue("txtBaseUSDFText")
					local txtLvUSDFText = objectReference:GetRefValue("txtLvUSDFText")
					local listUList = objectReference:GetRefValue("listUList")
					local btnUseUComponent = objectReference:GetRefValue("btnUseUComponent")
					local btnUWidget = objectReference:GetRefValue("btnUWidget")

					btnUWidget:SetActive(not isForbidPetPropUseBtn)

					local iconPropUImage = objectReference:GetRefValue("iconPropUImage")
					local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
					local txtNumUSDFText = objectReference:GetRefValue("txtNumUSDFText")
					local useTxtTipsUSDFText = objectReference:GetRefValue("useTxtTipsUSDFText")
					local rayBoxUWidget = objectReference:GetRefValue("rayBoxUWidget")
					local btnUseUButton = objectReference:GetRefValue("btnUseUButton")
					local tipsUWidget = objectReference:GetRefValue("tipsUWidget")
					local descUWidget = objectReference:GetRefValue("descUWidget")
					local txtDescUSDFText = objectReference:GetRefValue("txtDescUSDFText")

					PetManagementUtils.setPetRatioUINode(petInfo, newRatioNodeUComp)

					local templateId = petInfo.templateId
					local petData = PetData[templateId]
					local iconUrl = LuaUIUtils.getPetIcon(petData.iconName, LuaUIUtils.PET_ICON, petInfo.label, petInfo.gender)

					petIconUImage.url = iconUrl

					local maxLv = PetManagementUtils.getPetOldPropConfigMaxLv()
					local maxLvStr = pg.getGameString("PET_RATIO_MAX")

					ClientTextUtils.setText(txtTipsUSDFText, string.format(maxLvStr, maxLv))
					ClientTextUtils.setText(txtBaseUSDFText, pg.getGameString("PET_RATIO_BASE"))
					ClientTextUtils.setText(txtLvUSDFText, pg.getGameString("PET_RATIO_LEARN"))

					local propLevels = pg.game.petManage:getPetPropLevels(petInfo)

					function listUList.luaRenderItem(button, index, data)
						local objectReference = button:GetComponent("ObjectReference")
						local iconAttriUImage = objectReference:GetRefValue("iconAttriUImage")
						local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
						local txtTotalUSDFText = objectReference:GetRefValue("txtTotalUSDFText")
						local imgFillBaseUImage = objectReference:GetRefValue("imgFillBaseUImage")
						local imgFillAddUImage = objectReference:GetRefValue("imgFillAddUImage")
						local txtBaseUSDFText = objectReference:GetRefValue("txtBaseUSDFText")
						local txtAddUSDFText = objectReference:GetRefValue("txtAddUSDFText")

						iconAttriUImage.url = data and data.iconUrl or ""

						ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(data and data.l18nNameKey or ""))
						ClientTextUtils.setText(txtTotalUSDFText, data and data.baseAndActiveTotalLv or 0)

						local baseRatio = (data and data.complexBaseLv or 0) / (data and data.max or 1)

						imgFillBaseUImage.fillAmount = baseRatio

						local addRatio = (data and data.learnt or 0) / (data and data.max or 1) + baseRatio

						imgFillAddUImage.fillAmount = addRatio

						ClientTextUtils.setText(txtBaseUSDFText, data and data.complexBaseLv or 0)
						ClientTextUtils.setText(txtAddUSDFText, data and data.learnt and data.learnt > 0 and "+" .. data.learnt or "0")
					end

					listUList:SetList(propLevels)

					local usedCount, maxCount = pg.game.petManage:getPetPropLevelMaxInfo(petId)
					local isReachedMax = maxCount <= usedCount

					btnUseUComponent:TryChangePage("Limit", isReachedMax and 1 or 0)

					if not isReachedMax then
						TimerManager.addNextFrameCb(function()
							if IsNil(tipsUWidget) then
								return
							end

							local showShineTip = pg.game.petManage:getIsShowShineTip(petInfo)

							tipsUWidget:SetActive(showShineTip)
						end)
					end

					rayBoxUWidget:SetActive(not isReachedMax)

					local name = isReachedMax and pg.getGameString("PET_USE_ITEM_ENHANCE_PROP_REACHEDMAX") or pg.getGameString("PET_USE_ITEM_ENHANCE_PROP")

					ClientTextUtils.setText(txtNameUSDFText, name or "")
					ClientTextUtils.setText(txtNumUSDFText, usedCount .. "/" .. maxCount)
					ClientTextUtils.setText(useTxtTipsUSDFText, pg.getGameString("PET_USE_ITEM_ENHANCE_PROP_TIP") or "")

					local itemSimpleInfo = PetManagementUtils.getPetEnhancePropUseItemUIInfo()

					iconPropUImage.url = itemSimpleInfo.icon or ""

					if not isReachedMax and not isForbidPetPropUseBtn then
						function btnUseUButton.luaClick()
							if LuaUIUtils.checkWarehousePetOperationLocked(petId, PetWarehouseConst.PetWarehouseText.FRUIT_USE_FORBIDDEN) then
								return
							end

							if PetManagementUtils.checkHomePetOperationLocked(petId) then
								return
							end

							local itemId = PetConfigData.PET_ENHANCE_PROP_ITEMID or 151000
							local haveCount = ItemUtils.getItemCountById(pg.me, itemId) or 0

							if haveCount < 1 then
								pg.global.showBubbleMessageById(NoticeDef.ITEM_COUNT_LACK)

								return
							end

							local retItems = LuaUIUtils.getInventoryProps(2, nil, itemId)

							pg.global.ui:open(UIConst.UI_ID_INVENTORY_PET_PROP_USE, {
								propData = retItems and retItems[1],
								sType = ItemConst.USEITEM_TYPE_PROPERTY_ENHANCE,
								petId = petId
							})
						end
					else
						btnUseUButton.luaClick = nil
					end

					local curExtraCntByEvent = petInfo and petInfo.propertyCountByEvent or 0
					local maxExtraCntByEvent = PetConfigData.individualPropEnhanceTimesMax or 0

					if curExtraCntByEvent > 0 then
						descUWidget:SetActive(true)

						local fStr = pg.getGameString("PET_EVENT_ENHANCE_PROP")

						fStr = (not fStr or fStr == "" or fStr == "PET_EVENT_ENHANCE_PROP") and "PET_EVENT_ENHANCE_PROP: %s/%s" or fStr

						ClientTextUtils.setText(txtDescUSDFText, string.format(fStr, curExtraCntByEvent, maxExtraCntByEvent))
					else
						descUWidget:SetActive(false)
					end
				end
			else
				btnTipsUButton.luaRenderTooltip = nil
			end
		end
	end

	function PetManagementUtils.getPetEnhancePropUseItemUIInfo()
		local itemId = PetConfigData.PET_ENHANCE_PROP_ITEMID or 151000
		local simpleInfo = ItemUtils.getItemSimpleInfo(itemId)

		return simpleInfo
	end

	function PetManagementUtils.applyPetQualityRatingText(petQualityUContainer, data, isValid)
		if IsNil(petQualityUContainer) then
			return
		end

		local isCatchReporting = false

		if data ~= nil then
			isCatchReporting = data.isCatchReportingStatus == true
		end

		if isCatchReporting then
			petQualityUContainer:DestroyContent()

			return
		end

		petQualityUContainer:LoadDefaultUrlManually()

		if IsNil(petQualityUContainer.content) then
			return
		end

		local ratingIndex = 0

		if data ~= nil and data.rating ~= nil then
			ratingIndex = data.rating
		end

		petQualityUContainer.content:TryChangePage("Quality", ratingIndex)

		local function applyText()
			if isValid ~= nil and not isValid() then
				return
			end

			if IsNil(petQualityUContainer) or IsNil(petQualityUContainer.content) then
				return
			end

			local transform = petQualityUContainer.content.transform

			if transform == nil then
				return
			end

			local textT = transform:Find("Detail/Text")

			if textT == nil then
				return
			end

			local text = textT:GetComponent("USDFText")

			if IsNil(text) then
				return
			end

			local ratingStr = Const.STAGE_TO_RATING_STR[ratingIndex + 1] or ""

			ClientTextUtils.setText(text, pg.getGameString(ratingStr))
		end

		applyText()
		TimerManager.addNextFrameCb(applyText)
	end
end
