-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetPropertyUtils.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local Const = require("Common.Const.Const")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PetData = require("Data.pet_data")
local PetConfigData = require("Data.pet_config_data")
local PetDetailPropertyData = require("Data.pet_detail_property_data")
local PetPropLevelMaxData = require("Data.pet_prop_level_max")
local Utils = require("Common.Utils.Utils")
local AbilityConst = require("Common.Const.AbilityConst")
local PetResearchUtils = require("Guis.Utils.PetResearchUtils")
local AddressDataConst = require("Const.AddressDataConst")
local PetAttrConvertData = require("Data.pet_attr_convert_data")
local AttributeConst = require("Common.Const.AttributeConst")
local AttributeGroupData = require("Data.attribute_group_data")
local PetDisplayAttrNames = require("Data.pet_display_attr_names")
local PetAttributeCalcUtils = require("Common.Utils.PetAttributeCalcUtils")
local FormulaData = require("Data.formula_data")
local PriProRevertData = require("Data.primaryproperty_revert_data")
local PlayerHeadIconData = require("Data.player_head_icon_data")
local ItemUtils = require("Common.Utils.ItemUtils")
local ClientUtils = require("Utils.ClientUtils")
local math_floor = math.floor

return function(PetManagementUtils)
	function PetManagementUtils.getDisplayBookNumberText(data)
		if not data or not data.bookNum or data.bookNum >= 9000 then
			return "No.???"
		end

		local displayNumber, isCustomNumber = PetResearchUtils.getDisplayNumberByTemplateId(data.templateId)

		displayNumber = displayNumber ~= "" and displayNumber or data.bookNum

		return isCustomNumber and displayNumber or string.format("No.%s", displayNumber)
	end

	function PetManagementUtils.getPetOldSixPropLevelInfos(petId)
		local petInfo = pg.me:getPetInfo(petId)
		local baseProperty = petInfo.basePropertyList
		local individualLevelTable = {}

		for i = Const.BASE_PROPERTY_HP_IDX, Const.BASE_PROPERTY_ATK_MAG_IDX do
			individualLevelTable[i] = {
				base = baseProperty[i].indLv - baseProperty[i].iLvLn,
				learnt = baseProperty[i].iLvLn,
				total = baseProperty[i].indLv,
				isMax = baseProperty[i].indLv >= PetPropLevelMaxData[i],
				max = PetPropLevelMaxData[i]
			}
		end

		return individualLevelTable
	end

	function PetManagementUtils.getPetCurDisplayAttrVal(petId, dispAttrName)
		if not petId or not dispAttrName or not pg.me then
			return nil
		end

		local dispAttrId = AttributeConst[dispAttrName]
		local petInfo = pg.me:getPetInfo(petId)
		local attributeMap = PetAttributeCalcUtils.getAttributeMapByPetInfo(pg.me, petInfo)
		local curValue = attributeMap[dispAttrId]

		return curValue
	end

	function PetManagementUtils.getPetOldPropConfigMaxLv(includePassiveExtra)
		local maxLv = 0

		if includePassiveExtra then
			for i = Const.BASE_PROPERTY_HP_IDX, Const.BASE_PROPERTY_ATK_MAG_IDX do
				maxLv = math.max(maxLv, PetPropLevelMaxData[i] or 1)
			end
		else
			maxLv = PetConfigData.individualPropMax or 1
		end

		return maxLv
	end

	function PetManagementUtils.getPetOldPropIconAndNameKey(propId)
		local info = PetDetailPropertyData[propId][1]

		return info.icon, info.propName
	end

	function PetManagementUtils.getPetOldPropAttrConstName(propId)
		local info = PetDetailPropertyData[propId][1]

		return info.displayProp
	end

	function PetManagementUtils.getNewPropExtraMaxLv()
		return PetConfigData.newPropExtraMaxLv or Const.NEW_PROP_SPECIAL_LV
	end

	function PetManagementUtils.getNewPropSpecailLv()
		return 5
	end

	function PetManagementUtils.getPetNewPropIdAndNames()
		local id2Names = {}
		local name2Ids = {}

		for name, cfg in pairs(PetAttrConvertData) do
			id2Names[cfg.id] = name
			name2Ids[name] = cfg.id
		end

		return id2Names, name2Ids
	end

	function PetManagementUtils.getPetNewPropAttrNameByNewId(newPropId)
		for name, cfg in pairs(PetAttrConvertData) do
			if cfg.id == newPropId then
				return name
			end
		end
	end

	function PetManagementUtils.getPetNewPropIdByAttrName(newPropAttrName)
		for name, cfg in pairs(PetAttrConvertData) do
			if name == newPropAttrName then
				return cfg.id
			end
		end
	end

	function PetManagementUtils.getPetNewSixPropAttrId(newPropId)
		local attrName = Const.NEW_BASE_PROP_IDX2ATTR_MAP[newPropId]

		return AttributeConst[attrName]
	end

	function PetManagementUtils.getPetNewSixPropCfg(newPropId)
		if not newPropId then
			return nil
		end

		for _, cfg in pairs(PetAttrConvertData) do
			if cfg.id == newPropId then
				return cfg
			end
		end

		return nil
	end

	function PetManagementUtils.getPetNewSixPropAtomAttrCfg(newPropId)
		if not newPropId then
			return nil
		end

		local atomAttrName = PetManagementUtils.getPetNewPropAttrNameByNewId(newPropId)

		if not atomAttrName then
			return nil
		end

		local refAttrId = Const.NEW_BASE_PROP_ATTR2REFID_MAP[atomAttrName]

		return AttributeGroupData[refAttrId]
	end

	function PetManagementUtils.getPetNewSixPropInfos(petId, isTemp)
		if not pg.me then
			return
		end

		local petInfo = pg.me:getPetInfo(petId)
		local primaryProperty = petInfo.primaryProperty
		local newSixPInfo = {
			potentialPointSum = primaryProperty and primaryProperty.potentialPointSum or 0,
			usedPotentialPointSum = primaryProperty and primaryProperty.usedPotentialPointSum or 0,
			isAutoAddStrengPoint = primaryProperty and primaryProperty.isAutoAddStrengPoint or true,
			firstCreate = primaryProperty and primaryProperty.firstCreate or false,
			detailPropInfos = {}
		}

		newSixPInfo.remainPotentialPointSum = newSixPInfo.potentialPointSum - newSixPInfo.usedPotentialPointSum

		local extraStrengPointSrctypeMap = primaryProperty and primaryProperty.extraStrengPoint or {}
		local parseExtraStrengPointMap = {}

		for originAttrId, map in pairs(extraStrengPointSrctypeMap) do
			if map and next(map) then
				local newPropId = PetManagementUtils.getExtraNewPropIdByOriginAttrId(originAttrId)

				parseExtraStrengPointMap[newPropId] = map
			end
		end

		for i, v in ipairs(Const.NEW_BASE_PROP_IDX2ATTR_MAP) do
			newSixPInfo.detailPropInfos[i] = {
				propertyStrengPoint = primaryProperty and primaryProperty.propertyStrengPoint and primaryProperty.propertyStrengPoint[i] or 0,
				extraStrengPointSrctypeMap = parseExtraStrengPointMap and parseExtraStrengPointMap[i] or {},
				propertyStrengMax = primaryProperty and primaryProperty.propertyStrengMax and primaryProperty.propertyStrengMax[i] or 0,
				extraStrengthLv = PetManagementUtils.getExtraStrengthLv(petId, i, parseExtraStrengPointMap and parseExtraStrengPointMap[i] or {}),
				propExtraStrengMax = PetManagementUtils.getNewPropExtraMaxLv(),
				propId = i
			}

			if isTemp then
				newSixPInfo.detailPropInfos[i].propertyStrengPoint = 0
				newSixPInfo.detailPropInfos[i].parseExtraStrengPointMap = {}
				newSixPInfo.usedPotentialPointSum = 0
				newSixPInfo.remainPotentialPointSum = newSixPInfo.potentialPointSum
			end
		end

		return newSixPInfo
	end

	function PetManagementUtils.getExtraNewPropIdByOriginAttrId(originAttrId)
		if not originAttrId then
			return nil
		end

		local attrName = AttributeConst.ID2NAME[originAttrId]

		if not attrName then
			return nil
		end

		local newPropId

		for _newPropId, _attrName in ipairs(PriProRevertData or EMPTY_TABLE) do
			if _attrName == attrName then
				newPropId = _newPropId

				break
			end
		end

		return newPropId
	end

	function PetManagementUtils.getPetNewSixPropInfo(petId, propId)
		if not pg.me then
			return
		end

		local infos = PetManagementUtils.getPetNewSixPropInfos(petId)
		local retInfo

		if infos then
			retInfo = {
				potentialPointSum = infos and infos.potentialPointSum or 0,
				usedPotentialPointSum = infos and infos.usedPotentialPointSum or 0,
				remainPotentialPointSum = infos and infos.potentialPointSum - infos.usedPotentialPointSum or 0,
				isAutoAddStrengPoint = infos and infos.isAutoAddStrengPoint or true,
				firstCreate = infos and infos.firstCreate or false,
				propertyStrengPoint = infos and infos.detailPropInfos[propId] and infos.detailPropInfos[propId].propertyStrengPoint or 0,
				extraStrengPointSrctypeMap = infos and infos.detailPropInfos[propId] and infos.detailPropInfos[propId].extraStrengPointSrctypeMap or {},
				propertyStrengMax = infos and infos.detailPropInfos[propId] and infos.detailPropInfos[propId].propertyStrengMax or 0,
				extraStrengthLv = infos and infos.detailPropInfos[propId] and infos.detailPropInfos[propId].extraStrengthLv or 0,
				propExtraStrengMax = infos and infos.detailPropInfos[propId] and infos.detailPropInfos[propId].propExtraStrengMax or PetManagementUtils.getNewPropExtraMaxLv(),
				propId = propId,
				propL10NName = pg.getGameString(PetManagementDataHelper.NEW_PROP_NAMES[propId])
			}
		end

		return retInfo
	end

	function PetManagementUtils.getPetNewPropUpLvConvertGains(newPropId, newPropLv)
		newPropLv = newPropLv or 1

		if not newPropId then
			return nil
		end

		local newPropName = PetManagementUtils.getPetNewPropAttrNameByNewId(newPropId)
		local newPropConvertCfg = PetAttrConvertData[newPropName]

		if not newPropConvertCfg or not newPropConvertCfg.addprops then
			return nil
		end

		local atomPropInfos = {}

		for _, prop in pairs(newPropConvertCfg.addprops or EMPTY_TABLE) do
			local attrId = AttributeConst[prop[2]]

			if attrId ~= nil then
				local value = math_floor(newPropLv / prop[1]) * prop[3]

				atomPropInfos[attrId] = atomPropInfos[attrId] or {}
				atomPropInfos[attrId].value = (atomPropInfos[attrId].value or 0) + value
				atomPropInfos[attrId].propl10nName = ClientTextUtils.getLocalizationText(prop[4]) or prop[2]
				atomPropInfos[attrId].valueType = prop[5] or Const.PET_CONVERT_VALTYPE.Direct
			end
		end

		return atomPropInfos
	end

	function PetManagementUtils.getPetNewPropUpLvConvertGains2(newPropId, newPropLv)
		newPropLv = newPropLv or 1

		if not newPropId then
			return nil
		end

		local newPropName = PetManagementUtils.getPetNewPropAttrNameByNewId(newPropId)
		local newPropConvertCfg = PetAttrConvertData[newPropName]

		if not newPropConvertCfg or not newPropConvertCfg.addprops then
			return nil
		end

		local atomPropInfos = {}

		for _, prop in pairs(newPropConvertCfg.addprops or EMPTY_TABLE) do
			local attrId = AttributeConst[prop[2]]

			if attrId ~= nil then
				local value = math_floor(newPropLv / prop[1]) * prop[3]

				atomPropInfos[attrId] = atomPropInfos[attrId] or {}
				atomPropInfos[attrId].value = (atomPropInfos[attrId].value or 0) + value
				atomPropInfos[attrId].propl10nName = ClientTextUtils.getLocalizationText(prop[4]) or prop[2]
				atomPropInfos[attrId].valueType = prop[5] or Const.PET_CONVERT_VALTYPE.Direct
			end
		end

		return atomPropInfos
	end

	function PetManagementUtils.getPetNewPropConvertRuleInfo(newPropId, maxConvertNum)
		if not newPropId then
			return nil
		end

		maxConvertNum = maxConvertNum or 1

		local newPropName = PetManagementUtils.getPetNewPropAttrNameByNewId(newPropId)
		local newPropConvertCfg = PetAttrConvertData[newPropName]

		if not newPropConvertCfg or not newPropConvertCfg.addprops then
			return nil
		end

		local atomPropInfos = {}

		for _, propInfo in ipairs(newPropConvertCfg.addprops or EMPTY_TABLE) do
			local gainScaler = propInfo and propInfo[1]

			if gainScaler == maxConvertNum then
				local propAttrName = propInfo and propInfo[2]
				local propVal = propInfo and propInfo[3] or 0
				local addPropVal = propVal
				local propL10nName = propInfo and pg.getLocalizationText(propInfo[4]) or ""
				local propValShowType = propInfo and propInfo[5]

				atomPropInfos[#atomPropInfos + 1] = {
					propId = newPropId,
					convertNum = addPropVal,
					value = addPropVal,
					propl10nName = propL10nName,
					valueType = propValShowType
				}
			end
		end

		return atomPropInfos
	end

	function PetManagementUtils.getPetNewPropConvertGainDesc(atomPropInfo)
		if not atomPropInfo then
			return ""
		end

		if atomPropInfo.valueType == Const.PET_CONVERT_VALTYPE.Direct then
			local fixedVal = math_floor(atomPropInfo.value)

			return "+" .. fixedVal .. atomPropInfo.propl10nName
		elseif atomPropInfo.valueType == Const.PET_CONVERT_VALTYPE.Ratio then
			local fixedVal = math_floor(atomPropInfo.value * 100)

			fixedVal = string.format("%.0f", fixedVal)

			return "+" .. fixedVal .. "%" .. atomPropInfo.propl10nName
		end
	end

	function PetManagementUtils.getPetNewPropConvertGainDesc2(atomPropInfo)
		if not atomPropInfo then
			return "", ""
		end

		if atomPropInfo.valueType == Const.PET_CONVERT_VALTYPE.Direct then
			local fixedVal = math_floor(atomPropInfo.value)

			return atomPropInfo.propl10nName .. ": ", "+" .. fixedVal
		elseif atomPropInfo.valueType == Const.PET_CONVERT_VALTYPE.Ratio then
			local fixedVal = math_floor(atomPropInfo.value * 100)

			fixedVal = string.format("%.0f", fixedVal)

			return atomPropInfo.propl10nName .. ": ", "+" .. fixedVal .. "%"
		end
	end

	function PetManagementUtils.getResetEffortCostInfo()
		local result = {}
		local resetCostCfg = PetConfigData.petPropLvResetCost or {}

		for itemId, costNum in pairs(resetCostCfg) do
			if itemId and costNum then
				table.insert(result, {
					itemId,
					costNum
				})
			end
		end

		return result
	end

	function PetManagementUtils.getPetPropLvResetCostConfig(petLevel)
		local costConfig = PetConfigData.petPropLvResetCost
		local level = tonumber(petLevel)
		local resetLv = tonumber(PetConfigData.petPropCanNotResetLv)

		if level and resetLv and resetLv <= level and PetConfigData.petPropLvResetCost2 then
			costConfig = PetConfigData.petPropLvResetCost2
		end

		return costConfig
	end

	function PetManagementUtils.getPetPropResetConfirmCost(petInfo)
		if not petInfo or not petInfo.basePropertyList then
			return nil
		end

		local costItem, extraItemId, extraItemCount = Utils.getPetPropResetCost(petInfo)
		local countTable = ItemUtils.getItemCountTable(costItem or {})
		local currencyId, currencyNum

		for itemId, num in pairs(countTable) do
			if itemId ~= extraItemId and num and num > 0 then
				currencyId = itemId
				currencyNum = num

				break
			end
		end

		if not currencyId or not currencyNum then
			return nil
		end

		if not extraItemId or not extraItemCount or extraItemCount <= 0 then
			extraItemId = nil
			extraItemCount = nil
		end

		return {
			currencyId = currencyId,
			currencyNum = currencyNum,
			extraItemId = extraItemId,
			extraItemCount = extraItemCount
		}
	end

	function PetManagementUtils.getPetPropResetConfirmCurrencyIds(cost)
		if not cost or not cost.currencyId then
			return nil
		end

		local ids = {
			cost.currencyId
		}

		if cost.extraItemId and cost.extraItemCount and cost.extraItemCount > 0 then
			ids[#ids + 1] = cost.extraItemId
		end

		return ids
	end

	function PetManagementUtils.formatPetPropResetConfirmTip(cost)
		if not cost then
			return nil
		end

		local function colorCount(itemId, num)
			local ownCount = ClientUtils.getItemCountById(itemId)

			if ownCount < num then
				return string.format("<color=#ff7676>%s</color>", num)
			end

			return tostring(num)
		end

		local currencyText = colorCount(cost.currencyId, cost.currencyNum)
		local hasExtra = cost.extraItemId and cost.extraItemCount and cost.extraItemCount > 0

		if hasExtra then
			local raw = pg.getGameString("PROP_RESET_TIP_WITH_EXTRA")

			if not raw or raw == "" or raw == "PROP_RESET_TIP_WITH_EXTRA" then
				return currencyText .. " " .. colorCount(cost.extraItemId, cost.extraItemCount)
			end

			return pg.getFormatText(raw, currencyText, cost.currencyId, colorCount(cost.extraItemId, cost.extraItemCount), cost.extraItemId)
		end

		local raw = pg.getGameString("PROP_RESET_TIP")

		if not raw or raw == "" or raw == "PROP_RESET_TIP" then
			return currencyText
		end

		return pg.getFormatText(raw, currencyText, cost.currencyId)
	end

	function PetManagementUtils.getAddedAtomPropInfo(petId, newPropId, addLvs)
		if not petId or not newPropId then
			return nil
		end

		local times = addLvs or 1
		local convertAtomInfos = PetManagementUtils.getPetNewPropUpLvConvertGains(newPropId)

		if not convertAtomInfos then
			return nil
		end

		local addedAtomPropInfos = {}

		for atomPropName, atomPropInfo in pairs(convertAtomInfos) do
			if atomPropInfo then
				local addedInfo = addedAtomPropInfos[atomPropName] or {}

				addedInfo.atomPropName = atomPropInfo.atomPropId or atomPropName
				addedInfo.valueType = atomPropInfo.valueType or 0
				addedInfo.propL10nName = atomPropInfo.propl10nName or ""

				if atomPropInfo.valueType == Const.PET_CONVERT_VALTYPE.Direct then
					addedInfo.value = (addedInfo.value or 0) + atomPropInfo.value * times
				elseif atomPropInfo.valueType == Const.PET_CONVERT_VALTYPE.Ratio then
					addedAtomPropInfos[atomPropName].value = (addedAtomPropInfos[atomPropName].value or 0) + (atomPropInfo.value or 0) * times
				end

				addedAtomPropInfos[atomPropName] = addedInfo
			end
		end

		return addedAtomPropInfos
	end

	function PetManagementUtils.getPreviewAddedAtomPropInfo(petId, newPropId, addLvs, isDelNoChangedAttr)
		local petInfo = pg.me:getPetInfo(petId)
		local previewAtomAttrsMap = Utils.primaryPropertyUpdate(petInfo, newPropId, addLvs)
		local allAttrs = PetManagementUtils.m_getPreviewAddedAtomPropInfo(petId, previewAtomAttrsMap)

		isDelNoChangedAttr = isDelNoChangedAttr == nil and true or isDelNoChangedAttr

		if isDelNoChangedAttr then
			for i = #allAttrs, 1, -1 do
				if allAttrs[i].diffV <= 0 then
					table.remove(allAttrs, i)
				end
			end
		end

		return allAttrs
	end

	function PetManagementUtils.getPreviewAddedAtomPropInfo2(petId, newPropId, addLvs, targetSLv)
		local newPropCfg = PetManagementUtils.getPetNewSixPropCfg(newPropId)

		if not newPropCfg then
			return nil
		end

		local addprops = newPropCfg and newPropCfg.addprops

		if not addprops or #addprops == 0 then
			return nil
		end

		local allAttrs = PetManagementUtils.m_getPreviewAddedAtomPropInfoNewProp(petId, newPropId, addprops, addLvs, targetSLv)

		return allAttrs
	end

	function PetManagementUtils.m_getPreviewAddedAtomPropInfo_backup(petId, previewAtomAttrsMap, maxLen)
		local petInfo = pg.me:getPetInfo(petId)
		local simulateCalProps = PetManagementDataHelper.SIMULATE_CAL_PROPS
		local curAtomAttrsMap = Utils.primaryPropertyUpdate(petInfo)
		local curAttrsMap = {}

		for k, v in pairs(simulateCalProps) do
			local directVAttrName = AttributeConst.ID2NAME[v[1]]
			local directV = curAtomAttrsMap[directVAttrName] or 0
			local ratioVAttrName = AttributeConst.ID2NAME[v[2]]
			local ratioV = 1 + (curAtomAttrsMap[ratioVAttrName] or 0)
			local simulateV = directV * ratioV

			curAttrsMap[k] = simulateV
		end

		previewAtomAttrsMap = previewAtomAttrsMap or {}

		local previewAttrsMap = {}

		for k, v in pairs(simulateCalProps) do
			local directVAttrName = AttributeConst.ID2NAME[v[1]]
			local directV = previewAtomAttrsMap[directVAttrName] or 0
			local ratioVAttrName = AttributeConst.ID2NAME[v[2]]
			local ratioV = 1 + (previewAtomAttrsMap[ratioVAttrName] or 0)
			local simulateV = directV * ratioV

			previewAttrsMap[k] = simulateV
		end

		local previewFinalAttrsMap = {}

		for i = 1, Const.BASE_PROPERTY_CNT do
			local oldV = curAttrsMap[i] or 0
			local newV = previewAttrsMap[i] or 0
			local diffV = math.max(0, newV - oldV)

			previewFinalAttrsMap[#previewFinalAttrsMap + 1] = {
				propId = i,
				oldV = oldV,
				diffV = math_floor(diffV),
				l10nName = pg.getGameString(PetManagementDataHelper.FINAL_PROP_NAMES[i])
			}
		end

		if maxLen and maxLen < #previewFinalAttrsMap then
			for i = maxLen + 1, #previewFinalAttrsMap do
				previewFinalAttrsMap[i] = nil
			end
		end

		return previewFinalAttrsMap
	end

	function PetManagementUtils.m_getPreviewAddedAtomPropInfo(petId, previewAtomAttrsMap, maxLen)
		local petInfo = pg.me:getPetInfo(petId)
		local curAtomAttrsMap = Utils.primaryPropertyUpdate(petInfo) or {}

		previewAtomAttrsMap = previewAtomAttrsMap or {}

		local previewFinalAttrsMap = {}

		for k, v in pairs(AttributeGroupData or EMPTY_TABLE) do
			local propName = v.attrs and v.attrs[1]

			if propName and previewAtomAttrsMap[propName] then
				local oldPropVal = curAtomAttrsMap[propName] or 0
				local newPropVal = previewAtomAttrsMap[propName] or 0
				local diffVal = math.max(0, newPropVal - oldPropVal)

				if diffVal > 0 then
					local propDispTxt = PetManagementUtils.m_getDisplayShowPropTxt(diffVal, v.showType)

					previewFinalAttrsMap[#previewFinalAttrsMap + 1] = {
						propId = k,
						oldV = oldPropVal,
						diffV = diffVal,
						oldVDispTxt = PetManagementUtils.m_getDisplayShowPropTxt(oldPropVal, v.showType),
						newVDispTxt = PetManagementUtils.m_getDisplayShowPropTxt(newPropVal, v.showType),
						l10nName = pg.getLocalizationText(v.name),
						propDispTxt = propDispTxt
					}
				end
			end
		end

		return previewFinalAttrsMap
	end

	function PetManagementUtils.m_getPreviewAddedAtomPropInfoStarup(petId, gainProps, maxLen)
		local previewAtomAttrsMap = {}
		local previewFinalAttrsMap = {}

		for _, propInfo in ipairs(gainProps or EMPTY_TABLE) do
			local atomPropId = propInfo and propInfo[1]
			local atomPropVal = propInfo and propInfo[2]

			if atomPropId and atomPropVal then
				local atomCfg = AttributeGroupData[atomPropId]

				if atomCfg then
					previewFinalAttrsMap[#previewFinalAttrsMap + 1] = {
						diffV = 0,
						oldV = 0,
						propId = atomPropId,
						oldVDispTxt = "+" .. PetManagementUtils.m_getDisplayShowPropTxt(0, atomCfg.showType),
						newVDispTxt = "+" .. PetManagementUtils.m_getDisplayShowPropTxt(atomPropVal, atomCfg.showType),
						l10nName = pg.getLocalizationText(atomCfg.name),
						propDispTxt = "+" .. PetManagementUtils.m_getDisplayShowPropTxt(atomPropVal, atomCfg.showType)
					}
				end
			end
		end

		return previewFinalAttrsMap
	end

	function PetManagementUtils.m_getPreviewAddedAtomPropInfoNewProp(petId, newPropId, addprops, addLvs, targetSLv)
		local previewAtomAttrsMap = {}
		local previewFinalAttrsMap = {}

		for _, propInfo in ipairs(addprops or EMPTY_TABLE) do
			local gainScaler = propInfo and propInfo[1]

			if gainScaler == 1 or gainScaler > 1 and targetSLv % gainScaler == 0 then
				local propAttrName = propInfo and propInfo[2]
				local propVal = propInfo and propInfo[3] or 0
				local addPropVal = propVal
				local propL10nName = propInfo and pg.getLocalizationText(propInfo[4]) or ""
				local propValShowType = propInfo and propInfo[5]

				previewFinalAttrsMap[#previewFinalAttrsMap + 1] = {
					diffV = 0,
					oldV = 0,
					propId = newPropId,
					oldVDispTxt = "+" .. PetManagementUtils.m_getDisplayShowPropTxt(0, propValShowType),
					newVDispTxt = "+" .. PetManagementUtils.m_getDisplayShowPropTxt(addPropVal, propValShowType),
					l10nName = propL10nName,
					propDispTxt = "+" .. PetManagementUtils.m_getDisplayShowPropTxt(addPropVal, propValShowType)
				}
			end
		end

		return previewFinalAttrsMap
	end

	function PetManagementUtils.m_getDisplayShowPropTxt(propVal, showType)
		propVal = propVal or 0

		local propDispTxt = ""

		if showType == 0 then
			propDispTxt = string.format("%d", propVal)
		elseif showType == 1 and type(propVal) == "number" then
			propDispTxt = string.format("%s%%", math.floor(propVal * 100))
		elseif showType == 2 then
			propDispTxt = Utils.m_customParseFloatPropVal(propVal)
		end

		return propDispTxt
	end

	function PetManagementUtils.getNextStrengthExtraAtomPropDesc(newPropId, curStrengthPoint)
		if not newPropId then
			return nil
		end

		local newPropConvertCfg = PetManagementUtils.getPetNewSixPropCfg(newPropId)

		if not newPropConvertCfg then
			return
		end

		local curStrengthPointMod5 = (curStrengthPoint or 0) % 5
		local minNeedPointCnt = 0
		local minNeedPointId = 0

		for propId, prop in pairs(newPropConvertCfg.addprops or EMPTY_TABLE) do
			local needPointCnt = prop[1] or 0

			if minNeedPointCnt < needPointCnt then
				minNeedPointCnt = needPointCnt
				minNeedPointId = propId
			end
		end

		if minNeedPointId == 0 or minNeedPointCnt == 0 then
			return nil
		end

		local needPoint = curStrengthPointMod5 < minNeedPointCnt and minNeedPointCnt - curStrengthPointMod5 or minNeedPointCnt
		local extraAddpropInfo = newPropConvertCfg.addprops[minNeedPointId] or {}
		local gainVal = extraAddpropInfo[3] or 0
		local valType = extraAddpropInfo[5] or Const.PET_CONVERT_VALTYPE.Direct
		local gainValStr = ""
		local gainAttrL10nName = ClientTextUtils.getLocalizationText(extraAddpropInfo[4]) or extraAddpropInfo[2]

		if valType == Const.PET_CONVERT_VALTYPE.Direct then
			local fixedVal = string.format("%.2f", gainVal)

			gainValStr = fixedVal .. gainAttrL10nName
		elseif valType == Const.PET_CONVERT_VALTYPE.Ratio then
			local fixedVal = math_floor(gainVal * 100)

			fixedVal = string.format("%.2f", fixedVal)
			gainValStr = fixedVal .. "%" .. gainAttrL10nName
		end

		return needPoint, gainValStr
	end

	function PetManagementUtils.getPetDisplayAttrsIds()
		local retIds = {}

		for attrName, _ in pairs(PetDisplayAttrNames) do
			local attrId = AttributeConst[attrName]

			retIds[#retIds + 1] = attrId
		end

		return retIds
	end

	function PetManagementUtils.getExtraStrengthLv(petId, newPropId, extraStrengPointSrctypeMap)
		if not petId or not newPropId then
			return 0
		end

		local totalExtraStrengPoint = 0

		for srcType, extraStrengPoint in pairs(extraStrengPointSrctypeMap or EMPTY_TABLE) do
			if srcType == AbilityConst.EXCEPT_EXTRA_ATTR_SRCTYPE then
				break
			end

			totalExtraStrengPoint = totalExtraStrengPoint + (extraStrengPoint or 0)
		end

		return totalExtraStrengPoint
	end

	function PetManagementUtils.getExtraStrengthLvInfos(petId, newPropId)
		if not petId or not newPropId then
			return
		end

		local petNewSixPropInfos = PetManagementUtils.getPetNewSixPropInfos(petId)

		if not petNewSixPropInfos or not petNewSixPropInfos.detailPropInfos then
			return
		end

		if not petNewSixPropInfos.detailPropInfos[newPropId] then
			return
		end

		if not petNewSixPropInfos.detailPropInfos[newPropId].extraStrengPointSrctypeMap then
			return
		end

		local srcTypeMap = petNewSixPropInfos.detailPropInfos[newPropId].extraStrengPointSrctypeMap or {}
		local parseInfos = PetManagementUtils.mergeExtraStrengthLvInfos(srcTypeMap)

		return parseInfos
	end

	function PetManagementUtils.mergeExtraStrengthLvInfos(srcMap)
		if not srcMap then
			return
		end

		local parseInfos = {}

		for srcType, extraLv in pairs(srcMap) do
			if extraLv and srcType ~= AbilityConst.EXCEPT_EXTRA_ATTR_SRCTYPE then
				local finalStrKey = AbilityConst.EXTRA_SRCTYPE_STRKEY_OTHER

				for strKey, v in pairs(AbilityConst.EXTRA_SRCTYPE_STRKEYS) do
					if table.contains(v, srcType) then
						finalStrKey = strKey

						break
					end
				end

				parseInfos[finalStrKey] = parseInfos[finalStrKey] or 0
				parseInfos[finalStrKey] = parseInfos[finalStrKey] + extraLv
			end
		end

		return parseInfos
	end

	function PetManagementUtils.getNewPropReachNextLvNeedPotentialPoint(petId, strengthLv)
		if not pg.me or not petId or not strengthLv then
			return 0
		end

		if strengthLv <= 0 then
			return 0
		end

		local maxLv = PetManagementUtils.getNewPropMaxStrengthLv(petId)

		if not maxLv then
			return 0
		end

		if maxLv < strengthLv then
			return 0
		end

		return FormulaData[3020].formula(strengthLv, math_floor)
	end

	function PetManagementUtils.getNewPropMaxStrengthLv(petId)
		local max = 30

		if not pg.me or not petId then
			return max
		end

		local petInfo = pg.me:getPetInfo(petId)

		if not petInfo then
			return max
		end

		local level = petInfo.level
		local stage = petInfo.stage
		local maxLv = FormulaData[3021].formula(level, stage, petInfo.propertyScoreStage)

		return maxLv
	end

	function PetManagementUtils.getNewPropRangeLvChangePotentialPoint(petId, newPropId, startLv, endLv)
		if not petId or not newPropId or not startLv or not endLv then
			return 0
		end

		local minLv = math.min(startLv, endLv)
		local maxLv = math.max(startLv, endLv)
		local pointSum = 0

		for lv = minLv + 1, maxLv do
			local point = PetManagementUtils.getNewPropReachNextLvNeedPotentialPoint(petId, lv)

			pointSum = pointSum + point
		end

		if endLv < startLv then
			return -pointSum
		end

		return pointSum
	end

	function PetManagementUtils.getNewPropCostPPointCanReachedLv(petId, newPropId, startLv, costPPoint)
		if not petId or not newPropId or type(startLv) ~= "number" or type(costPPoint) ~= "number" then
			return 0
		end

		startLv = math.max(0, startLv)
		costPPoint = math.max(0, costPPoint)

		local maxLv = PetManagementUtils.getNewPropMaxStrengthLv(petId)

		if not maxLv or type(maxLv) ~= "number" or maxLv <= 0 then
			return startLv
		end

		maxLv = math.max(0, maxLv)

		if maxLv <= startLv or costPPoint <= 0 then
			return startLv
		end

		local accumulatedCost = 0
		local reachableLv = startLv

		for lv = startLv + 1, maxLv do
			local needPoint = PetManagementUtils.getNewPropReachNextLvNeedPotentialPoint(petId, lv)

			needPoint = type(needPoint) == "number" and needPoint >= 0 and needPoint or 0

			if costPPoint < accumulatedCost + needPoint then
				break
			end

			accumulatedCost = accumulatedCost + needPoint
			reachableLv = lv

			if maxLv <= reachableLv then
				break
			end
		end

		return math.min(reachableLv, maxLv)
	end

	function PetManagementUtils.getPPointProgressRatios(manualSLv, manualMaxLv, extraLv)
		local manualSLvPro = math.clamp(LuaUIUtils.safeDiv(manualSLv + extraLv, manualMaxLv), 0, 1)
		local extraLvPro = math.clamp(LuaUIUtils.safeDiv(extraLv, manualMaxLv), 0, 1)
		local allSLv = manualSLv + extraLv
		local specialSLvPro = math.floor(allSLv / PetManagementUtils.getNewPropSpecailLv()) * PetManagementUtils.getNewPropSpecailLv() / manualMaxLv
		local extraLvPro2 = math.clamp(LuaUIUtils.safeDiv(extraLv, PetManagementUtils.getNewPropExtraMaxLv()), 0, 1)

		return manualSLvPro, extraLvPro, specialSLvPro, extraLvPro2
	end

	function PetManagementUtils.getPPointBatchManuProgressRatios(manualSLv, manualMaxLv, extraLv)
		local manualSLvPro = math.clamp(LuaUIUtils.safeDiv(manualSLv, manualMaxLv), 0, 1)
		local extraLvPro = math.clamp(LuaUIUtils.safeDiv(extraLv, PetManagementUtils.getNewPropExtraMaxLv()), 0, 1)
		local specialSLvPro = math.floor(manualSLv / PetManagementUtils.getNewPropExtraMaxLv()) * PetManagementUtils.getNewPropExtraMaxLv() / manualMaxLv

		return manualSLvPro, extraLvPro, specialSLvPro
	end

	function PetManagementUtils.redDot_GetFreeResetPPointsRedDotKey()
		return "recordFreeResetPPoints"
	end

	function PetManagementUtils.redDot_GetFreeResetPPointsState(petId)
		if not petId then
			return false
		end

		local petInfo = pg.me and pg.me:getPetInfo(petId)

		if not petInfo then
			return false
		end

		local primaryProperty = petInfo.primaryProperty

		return primaryProperty and ToBool(primaryProperty.isAutoAddStrengPoint)
	end

	function PetManagementUtils.redDot_RecordFreeResetPPointsState()
		pg.me:setRedDotRecord(Const.CLIENT_KEY.PET_CULTIVATE_FREE_FIRST_RESET_PPOINT, PetManagementUtils.redDot_GetFreeResetPPointsRedDotKey(), false)
	end

	function PetManagementUtils.getPetL10nName(petId)
		local petName
		local pet = pg.me:getPetInfo(petId)

		if pet.customName and pet.customName ~= "" then
			petName = pet.customName
		else
			local pData = PetData[pet.templateId] or {}

			petName = pData.name
		end

		local l10nName = petName and pg.getLocalizationText(petName) or ""

		if pg.game.setting:getShowDebugId() then
			l10nName = l10nName .. tostring(pet.templateId)
		end

		return l10nName
	end

	function PetManagementUtils.generateBaseData(playerInfo, petInfo)
		local headIcon = playerInfo.headIcon or 1
		local petName = petInfo.customName

		if petName == nil or petName == "" then
			petName = ""

			local pData = PetData[petInfo.templateId] or {}

			if pData then
				petName = pg.getLocalizationText(pData.name)
			end
		end

		local data = {
			avatarIcon = PlayerHeadIconData[headIcon].res,
			playerName = playerInfo.playerName,
			petName = petName,
			petCp = Utils.getCpValue(petInfo) or 0,
			petLevel = petInfo.level,
			petExp = petInfo.exp or 0,
			templateId = petInfo.templateId,
			resonanceInfo = petInfo.resonanceInfo
		}

		return data
	end

	function PetManagementUtils.getPetSimpleInfo(petId)
		local petInfo = pg.me:getPetInfo(petId)

		if not petInfo then
			return
		end

		local templateId = petInfo.templateId
		local petPrototypeId = petInfo.petPrototypeId
		local petData = PetData[templateId]
		local petHandbookMap = pg.me.petHandbookMap or {}
		local petHandbookInfo = petHandbookMap[petPrototypeId] or {}
		local isRare = Utils.isLabelShiny(petInfo.label)
		local _, elementNames = LuaUIUtils.getElementInfo(petData.elementType)
		local petSimpleInfo = {
			elementTypes = petData.elementType,
			gender = petInfo.gender,
			genderIcon = petInfo.gender == Const.GENDER_TYPE_MALE and AddressDataConst.UI_PET_INFO_GENDER_MALE or AddressDataConst.UI_PET_INFO_GENDER_FEMALE,
			headIconName = petData.iconName,
			iconName = petData.iconName,
			id = petInfo.id,
			isBoss = Utils.isLabelElite(petInfo.label),
			isVariant = Utils.isLabelVariant(petInfo.label),
			isNew = not petHandbookInfo:isCatched(),
			isRare = isRare,
			isRareNew = isRare and not petHandbookInfo:isShinyCatched(),
			label = petInfo.label,
			lv = petInfo.level,
			name = petInfo.customName and petInfo.customName ~= "" and petInfo.customName or pg.getLocalizationText(petData.name),
			templateId = templateId,
			cpValue = petInfo:getCpValue() or 0,
			elementNames = elementNames or {}
		}

		return petSimpleInfo
	end

	function PetManagementUtils.getIsUnlockCarrySlot(curLv)
		return curLv >= PetManagementUtils.getUnlockCarrySlotFuncMaxLv()
	end

	function PetManagementUtils.getUnlockCarrySlotFuncMaxLv()
		return PetConfigData.PET_TRAIN_CARRY_UNLOCK_MAXLV or 15
	end

	function PetManagementUtils.getPetCarryInfo(petId)
		local pCarryInfo = {}
		local petInfo = pg.me:getPetInfo(petId)

		if petInfo == nil then
			return pCarryInfo
		end

		local carryPosMap

		if pg.me.tempPets and pg.me.tempPets[petId] == petInfo then
			carryPosMap = pg.me.tempPetCoreCarryPosMap
		elseif pg.me.pets and pg.me.pets[petId] == petInfo then
			carryPosMap = pg.me.petCoreCarryPosMap
		end

		local carry = carryPosMap and carryPosMap:getItemPos(petId)
		local invId = carry and carry:invId() or 0
		local genId = carry and carry:genId() or 0

		pCarryInfo.isEquipped = genId ~= 0
		pCarryInfo.genID = genId
		pCarryInfo.invId = invId

		return pCarryInfo
	end
end
