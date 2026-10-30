-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetCultivationRequests.lua

local Const = require("Common.Const.Const")
local MessageName = require("Const.MessageName")
local NoticeDef = require("Common.NoticeDef")
local Utils = require("Common.Utils.Utils")

return function(PetManagementUtils)
	function PetManagementUtils.tryReqBatchAllocateEffort(petId, batchPropInfos, isNotice, isRecommend)
		local isChanged = false
		local realInfos = PetManagementUtils.getPetNewSixPropInfos(petId)
		local realDetailInfos = realInfos and realInfos.detailPropInfos or {}
		local parseBatchInfos = {}

		for i, v in ipairs(batchPropInfos) do
			local newPropId = PetManagementUtils.getPetNewPropIdByAttrName(v.propAttrName)

			parseBatchInfos[newPropId] = v.propLv
		end

		for newPropId, propAttrName in ipairs(Const.NEW_BASE_PROP_IDX2ATTR_MAP) do
			local realStrengthLv = realDetailInfos and realDetailInfos[newPropId] and realDetailInfos[newPropId].propertyStrengPoint or 0
			local changeStrengthLv = parseBatchInfos[newPropId] or 0

			if changeStrengthLv ~= realStrengthLv then
				isChanged = true

				break
			end
		end

		if not isChanged then
			if isNotice then
				pg.global.showBubbleMessageById(NoticeDef.PET_NEW_PROP_WITHOUT_CHANGE)
			end

			return
		end

		PetManagementUtils.reqResetEffort(petId, function()
			PetManagementUtils.m_reqBatchAllocateEffort(petId, batchPropInfos)
		end)

		if isRecommend then
			PetManagementUtils.redDot_RecordState(Const.CLIENT_KEY.PET_RECORD_APPLIED_RECOMMEND, petId)
		end
	end

	function PetManagementUtils.m_reqBatchAllocateEffort(petId, batchPropInfos)
		if not petId or not batchPropInfos then
			return
		end

		for i = 1, #batchPropInfos do
			local propAttrName = batchPropInfos[i].propAttrName
			local addLv = batchPropInfos[i].propLv

			PetManagementUtils.reqAllocateEffort(petId, propAttrName, addLv)
		end
	end

	function PetManagementUtils.reqAllocateEffort(petId, propAttrName, addLv)
		if not petId or not propAttrName or not addLv then
			return
		end

		pg.me:serverMsg("RPC_CS_AllocateEffort", petId, propAttrName, addLv, function(noticeId)
			if noticeId == NoticeDef.SUCCESS then
				facade:sendMsgToUI(MessageName.PET_NEW_PROP_CHANGE, {
					petId = petId
				})
			end
		end)
	end

	function PetManagementUtils.tryReqResetEffort(petId, isFree, sucCallback)
		if not petId then
			return
		end

		local realInfos = PetManagementUtils.getPetNewSixPropInfos(petId)
		local sum = realInfos and realInfos.potentialPointSum or 0
		local used = realInfos and realInfos.usedPotentialPointSum or 0

		if realInfos and sum == 0 or used == 0 then
			pg.global.showBubbleMessageById(NoticeDef.PET_NEW_PROP_WITHOUT_ALLOCATED)
		elseif isFree then
			PetManagementUtils.autoAllocatePoint(petId, sucCallback)
		else
			PetManagementUtils.reqResetEffort(petId, sucCallback)
		end
	end

	function PetManagementUtils.reqResetEffort(petId, sucCallback)
		if not petId then
			return
		end

		pg.me:serverMsg("RPC_CS_ResetEffort", petId, function(noticeId)
			if noticeId == NoticeDef.SUCCESS then
				facade:sendMsgToUI(MessageName.PET_NEW_PROP_CHANGE, {
					petId = petId
				})

				if sucCallback then
					sucCallback()
				end
			end
		end)
	end

	function PetManagementUtils.autoAllocatePoint(petId, sucCallback)
		if not petId then
			return
		end

		pg.me:serverMsg("RPC_CS_autoAllocatePoint", petId, function(noticeId)
			if noticeId == NoticeDef.SUCCESS then
				PetManagementUtils.redDot_RecordFreeResetPPointsState()
				facade:sendMsgToUI(MessageName.PET_NEW_PROP_CHANGE, {
					petId = petId
				})

				if sucCallback then
					sucCallback()
				end
			end
		end)
	end

	function PetManagementUtils.reqUpgradeResonance(petId, callback, excludeItemList)
		if not petId then
			if callback then
				callback()
			end

			return
		end

		local oldStage, oldLv = PetManagementUtils.getPetCurStarSLv(petId)
		local _, expectedStage, expectedLv = PetManagementUtils.getPetNextResonanceCfg(petId, oldStage, oldLv)
		local player = pg.me

		if not player or not player.serverMsg then
			if callback then
				callback(NoticeDef.FAIL)
			end

			return
		end

		local excludePayload = {}

		if Utils.isTable(excludeItemList) then
			for _, itemId in ipairs(excludeItemList) do
				excludePayload[#excludePayload + 1] = itemId
			end
		end

		local rid = player:serverMsg("RPC_CS_UpgradeResonance", petId, excludePayload, function(noticeId)
			local info

			if noticeId == NoticeDef.SUCCESS then
				local liveStage, liveLv = PetManagementUtils.getPetCurStarSLv(petId)
				local newStage = expectedStage

				if newStage == nil then
					newStage = liveStage
				end

				local newLv = expectedLv

				if newLv == nil then
					newLv = liveLv
				end

				info = {
					petId = petId,
					oldStage = oldStage,
					oldLv = oldLv,
					newStage = newStage,
					newLv = newLv
				}

				facade:sendMsgToUI(MessageName.PET_RESONANCE_CHANGE, info)
			end

			if callback then
				callback(noticeId, info)
			end
		end)

		if not rid and callback then
			callback(NoticeDef.FAIL)
		end
	end

	function PetManagementUtils.learnPetPropLevel(petId, propIndex, toLevel, cb)
		pg.me:serverMsg("RPC_CS_LearnPetPropLevel", petId, propIndex, toLevel, function(noticeId)
			if noticeId == NoticeDef.SUCCESS then
				facade:sendMsgToUI(MessageName.PET_PROP_LEARN_CHANGE, {
					petId = petId,
					propIndex = propIndex,
					toLevel = toLevel
				})
			end
		end)
	end
end
