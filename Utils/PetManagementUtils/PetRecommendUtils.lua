-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetRecommendUtils.lua

local Const = require("Common.Const.Const")
local PetData = require("Data.pet_data")
local FormulaData = require("Data.formula_data")
local RecommendData = require("Data.pet_strength_recommend_data")
local CommonPetGroupData = require("Data.common_pet_group_data")
local RecommendPetData = require("Data.recommend_pet_data")
local math_floor = math.floor

return function(PetManagementUtils)
	function PetManagementUtils.getPetRecommendList(petId)
		if not petId then
			return
		end

		local petInfo = pg.me:getPetInfo(petId)

		if not petInfo then
			return
		end

		local petCfg = PetData[petInfo.templateId]

		if not petCfg then
			return
		end

		local recommendIds = petCfg.recommend_addprop
		local recommendRatios = petCfg.recommend_userpercent

		if not recommendIds or not recommendRatios then
			return
		end

		local recommendSuitInfos = {}

		for i, recommendId in ipairs(recommendIds) do
			local newTempPropInfo = PetManagementUtils.getPetNewSixPropInfos(petId, true)

			newTempPropInfo.recommendId = recommendId
			newTempPropInfo.recommendRatio = recommendRatios[i]

			PetManagementUtils.caculateRecommendPPoints(petId, newTempPropInfo)

			newTempPropInfo.index = i

			table.insert(recommendSuitInfos, newTempPropInfo)
		end

		return recommendSuitInfos
	end

	function PetManagementUtils.caculateRecommendPPoints(petId, newTempPropInfo)
		local petInfo = pg.me:getPetInfo(petId)

		if not petInfo then
			return
		end

		local pData = PetData[petInfo.templateId] or {}
		local recommendAttrs = pData.recommend_attr
		local recommendId = newTempPropInfo.recommendId
		local recommendCfg = RecommendData[recommendId]
		local recommendAttrWeight = recommendCfg and recommendCfg.recommendPropWeight
		local normalWeights = recommendCfg and recommendCfg.weight

		if recommendAttrWeight then
			local flag = true

			while flag and newTempPropInfo.remainPotentialPointSum > 0 do
				flag = false

				for i, _ in pairs(recommendAttrWeight) do
					local newPropId = recommendAttrs[i]

					flag = newPropId and newTempPropInfo.remainPotentialPointSum > 0 and PetManagementUtils.tryAddStrengPointSum(petId, newPropId, 1, newTempPropInfo) or flag
				end
			end
		end

		if normalWeights then
			local flag = true

			while flag and newTempPropInfo.remainPotentialPointSum > 0 do
				flag = false

				for newPropId, weight in ipairs(normalWeights) do
					flag = weight > 0 and newTempPropInfo.remainPotentialPointSum > 0 and PetManagementUtils.tryAddStrengPointSum(petId, newPropId, weight, newTempPropInfo) or flag
				end
			end
		end

		if newTempPropInfo.remainPotentialPointSum > 0 then
			local flag = true

			while flag and newTempPropInfo.remainPotentialPointSum > 0 do
				flag = false

				for newPropId, propAttrName in ipairs(Const.NEW_BASE_PROP_IDX2ATTR_MAP) do
					flag = newTempPropInfo.remainPotentialPointSum > 0 and PetManagementUtils.tryAddStrengPointSum(petId, newPropId, 1, newTempPropInfo) or flag
				end
			end
		end
	end

	function PetManagementUtils.tryAddStrengPointSum(petId, newPropId, addLv, newTempPropInfo)
		if newPropId == nil then
			return false
		end

		local curNewPropDetailInfo = newTempPropInfo and newTempPropInfo.detailPropInfos and newTempPropInfo.detailPropInfos[newPropId]

		if not curNewPropDetailInfo then
			return false
		end

		local strengthenPoint = curNewPropDetailInfo.propertyStrengPoint or nil

		if strengthenPoint == nil then
			return false
		end

		if strengthenPoint >= (curNewPropDetailInfo.propertyStrengMax or 0) then
			return
		end

		local addedLv = strengthenPoint + addLv

		if addedLv > (curNewPropDetailInfo.propertyStrengMax or 0) then
			addLv = curNewPropDetailInfo.propertyStrengMax - strengthenPoint
		end

		local needPotentialPoint = 0

		for i = strengthenPoint + 1, strengthenPoint + addLv do
			needPotentialPoint = needPotentialPoint + FormulaData[3020].formula(i, math_floor)
		end

		if needPotentialPoint + newTempPropInfo.usedPotentialPointSum > newTempPropInfo.potentialPointSum then
			return false
		end

		strengthenPoint = strengthenPoint + addLv
		curNewPropDetailInfo.propertyStrengPoint = strengthenPoint
		newTempPropInfo.usedPotentialPointSum = newTempPropInfo.usedPotentialPointSum + needPotentialPoint
		newTempPropInfo.remainPotentialPointSum = newTempPropInfo.potentialPointSum - newTempPropInfo.usedPotentialPointSum
		curNewPropDetailInfo.m_usedPotentialPointSum = (curNewPropDetailInfo.m_usedPotentialPointSum or 0) + needPotentialPoint
		newTempPropInfo.detailPropInfos[newPropId] = curNewPropDetailInfo

		return true
	end

	function PetManagementUtils.isPetNewPropApplied(petId, checkSuitInfo)
		if not petId or not checkSuitInfo then
			return false
		end

		local petInfo = pg.me:getPetInfo(petId)

		if not petInfo then
			return false
		end

		local realInfos = PetManagementUtils.getPetNewSixPropInfos(petId)

		if not realInfos then
			return false
		end

		local realDetailInfos = realInfos.detailPropInfos

		if not realDetailInfos then
			return false
		end

		local checkDetailSuitInfos = checkSuitInfo.detailPropInfos

		if not checkDetailSuitInfos then
			return false
		end

		for newPropId, checkDetailInfo in pairs(checkDetailSuitInfos) do
			local realDetailInfo = realDetailInfos[newPropId]

			if not realDetailInfo then
				return false
			end

			if realDetailInfo.propertyStrengPoint ~= checkDetailInfo.propertyStrengPoint then
				return false
			end
		end

		if realInfos.potentialPointSum == 0 or realInfos.usedPotentialPointSum == 0 then
			return false
		end

		return true
	end

	function PetManagementUtils.getIsAppliedgRecommend(petId)
		if not petId then
			return false
		end

		return not PetManagementUtils.redDot_GetState(Const.CLIENT_KEY.PET_RECORD_APPLIED_RECOMMEND, petId)
	end

	function PetManagementUtils.redDot_GetState(redKey, petId)
		local isValid = pg.me:getRedDotRecord(redKey, redKey .. "_" .. petId, true)

		return isValid
	end

	function PetManagementUtils.redDot_RecordState(redKey, petId)
		pg.me:setRedDotRecord(redKey, redKey .. "_" .. petId, false)
	end

	function PetManagementUtils.buildCommonPetTemplateIdSet(refKey)
		local groupData = refKey and CommonPetGroupData[refKey]

		if not groupData then
			return nil
		end

		local ids = {}

		for _, templateList in pairs(groupData) do
			for _, id in ipairs(templateList) do
				ids[id] = true
			end
		end

		return ids
	end

	function PetManagementUtils.buildRecommendPetTemplateIdSet(refKey)
		if not refKey then
			return nil
		end

		local ids = {}

		for _, recommendId in ipairs(refKey) do
			local recommendPet = RecommendPetData[recommendId]

			if recommendPet then
				for _, info in ipairs(recommendPet.petSet) do
					for _, petId in ipairs(info[2]) do
						ids[petId] = true
					end
				end
			end
		end

		return ids
	end
end
